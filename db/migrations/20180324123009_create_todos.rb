Hanami::Model.migration do
  change do
    create_table :todos do
      primary_key :todo_no, Integer, null: false
      column :task, String, null: false, size: 255
      column :is_completed, Integer, null: false
      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
