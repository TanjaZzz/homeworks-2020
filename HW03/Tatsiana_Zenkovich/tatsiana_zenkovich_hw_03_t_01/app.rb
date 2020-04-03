require_relative 'student'
require_relative 'mentor'

module App
  def self.run
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
  end
end

App.run
