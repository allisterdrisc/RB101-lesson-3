# After Midnight part 1:
# The time of day can be represented as a number of minutes before or after midnight
# If the number of minutes is positive, the time is after midnight. If the number of
# minutes is negative, the time is before midnight

# Write a method that takes a time using this minute based format and returns the time 
# day in 24 hour format (hh:mm). Your method should work with any integer input
# You may not use ruby's Date and Time classes
# Disregard daylight savings and standard time etc.

# pseudo code/notes:
# if the integer is positive the time is after midnight
  # so 800 is 800 minutes after midnight
# if the integer is negative the time is before midnight
  # so -3 is 3 minutes before midnight
# 60 min in an hour 
# 24 hours in a day
# 60 * 24 = 1440 minutes in a day

# numbers that are negative, can have 1440 minutes added to them until they become positive,
# this will result in representing the same time from midnight, but working with a positive instead

# take the number of minutes (once converted to positive number) and find the remainder when
# the total minutes is divided by 1440
# this way number of minutes that are greater than 1440 will return as the remainder of minutes
# left (subtracting entire days from being included) 
# and number of minutes that are less than 1440 will return as themselves since 1440
# doesn't go into them at all

# once you have a number of minutes that is between 0 and 1439
# you can get to turning that number into hour and minute format
# take the number of minutes and return the division result and the remainder result
# the number of hours will be set to equal the division result
# the number of minutes will be set to equal the remainder result
# then change the formating so each number is represented with 2 digits and 
# written as hh:mm

# START (overall program)
# given an integer
# SET constant variable min/hr = 60
# SET constant variable hr/day = 24
# SET constant variable min/day = hr/day * min/hr (1440)
# define method: for changing min given to a positive number between 0 and 1439
  # START
  # given an integer
  # LOOP while integer is less than 0
    # add min/day to integer
  # divide minutes by min/day
# define method: for taking minutes before or after midnight and returning hh:mm format
  # START
  # given an integer
  # SET minutes = 0 to 1439 method(integer passed in)
  # SET hours = result of dividing minutes by min/hr
  # SET mins = result of finding the remainder of minutes divided by min/hr
  # format the hours and minutes to return as "hh:mm" ex: 04:43
# END

MINUTES_AN_HOUR = 60
HOURS_A_DAY = 24
MINUTES_A_DAY = HOURS_A_DAY * MINUTES_AN_HOUR

def normalize_minutes_0_through_1439(minutes)
  while minutes < 0
    minutes += MINUTES_A_DAY
  end

  minutes % MINUTES_A_DAY
end

def time_of_day(delta_minutes)
  delta_minutes = normalize_minutes_0_through_1439(delta_minutes)
  hours, minutes = delta_minutes.divmod(MINUTES_AN_HOUR)
  format('%02d:%02d', hours, minutes)
end 
