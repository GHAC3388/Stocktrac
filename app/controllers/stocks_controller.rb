class StocksController < ApplicationController
    
    def search    
      if params[:stock].blank?            #checks if params input has content
        flash.now[:danger] = "You have entered an empty search string"
      else
        @stock = Stock.new_form_lookup(params[:stock])
                                            #render json: @stock - to print data from query
        flash.now[:danger] = "You have entered an incorrect symbol" unless @stock
        end
          respond_to do |format|
          format.js { render partial: 'users/result' }
      end
    end
end
