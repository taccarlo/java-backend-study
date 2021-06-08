package com.example.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.jdbc.core.JdbcTemplate;

@SpringBootApplication
public class NationsConnectionApplication implements CommandLineRunner{

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public static void main(String[] args) {
		SpringApplication.run(NationsConnectionApplication.class, args);
	}

	@Override
	public void run(String... args) throws Exception {
		// TODO Auto-generated method stub
		String sql ="INSERT INTO nation (iso_code, name, capital, population) VALUES ( ?, ?, ?, ?)";
		int result = jdbcTemplate.update(sql, "GBR", "United Kingdom", "London", 67886004);
		if(result>0) {
			System.out.println("A new row has been inserted");
		}
	}

}
