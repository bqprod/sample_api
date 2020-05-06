module Api
  module V1
    module Posts
      class IndexPage < BasePage
        option :current_user, optional: true

        def call
          {
            meta: { page_number: page_number, page_size: page_size, total: repo.total_count },
            posts: posts
          }
        end

        private

        SELECT_ATTRS = {
          default: %i[id title body likes_count created_at],
          is_liked: ['CASE WHEN likes.id IS NULL THEN 0 ELSE 1 END as is_liked']
        }

        def posts
          data = current_user ? repo.all_posts_with_current_user_likes : repo.all_posts
          data.limit(limit).offset(offset).select(*select_attrs)
        end

        def select_attrs
          if current_user
            SELECT_ATTRS[:default] + SELECT_ATTRS[:is_liked]
          else
            SELECT_ATTRS[:default]
          end
        end

        def repo
          @repo ||= PostsRepository.new(current_user: current_user)
        end
      end
    end
  end
end
