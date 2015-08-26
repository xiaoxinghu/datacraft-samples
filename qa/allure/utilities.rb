require 'csv'

class ReportBuilder
  def initialize
    @report = {}
  end

  def <<(row)
    status = row['@status']
    @report[status] ||= 0
    @report[status] += 1
  end

  def build
    File.open('report.txt', 'w') do |f|
      @report.each do |k, v|
        f.puts "#{k}: #{v}"
      end
      total = @report.values.reduce :+
      passed = @report['passed']
      f.puts "pass rate: #{(passed * 100.0 / total).round(2)}%"
    end
  end
end
