require "rails_helper"

RSpec.describe "Posts", :type => :request do
  let(:parsed_response) { JSON.parse(response.body) }
  let(:user) { create(:user) }
  let!(:post_1) { create(:post) }
  let!(:post_2) { create(:post) }

  describe 'request list of posts' do
    before do
      create(:like, user: user, post: post_1)
    end

    it_behaves_like 'success response' do
      before { get api_v1_posts_path }
    end

    it 'returns posts' do
      get api_v1_posts_path, headers: valid_auth_header(user)
      aggregate_failures do
        expect(parsed_response['posts'][0]['id']).to eq(post_1.id)
        expect(parsed_response['posts'][0]['is_liked']).to eq(1)
        expect(parsed_response['posts'][1]['id']).to eq(post_2.id)
        expect(parsed_response['posts'][1]['is_liked']).to eq(0)
      end
    end
  end

  describe 'request to like a post' do
    let(:send_request) { post like_api_v1_post_path(post_1.id), headers: valid_auth_header(user) }

    it_behaves_like 'invalid auth token' do
      before { post like_api_v1_post_path(post_1.id) }
    end

    it_behaves_like 'record not found' do
      before { post like_api_v1_post_path(post_2.id + 1), headers: valid_auth_header(user) }
    end

    it_behaves_like 'success response' do
      before { send_request }
    end

    it 'creates like for post' do
      expect { send_request }
        .to change { post_1.reload.likes.count }.by(1)
        .and change { post_1.likes_count }.from(0).to(1)
    end

    context 'when user tries to like again' do
      before { send_request }

      it_behaves_like 'success response' do
        before { send_request }
      end

      it 'doesn\'t create new like' do
        expect { send_request }.to_not change { post_1.reload.likes.count }
      end
    end
  end

  describe 'request to dislike a post' do
    it_behaves_like 'invalid auth token' do
      before { post dislike_api_v1_post_path(post_1.id) }
    end

    let(:send_request) { post dislike_api_v1_post_path(post_1), headers: valid_auth_header(user) }

    before do
      post_1.likes.create(user: user)
    end

    it_behaves_like 'record not found' do
      before { post dislike_api_v1_post_path(post_2.id + 1), headers: valid_auth_header(user) }
    end

    it_behaves_like 'success response' do
      before { send_request }
    end

    it 'deletes like' do
      expect { send_request }
        .to change { post_1.reload.likes.count }.from(1).to(0)
        .and change { post_1.likes_count }.from(1).to(0)
    end

    context 'when user tries to dislike again' do
      before { send_request }

      it_behaves_like 'success response' do
        before { send_request }
      end

      it 'do nothing' do
        expect { send_request }.to_not change { post_1.reload.likes.count }
      end
    end
  end
end
