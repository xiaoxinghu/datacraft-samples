require './utilities'
require 'faker'
require 'datacraft/tools'

total_number_of_employees = 1000
retirement_age = 60

# generate csv file before the build
pre_build do
  puts 'Generating data file...'
  CSV.open('data.csv', 'w') do |csv|
    csv << ['first name', 'last name', 'age', 'phone number', 'email']
    total_number_of_employees.times do
      csv << [
        Faker::Name.first_name,
        Faker::Name.last_name,
        Faker::Number.between(1, 100),
        Faker::PhoneNumber.cell_phone,
        Faker::Internet.email]
    end
  end
  puts "#{total_number_of_employees} entries has been generated."
end

# define data provider
from Datacraft::Tools::CsvReader, 'data.csv'

# tweak each row
tweak do |row|
  # eliminate the retired ones
  row[:age].to_i < retirement_age ? row : nil
end

# define data consumer
to ReportBuilder

# after build hook
post_build do
  puts 'Done.'
end
