module Responses 
  def return_success (obj)
    render json: obj
  end

  def return_not_authorized (msg)
    render json: { :body => msg }, status: :unauthorized
  end
end