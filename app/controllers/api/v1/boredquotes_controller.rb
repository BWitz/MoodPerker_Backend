class Api::V1::BoredquotesController < ApplicationController
  before_action :find_boredquote, only: [:update, :destroy]

 def index
   @boredquotes = Boredquote.all
   render json: @boredquotes
 end

 def create
   @boredquote = Boredquote.create(boredquote_params)
   render json: @boredquote, status: :accepted
 end

 def update
   @boredquote.update(boredquote_params)
   if @boredquote.save
     render json: @boredquote, status: :accepted
   else
     render json: { errors: @boredquote.errors.full_messages }, status: :unprocessible_entity
   end
 end

 def destroy
   @boredquote.destroy
   render json: { message: “removed” }, status: :ok
 end

 private

 def boredquote_params
   params.require(:boredquote).permit(:author, :quote)
 end

 def find_boredquote
   @boredquote = Boredquote.find(params[:id])
 end

end
