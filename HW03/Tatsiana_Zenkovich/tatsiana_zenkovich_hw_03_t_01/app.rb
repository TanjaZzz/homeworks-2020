require_relative 'student'
require_relative 'mentor'
require_relative 'task'

student = Student.new('John', 'Doe')
mentor = Mentor.new('Jack', 'Gonsales')

student.subscribe(mentor)
mentor.prepare_task('your task') # => [Task, ...]

mentor.subscribe_to(student)
mentor.send_task_to_student(student)

student.tasks # => [Task, ...]
student.submit_homework!('Homework')

student.homeworks # => [Homework, ...]
mentor.notifications # => [Notification, ...]

mentor.read_notifications!
mentor.notifications # => []

mentor.unsubscribe_from(student)
student.unsubscribe_from(mentor)
