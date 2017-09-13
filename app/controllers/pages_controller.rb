class PagesController < ApplicationController
  # responsible for showing all pages
  def index
    # local var is only available in the method
    # if we want our view to have access to the var 
    # we need an instance variable
    @pages = Page.all
    # return app/views/pages/index.html.erb
    # render :index
  end
  
  # responsible for showing a specific page
  def show
    @page = Page.find(params[:id])
    # render :show - app/views/pages/show.html.erb
  end

  # responsible for showing a form to edit an exisiting page
  def edit
    @page = Page.find(params[:id])
  end

  # responsible for updating the values of a pre exisiting method
  def update
    @page = Page.find(params[:id])
    if @page.update(page_params)
      #success
      redirect_to page_path(@page)
    else
      #fail
      render :edit
    end
  end

  # responsoble for showing a form to create a new page
  def new
    @page = Page.new
    # render :new - app/voews/pages/new.html.erb
  end

  #responsible for ssaving a new record in our databases
  def create
    # Strong params
    page = Page.new(page_params)
    # exectues the sql to try to save the new page in the database
    if page.save
      # success - new record in the database
      redirect_to page_path(page)
    else
      # fail - failed to execute the sql for some reason
      render :new
    end
  end

  def destroy
    Page.find(params[:id]).destroy
    redirect_to pages_path
  end

  private
    def page_params
      params.require(:page).permit(:title, :author, :body, :private)
    end
end
