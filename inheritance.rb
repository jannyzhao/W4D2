class Employee

    attr_reader :name, :title, :salary, :boss

    def initialize(name, title, salary, boss=nil)
        @name = name
        @title = title
        @salary = salary
        self.boss = boss
    end

    def boss=(boss)
        @boss = boss
        boss.employees << self
        self
    end

    def bonus(multiplier)
        bonus = (salary) * multiplier
    end

end


class Manager < Employee
    attr_writer :employees
    attr_writer :boss
    def initialize(name, title, salary, boss=nil, employees = [])
        super(name, title, salary, boss)
        @employees = employees
    end

    def add_employee(subordinate)
        @employees << subordinate
    end

    def bonus(multiplier)
        self.total_subsalary * multiplier
    end

    protected

    def total_subsalary
    total_subsalary = 0
    self.employees.each do |employee|
        if employee.is_a?(Manager)
        total_subsalary += employee.salary + employee.total_subsalary
        else
        total_subsalary += employee.salary
        end
    end

    total_subsalary
    end
end


ned = Manager.new("Ned", "Founder", 10000000, nil)
darren = Manager.new("Darren", "TA Manager", 78000, "ned")
shawna = Employee.new("Shawna", "TA", 12000, "darren")
david = Employee.new("David", "TA", 10000, "darren")

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
