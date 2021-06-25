package rva.ctrls;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import rva.jpa.Preduzece;
import rva.repository.PreduzeceRepository;

@CrossOrigin
@RestController
@Api(tags = {"Preduzece CRUD operacije"})
public class PreduzeceRestController {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private PreduzeceRepository preduzeceRepository;
	
	@GetMapping("preduzece")
	@ApiOperation(value = "Vraća kolekciju svih preduzeća iz baze podataka")
	public Collection<Preduzece> getPreduzeca() {
		return preduzeceRepository.findAll();
	}
	
	@GetMapping("preduzece/{id}")
	@ApiOperation(value = "Vraća preduzeće iz baze podataka čija je id vrednost prosleđena kao path varijabla")
	public Preduzece getPreduzece(@PathVariable ("id") Integer id) {
		return preduzeceRepository.getOne(id);
	}
	
	@GetMapping("preduzeceNaziv/{naziv}")
	@ApiOperation(value = "Vraća kolekciju svih preduzeća iz baze podataka koja u nazivu sadrže string prosleđen kao path varijabla")
	public Collection<Preduzece> getPreduzeceByNaziv(@PathVariable("naziv") String naziv){
		return preduzeceRepository.findByNazivContainingIgnoreCase(naziv);
	}
	
	@PostMapping("preduzece")
	@ApiOperation(value = "Upisuje preduzeće u bazu podataka")
	public ResponseEntity<Preduzece> insertPreduzece(@RequestBody Preduzece preduzece){
		if(!preduzeceRepository.existsById(preduzece.getId())) {
			preduzeceRepository.save(preduzece);
			return new ResponseEntity<Preduzece>(HttpStatus.OK);
		}
		return new ResponseEntity<Preduzece>(HttpStatus.CONFLICT);
	}
	
	@PutMapping("preduzece")
	@ApiOperation(value = "Modifikuje postojeće preduzeće u bazi podataka")
	public ResponseEntity<Preduzece> updatePreduzece(@RequestBody Preduzece preduzece){
		if(!preduzeceRepository.existsById(preduzece.getId())) {
			return new ResponseEntity<Preduzece>(HttpStatus.NO_CONTENT);
		}
		preduzeceRepository.save(preduzece);
		return new ResponseEntity<Preduzece>(HttpStatus.OK);
	}
	
	@DeleteMapping("preduzece/{id}")
	@ApiOperation(value = "Briše preduzeće iz baze podataka čija je id vrednost prosleđena kao path varijabla")
	public ResponseEntity<Preduzece> deletePreduzece(@PathVariable("id") Integer id){
		if(!preduzeceRepository.existsById(id)) {
			return new ResponseEntity<Preduzece>(HttpStatus.NO_CONTENT);
		}
		
		jdbcTemplate.execute("Delete from radnik where sektor in (select id from sektor where preduzece= " + id +")"); 
		jdbcTemplate.execute("delete from sektor where preduzece = " + id);
		preduzeceRepository.deleteById(id);
		if(id == -100) {
			jdbcTemplate.execute(
					"INSERT INTO \"preduzece\"(\"id\", \"naziv\", \"pib\", \"sediste\", \"opis\") "
				  + "VALUES (-100, 'Naziv Test', 101, 'Test sediste', 'Test opis')"
			);
		}
		return new ResponseEntity<Preduzece>(HttpStatus.OK);
	}

}
