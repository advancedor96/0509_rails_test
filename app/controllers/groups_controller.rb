class GroupsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

	def index
		@groups = Group.all
	end

	def show
		@group = Group.find(params[:id])

		@posts = @group.posts

	end

	def new
		@group = current_user.groups.new
	end

	def create
		@group = current_user.groups.new(groups_params)

		if @group.save
			flash[:notice]="新增討論區成功"
			redirect_to groups_path
		else
			flash[:notice]="新增Group...失敗"
			render :new
		end
	end

	def edit
		@group = current_user.groups.find(params[:id])

	end

	def update
		@group = current_user.groups.find(params[:id])
		if @group.update(groups_params)
			flash[:notice]="討論區更新成功"
			redirect_to groups_path
		else
			flash[:notice]="更新資料失敗"
			render :neditew
		end

	end

	def destroy
		@group = current_user.groups.find(params[:id])
		@group.destroy
		flash[:notice]="討論區已刪除"
		redirect_to groups_path


	end


	private

	def groups_params
		params.require(:group).permit(:title, :description)
	end




end
