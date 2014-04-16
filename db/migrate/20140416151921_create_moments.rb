class CreateMoments < ActiveRecord::Migration
  def change
    create_table :moments do |t|
      t.belongs_to :tag
      t.belongs_to :photo
      t.timestamps
    end
  end
end
