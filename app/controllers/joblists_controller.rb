class JoblistsController < ApplicationController
  before_action :check_current_user, only:[:new,:edit,:update,:create,:destroy]

  def index
  	@joblists = Joblist.all
  end

  def new
  	@joblist = Joblist.new
  end

  def edit
    @joblist = Joblist.find_by_id(params[:id])
  end

  def show
    @joblist = Joblist.find_by_id(params[:id])
  end

  def destroy
    @joblist = Joblist.find_by_id(params[:id])
    if @joblist.destroy
      flash[:notice] = "Success"
      redirect_to action:'index'
    else
      flash[:errors] = "fails"
      redirect_to action:'index'
    end
  end

  def update
    @joblist = Joblist.find_by_id(params[:id])
    if @joblist.update(params_joblist)
      flash[:notice] = "Success"
      redirect_to action:'index'
    else
      flash[:errors] = "data not valid"
      render 'edit'
    end
  end

  def create 
  	@joblist = Joblist.new(params_joblist)
  	if @joblist.save
  	  flash[:notice] = "add new job to fucking normies"
  	  redirect_to action:'index'
  	else 
  	  flash[:errors] = "fails bro"
  	  render 'new'
  	end
  end

  private
  def params_joblist
  	params.require(:joblist).permit(:title,:description,:status)
  end
end
