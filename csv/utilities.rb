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
