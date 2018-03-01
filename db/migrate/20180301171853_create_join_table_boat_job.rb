class CreateJoinTableBoatJob < ActiveRecord::Migration[5.1]
  def change
    create_join_table :boats, :jobs do |t|
      t.index [:boat_id, :job_id]
      t.index [:job_id, :boat_id]
    end
  end
end
