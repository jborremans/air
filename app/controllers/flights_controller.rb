class FlightsController < ApplicationController

  def index
    
    if params[:keyword].present?
      
      @flights = Flight.where("LOWER(departure_airport_code) = ? OR LOWER(arrival_airport_code) = ?", params[:keyword].downcase, params[:keyword].downcase)
      
      @flights = @flights.page(params[:page]).per(3)
      
    else
      
      @flights = Flight.page(params[:page]).per(3)
      
    end
    
    
    # 
    # # Flight.offset(2).limit(2)
    # @page_number = params[:page].to_i
    # @page_number = 1 if @page_number < 1
    # 
    # @flights = Flight.limit(4) if @flights.nil?
    # 
    # @flights = @flights.offset((@page_number - 1) * 4).limit(4)
    
  end

end
