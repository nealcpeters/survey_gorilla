
user = User.create(name: "Jake The Snake", email: "h@gmail.com", password: "password", password_confirmation: "password")
survey = Survey.create(title: "What?", description: "This is a test", is_public: true, user_id: user.id)

5.times do |i|
  question = Question.create(text: "This is question number #{i}", survey_id: survey.id)
  option1 = Option.create(question_id: question.id, text: "This is option 1")
  option2 = Option.create(question_id: question.id, text: "This is option 2")

  answer1 = Answer.create(option_id: option1.id, user_id: user.id)
  answer2 = Answer.create(option_id: option2.id, user_id: user.id)
end

Survey.create(user_id: 1, title: "Sample survey title", description: "Sample survey description", is_public: true)
Question.create(survey_id: 2, text: "asdfasdfasdf")
Question.create(survey_id: 2, text: "ad;gkhj;lasdlkfklj")
Question.create(survey_id: 2, text: "tewpuvdsakj;dfa")
Question.create(survey_id: 2, text: "tpoiua;kdsn;sadfj")
Option.create(question_id: 2, text: "option 1")
Option.create(question_id: 2, text: "option 2")
Option.create(question_id: 2, text: "option 3")
Option.create(question_id: 3, text: "option 1")
Option.create(question_id: 3, text: "option 2")
Option.create(question_id: 3, text: "option 3")
Option.create(question_id: 4, text: "option 1")
Option.create(question_id: 4, text: "option 2")
Option.create(question_id: 4, text: "option 3")
Option.create(question_id: 5, text: "option 1")
Option.create(question_id: 5, text: "option 2")
Option.create(question_id: 5, text: "option 3")




