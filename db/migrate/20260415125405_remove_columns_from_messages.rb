class RemoveColumnsFromMessages < ActiveRecord::Migration[8.1]
  def change
    remove_column :messages, :chat, :string
    remove_column :messages, :references, :string
  end
end
