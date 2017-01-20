class PostsController < ApplicationController

	before_action :find_post , only: [:show, :update, :edit, :destroy]
	before_action :authenticate_user!

	def index
		@posts = Post.all
	end

	def show
		@comments = Comment.where(post_id: @post) 
	end

	def new
		@post = current_user.posts.build
	end

	def create
		@post = current_user.posts.build(post_params)
		if @post.save 
			redirect_to @post
		else
			render 'new'
		end	
		
	end

	def edit
		@post
	end

	def update
		if @post.update_attributes(post_params)
			redirect_to @post
		else
			render 'edit'
		end	
		
	end


	def destroy
		@post.destroy
		redirect_to root_path
	end

	private 

	 def post_params
	 	params.require(:post).permit(:title, :link, :description, :image)
	 	
	 end

	 def find_post
	 	@post = Post.find(params[:id])
	 end
end
