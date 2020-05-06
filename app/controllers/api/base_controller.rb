module Api
  class BaseController < ApplicationController
    before_action :authenticate_user!, :authorize_user!

    rescue_from ActiveRecord::RecordNotFound, with: :not_found

    private

    def current_user
      @current_user
    end

    # Any auth logic
    def authenticate_user!
      @current_user ||= User.find_by(id: decode_user_data[:id])
    end

    def authorize_user!
      return not_authorized unless current_user
    end

    def decode_user_data
      { id: request.env['HTTP_AUTHORIZATION'] }
    end

    def not_authorized
      render json: { error: 'Unauthorized' }, status: 401
    end

    def not_found
      render json: { error: 'Not Found' }, status: 404
    end

    def paginate_params
      params.permit(:page_number, :page_size).to_h.symbolize_keys
    end
  end
end
