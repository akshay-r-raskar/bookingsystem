package com.bookingsystem.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bookingsystem.model.Booking;

public interface BookingRepository extends JpaRepository<Booking, Integer> {

}
