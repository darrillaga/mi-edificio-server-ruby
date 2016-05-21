MiEdificioServer::App.controllers :building_users, parent: :buildings do

  get :index, :provides => [:json] do
    params_keys = [:building_id]

    @building_users = BuildingUser.where(params.slice(*params_keys))

    jbuilder 'building_users/index'
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
