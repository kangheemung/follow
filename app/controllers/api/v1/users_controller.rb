class Api::V1::UsersController < ApplicationController
  include JwtAuthenticator
  before_action :jwt_authenticate, except: :create
    def create
        user=User.new(user_params)
        p"=============new======"
        p params
        p"==================="
        p "user variable"
        p user
       if user.save
        p"==============save====="
        p params
        p"==================="
        token = encode(user.id)
        render json: {status: 201, data: {name: user.name, email: user.email, token: token}}
       else
        p"error for user"
        p user.errors.full_messages
        render json: {status: 400,error: "users can't save and create"}
       end
    end
    def update
      if user=User.find_by(id: params[:id])
        p"==============save====="
        p params
        p"==================="
        user.update(user_params)
        user.save
        render json: {status: 201, data: user}
      else
        render json: {status: 400,error: "users can't update"}
      end
    end
    private
    def user_params
      
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    

end
