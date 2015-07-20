class CreateAffiliations < ActiveRecord::Migration
  def change
    create_table :affiliations do |t|
      t.references :team, index: true, foreign_key: true
      t.references :superhero, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
