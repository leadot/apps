class CreateIncidents < ActiveRecord::Migration[5.0]
  def change
    create_table :incidents do |t|
      t.datetime :date
      t.string :description
      t.references :neighborhood_id, index: true

      t.timestamps
    end
  end
end
