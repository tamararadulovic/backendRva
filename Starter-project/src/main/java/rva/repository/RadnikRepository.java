package rva.repository;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;

import rva.jpa.Radnik;
import rva.jpa.Sektor;

public interface RadnikRepository  extends JpaRepository<Radnik, Integer>{
	
	Collection<Radnik> findByImeContainingIgnoreCase(String ime);
	Collection<Radnik> findByPrezimeContainingIgnoreCase(String prezime);
	Collection<Radnik> findBySektor(Sektor s);
}