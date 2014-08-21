class CreateJoinTableCaseLabel < ActiveRecord::Migration
  def change
    create_join_table :cases, :labels do |t|
      # t.index [:case_id, :label_id]
      # t.index [:label_id, :case_id]
    end
  end
end
