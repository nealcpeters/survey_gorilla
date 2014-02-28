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
end

get '/survey/create' do
  # binding.pry
  if session[:user_id] == nil
    redirect '/'
  end
  erb :create_survey
end

get '/survey/:survey_id' do
  @survey = session[:current_survey]
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
  erb :confirm_survey
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
    redirect '/'
  else
    @errors = true
    erb :login
  end
end

post '/survey/confirm' do
  session[:current_survey] = nil
  redirect '/'
end

post '/survey/create' do
  survey = Survey.create(params[:survey])
  session[:current_survey] = survey.id
  redirect '/survey/create/question'
end

post '/survey/create/question' do
  @survey = Survey.find(session[:current_survey])
  @survey.questions << Question.new(params[:question])
  redirect "/survey/create/question"
end

post '/survey/create/option' do
  @survey = Survey.find(session[:current_survey])
  @survey.questions << Question.new(params)
  redirect '/survey/create/question'
end

post '/survey/create/confirm' do
  survey = Survey.find(session[:current_survey])
  survey.save
  redirect '/survey/create/confirm'
end



























