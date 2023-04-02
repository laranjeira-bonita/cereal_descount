ActiveRecord::Schema.define(version: 2023_04_02_210026) do
  create_table "promotions", force: :cascade do |t|
    t.string "name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "priority_level"
  end

end
