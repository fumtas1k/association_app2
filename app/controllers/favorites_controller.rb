class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(blog_id: params[:blog_id])
    redirect_to request.referer, notice: "#{favorite.blog.user.name}の投稿をお気に入り登録しました"
  end
  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    flash[:danger] = "#{favorite.blog.user.name}の投稿をお気に入り解除しました"
    redirect_to request.referer
  end
end
