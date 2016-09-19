class PasswordsController < Devise::PasswordsController
	skip_authorization_check
	
	def new
		super
	end

	def create
		super
	end

	def edit
		super
	end

	def update
		super
	end

end