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
    @student << student
    notify_student
  end

  def notify_student
    @student.each { |student| student.subscribe(self) }
  end

  def read_notifications!
    @notifications = @notifications.clear
  end

  attr_reader :notifications

  def send_update(_notifiaction)
    @notifications << 'Notification'
  end
end
