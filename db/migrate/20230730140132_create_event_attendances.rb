class CreateEventAttendances < ActiveRecord::Migration[7.0]
  def change
    create_table :event_attendances do |t|
      t.references :attended_event, index: true, foreign_key: true
      t.references :attendee, index: true, foreign_key: true

      t.timestamps
    end
  end
end
