require 'active_model'
require 'active_support'
require 'active_record'

module ActsAsViewable

  if defined?(ActiveRecord::Base)
    require 'acts_as_viewable/extenders/viewable'
    require 'acts_as_viewable/extenders/viewer'
    require 'acts_as_viewable/viewable'
    require 'acts_as_viewable/view'
    require 'acts_as_viewable/viewer'
  end

end