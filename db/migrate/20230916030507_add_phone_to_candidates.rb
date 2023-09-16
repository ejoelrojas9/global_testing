class AddPhoneToCandidates < ActiveRecord::Migration[7.0]
  def change
    add_column :candidates, :phone, :string
  end
end
