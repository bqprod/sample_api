module Api
  module V1
    class CommentsController < BaseController
      before_action :authorize_user!, except: %i[index]

      api :GET, '/v1/posts/:post_id/comments'
      param :page_number, :number, required: false, desc: 'Number of a page. Default: 1'
      param :page_size, :number, required: false, desc: 'Items per page. Default: 25'
      def index
        render json: Api::V1::Comments::IndexPage.new(params[:post_id], paginate_params).call, status: 200
      end
    end
  end
end
