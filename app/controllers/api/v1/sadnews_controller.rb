class Api::V1::SadnewsController < ApplicationController
  before_action :find_sadnew, only: [:update, :destroy]

 def index
   @sadnews = Sadnew.all
   render json: @sadnews
 end

 def create
   @sadnew = Sadnew.create(sadnew_params)
   render json: @sadnew, status: :accepted
 end

 def update
   @sadnew.update(sadnew_params)
   if @sadnew.save
     render json: @sadnew, status: :accepted
   else
     render json: { errors: @sadnew.errors.full_messages }, status: :unprocessible_entity
   end
 end

 def destroy
   @sadnew.destroy
   render json: { message: “removed” }, status: :ok
 end

 private

 def sadnew_params
   params.require(:sadnews).permit(:news_src, :title, :description)
 end

 def find_sadnew
   @sadnew = Sadnew.find(params[:id])
 end

end
