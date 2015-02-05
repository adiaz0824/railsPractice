class BeveragesController < ApplicationController
	
	def index
		@beverages = Beverage.all
	end

	def new
		@beverage = Beverage.new
		# Creating a new instance of the beverage class
	end

	def create 
		@beverage = Beverage.create(params.require(:beverage).permit(:bev_type, :price, :quantity, :roast, :brew, :expiration_date))
		if @beverage.save
				redirect_to beverages_path
		else 
			render 'new'
		end	

		# We are finding this particular instance of beverage and setting it equal to the create method  and inside that method I am permitting the user to input these properties, after they input them, save them and redirect to the beverages path. If it is successfully saved, redirect to beverages, if not render new. 
		# You can use "rake routes" in terminal to see paths
		# Came in rails 4, strong parameters - control which 
		# fields are allowed to be changed

	end	
end
