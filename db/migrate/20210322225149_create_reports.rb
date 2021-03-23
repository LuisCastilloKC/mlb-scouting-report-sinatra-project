class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.string :player_name
      t.string :bats
      t.string :throws
      t.string :drafted
      t.string :position
      t.integer :age
      t.date :day_of_birth
      t.integer :height
      t.integer :weight
    end
  end
end
