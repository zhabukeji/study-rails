class Admin::UsersController < Admin::ApplicationController
    layout false
    def index
        
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = '用户注册成功'
            redirect_to admin_login_path
        else
            flash[:notice] = '用户注册失败'
            render :new, locals: {user: @user }
        end
    end

    private

        def user_params
            params.require(:user).permit(:email, :password, :password_confirmation, :remember_me)
        end
end
