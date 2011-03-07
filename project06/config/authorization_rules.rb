authorization do
	role :admin do
		has_permission_on :games, :to => [:index, :edit, :update] 
		has_permission_on :admin_users, :to => [:edit, :update, :index]
		has_permission_on :admin_admin, :to => [:index]
		has_permission_on :admin_roles, :to => [:index, :show, :create, :update, :destroy, :edit, :new]
	end
	
	role :guest do
		has_permission_on :games, :to => [:index]
		has_permission_on :admin_users, :to => [:new]
	end
	role :member do
		includes :guest
		has_permission_on :admin_users, :to => [:edit, :update] do
			if_attribute :user => is { user }
		end
		has_permission_on :games, :to => [:edit, :update] 
		has_permission_on :games, :to => [:new, :create]
		has_permission_on :member_member, :to => [:index]
	end
	
end