class CreateCases < ActiveRecord::Migration
  def change
    create_table :cases do |t|
      t.references :case_filter, index: true

      t.timestamps
    end
  end
end
