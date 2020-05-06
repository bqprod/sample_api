module Posts
  class Like < BaseService
    option :current_user
    option :post_id

    def call
      process_like
    end

    private

    def process_like
      post.likes&.find_or_create_by(user_id: current_user.id)
    end

    def post
      Post.find(post_id)
    end
  end
end
