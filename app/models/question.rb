class Question < ActiveRecord::Base
  has_many :answers
  default_scope {order('questions.created_at desc')} 
  validates :title, presence: true

  @@colors = ['#fde470','#32bdf1','#7397c3','#d7cba4','#57b8c5',
            '#61b4a1', '#9d7ac2', '#E0E4CC', '#69D2E7','#F38630']

  def all_answers
    all_count = self.all_count
    self.answers.each_with_index do |a,index|
      a.color = @@colors[index%@@colors.size()]
      if all_count == 0
        a.percent = 0
      else 
        a.percent = ((a.check_count.to_f/all_count.to_f) * 100).round
      end
      
    end
  end

  def all_count
    all_count = 0
    self.answers.each_with_index do |a,index|
      all_count = all_count + a.check_count 
    end
    all_count
  end

  def answersJSON
    answers = []
    self.answers.each_with_index do |a,index|
      answer = AnswerJson.new
      answer.value = a.check_count
      answer.color = @@colors[index%@@colors.size()]
      answers << answer
    end
    answers.to_json()
  end
end
