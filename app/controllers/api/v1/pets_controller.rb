module Api
  module V1
    class PetsController < ApplicationController
      def index
        render json: PetSerializer.new(Pet.all)
      end

      def show
        render json: PetSerializer.new(Pet.find(params[:id]))
      end
    end
  end
end
