MiEdificioServer::App.controllers :posts, parent: [:buildings] do

  get :index, provides: [:json] do
    params_keys = [:building_id]

    @posts = Post.where(params.slice(*params_keys))

    jbuilder 'posts/index'
  end

  post :create, '', provides: [:json] do
    params_keys = [:text, :building_id, :building_user_id]

    @post = Post.create(params.slice(*params_keys))

    jbuilder 'posts/show'
  end

  put :update, '', with: :id, provides: [:json] do
    params_keys = [:text]

    @post = Post.update(params[:id], params.slice(*params_keys))

    respond_not_nil(@post) do
      jbuilder 'posts/show'
    end
  end

  delete :destroy, '', with: :id, provides: [:json] do
    params_keys = [:building_id, :id]

    @post = Post.where(params.slice(*params_keys)).delete_all

    respond_if_condition(@post.count > 0) do
      respond_no_content
    end
  end
  

end
