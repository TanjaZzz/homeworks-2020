class Student
  attr_reader :name, :surname, :mentors, :tasks, :homeworks
  def initialize(name, surname)
    @name = name
    @surname = surname
    @homeworks = []
    @mentors = []
    @tasks = []
  end

  def submit_homework!(homework_data)
    @tasks.pop
    @homeworks << homework_data
    notify_mentor
  end

  def notify_mentor
    @mentors.each { |mentor| mentor.send_update(self) }
  end

  def subscribe(mentor)
    @mentors << mentor
  end

  def get_tasks(mentor)
    @tasks << mentor.tasks
  end

  def unsubscribe_from(mentor)
    @mentors.delete(mentor)
  end
end
