class Answer < ActiveRecord::Base
  belongs_to :question
  default_scope {order('answers.check_count desc')}
  validates :answer, presence: true
  validates :question, presence: true
  validates :check_count, presence: true

  def value=(value)
    @value = value
  end

  def value
    @value
  end
  
  def color=(color)
    @color = color
  end

  def color
    @color
  end

  def percent=(percent)
    @percent = percent
  end

  def percent
    @percent
  end
end
