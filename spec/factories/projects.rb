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
FactoryBot.define do
  factory :project do
    project_geographic_district { "10" }
    project_building_identifier { "X254" }
    project_school_name { "I.S. 254 - BRONX" }
    project_type { "SCA CIP" }
    project_description { "FACADE/ROOFS" }
    project_phase_name { "Construction" }
    project_status_name { "In-Progress" }
    project_phase_actual_start_date { Date.strptime("07/07/2016", "%m/%d/%Y") }
    project_phase_planned_end_date { Date.strptime("03/28/2018", "%m/%d/%Y") }
    project_phase_actual_end_date { "" }
    project_budget_amount { 4050000 }
    final_estimate_of_actual_costs_through_end_of_phase_amount { 4229193 }
    total_phase_actual_spending_amount { 3791127 }
    dsf_numbers { "DSF: 0000821031, 0000822210" }
  end
end
