get '/user/register' do
  erb :'user/register'
end

post '/user/register' do
  @current_user = User.create(
                            firstname: params[:user][:firstname],
                            lastname: params[:user][:lastname],
                            username: params[:user][:username],
                            email: params[:user][:email],
                            email_confirmation: params[:user][:email_confirmation],
                            password: params[:user][:password],
                            password_confirmation: params[:user][:password_confirmation]
                          )
  if @current_user.errors.empty?
    session[:id] = @current_user.id
    erb :'user/portal'
  else
    @errors = @current_user.errors
    erb :'/user/register'
  end
end
