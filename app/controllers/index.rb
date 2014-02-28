get '/' do
  if session[:user_id] == nil
    erb :register
  else
    erb :index
  end
end

get '/logout' do
  if session
    session.clear
  end
<<<<<<< HEAD

  redirect to '/'
=======
  redirect '/'
>>>>>>> c9f2b0db61a5539b03689c9d8cea4c5136830be7
end

get '/survey/create' do
  # binding.pry
  if session[:user_id] == nil
    redirect '/'
  end
  erb :create_survey
end

get '/survey/:survey_id' do
  @survey = Survey.find(params[:survey_id])

  erb :take_survey
end

get '/survey/create/question' do
  if session[:user_id] == nil
    redirect '/'
  end
  erb :create_question
end

get '/survey/create/confirm' do
  if session[:user_id] == nil
    redirect '/'
  end
  session[:current_survey] = nil
  erb :confirm_survey
end

get '/survey/:survey_id/results' do
  @survey = Survey.find_by_id(params[:survey_id])
  if @survey == nil
    @error = true
  end

  erb :survey_results
end

get '/survey/create/question/option' do
  if session[:user_id] == nil
    redirect '/'
  end
  @question = Question.last

  erb :_create_option
end


#################################################POST




post '/login' do
  @user = User.find_by_email(params[:email])
  if @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect '/'
  else
    @errors = true
    erb :login
  end
end

post '/create_account' do
  @user = User.create(params[:user])
  if @user.save
    session[:user_id] = user.id
    redirect '/'
  else
    @errors = true
    erb :login
  end
end

post '/survey/confirm' do
  @survey = Survey.find(params[:survey_id])
  #@question = @survey.
  params[:option].each do |x|
    Answer.create(
      option_id: x[1],
      user_id: session[:user_id],
      survey_id: @survey.id,
      question_id: x[0]
    )
  end
  erb :survey_confirmation
end

post '/survey/create' do
  survey = Survey.create(params[:survey])
  session[:current_survey] = survey.id
  redirect '/survey/create/question'
end

post '/survey/create/question' do

  @survey = Survey.find(session[:current_survey])
  # binding.pry
  @survey.questions << Question.new(params[:question])
  @question = Question.last
  @options = true
  erb :_create_option, layout: false
end

post '/survey/create/question/option' do
  @question = Question.last
  @question.options << Option.new(params[:option])
  # binding.pry
  if request.xhr?
    # binding.pry
    @add = true
    erb :_add_option, layout: false
  else
    puts "babababa"
    redirect '/survey/create/question'
  end

end

post '/survey/create/confirm' do
  redirect '/survey/create/confirm'
end



























