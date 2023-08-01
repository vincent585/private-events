class CreateEventAttendances < ActiveRecord::Migration[7.0]
  def change
    create_table :event_attendances do |t|
      t.references :attended_event, index: true, foreign_key: false
      t.references :attendee, index: true, foreign_key: false

      t.timestamps
    end
    add_foreign_key :event_attendances, :users, column: :attendee_id
    add_foreign_key :event_attendances, :events, column: :attended_event_id
  end
end
