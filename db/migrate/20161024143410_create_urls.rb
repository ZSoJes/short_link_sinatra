class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |ur|
      ur.string :long_url
      ur.string :short_url
      ur.integer :click_count,:default => 0
    end
  end
end
