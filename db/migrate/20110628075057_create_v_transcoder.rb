class CreateVTranscoder < ActiveRecord::Migration
  def self.up
    create_table "video_artifacts", :force => true do |t|
      t.string  "name"
      t.string  "output"
      t.string  "params"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "parent_job_id"
    end
    
    add_index "video_artifacts", "parent_job_id"
    
    create_table "jobs", :force => true do |t|
      t.string   "input_name"
      t.integer  "length_in_seconds"
      t.integer  "size_in_mb"
      t.string   "status" # requested, processing, aborted, finished
      t.string   "owner"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "assigned_to_machine_id" #machine assignet to process this job
    end
    
    add_index "jobs", "assigned_to_machine_id"
    
    create_table "machines", :force => true do |t|
      t.string   "status" 
      t.string   "url"
      t.string   "type"
      t.datetime "created_at"
      t.datetime "updated_at"
    end    
    
    add_foreign_key "jobs", "video_artifacts", :name => "index_jobs_on_parent_job_id"
    add_foreign_key "machines", "jobs", :name => "index_machines_on_assigned_to_machine_id"
    
  end
  
  def self.down
    drop_table :jobs
    drop_table :machines
    drop_table :video_artifacts
  end
end
