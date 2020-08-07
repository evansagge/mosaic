# == Schema Information
#
# Table name: projects
#
#  id                                                         :integer          not null, primary key
#  dsf_numbers                                                :string
#  final_estimate_of_actual_costs_through_end_of_phase_amount :integer
#  project_budget_amount                                      :integer
#  project_building_identifier                                :string
#  project_description                                        :string
#  project_geographic_district                                :string
#  project_phase_actual_end_date                              :date
#  project_phase_actual_end_date_notes                        :string
#  project_phase_actual_start_date                            :date
#  project_phase_actual_start_date_notes                      :string
#  project_phase_name                                         :string
#  project_phase_planned_end_date                             :date
#  project_phase_planned_end_date_notes                       :string
#  project_school_name                                        :string
#  project_status_name                                        :string
#  project_type                                               :string
#  total_phase_actual_spending_amount                         :integer
#
class Project < ApplicationRecord
  paginates_per 50

  validates :project_building_identifier, presence: true

  def self.similar_projects(project_ids)
    projects = Project.find(project_ids)

    project_geographic_district = projects.map(&:project_geographic_district).uniq

    return [] if project_geographic_district.size > 1

    max_budget_amount = projects.map(&:project_budget_amount).min * 2

    where(project_geographic_district: project_geographic_district[0]).where(["project_budget_amount <= (?)", max_budget_amount])
  end

  def similar_projects
    self.class.where(
      project_geographic_district: self.project_geographic_district
    ).where(["project_budget_amount <= (?)", self.project_budget_amount * 2])
  end
end
