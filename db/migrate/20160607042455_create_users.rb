class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :questions
      t.string :hashed_ip
      t.string :hashed_address
      t.string :vote
      t.string :polling_location
      t.timestamps
    end
  end
end
