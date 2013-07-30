class ProjectsController < ApplicationController
  
  #before_filter :require_user, :set_navs, :parse_filters_from_url
  layout "public"
  #authorize_actions_for Item, :actions => {:index => :delete}
  
  before_filter :parse_pagination_params, :only=>:index
  
  # GET /projects
  # GET /projects.js
  # GET /projects.json
  def index
    
    get_collections
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
      format.js {}
    end
  end

  # GET /projects/1
  # GET /projects/1.js
  # GET /projects/1.json
  def show
    ## Creating the project object  
    @project = Project.find(params[:id])
    
    respond_to do |format|
      format.html { get_collections and render :index }
      format.json { render json: @project }
      format.js {}
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    ## Intitializing the project object 
    @project = Project.new
    
    respond_to do |format|
      format.html { get_collections and render :index }
      format.json { render json: @project }
      format.js {}
    end
  end

  # GET /projects/1/edit
  def edit
    ## Fetching the project object 
    @project = Project.find(params[:id])
    
    respond_to do |format|
      format.html { get_collections and render :index }
      format.json { render json: @project }
      format.js {}
    end
  end

  # POST /projects
  # POST /projects.js
  # POST /projects.json
  def create
    ## Creating the project object  
    @project = Project.new(params[:project])
    
    ## Validating the data
    @project.valid?
    
    respond_to do |format|
      if @project.errors.blank?
        
        # Saving the project object
        @project.save
        
        # Setting the flash message
        message = translate("forms.created_successfully", :item => "Project")
        store_flash_message(message, :success)
        
        format.html { 
          redirect_to project_url(@project), notice: message
        }
        format.json { render json: @project, status: :created, location: @project }
        format.js {}
      else
        
        # Setting the flash message
        message = @project.errors.full_messages.to_sentence
        store_flash_message(message, :alert)
        
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
        format.js {}
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.js
  # PUT /projects/1.json
  def update
    ## Fetching the project
    @project = Project.find(params[:id])
    
    ## Updating the @project object with params
    @project.update_attributes(params[:project])
    
    ## Validating the data
    @project.valid?
    
    respond_to do |format|
      if @project.errors.blank?
        
        # Saving the project object
        @project.save
        
        # Setting the flash message
        message = translate("forms.updated_successfully", :item => "Project")
        store_flash_message(message, :success)
        
        format.html { 
          redirect_to project_url(@project), notice: message 
        }
        format.json { head :no_content }
        format.js {}
        
      else
        
        # Setting the flash message
        message = @project.errors.full_messages.to_sentence
        store_flash_message(message, :alert)
        
        format.html { 
          render action: "edit" 
        }
        format.json { render json: @project.errors, status: :unprocessable_entity }
        format.js {}
        
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.js
  # DELETE /projects/1.json
  def destroy
    ## Fetching the project
    @project = Project.find(params[:id])
    
    respond_to do |format|
      ## Destroying the project
      @project.destroy
      
      # Fetch the projects to refresh ths list and details box
      get_collections
      @project = @projects.first
      
      # Setting the flash message
      message = translate("forms.destroyed_successfully", :item => "Project")
      store_flash_message(message, :success)
      
      format.html { 
        redirect_to projects_url notice: message
      }
      format.json { head :no_content }
      format.js {}
        
    end
  end
  
  private
  
  def set_navs
    set_nav("Project")
  end
  
  def get_collections
    # Fetching the projects
    relation = Project.where("")
    @filters = {}
    
    if params[:project] && params[:project][:query]
      @query = params[:project][:query].strip
      if !@query.blank?
        relation = relation.where("
          LOWER(name) LIKE LOWER('%#{@query}%') OR\
          LOWER(status) LIKE LOWER('%#{@query}%') OR\
          LOWER(qa_url) LIKE LOWER('%#{@query}%') OR\
          LOWER(uat_url) LIKE LOWER('%#{@query}%') OR\
          LOWER(repo_url) LIKE LOWER('%#{@query}%')")
      end
    end
    
    @projects = relation.order("created_at desc").page(@current_page).per(@per_page)
    
    ## Initializing the @project object so that we can render the show partial
    @project = @projects.first unless @project
    
    return true
    
  end
  
end
