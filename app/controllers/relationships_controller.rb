class RelationshipsController < ApplicationController
  #フォローアンフォロー
  def create
    @user = User.find(params[:user_id])
    current_user.follow(params[:user_id])
    redirect_back fallback_location: root_path
  end
  def destroy
    current_user.unfollow(params[:user_id])
    redirect_back fallback_location: root_path
  end

  #一覧
  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end
  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end
end
