module Api
  module V1
    class PetsController < ApplicationController
      def index
        render json: PetSerializer.new(Pet.all)
      end
    end
  end
end
