class WikisController < ApplicationController
 before_action :authorize_user, except: [:index, :show, :update, :edit]
 before_action :authenticate_user!

  def index
  	@wikis = Wiki.all
  end

  def show
  	@wiki = Wiki.find(params[:id])
  end

  def new
  	@wiki = Wiki.new
  end

  def create
  	@wiki = Wiki.new
  	@wiki.title = params[:wiki][:title]
  	@wiki.body = params[:wiki][:body]
    @wiki.user = current_user

  	if @wiki.save
  		flash[:notice] = "Wiki was saved"
  		redirect_to @wiki
  	else 
  		flash.now[:alert] = "There is some problem.Please try again"
  		render :new
  	end
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def update
     @wiki = Wiki.find(params[:id])
     @wiki.title = params[:wiki][:title]
     @wiki.body = params[:wiki][:body]
 
     if @wiki.save
        flash[:notice] = "Wiki was updated."
       redirect_to @wiki
     else
       flash.now[:alert] = "Error saving wiki. Please try again."
       render :edit
     end
  end  

  def destroy
     @wiki = Wiki.find(params[:id])
 
     if @wiki.destroy
       flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
       redirect_to action: :index
     else
       flash.now[:alert] = "There was an error deleting the wiki."
       render :show
     end
   end

   def authorize_user

     #wiki = Wiki.find(params[:id])
     unless current_user.member || current_user.admin?
       flash[:alert] = "You must be an admin to do that."
       redirect_to wikis_path
     end
   end
end
