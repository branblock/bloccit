class CreateLevels < ActiveRecord::Migration
   def change
     create_table :levels do |t|
       t.string :name
       t.references :levelable, polymorphic: true, index: true
 
       t.timestamps null: false
     end
   end
 end
