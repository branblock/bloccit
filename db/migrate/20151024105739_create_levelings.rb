class CreateLevelings < ActiveRecord::Migration
   def change
     create_table :levelings do |t|
       t.integer :level_id
       t.integer :topic_id
       t.references :level, index: true
       t.references :topic, index: true
       t.references :post, index: true
 # #3
       t.references :levelable, polymorphic: true, index: true

       t.timestamps null: false
     end
     add_foreign_key :levelings, :levels
     add_foreign_key :levelings, :topics
     add_foreign_key :levelings, :posts
   end
 end
