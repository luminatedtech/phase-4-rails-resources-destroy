Rails.application.routes.draw do
  resources :birds
  patch "/birds/:id/like", to: "birds#increment_likes"
  def destroy
    bird = Bind.find_by(id: params[:id])
    if bird 
      bird.destroy
      head :no_content
    else
      render json: {error: "Bird no found"}, status: :not_found
    end 
  end 
end
