package com.bookingsystem.controller.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.bookingsystem.model.Booking;
import com.bookingsystem.service.BookingService;

@RestController
public class BookingApiController {

	@Autowired
	private BookingService service;
	
	@GetMapping("/booking/{id}")
	public Booking getById(@PathVariable Integer id) {
		return service.getById(id);
	}

	@PostMapping("/addNew")
	public void addNewBooking(@RequestBody @Validated Booking booking) {
		service.add(booking);
	}
	
	@DeleteMapping("/delete/{id}")
	public void deleteById(@PathVariable Integer id) {
		service.delete(id);
	}
	
	@PutMapping("/update/{id}")
	public void updateById(@PathVariable Integer id, @RequestBody Booking booking) {
		service.update(id, booking);
	}

}
