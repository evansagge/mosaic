class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :project_geographic_district
      t.string :project_building_identifier
      t.string :project_school_name
      t.string :project_type
      t.string :project_description
      t.string :project_phase_name
      t.string :project_status_name
      t.date :project_phase_actual_start_date
      t.date :project_phase_planned_end_date
      t.date :project_phase_actual_end_date
      t.string :project_phase_actual_start_date_notes
      t.string :project_phase_planned_end_date_notes
      t.string :project_phase_actual_end_date_notes
      t.integer :project_budget_amount
      t.integer :final_estimate_of_actual_costs_through_end_of_phase_amount
      t.integer :total_phase_actual_spending_amount
      t.string :dsf_numbers
    end
  end
end
