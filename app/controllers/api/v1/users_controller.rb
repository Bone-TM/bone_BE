module Api
  module V1
    class UsersController < ApplicationController
      def index
        render json: UserSerializer.new(User.all)
      end

      def create
        user = User.create(user_params)
        render json: UserSerializer.new(user), status: :created
      end

      def show
        user = User.find(params[:id])
        render json: UserSerializer.new(user)
      end

      private

      def user_params
        params.permit(:name, :bio, :email, :location)
      end
    end
  end
end
