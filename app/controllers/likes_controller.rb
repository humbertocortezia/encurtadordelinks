class LikesController < ApplicationController
  before_action :set_like, only: %i[destroy ]

  def new
    ipx = request.remote_ip
    ip_extern = Like.where(ipx: ipx)

      if ip_extern
        @url = ip_extern
      end

      @like = Like.new
  end

  def create
    encurtador
    ipx = request.remote_ip
    @like = Like.new(like_params)
    @like.url_curt = encurtador
    @like.cont =  0
    @like.ipx = ipx
    @like.save
    flash[:success] = 'link encurtado com Sucesso.'
    redirect_to new_like_path
  end

  def encurtador
    #Gerador de caracteres limitado a 4 dígitos
   str = SecureRandom.alphanumeric(4)
  end

  # DELETE /likes/1 or /likes/1.json
  def destroy
    @like.destroy
    respond_to do |format|
      flash[:success] = 'link deletado com Sucesso.'
      format.html { redirect_to new_like_path }
      format.json { head :no_content }
    end
  end

  def valida
     base = Like.where(url_curt: params[:id]).take
     url = params[:id]
    if url == base.url_curt
      total = base.cont + 1
      base.update(cont: total)
      redirect_to base.url_ori
    else
       redirect_to new_like_path
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_like
      @like = Like.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def like_params
      params.require(:like).permit(:url_ori, :url_curt, :cont)
    end
end
