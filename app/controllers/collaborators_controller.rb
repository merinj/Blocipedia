class CollaboratorsController < ApplicationController

	def create
		@collaborators = User.collaborators.build(collaborators: collaborators)
         
         if @collaborators.save
         	flash[:notice] = "collaboration was saved"
         else
          	flash[:alert] = "collaboration failed."	
         end 
	end
	
	def destroy
		@wiki = Wiki.find(params[:id])
		@collaborators = Collaborator.find(params[:id])
	end

	def index
       @wiki = Wiki.find(params[:id])
	end	

end
