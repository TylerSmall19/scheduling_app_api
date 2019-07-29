module Responses 
  def return_success (obj)
    render json: obj
  end
end