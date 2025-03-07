CREATE DATABASE OLA;
USE OLA;

-- reterive the successful bookings 
CREATE View Successful_Bookings as
SELECT * FROM bookings 
WHERE Booking_Status = 'Success';

SELECT * FROM Successful_Bookings;

-- find the average ride distance for each of vehicle type 
CREATE VIEW ride_distance_for_each_vehicle as 
SELECT Vehicle_Type, AVG(Ride_Distance)
as avg_distance FROM bookings GROUP BY Vehicle_Type;

SELECT * FROM ride_distance_for_each_vehicle;

-- find out the number of rides cancelled by the customer
create view cancelled_ride_by_customer as 
SELECT COUNT(*) FROM bookings 
WHERE Booking_Status = 'Canceled by Customer';

select * from cancelled_ride_by_customer;


-- -FETCH OUT THE LIST OF CUSTOMER WHO BOOKED MOST RIDES 
CREATE VIEW Top_5_Customer as 
SELECT Customer_ID,COUNT(Booking_ID) as total_rides 
FROM bookings
GROUP BY Customer_ID 
ORDER BY total_rides DESC LIMIT 5; 

select * from Top_5_Customer;


-- find out the number bookings cancelled due to personal and car realted issues
CREATE VIEW Personal_and_car_related_issue as 
SELECT COUNT(*) FROM bookings 
where Canceled_Rides_by_Driver = 'Personal & Car related issues';

select * from Personal_and_car_related_issue;


-- find out the driver max and min ratings 
CREATE VIEW max_min_rating as 
SELECT MAX(Driver_Ratings) as max_rating,
MIN(Driver_Ratings) as min_rating
FROM bookings WHERE Vehicle_Type = 'Primer Sedan';

select * from max_min_rating;


-- find out the numbre of bookings where the payment method is upi 
CREATE VIEW Payment_UPI as 
SELECT * FROM bookings
WHERE Payment_Method = 'UPI';

select * from Payment_UPI;


-- find out the average customer ratings per vehicle type 
CREATE VIEW Avg_Customer_Rating as
SELECT Vehicle_Type, AVG(Customer_Rating) as avg_customer_rating 
FROM bookings 
GROUP BY Vehicle_Type;

select * from Avg_Customer_Rating;


-- Calculate the average customer rating per vehicle type;
CREATE VIEW Sum_booking_values as 
SELECT SUM(Booking_Value) as total_successful_value 
FROM bookings 
WHERE Booking_Status = 'Success';

select * from Sum_booking_values;

-- List all the incomplete rides along with the reasons;

CREATE VIEW Incomplete_Ride_Reason as
SELECT Booking_ID, Incomplete_Rides_Reason
FROM bookings 
WHERE Incomplete_Rides = 'YES';

SELECT * FROM Incomplete_Ride_Reason;