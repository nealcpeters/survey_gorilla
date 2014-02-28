
user = User.create(name: "Jake The Snake", email: "h@gmail.com", password: "password", password_confirmation: "password", country: "America", gender: "Male", age: 24)
survey = Survey.create(title: "What?", description: "This is a test", is_public: true, user_id: user.id)

5.times do |i|
  question = Question.create(text: "This is question number #{i}", survey_id: survey.id)
  option1 = Option.create(question_id: question.id, text: "This is option 1")
  option2 = Option.create(question_id: question.id, text: "This is option 2")

  answer1 = Answer.create(option_id: option1.id, user_id: user.id)
  answer2 = Answer.create(option_id: option2.id, user_id: user.id)
  answer2 = Answer.create(option_id: option2.id, user_id: 2)
  answer2 = Answer.create(option_id: option2.id, user_id: 3)
  answer2 = Answer.create(option_id: option2.id, user_id: 4)
  answer2 = Answer.create(option_id: option2.id, user_id: 6)
  answer2 = Answer.create(option_id: option2.id, user_id: 5)
  answer2 = Answer.create(option_id: option2.id, user_id: 7)
  answer2 = Answer.create(option_id: option2.id, user_id: 8)
  answer2 = Answer.create(option_id: option2.id, user_id: 9)
  answer2 = Answer.create(option_id: option2.id, user_id: 11)
end
