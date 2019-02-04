class Api::V1::ContentnewsController < ApplicationController
  before_action :find_contentnew, only: [:update, :destroy]

 def index
   @contentnews = Contentnew.all
   render json: @contentnews
 end

 def create
   @contentnew = Contentnew.create(contentnew_params)
   render json: @contentnew, status: :accepted
 end

 def update
   @contentnew.update(contentnew_params)
   if @contentnew.save
     render json: @contentnew, status: :accepted
   else
     render json: { errors: @contentnew.errors.full_messages }, status: :unprocessible_entity
   end
 end

 def destroy
   @contentnew.destroy
   render json: { message: “removed” }, status: :ok
 end

 private

 def contentnew_params
   params.require(:contentnew).permit(:news_src, :title, :description)
 end

 def find_contentnew
   @contentnew = Contentnew.find(params[:id])
 end

end
