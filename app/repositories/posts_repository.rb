class PostsRepository < BaseRepository
  option :relation, default: -> { Post }
  option :current_user, optional: true

  def total_count
    relation.count
  end

  def all_posts
    relation.order(:id)
  end

  def all_posts_with_current_user_likes
    all_posts.joins("LEFT JOIN likes on posts.id = likes.post_id and likes.user_id = #{current_user.id}")
  end
end
