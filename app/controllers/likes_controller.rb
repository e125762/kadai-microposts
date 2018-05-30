# -*- coding: utf-8 -*-
class LikesController < ApplicationController
  before_action :require_user_logged_in

  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.liked(micropost)
    flash[:success] = 'micropostにいいねしました'
    redirect_to(:back)
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.unliked(micropost)
    flash[:success] = 'micropostのいいねを取り消しました'
    redirect_to(:back)
  end
end
