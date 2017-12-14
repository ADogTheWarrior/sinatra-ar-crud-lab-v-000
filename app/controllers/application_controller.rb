require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    Post.new(params).save
    erb :index
  end

  get '/posts' do
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    post = Post.find(params[:id])
    post.update(name: params[:name])
    post.update(content: params[:content])
    erb :index
  end

  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    @post.destroy
    # @post = Post.find(params[:id])
    # copy_post = @post
    # copy_post.destroy
    erb :delete
  end
end
