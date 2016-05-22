MiEdificioServer::App.controllers :comments, parent: [:buildings, :posts] do

  get :index, provides: [:json] do
    params_keys = [:building_id, :post_id]

    @comments = Comment.where(params.slice(*params_keys))

    jbuilder 'comments/index'
  end

  post :create, '', provides: [:json] do
    params_keys = [:text, :building_id, :post_id]

    @comment = Comment.create(params.slice(*params_keys))

    jbuilder 'comments/show'
  end

  put :update, '', with: :id, provides: [:json] do
    params_keys = [:text]

    @comment = Comment.update(params[:id], params.slice(*params_keys))

    respond_not_nil(@comment) do
      jbuilder 'comments/show'
    end
  end

  delete :destroy, '', with: :id, provides: [:json] do
    params_keys = [:building_id, :post_id, :id]

    @comment = Comment.where(params.slice(*params_keys)).delete_all

    respond_if_condition(@comment.count > 0) do
      respond_no_content
    end
  end

end
