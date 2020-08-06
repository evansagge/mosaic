# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_06_180551) do

  create_table "projects", force: :cascade do |t|
    t.string "project_geographic_district"
    t.string "project_building_identifier"
    t.string "project_school_name"
    t.string "project_type"
    t.string "project_description"
    t.string "project_phase_name"
    t.string "project_status_name"
    t.date "project_phase_actual_start_date"
    t.date "project_phase_planned_end_date"
    t.date "project_phase_actual_end_date"
    t.string "project_phase_actual_start_date_notes"
    t.string "project_phase_planned_end_date_notes"
    t.string "project_phase_actual_end_date_notes"
    t.integer "project_budget_amount"
    t.integer "final_estimate_of_actual_costs_through_end_of_phase_amount"
    t.integer "total_phase_actual_spending_amount"
    t.string "dsf_numbers"
  end

end
