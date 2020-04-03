class Student
  attr_reader :name, :surname
  def initialize(name, surname)
    @name = name
    @surname = surname
    @homeworks = []
    @mentors = []
  end

  def submit_homework!(homework_data)
    @homeworks << homework_data
    notify_mentor
  end

  def notify_mentor
    @mentors.each { |mentor| mentor.send_update(self) }
  end

  attr_reader :homeworks

  def subscribe(mentor)
    @mentors << mentor
  end
end
