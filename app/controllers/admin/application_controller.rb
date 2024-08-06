class Admin::ApplicationController < ActionController::Base
  before_action :require_login
  layout "admin/layouts/main"

  private
    def not_authenticated
      redirect_to admin_login_path
    end
end
