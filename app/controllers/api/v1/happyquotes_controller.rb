class Api::V1::HappyquotesController < ApplicationController
  before_action :find_happyquote, only: [:update, :destroy]

 def index
   @happyquotes = Happyquote.all
   render json: @happyquotes
 end

 def create
   @happyquote = Happyquote.create(happyquote_params)
   render json: @happyquote, status: :accepted
 end

 def update
   @happyquote.update(happyquote_params)
   if @happyquote.save
     render json: @happyquote, status: :accepted
   else
     render json: { errors: @happyquote.errors.full_messages }, status: :unprocessible_entity
   end
 end

 def destroy
   @happyquote.destroy
   render json: { message: “removed” }, status: :ok
 end

 private

 def happyquote_params
   params.require(:happyquote).permit(:author, :quote)
 end

 def find_happyquote
   @happyquote = Happyquote.find(params[:id])
 end

end
