class Api::V1::Users::UserFindController < ApplicationController
  def find
    user = User.find_by_email(params[:email])
    if !user.empty?
      render json: UserSerializer.new(user.first)

    elsif params[:email].blank?
      render json: { errors: { data: 'no search parameters' } }, status: 400

    else
      render json: UserSerializer.no_match(params[:email])
    end
  end
end
