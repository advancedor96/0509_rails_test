class PostsController < ApplicationController
	before_action :find_group
	before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]



	
	def new
		@post = @group.posts.new
	end

	def create
		@post = @group.posts.build(posts_params)
		@post.user_id = current_user.id


		if @post.save
			flash[:notice]="文章新增成功"
			redirect_to group_path(@group)
		else
			flash[:notice]="文章新增失敗"
			render :new
		end

	end

	def edit
		@post = @group.posts.find(params[:id])

	end

	def update
		@post = @group.posts.find(params[:id])

		if @post.update(posts_params)
			flash[:notice]="文章已更新"
			redirect_to group_path(@group)
		else
			flash[:notice]="文章更新失敗"
			render :edit
		end

	end

	def destroy
		@post = @group.posts.find(params[:id])

		@post.destroy
		flash[:notice]="文章已刪除"
		redirect_to group_path(@group)

	end


	private

	def find_group
		@group = Group.find(params[:group_id])
	end

	def posts_params
		params.require(:post).permit(:content)
	end

end
