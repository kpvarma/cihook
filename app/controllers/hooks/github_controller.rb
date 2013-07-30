module Hooks
  class GithubController < ApplicationController
  
    layout 'public'
  
    def listen
      @project = Project.find_by_id(params[:project_id])
    end
  
  end
end
