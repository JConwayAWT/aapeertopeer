class AddGoogleCalendarLinkToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
        t.string :google_calendar_link
    end
  end
end
