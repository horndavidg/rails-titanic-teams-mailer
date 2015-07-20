class CreateSuperheros < ActiveRecord::Migration
  def change
    create_table :superheros do |t|
      t.string :name
      t.string :bio
      t.string :image_url
      t.float :height

      t.timestamps null: false
    end
  end
end
