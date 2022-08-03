module Api
  module V1
    class PetsController < ApplicationController
      def index
        render json: PetSerializer.new(Pet.all)
      end

      def create
        pet = Pet.create(pet_params)
        render json: PetSerializer.new(pet), status: :created
      end

      def show
        render json: PetSerializer.new(Pet.find(params[:id]))
      end

      def destroy
        begin
          pet = Pet.find(params[:id])
          pet.destroy
        rescue ActiveRecord::RecordNotFound
          render status: 404
        end
      end

      def update
        begin
          pet = Pet.find(params[:id])
          pet.update(pet_params)
          render json: PetSerializer.new(Pet.find(params[:id]))
        rescue ActiveRecord::RecordNotFound
          render status: 404
        end
      end

      def search
        pets = Pet.search(pet_params)
        render json: PetSerializer.new(pets)
      end

      private

      def pet_params
        params.permit(:name, :breed, :sex, :bio, :weight, :age, :user_id)
      end
    end
  end
end
