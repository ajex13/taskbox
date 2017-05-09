class Project < ActiveRecord::Base

  has_many :tasks , dependent: :destroy
    validates_presence_of :name
    validates_length_of :name,minimum: 2
  def task_count
    self.task.size
  end
end
