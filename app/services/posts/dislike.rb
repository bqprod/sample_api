module Posts
  class Dislike < BaseService
    option :current_user
    option :post_id

    def call
      process_dislike
    end

    private

    def process_dislike
      post.likes.find_by(user_id: current_user.id)&.destroy
    end

    def post
      Post.find(post_id)
    end
  end
end
