SELECT f.route_no,
       r.departure_airport,
       r.arrival_airport,
       a.airport_name ->> 'ru' AS departure_airport_name,
       f.actual_arrival
FROM bookings.flights AS f
JOIN bookings.routes AS r ON r.route_no = f.route_no
JOIN bookings.airports_data AS a ON a.airport_code = r.departure_airport
WHERE f.actual_arrival IS NOT NULL
ORDER BY f.actual_arrival DESC
LIMIT 20;
