class CreateExpenses < ActiveRecord::Migration[8.0]
  def change
    create_table :expenses do |t|
      t.string :category
      t.decimal :total

      t.timestamps
    end
  end
end
