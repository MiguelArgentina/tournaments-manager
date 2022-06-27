class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :uid
      t.string :codnickname
      t.string :cellphone
      t.string :time_zone

      t.timestamps
    end
  end
end
