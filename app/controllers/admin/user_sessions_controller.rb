class Admin::UserSessionsController < Admin::ApplicationController
    skip_before_action :require_login, only: [:new, :create]
    before_action :user_status, only: [:new, :create]
    layout false
    def new
        @user = User.new
    end

    def create
        @params = user_params
        @user = User.new(@params)
        if login(@params[:email], @params[:password], @params[:remember_me])
            redirect_to admin_root_path
        else 
            flash.now[:notice] = '登入失败,账号密码错误'
            render :new, locals: { user: @user, message: @message}
        end
    end
    def destroy
        logout
        redirect_to admin_login_path
    end

    private
        def user_params
            params.require(:user).permit(:email, :password, :password_confirmation, :remember_me)
        end
        
        def user_status
            if logged_in?
                redirect_to admin_root_path
            end
        end
end
