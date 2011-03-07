class Admin::UsersController < Admin::AdminController
  before_filter :magic_user, :only => [:show, :edit, :update, :destroy]
  filter_access_to :all
  filter_access_to :edit, :attribute_check => true
 
  # GET /users
  # GET /users.xml
  def index
    @users = User.paginate(:page => params[:page], :order => 'lname ASC')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show

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
      if @user.update_attributes(params[:user])
       flash[:notice] = 'Profile updated.' 
	   redirect_to home_url
      else
       render :action => "edit"
      end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  def magic_user
    if defined?(params[:id]) and params[:id] != "current"
      @user = User.find(params[:id])
    else
      @user = current_user
    end
  end
  
  def self.get_users
    return User.find(:all)
  end
end
