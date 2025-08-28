Create database ola;
Use ola;

select * from ola_ride_analytics;

#1. Retrieve all successful bookings:
Create View Successful_Bookings As
SELECT * FROM ola_ride_analytics
WHERE Booking_Status = 'Success';

#2. Find the average ride distance for each vehicle type:
Create View ride_distance_for_each_vehicle As
SELECT Vehicle_Type, AVG(Ride_Distance)
as avg_distance FROM ola_ride_analytics
GROUP BY Vehicle_Type;

#3. Get the total number of cancelled rides by customers:
Create View cancelled_rides_by_customers As
SELECT COUNT(*) FROM ola_ride_analytics
WHERE Booking_Status = 'cancelled by Customer';

#4. List the top 5 customers who booked the highest number of rides:
Create View Top_5_Customers As
SELECT Customer_ID, COUNT(Booking_ID) as total_rides
FROM ola_ride_analytics
GROUP BY Customer_ID
ORDER BY total_rides DESC LIMIT 5;

#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
Create View Rides_cancelled_by_Drivers_P_C_Issues As
SELECT COUNT(*) FROM ola_ride_analytics
WHERE cancelled_Rides_by_Driver = 'Personal & Car related issue';

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
Create View Max_Min_Driver_Rating As
SELECT MAX(Driver_Ratings) as max_rating,
MIN(Driver_Ratings) as min_rating
FROM ola_ride_analytics WHERE Vehicle_Type = 'Prime Sedan';


#7. Retrieve all rides where payment was made using UPI:
Create View UPI_Payment As
SELECT * FROM ola_ride_analytics
WHERE Payment_Method = 'UPI';

#8. Find the average customer rating per vehicle type:
Create View AVG_Cust_Rating As
SELECT Vehicle_Type, AVG(Customer_Rating) as avg_customer_rating
FROM ola_ride_analytics
GROUP BY Vehicle_Type;

#9. Calculate the total booking value of rides completed successfully:
Create View total_successful_ride_value As
SELECT ROUND(SUM(Booking_Value),0) as total_successful_ride_value
FROM ola_ride_analytics
WHERE Booking_Status = 'Success';

#10. List all incomplete rides along with the reason:
Create View Incomplete_Rides_Reason As
SELECT Booking_ID, Incomplete_Rides_Reason
FROM ola_ride_analytics
WHERE Incomplete_Rides = '1';