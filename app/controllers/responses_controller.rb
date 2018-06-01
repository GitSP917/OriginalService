class ResponsesController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    @thre = Thre.find(params[:thre_id])
    @response = current_user.responses.build(response_params)
    @response.thre_id = @thre.id
    @response.restime=Time.now.to_s(:db)

    if @response.save!
      flash[:success] = '投稿しました。'
      redirect_to @thre
    else
      @responses = current_user.responses.order('created_at DESC').page(params[:page])
      flash.now[:danger] = '投稿に失敗しました。'
      render 'toppages/index'
    end
    
  end
  
  private
  
  def response_params
    #params.require(:response).permit(:content, :thre_id)
    params.require(:response).permit(:content)
  end
  
  def correct_user
    @response = current_user.responses.find_by(id: params[:id])
    unless @response
      redirect_to root_url
    end
  end
  
end
