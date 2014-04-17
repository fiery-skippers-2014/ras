class CreatePrimaries < ActiveRecord::Migration
  def change
    create_table :primaries do |col|
      col.string :title
      col.timestamps
    end
  end
end
