module Refinery
  module Authentication
    module Devise
      include ActiveSupport::Configurable

      config_accessor :superuser_can_assign_roles, :email_from_name, :devise_modules_for_user_model

      self.superuser_can_assign_roles = false
      self.email_from_name = "no-reply"
      self.devise_modules_for_user_class = [ :database_authenticatable,
	      :registerable, :recoverable, :rememberable, :trackable,
	      :validatable, { authentication_keys: [ :login ] } ]

      class << self
        def email_from_name
          ::I18n.t(
            'email_from_name',
            scope: 'refinery.authentication.config',
            default: config.email_from_name
          )
        end
      end
    end
  end
end
