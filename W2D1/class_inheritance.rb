class Employee
  attr_accessor :boss
  attr_reader :salary
  def initialize(name, title, salary, boss)

    @name = name
    @title = title
    @salary = salary
    @boss = boss
      
  end
  
  def bonus(multiplier)
    bonus = @salary * multiplier
  end
  
end

class Manager < Employee
  attr_accessor :employees
  def initialize(name, title, salary, boss, employees = [])
    super(name, title, salary, boss)
    @employees = employees

  end
  
  def bonus(multiplier)
    super
    salaries = []
    @employees.each do |employee|
      salaries << employee.salary
      puts salaries
      if employee.is_a? Manager
        employee.employees.each do |employee|
          salaries << employee.salary
        end
      end
    end
    total_sal = salaries.reduce(:+)
    bonus = total_sal * multiplier
  end
end

