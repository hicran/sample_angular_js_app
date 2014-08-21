class RemoveCaseFilterIdFromCases < ActiveRecord::Migration
  def change
    remove_column :cases, :case_filter_id
  end
end
