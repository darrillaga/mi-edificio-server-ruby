MiEdificioServer::App.controllers :buildings do
  
  get :index, :provides => [:json] do
    @buildings = Building.all
    render :jbuilder, 'buildings/index'
  end
  
  get :show, :with => :id do
    # url is generated as "/user/#{params[:user_id]}/product/show/#{params[:id]}"
    # url_for(:product, :show, :user_id => 5, :id => 10) => "/user/5/product/show/10"
  end

  post :create do
  end

  put :update do
  end

  delete :destroy do
  end

end
