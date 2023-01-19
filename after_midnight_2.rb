# After Midnight part 2
# Write two methods that each take a time of day in 24 hour format
# and return the number of minutes before and after midnight, respectively
# Both methods should return a value in the range 0..1439
# No using ruby's Date and Time methods

# START (whole program)
# SET constant variable hrs/day = 24
# SET constant variable min/hr = 60
# SET constant variable min/day = 1440

# after_midnight method:
# START
# given a string written in hh:mm format
# turn the string into an array of its characters
# SET hours = hh (from hh:mm)
# SET minutes = mm (from hh:mm)
# IF hours equals 24 then it is midnight
  # SET minutes_after_midnight = 0
# ELSE
  # SET minutes_after_midnight = hours * min/hr + minutes
# return minutes_after_midnight
# END

# before_midnight method:
# START
# given a string written in hh:mm format
# turn the string into an array of its characters
# SET hours = [h, h] from [h, h, :, m, m], join [h, h] to 'hh' and turn to integer
# SET minutes = [m, m] from [h, h, :, m, m], join [m, m] to 'mm' and turn to integer
# IF hours equal 24 or hours equal 00 and minutes equal 00 then its midnight
  # SET minutes_before_midnight = 0
# ELSE
  # SET minutes_before_midnight = min/day minus ((hours * min/hr) + minutes)
# return minutes_before_midnight
# END

HOURS_A_DAY = 24
MINUTES_AN_HOUR = 60
MINUTES_A_DAY = HOURS_A_DAY * MINUTES_AN_HOUR

def after_midnight(time)
  hours_and_minutes = time.chars
  hours = hours_and_minutes[0, 2].join.to_i
  minutes = hours_and_minutes[-2, 2].join.to_i
  if hours == 24
    minutes_after_midnight = 0
  else
    minutes_after_midnight = (hours * MINUTES_AN_HOUR) + minutes
  end
  minutes_after_midnight
end

def before_midnight(time)
  hours_and_minutes = time.chars
  hours = hours_and_minutes[0, 2].join.to_i
  minutes = hours_and_minutes[-2, 2].join.to_i
  if hours == 24 || (hours == 00 && minutes == 00)
    minutes_before_midnight = 0
  else
    minutes_before_midnight = MINUTES_A_DAY - ((hours * MINUTES_AN_HOUR) + minutes)
  end
  minutes_before_midnight
end 

# launch school's solution:
HOURS_PER_DAY = 24
MINUTES_PER_HOUR = 60
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def after_midnight(time_str)
  hours, minutes = time_str.split(':').map(&:to_i) # split returns an array separated at ':' and map(&:to_i) turns each element to an integer
  (hours * MINUTES_PER_HOUR + minutes) % MINUTES_PER_DAY # returns number of minutes past midnight
end                                                     # % MINUTES_PER _DAY takes care of returning 0 for 00:00 and 24:00
                                                        # since both have remainder of 0 

def before_midnight(time_str)   # uses the after_midnight method to shorten logic inside method
  delta_minutes = MINUTES_PER_DAY - after_midnight(time_str) # takes MINUTES_PER_DAY minus the return of time string being passed to after_midnight
  delta_minutes = 0 if delta_minutes == MINUTES_PER_DAY # returns 0 if total minutes ends up equal to MINUTES_PER_DAY
  delta_minutes 
end