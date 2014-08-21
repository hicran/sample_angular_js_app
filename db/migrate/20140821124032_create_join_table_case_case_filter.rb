class CreateJoinTableCaseCaseFilter < ActiveRecord::Migration
  def change
    create_join_table :cases, :case_filters do |t|
      # t.index [:case_id, :case_filter_id]
      # t.index [:case_filter_id, :case_id]
    end
  end
end
