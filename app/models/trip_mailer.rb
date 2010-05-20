class TripMailer < ActionMailer::Base
	
	def trip_email(trip)
    recipients    "xoki69@gmail.com"
    from          "bpt@md6.org"
    subject       "Nowy wpis: #{trip.biker.nick} +#{trip.dist} km"
    sent_on       Time.now
    body(:trip => trip)
    content_type  "text/html"
  end

end
