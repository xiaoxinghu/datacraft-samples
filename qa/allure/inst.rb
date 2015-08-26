require './utilities'
require 'datacraft/tools'

from Datacraft::Tools::AllureTestCases, 'allure_results'

tweak do |row|
  row
end

to ReportBuilder
