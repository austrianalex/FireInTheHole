class SearchController < ApplicationController
  def show
    
  end
  def all
  end
  
  def user
    @users = User.find(:all, :conditions=>"CONCAT(first,' ',last) LIKE '%"+params[:part]+"%'")
    respond_to do |format|
      format.js  { render :json => @users.to_json }
    end
  end
  
  def hydrant
  end
  
  def location
    @results = Location.find_by_sql( "SELECT CONCAT(house_num,' ',street) as address FROM locations WHERE CONCAT(house_num,' ',street) LIKE "+params[:part])
    respond_to do |format|
      format.json  { render :json => @results.to_json }
    end
  end
  
end
