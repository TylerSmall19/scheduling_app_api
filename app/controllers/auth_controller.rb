class AuthController < ApplicationController
  def login
    print params.permit(:user_name, :password)
    return_success( params )
  end

  def logout
    print 'Goodbye'
  end

  def oauth
    print 'Auth'
  end
end
