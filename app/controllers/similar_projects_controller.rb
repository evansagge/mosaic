class SimilarProjectsController < ApplicationController

  def index
    render json: Project.similar_projects(params[:project_ids].split(','))
  end
end
