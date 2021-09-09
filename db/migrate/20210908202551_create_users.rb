class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :gender
      t.integer :age
      t.string :language

      t.timestamps
    end
  end
end
