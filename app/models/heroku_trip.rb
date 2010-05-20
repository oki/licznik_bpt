class HerokuTrip < ActiveResource::Base
	self.site = "http://127.0.0.1:3000/"
	self.element_name = "trip"
end
