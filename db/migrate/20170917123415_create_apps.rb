class CreateApps < ActiveRecord::Migration[5.1]
  def change
    create_table :apps, id: :uuid do |t|
      t.json :data, null: :false, default: {}
      t.timestamps
    end
  end
end
