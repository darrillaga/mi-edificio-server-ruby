MiEdificioServer::App.controllers :building_users, parent: :buildings do

  NO_CONTENT = 204

  get :index, provides: [:json] do
    params_keys = [:building_id]

    @building_users = BuildingUser.where(params.slice(*params_keys))

    jbuilder 'building_users/index'
  end

  get :show, "", with: :id, provides: [:json] do
    params_keys = [:building_id, :id]

    @building_user = BuildingUser.where(params.slice(*params_keys)).first

    jbuilder 'building_users/show'
  end

  post :create, "", provides: [:json] do
    params_keys = [:building_id, :name, :apartment, :role_description]
    attributes = params.slice(*params_keys).merge(building_creator: false)

    building = Building.find(params[:building_id])

    if (building.nil?)
      #TODO not found
    elsif (building.building_users.count == 0)
      attributes[:building_creator] = true
    end

    @building_user = BuildingUser.create(attributes)

    jbuilder 'building_users/show'
  end

  put :update, "", with: :id, provides: [:json] do
    params_keys = [:name, :apartment, :role_description]
    attributes = params.slice(*params_keys)

    @building_user = BuildingUser.update(params[:id], attributes)

    jbuilder 'building_users/show'
  end

  delete :destroy, "", with: :id, provides: [:json] do
    params_keys = [:building_id, :id]

    @building_user = BuildingUser.where(params.slice(*params_keys)).delete_all

    NO_CONTENT
  end

end
