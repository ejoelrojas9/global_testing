class CreateCandidates < ActiveRecord::Migration[7.0]
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :gender
      t.integer :age
      t.datetime :birthday
      t.string :proffesion
      t.string :education_level

      t.timestamps
    end
  end
end
