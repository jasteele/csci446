authorization do
	role :admin do
		has_permission_on :member_member, :to => [:index]
		has_permission_on :games, :to => [:index, :edit, :update, :new, :create] 
		has_permission_on :admin_users, :to => [:edit, :update, :index]
		has_permission_on :admin_admin, :to => [:index]
		has_permission_on :admin_roles, :to => [:index, :create, :update, :destroy, :edit, :new]
	end
	
	role :guest do
		has_permission_on :games, :to => [:index]
		has_permission_on :admin_users, :to => [:new, :create]

	end
	role :member do
		
		has_permission_on :admin_users, :to => [:edit, :update] do
			if_attribute :id => is { user.id }
		end
		has_permission_on :games, :to => [:edit, :update, :new, :create, :index]
		has_permission_on :member_member, :to => [:index]
	end
	
end