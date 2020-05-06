class CommentsRepository < BaseRepository
  option :relation, default: -> { Comment }
  option :post_id, optional: true

  def post_comments
    relation.where(post_id: post_id).includes(:user).order(:id)
  end

  def post_comments_count
    relation.where(post_id: post_id).count
  end
end
