class AddInteractionsCountToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :interactions_count, :integer, default: 0, null: false
  end
end
