# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
	
	def digit_to_month(digit)
		digit = digit.to_i
		
		if digit < 0 or digit > 12
			return "Error"
		end
		
		month = ["Styczen", "Luty", "Marzec", "Kwiecien", "Maj", "Czerwiec", "Lipiec", "Sierpien", "Wrzesien", "Pazdziernik", "Listopad", "Grudzien"]
		month[digit-1]
	end
	
end
