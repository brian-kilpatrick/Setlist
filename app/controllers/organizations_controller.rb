class OrganizationsController < ApplicationController
	before_action :authenticate_user!

  def index
    if @current_org
      @setlists = @current_org.setlists
    end
  end

  def new
  	@org = Organization.new
  end

  def create
  	@org = Organization.new(org_params)
  	if @org.save
  		current_user.organizations << @org
  		flash[:message] = "Organization Successfully Created!"
  		redirect_to root_path
  	else
  		flash[:message] = "Something Went Wrong"
  		render 'new'
  	end
  end

  def edit
  end

  def show
  
  end

  private

  def org_params
  	params.require(:organization).permit(:name, :avatar)
  end
end
