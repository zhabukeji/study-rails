class Admin::UsersController < ApplicationController
    def index
        
    end
    def new
        @user = User.new()
    end
    def create
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = '用户注册成功'
            redirect_to admin_login_path
        else
            flash[:notice] = '用户注册失败'
            flash[:error] = @user.errors.first.full_message
            render :new
        end
    end

    def login_page
        
    end

    def user_login
        @params = user_params
        @user = login(@params[:email], @params[:password], @params[:remember_me])
        if @user
            redirect_to admin_root_path
        else 
            flash[:notice] = '登入失败,账号密码错误'
            render :login_page
        end
    end
    private
        def user_params
            params.require(:user).permit(:email, :password, :password_confirmation, :remember_me)
        end
end
