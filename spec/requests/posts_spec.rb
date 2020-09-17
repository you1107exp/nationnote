require 'rails_helper'

describe PostsController, type: :request do
  before do
    @post = FactoryBot.create(:post)
  end

  describe "GET #index" do
    it "indexアクションにリクエストすると正常にレスポンスが返ってくる" do
      get root_path
      expect(response.status).to eq 200
    end
    it "indexアクションにリクエストするとレスポンスに投稿済みのタイトルが存在する" do
      get root_path
      expect(response.body).to include @post.title
    end
    it "indexアクションにリクエストするとレスポンスに投稿済みの国名が存在する" do
      get root_path
      expect(response.body).to include @post.country[:name]
    end
    it "indexアクションにリクエストするとレスポンスに投稿済みの投稿者名が存在する" do
      get root_path
      expect(response.body).to include @post.user[:nickname]
    end
  end

  describe "GET #show" do
    it "showアクションにリクエストすると正常にレスポンスが返ってくる" do
      get post_path(@post)
      expect(response.status).to eq 200
    end
    it "showアクションにリクエストするとレスポンスに投稿済みのタイトルが存在する" do
      get post_path(@post)
      expect(response.body).to include @post.title
    end
    it "showアクションにリクエストするとレスポンスに投稿済みの国名が存在する" do
      get post_path(@post)
      expect(response.body).to include @post.country[:name]
    end
    it "showアクションにリクエストするとレスポンスに投稿済みの投稿者名が存在する" do
      get post_path(@post)
      expect(response.body).to include @post.user[:nickname]
    end
  end
end
