class CreateAuditLogs < ActiveRecord::Migration
  def change
    create_table :audit_logs do |t|
      t.integer :user_id, null: false, index: true
      t.string  :action, null: false, index: true
      t.integer :project_id, null: false, index: true
      t.integer :build_id

      t.timestamps null: false
    end
  end
end
