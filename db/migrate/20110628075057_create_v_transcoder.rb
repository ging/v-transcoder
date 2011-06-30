class CreateVTranscoder < ActiveRecord::Migration
  def self.up
    create_table "video_artifacts", :force => true do |t|
      t.string  "name"
      t.string  "output"
      t.string  "params"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "job_id"
    end
        
    create_table "jobs", :force => true do |t|
      t.string   "code"
      t.string   "input_name"
      t.integer  "length_in_seconds"
      t.integer  "size_in_mb"
      t.string   "status" # requested, processing, aborted, finished
      t.string   "owner"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "machine_id" #machine assigned to process this job
    end
        
    create_table "machines", :force => true do |t|
      t.string   "status" 
      t.string   "url"
      t.string   "type"
      t.datetime "created_at"
      t.datetime "updated_at"
    end    
    
    add_foreign_key "video_artifacts", "jobs", :name => "index_video_artifacts_on_job_id"
    add_foreign_key "jobs", "machines", :name => "index_jobs_on_machine_id"
    
  end
  
  def self.down
    drop_table :jobs
    drop_table :machines
    drop_table :video_artifacts
    remove_foreign_key "video_artifacts", :name => "index_video_artifacts_on_job_id"
    remove_foreign_key "jobs", :name => "index_jobs_on_machine_id"
  end
end
