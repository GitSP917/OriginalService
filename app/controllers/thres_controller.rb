class ThresController < ApplicationController
  before_action :require_user_logged_in
  
  def index
    if logged_in?
      @user = current_user
      @thread = current_user.thres.build  # form_for 用
      @threads = Thre.all.page(params[:page])
    end
  end
  
  def new
    @thread = Thre.new
  end
  
  def show
    @thread = Thre.find(params[:id])
    @response = @thread.responses.build
    @responses = @thread.responses.page(params[:page])
  end

  def create
    @thread = current_user.thres.build(thread_params)
    if @thread.save
      flash[:success] = 'スレッドを作成しました。'
      redirect_to @thread
    else
      @threads = current_user.thres.order('created_at DESC').page(params[:page])
      flash.now[:danger] = 'スレッドの作成に失敗しました。'
      render :new
    end
  end

  def destroy
    @thread = current_user.thres.find_by(id: params[:id])
    return redirect_to root_url if @thread.user != current_user
    @thread.destroy
    flash[:success] = 'スレッドを削除しました。'
    redirect_back(fallback_location: root_path)
  end

  private

  def thread_params
    params.require(:thre).permit(:title)
  end
  
  def correct_user
    @thread = current_user.thres.find_by(id: params[:id])
    unless @thread
      redirect_to root_url
    end
  end
end
