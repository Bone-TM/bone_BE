module Api
  module V1
    class UsersController < ApplicationController
      def index
        render json: UserSerializer.new(User.all)
      end

      def create
        render json: UserSerializer.new(User.create(user_params)), status: :created
      end

      private

      def user_params
        params.require(:user).permit(:name, :bio, :email, :password_digest, :location)
      end
    end
  end
end
