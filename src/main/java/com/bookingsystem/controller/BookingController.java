package com.bookingsystem.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bookingsystem.model.Booking;
import com.bookingsystem.service.BookingService;

@Controller
@RequestMapping
public class BookingController {

	@Autowired
	private BookingService service;

	@GetMapping(path = "/")
	public ModelAndView homepage() {

		ModelAndView modelAndView = new ModelAndView("home");
		List<Booking> bookings = service.getAllBookings();
		modelAndView.addObject("bookings", bookings);
		return modelAndView;
	}

}
