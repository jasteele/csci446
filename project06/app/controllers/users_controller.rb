class UsersController < ApplicationController
  filter_access_to :all
  # GET /users
  # GET /users.xml
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = current_user
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])
	#default role to member
	@user.role = Role.find_by_name("member")
    if verify_recaptcha && @user.save
       flash[:notice] ="Welcome, #{@user.first_last}."
	   redirect_to root_url
    else
	   render :action => 'new'
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = current_user

      if @user.update_attributes(params[:user])
       flash[:notice] = 'Profile updated.' 
	   redirect_to root_url
      else
       render :action => "edit"
      end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
end
