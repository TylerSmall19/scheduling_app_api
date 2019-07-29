class AuthController < ApplicationController
  def login
    print 'Hello'
    render json: { this: :thing }
  end

  def logout
    print 'Goodbye'
  end

  def oauth
    print 'Auth'
  end
end
