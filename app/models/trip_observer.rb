class TripObserver < ActiveRecord::Observer
	
	def after_create(trip)
    TripMailer.deliver_trip_email(trip)
  end

end
