module Api
  module V1
    class PostsController < BaseController
      before_action :authorize_user!, except: %i[index]

      api :GET, '/v1/posts'
      param :page_number, :number, required: false, desc: 'Number of a page. Default: 1'
      param :page_size, :number, required: false, desc: 'Items per page. Default: 25'
      def index
        render json: Api::V1::Posts::IndexPage.new(current_user: current_user, **paginate_params).call, status: 200
      end

      api :POST, '/v1/posts/:id/like'
      description 'Add like to a post. Only for authorized users'
      def like
        ::Posts::Like.call(current_user: current_user, post_id: params[:id])
        render json: { message: "liked" }, status: 200
      end

      api :POST, '/v1/posts/:id/dislike'
      description 'Delete like from a post. Only for authorized users'
      def dislike
        ::Posts::Dislike.call(current_user: current_user, post_id: params[:id])
        render json: { message: "disliked" }, status: 200
      end
    end
  end
end
