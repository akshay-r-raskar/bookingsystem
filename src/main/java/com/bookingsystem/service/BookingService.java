package com.bookingsystem.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookingsystem.model.Booking;
import com.bookingsystem.repository.BookingRepository;

@Service
public class BookingService {

	@Autowired
	private BookingRepository repository;

	public List<Booking> getAllBookings() {
		return repository.findAll();
	}

	public void add(Booking booking) {
		repository.save(booking);
	}

	public void delete(Integer id) {
		repository.deleteById(id);
	}

	public Booking getById(Integer id) {
		return repository.findById(id).get();
	}

	public void update(Integer id, Booking booking) {
		Optional<Booking> maybeBooking = repository.findById(id);
		if (maybeBooking.isPresent()) {
			Booking existingBooking = maybeBooking.get();
			existingBooking.setDuration(booking.getDuration());
			existingBooking.setFromCity(booking.getFromCity());
			existingBooking.setToCity(booking.getToCity());
			repository.save(existingBooking);
		}
	}

}
