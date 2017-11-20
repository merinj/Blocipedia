class DowngradesController < ApplicationController

	def create
		
		wikis =Wiki.all
		wikis.each do |wiki|
			if wiki.user.id == current_user.id
        		wiki.update_attribute(:private, false)

			end
		end
			current_user.update_attributes(role: 'standard') 
			  flash[:notice]= "Your account is being downgraded"
			  redirect_to wikis_path

	end	
end
