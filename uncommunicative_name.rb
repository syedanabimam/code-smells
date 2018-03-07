# BAD
# app/controllers/summaries_controller.rb
@summaries = @survey.summaries_using(summarizer)

# app/models/survey.rb
def summaries_using(summarizer)
  questions.map do |question|
    question.summarize(summarizer)
  end
end

# app/models/question.rb
def summarize(summarizer)
  value = summarizer.summarize(self)
  Summary.new(title, value)
end

# GOOD

# app/models/survey.rb
  def summaries_using(summarizer)

# app/controllers/summaries_controller.rb
  @summaries = @survey.summaries_using(summarizer)

# app/models/question.rb
  def summary_using(summarizer)

# app/models/survey.rb
  question.summary_using(summarizer)
