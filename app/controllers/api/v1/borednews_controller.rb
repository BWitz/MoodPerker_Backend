class Api::V1::BorednewsController < ApplicationController
  before_action :find_borednew, only: [:update, :destroy]

 def index
   @borednews = Borednew.all
   render json: @borednews
 end

 def create
   @borednew = Borednew.create(borednew_params)
   render json: @borednew, status: :accepted
 end

 def update
   @borednew.update(borednew_params)
   if @borednew.save
     render json: @borednew, status: :accepted
   else
     render json: { errors: @borednew.errors.full_messages }, status: :unprocessible_entity
   end
 end

 def destroy
   @borednew.destroy
   render json: { message: “removed” }, status: :ok
 end

 private

 def borednew_params
   params.require(:borednews).permit(:news_src, :title, :description)
 end

 def find_borednew
   @borednew = Borednew.find(params[:id])
 end

end
