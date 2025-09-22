SELECT * FROM ola.ola;
use ola;

# 1. List all completed rides.
SELECT *
FROM ola
WHERE 'Booking_Status' = 'Completed';

#2. Show all rides booked with **UPI payment**
SELECT 'Booking_ID', 'Customer_ID', 'Booking_Value
FROM ola
WHERE `Payment_Method' = 'UPI';

#3. Find all rides where the **vehicle type** was 'Auto'.
SELECT *
FROM ola
WHERE 'Vehicle_Type' = 'Auto';

#4. Find the total number of rides booked by each 'Vehicle Type'.
SELECT 'Vehicle_Type',COUNT(*) AS total_rides
FROM ola
GROUP BY 'Vehicle Type';

#5. Calculate the **average booking value** for completed rides
SELECT AVG('Booking_Value') AS avg 
FROM ola
WHERE 'Booking_Status' = 'Completed';

#6. Find the **maximum ride distance** travelled.
SELECT('Ride_Distance') AS longest_ride
FROM ola;

#7. Get the top 5 customers who spent the most on bookings.

SELECT 'Customer_ID',sum('Booking_Value') AS total_spent
FROM ola
WHERE'Booking_Status' 'Completed'
GROUP BY Customer_ID
ORDER BY total_spent DESC
LIMIT 5;

# 8. Show the **most common reason** for customer cancellations

SELECT 'Reason for cancelling by Customer', COUNT(*) AS frequency
FROM ola
WHERE Cancelled_Rides_by_Customer IS NOT NULL
GROUP BY Reason_for_cancelling_by_Customer
ORDER BY frequency DESC
LIMIT 1;

#9. Find the driver rating vs customer rating difference for each ride..
SELECT 'Booking_ID', 'Driver_Ratings', 'Customer_Rating', ('Customer_Rating''Driver_Ratings') AS rating_gap
FROM ola
WHERE 'Driver_Ratings' IS NOT NULL AND 'Customer_Rating' IS NOT NULL;

# 10. Find the **busiest pickup location** (most rides started from there)

SELECT 'Pickup_Location', COUNT(*) AS total_rides
FROM ola
GROUP BY 'Pickup_Location'
ORDER BY total_rides DESC
LIMIT 1;

