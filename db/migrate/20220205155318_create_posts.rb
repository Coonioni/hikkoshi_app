class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|

      t.text    :post_content
      t.string  :address
      t.integer :counts_good, default: 0
      t.integer :thread_id, default:0
      t.timestamps
    end
  end
end
