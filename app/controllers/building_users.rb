MiEdificioServer::App.controllers :users, parent: :buildings do

  get :index, provides: [:json] do
    params_keys = [:building_id]

    @building_users = BuildingUser.where(params.slice(*params_keys))

    jbuilder 'building_users/index'
  end

  get :show, '', with: :id, provides: [:json] do
    params_keys = [:building_id, :id]

    @building_user = BuildingUser.where(params.slice(*params_keys)).first

    respond_not_nil(@building_user) do
      jbuilder 'building_users/show'
    end
  end

  post :create, '', provides: [:json] do
    params_keys = [:building_id, :name, :apartment, :role_description]
    attributes = params.slice(*params_keys).merge(building_creator: false)

    building = Building.find_by_id(params[:building_id])

    if (building.nil?)
      return respond_not_found
    elsif (building.building_users.count == 0)
      attributes[:building_creator] = true
    end

    @building_user = BuildingUser.create(attributes)

    jbuilder 'building_users/show'
  end

  put :update, '', with: :id, provides: [:json] do
    params_keys = [:name, :apartment, :role_description]
    attributes = params.slice(*params_keys)

    @building_user = BuildingUser.update(params[:id], attributes)

    respond_not_nil(@building_user) do
      jbuilder 'building_users/show'
    end
  end

  delete :destroy, '', with: :id, provides: [:json] do
    params_keys = [:building_id, :id]

    @building_user = BuildingUser.where(params.slice(*params_keys)).delete_all

    respond_if_condition(@building_user.count > 0) do
      respond_no_content
    end
  end

end
