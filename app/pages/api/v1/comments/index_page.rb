module Api
  module V1
    module Comments
      class IndexPage < BasePage
        param :post_id

        def call
          {
            meta: { page_number: page_number, page_size: page_size, total: repo.post_comments_count },
            comments: comments
          }
        end

        private

        SELECT_ATTS = {
          only: [:user_id, :message, :created_at],
          include: { user: { only: [:email] } }
        }.freeze

        def comments
          data = repo.post_comments
          data.limit(limit).offset(offset).as_json(SELECT_ATTS)
        end

        def repo
          @repo ||= CommentsRepository.new(post_id: post_id)
        end
      end
    end
  end
end
