class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.json :questions
      t.string :hashed_ip
      t.string :hashed_address
      t.string :vote
    end
  end
end
