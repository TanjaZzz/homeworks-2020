class Student
  attr_reader :name, :surname
  def initialize(name, surname)
    @name = name
    @surname = surname
    @homeworks = []
    @mentor = []
  end

  def submit_homework!(homework_data)
    @homeworks << homework_data
    # puts 'homework submitted'
    notify_mentor
  end

  def notify_mentor
    @mentor.each { |mentor| mentor.update(self) }
    # puts 'mentor notified'
  end

  def homeworks
    puts @homeworks
  end

  def update(mentor)
    @mentor << mentor
    # puts 'mentor is added'
  end
end

class Mentor
  attr_reader :name, :surname
  def initialize(name, surname)
    @name = name
    @surname = surname
    @notifications = []
    @student = []
  end

  def subscribe_to(student)
    @notifications.clear
    # puts 'mentor subscribed'
    @student << student
    notify_student
  end

  def notify_student
    @student.each { |student| student.update(self) }
    # puts 'student notified'
  end

  def read_notifications!
    @notifications = @notifications.clear
    # puts 'notifications are read'
  end

  def notifications
    puts @notifications
  end

  def update(_notifiaction)
    @notifications << 'Notification'
    # puts 'notifiaction is added'
  end
end

student = Student.new('John', 'Doe')
mentor = Mentor.new('Jack', 'Gonsales')

student.submit_homework!('homework_first')
student.homeworks # => [Homework, ...]

mentor.subscribe_to(student)
mentor.notifications # => []

student.submit_homework!('homework_second')
mentor.notifications # => [Notification, ...]

mentor.read_notifications!
mentor.notifications # => []
