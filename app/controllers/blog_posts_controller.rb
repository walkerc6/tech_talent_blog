class BlogPostsController < ApplicationController

before_action :set_blog_post, only: [:show, :edit, :update, :destory]
  def index
  	@blog_posts = BlogPost.all
  end

  def show
  	@comment = Comment.new
  end

  def new
  	@blog_posts = BlogPost.all
  end

  def edit
  end

  def create
  	@blog_posts = BlogPost.new(blog_post_params)

  	respond_to do |form|
  		if @blog_post.save
  			format.html { redirect_to blog_post_path(id: @blog_post.id), notice: "Blog Post was created successfully!"}
  		else
  			format.html { render :new }
  		end
  	end
  end

  def update
  	
  	respond_to do |format| 
  		if @blog_post.update(blog_post_params)
  			format.html { redirect_to blog_post_path(id: @blog_post.id), notice: "Blog post was updated successfully!"}
  		else 
  			format.html { render :edit }
  		end
  	end
  end

  def destroy
  	

  	@blog_post.destroy

  	respond_to do |format|
  		format.html { redirect_to blog_posts_path, notice: "your blog post was destoryed"}
  end
 end


  private 

  def blog_post_params 
  	params.require(:blog_post).permit(:title, :blog_entry, :author)
  end

  def blog_post_params
  	params.require(:blog_post).permit(:title, :blog_entry, :author)
  end


end
