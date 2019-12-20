json.array! @days do |day|
  json.extract! day, :id, :day_date.to_date, :status, :starting_hour, ending_hour, daily_meal
end