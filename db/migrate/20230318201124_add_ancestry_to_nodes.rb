class AddAncestryToNodes < ActiveRecord::Migration[7.0]
  def change
    add_column :nodes, :ancestry, :string
  end
end
