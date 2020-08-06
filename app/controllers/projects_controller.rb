class ProjectsController < ApplicationController
  ALLOWED_FILTERS = [
    :project_school_name,
    :project_description,
    :project_phase_actual_start_date, 
    :project_phase_planned_end_date, 
    :project_phase_actual_end_date, 
    :project_budget_amount, 
    :final_estimate_of_actual_costs_through_end_of_phase_amount, 
    :total_phase_actual_spending_amount
  ]

  before_action :set_project, only: [:show, :update, :destroy]

  # GET /projects
  def index
    @projects = Project.page(params[:page]).where(filters)

    render json: @projects
  end

  # GET /projects/1
  def show
    render json: @project
  end

  # POST /projects
  def create
    @project = Project.new(create_project_params)

    if @project.save
      render json: @project, status: :created, location: @project
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /projects/1
  def update
    # update_project_params = Hash[update_project_params.to_h.map { |key, val| [key, key =~ /_date$/ ? Date.strptime(val, '%m/%d/%Y') : val]  }]

    if @project.update(update_project_params)
      render json: @project
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  # DELETE /projects/1
  def destroy
    @project.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    def create_project_params
      params.require(:project).permit(
        :project_geographic_district,
        :project_building_identifier,
        :project_school_name,
        :project_type,
        :project_description,
        :project_phase_name,
        :project_status_name,
        :project_phase_actual_start_date,
        :project_phase_planned_end_date,
        :project_phase_actual_end_date,
        :project_phase_actual_start_date_notes,
        :project_phase_planned_end_date_notes,
        :project_phase_actual_end_date_notes,
        :project_budget_amount,
        :final_estimate_of_actual_costs_through_end_of_phase_amount,
        :total_phase_actual_spending_amount,
        :dsf_numberst,
      )
    end

    def update_project_params
      params.require(:project).permit(
        :project_phase_actual_start_date,
        :total_phase_actual_spending_amount
      )
    end

    def filters
      ALLOWED_FILTERS.each_with_object({}) do |filter, conditions|
        filter_value = [*params[filter]]

        if filter_value.any?
          if filter.to_s =~ /_date$/
            filter_value = filter_value.map { |val| Date.strptime(val, '%m/%d/%Y') }
          end

          # Pass a range for a condition (i.e. 1..2, 07/07/2016..07/20/2016)
          if filter_value.size == 2
            filter_value = filter_value[0]..filter_value[1]
          else
            filter_value = filter_value[0]
          end

          conditions[filter.to_sym] = filter_value
        end
      end
    end
end
