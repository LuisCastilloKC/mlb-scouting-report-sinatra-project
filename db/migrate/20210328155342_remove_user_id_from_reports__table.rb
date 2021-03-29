class RemoveUserIdFromReportsTable < ActiveRecord::Migration[6.1]
  def change
    remove_column :reports, :user_id
  end
end
