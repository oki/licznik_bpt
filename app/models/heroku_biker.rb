class HerokuBiker < ActiveResource::Base
	self.site = "http://licznik.heroku.com/"
	self.element_name = "biker"
end
