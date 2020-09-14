########################################################
# Step 1: Establish the layers
# # In this section of the file, as a series of comments,
# # create a list of the layers you identify.

# There are three main layers:
# Trips_data (hash)
# rides (arrays of hashes in which each single hash represents a single ride )

# Which layers are nested in each other?
# In Trips_data (hash), for each driver there is rides array which represents all rides for that driver.
# Inside rides (array of hashes) there are hashes with information of each ride.

# Which layers of data "have" within it a different layer?
# The trips_data (hash) has rides (array) inside it.
# Also rides (array) has multiple hashes inside it.

# Which layers are "next" to each other?
# the rides(array) layers of each driver(hashes), the details of each ride is inside a hash

########################################################
# Step 2: Assign a data structure to each layer
# Copy your list from above, and in this section
# determine what data structure each layer should have
# trips_data (hashes)
# rides (arrays of hashes)
# each single ride has its own hash
########################################################
# Step 3: Make the data structure!
# # Setup the entire data structure:
# # based off of the notes you have above, create the
# # and manually write in data presented in rides.csv
# # You should be copying and pasting the literal data
# # into this data structure, such as "DR0004"
# # and "3rd Feb 2016" and "RD0022"

trips_data = [{
    driver_id: "DR0001",
    rides: [
        {
            date: "3rd Feb 2016",
            cost: 10,
            rider_id: "RD0003",
            rating: 3
        },{
            date: "3rd Feb 2016",
            cost: 30,
            rider_id: "RD0015",
            rating: 4
        },{
            date: "5th Feb 2016",
            cost: 45,
            rider_id: "RD0003",
            rating: 2
        }]},{
    driver_id: "DR0002",
    rides: [
        {
            date: "3rd Feb 2016",
            cost: 25,
            rider_id: "RD0073",
            rating: 5
        },{
            date: "4th Feb 2016",
            cost: 15,
            rider_id: "RD0013",
            rating: 1
        },{
            date: "5th Feb 2016",
            cost: 35,
            rider_id: "RD0066",
            rating: 3
        }]},{
    driver_id: "DR0003",
    rides: [
        {
            date: "4th Feb 2016",
            cost: 5,
            rider_id: "RD0066",
            rating: 5
        },{
            date: "5th Feb 2016",
            cost: 50,
            rider_id: "RD0003",
            rating: 2
        }]},{
    driver_id: "DR0004",
    rides: [
        {
            date: "4th Feb 2016",
            cost: 10,
            rider_id: "RD0022",
            rating: 4
        },{
            date: "5th Feb 2016",
            cost: 20,
            rider_id: "RD0073",
            rating: 5
        },{
            date: "3rd Feb 2016",
            cost: 5,
            rider_id: "RD0022",
            rating: 5
        }]}]

def line
        puts "-" * 55
end

def line2
        puts "-" * 104
end
########################################################
# Step 4: Total Driver's Earnings and Number of Rides

# Use an iteration blocks to print the following answers:
# - the number of rides each driver has given

line
puts "Number of rides each driver has given"
line
trips_data.map { |driver_trips|
  puts "Driver with ID of #{driver_trips[:driver_id]} made #{driver_trips[:rides].length} rides"}
line

# - the total amount of money each driver has made
puts "Total amount of money each driver has made"
line

trips_data.map do |driver_trips|
  sum = driver_trips[:rides].sum do |ride|
    ride[:cost]
  end
  puts "Driver with ID of #{driver_trips[:driver_id]} earned $#{sum} "
  end
line

# - the average rating for each driver
puts "Average rating for each driver"
line

trips_data.map do |driver_trips|
  sum = driver_trips[:rides].sum { |ride|
          ride[:rating]}
  count = driver_trips[:rides].count { |ride|
          ride[:rating]}
  average = sum/count
  puts "Driver with ID of #{driver_trips[:driver_id]} has an average ratings of #{average} "
end


# - Which driver made the most money?
line2
drivers_earning = []

trips_data.map do |driver_trips|
  earning = driver_trips[:rides].sum do |ride|
                ride[:cost]
        end

        drivers_earning << {
            driver_id: driver_trips[:driver_id],
            earnings: earning
        }
end

drivers_earning.sort_by!{|driver| driver[:earnings]}

puts "The driver who earned the most is the driver with ID of #{drivers_earning[-1][:driver_id]} who earned $#{drivers_earning[-1][:earnings]} ."


# - Which driver has the highest average rating?

drivers_ratings = []

trips_data.map do |driver_trips|
        sum = driver_trips[:rides].sum { |ride|
                ride[:rating]}
        count = driver_trips[:rides].count { |ride|
                ride[:rating]}
        average = sum/count

        drivers_ratings << {
            driver_id: driver_trips[:driver_id],
            ratings: average
        }
end

drivers_ratings.sort_by!{|driver| driver[:ratings]}

puts "The driver with the highest average rating is the driver with ID of #{drivers_ratings[-1][:driver_id]} with an average rating of #{drivers_ratings[-1][:ratings]} ."
line2
