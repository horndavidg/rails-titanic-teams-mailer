class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :password_digest
      t.string :avatar_url
      t.boolean :is_admin, defautl: false

      t.timestamps null: false
    end
  end
end
