class AuthController < ApplicationController
  def login
    return_success(auth_params)
  end

  def logout
    print 'Goodbye'
  end

  def oauth
    print 'Auth'
  end

  private
  def auth_params
    params.require(:auth).permit(:userName, :password)
  end
end