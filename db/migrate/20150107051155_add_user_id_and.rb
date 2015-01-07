class AddUserIdAnd < ActiveRecord::Migration
  def change
    add_index :todos, [:user_id, :created_at]
  end
end
