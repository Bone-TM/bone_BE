module Api
  module V1
    class PetsController < ApplicationController
      def index
        render json: PetSerializer.new(Pet.all)
      end
      
      def create
        render json: PetSerializer.new(Pet.create(pet_params)), status: :created
      end
      
      def show
        render json: PetSerializer.new(Pet.find(params[:id]))
      end

      private

      def pet_params
        params.require(:pet).permit(:name, :breed, :sex, :bio, :weight, :age, :user_id)
      end
    end
  end
end
