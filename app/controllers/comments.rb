MiEdificioServer::App.controllers :comments, parent: [:buildings, :building_users, :posts] do

  get :index, :provides => [:json] do
    params_keys = [:building_id, :building_user_id, :post_id]

    @comments = Comment.where(params.slice(*params_keys))

    jbuilder 'comments/index'
  end

  # get :sample, :map => '/sample/url', :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   "Maps to url '/foo/#{params[:id]}'"
  # end

  # get '/example' do
  #   'Hello world!'
  # end
  

end
