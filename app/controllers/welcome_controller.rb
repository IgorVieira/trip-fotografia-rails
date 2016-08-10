class WelcomeController < ApplicationController
	   def index
	   	 @projects = Project.order("created_at DESC")	   	
	   end
end
