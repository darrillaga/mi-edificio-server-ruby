MiEdificioServer::App.controllers :buildings do
  
  get :index, provides: [:json] do
    @buildings = Building.all

    jbuilder 'buildings/index'
  end

  get :by_code, 'buildings/by-code', with: :code, provides: [:json] do
    @building = Building.find_by_code(params[:code])

    respond_not_nil(@building) do
      jbuilder 'buildings/show'
    end
  end

  get :show, '', with: :id, provides: [:json] do

    @building = Building.find_by_id(params[:id])

    respond_not_nil(@building) do
      jbuilder 'buildings/show'
    end
  end

  post :create, '', provides: [:json] do
    params_keys = [:name, :address, :contact_email]

    last_building = Building.last;

    #TODO generate building code properly
    attributes = params.slice(*params_keys).merge(code: last_building ? "#{last_building.id}code12" : "1code12")

    @building = Building.create(attributes)

    jbuilder 'buildings/show'
  end

  put :update, '', with: :id, provides: [:json] do
    params_keys = [:name, :address, :contact_email]
    attributes = params.slice(*params_keys)

    @building = Building.update(params[:id], attributes)

    respond_not_nil(@building) do
      jbuilder 'buildings/show'
    end
  end

  delete :destroy, '', with: :id, provides: [:json] do
    params_keys = [:id]

    @building = Building.where(params.slice(*params_keys)).delete_all

    respond_if_condition(@building.count > 0) do
      respond_no_content
    end
  end

end
