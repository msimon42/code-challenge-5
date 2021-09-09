class ChangeAgeToBoolean < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :age, :integer
    add_column :users, :adult, :boolean
  end
end
