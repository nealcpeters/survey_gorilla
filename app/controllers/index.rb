get '/' do
  if session[:user_id] == nil
    erb :login
  else
    erb :index
  end
end



get '/survey/create' do
  if session[:user_id] == nil
    redirect '/'
  end

  erb :create_survey
end

#################################################POST


post '/login' do
  @user = User.find_by(params[:email])
  if @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect '/'
  else
    @errors = true
    erb :login
  end
end

post '/survey/create' do
  @survey = Survey.create(title: params[:title], user: session[:user_id], description: params[:description], public?: [:public])
end

post '/survey/question/create' do
  @survey.questions << Question.new(params)
end
