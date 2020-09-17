require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe '投稿の保存' do
    context "投稿が保存できる場合" do
      it "タイトルと国名と本文と参考URLがあれば投稿は保存される" do
        expect(@post).to be_valid
      end
      it "タイトルと国名と本文があれば投稿は保存される" do
        @post.ref_url = ""
        expect(@post).to be_valid
      end
    end

    context "投稿が保存できない場合" do
      it "タイトルがないと投稿は保存できない" do
        @post.title = ""
        @post.valid?
        expect(@post.errors.full_messages).to include("Title can't be blank")
      end
      it "国名が選択されていないと投稿は保存できない" do
        @post.country_id = 1
        @post.valid?
        expect(@post.errors.full_messages).to include("Country must be other than 1")
      end
      it "本文がないと投稿は保存できない" do
        @post.content = ""
        @post.valid?
        expect(@post.errors.full_messages).to include("Content can't be blank")
      end
      it "ユーザーが紐付いていないと投稿は保存できない" do
        @post.user = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("User must exist")
      end
    end
  end
end
