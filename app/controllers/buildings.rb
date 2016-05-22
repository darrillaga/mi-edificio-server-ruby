MiEdificioServer::App.controllers :buildings do

  NO_CONTENT = 204
  
  get :index, provides: [:json] do
    @buildings = Building.all

    jbuilder 'buildings/index'
  end

  get :by_code, 'by-code', with: :code, provides: [:json] do
    params_keys = [:code]

    @building = Building.where(params.slice(*params_keys)).first

    jbuilder 'buildings/show'
  end

  get :show, '', with: :id, provides: [:json] do

    @building = Building.find(params[:id])

    jbuilder 'buildings/show'
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

    jbuilder 'buildings/show'
  end

  delete :destroy, '', with: :id, provides: [:json] do
    params_keys = [:id]

    @building = Building.where(params.slice(*params_keys)).delete_all

    NO_CONTENT
  end

end
