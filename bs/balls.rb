class Technik
  attr_accessor :age

  def initialize(age, extra_skills = nil)

    @extra_skills = extra_skills
    @age = age
    @all_skills = ""
    @base_skills = "cs knowledge"
    @all_skills << [@skills, @base_skills, *@extra_skills].join(", ")

  end
  def age=(value)
    value > @age && value > 0 ? @age = value : puts("invalid age")
  end

  def greet
    puts "hey, i'm stinky and i'm #{@age} years old, and my skill is #{@all_skills}" 
  end

  def learn(skill)
    @all_skills += ", #{skill}"
  end

end


class Programista < Technik
  def initialize(age, extra_skills = nil)

    @skills = "coding"   
    super(age, extra_skills)
  end
end


class Informatyk < Technik

  def initialize(age, extra_skills = nil)
    @skills = "network management"   
    super(age, extra_skills)

  end
end
janek = Informatyk.new(19, "server administration")
janek.greet
