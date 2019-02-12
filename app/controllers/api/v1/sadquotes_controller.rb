class Api::V1::SadquotesController < ApplicationController
  before_action :find_sadquote, only: [:update, :destroy]

 def index
   @sadquotes = Sadquote.all
   render json: @sadquotes
 end

 def create
   @sadquote = Sadquote.create(sadquote_params)
   render json: @sadquote, status: :accepted
 end

 def update
   @sadquote.update(sadquote_params)
   if @sadquote.save
     render json: @sadquote, status: :accepted
   else
     render json: { errors: @sadquote.errors.full_messages }, status: :unprocessible_entity
   end
 end

 def destroy
   @sadquote.destroy
   render json: { message: “removed” }, status: :ok
 end

 private

 def sadquote_params
   params.require(:sadquote).permit(:author, :quote)
 end

 def find_sadquote
   @sadquote = Sadquote.find(params[:id])
 end

end
