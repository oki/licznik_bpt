class TripsController < ApplicationController
	
	def index
		@trips = Trip.all(:limit => 50, :order => "created_at desc")
	end
	
	def nick
		@trips = Biker.find_by_nick(params[:nick]).trips
		render :index
	end
	
	def month_nick
		@trips = Biker.find_by_nick(params[:nick]).trips.find_all_by_month(params[:month]) rescue nil
		render :index
	end
	
end
