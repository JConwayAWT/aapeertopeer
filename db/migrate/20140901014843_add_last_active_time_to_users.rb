class AddLastActiveTimeToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.datetime :last_active_time
    end
  end
end
