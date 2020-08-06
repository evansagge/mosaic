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
end
