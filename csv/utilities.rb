require 'csv'

class CsvSource
  def initialize(csv_file)
    @csv = CSV.open(csv_file, headers: true, header_converters: :symbol)
  end

  def each
    @csv.each do |row|
      yield(row.to_hash)
    end
    @csv.close
  end
end

class ReportBuilder
  def initialize
    @total_employee = 0
    @total_age = 0
  end

  def <<(row)
    @total_employee += 1
    @total_age += row[:age].to_i
  end

  def build
    File.open('report.txt', 'w') do |f|
      f.puts "Total Employee: #{@total_employee}"
      f.puts "Average Age: #{@total_age / @total_employee}"
    end
  end
end
