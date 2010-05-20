class RootController < ApplicationController
	
	def index
		@month = Dbconfig.find_by_name("month").value
		@bikers = Biker.all.inject({}) {|h,biker| h[biker.nick] = biker.trips.sum(:dist, :conditions => {:month => @month }); h }.sort { |a, b| b[1] <=> a[1] }
	end
	
	def widget
		render :layout => false
	end
	
end
