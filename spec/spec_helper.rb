$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'lib')
require 'rspec'
require 'acts_as_viewable'
require 'logger'

ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")
ActiveRecord::Base.logger = Logger.new(File.join(File.dirname(__FILE__),'debug.log'))
ActiveRecord::Base.logger.level = Logger::INFO

ActiveRecord::Schema.define(:version => 1) do
  create_table :viewers, :force => true do |t|
    t.timestamps
  end

  create_table :viewables, :force => true do |t|
    t.timestamps
  end

  create_table :views, :force => true do |t|
    t.references :viewable, :polymorphic => true
    t.references :viewer, :polymorphic => true
    t.integer :times_viewed, :default => 1
    t.datetime :past_time_viewed
    t.timestamps
  end

end


class Viewable < ActiveRecord::Base
  acts_as_viewable
end

class Viewer < ActiveRecord::Base
  acts_as_viewer
end



def clean_database
  models = [Viewable, Viewer, ActsAsViewable::View ]
  models.each do |model|
    ActiveRecord::Base.connection.execute "DELETE FROM #{model.table_name}"
  end
end
