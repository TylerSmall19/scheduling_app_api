class AuthController < ApplicationController
  def login
    return_success( {this: :thing} )
  end

  def logout
    print 'Goodbye'
  end

  def oauth
    print 'Auth'
  end
end
