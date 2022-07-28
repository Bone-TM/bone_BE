module Api
  module V1
    class UsersController < ApplicationController
      def index
        render json: UserSerializer.new(User.all)
      end

      def show
        user = User.find(params[:id])
        render json: UserSerializer.new(user)
      end
    end
  end
end
