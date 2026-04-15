class Chat < ApplicationRecord
  belongs_to :user
  has_many :messages

  def collected_answers
    answers = messages.where(role: "user").pluck(:content)

    {
      indoor_outdoor: answers[0],
      light: answers[1],
      care_level: answers[2]
    }
  end

  def all_answers_collected?
    collected_answers.values.all?(&:present?)
  end
end
