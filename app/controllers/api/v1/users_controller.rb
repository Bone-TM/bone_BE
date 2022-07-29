module Api
  module V1
    class UsersController < ApplicationController
      def index
        render json: UserSerializer.new(User.all)
      end

      def create
        render json: UserSerializer.new(User.create(user_params)), status: :created
      end

      def destroy
        render json: User.find(params[:id]).destroy
      end

      def show
        user = User.find(params[:id])
        render json: UserSerializer.new(user)
      end

      private

      def user_params
        params.require(:user).permit(:name, :bio, :email, :auth_token, :location)
      end
    end
  end
end
