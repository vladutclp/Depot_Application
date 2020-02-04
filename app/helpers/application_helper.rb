module ApplicationHelper
# Helper method to hide the cart
# params: a condition and the object to render. If the condition is true the object will be rendered
	def render_if(condition, object)
		if condition
			render object
		end
	end

end
