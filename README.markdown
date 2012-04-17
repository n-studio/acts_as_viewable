# ActsAsViewable

### General information

Adds functionality to models.

## Installation

To use it, add it to your Gemfile:

    gem 'acts_as_viewable', :git => 'git@github.com:ivoreis/acts_as_viewable.git' or
    gem 'acts_as_viewable', :github => 'ivoreis/acts_as_viewable'
    bundle update / bundle install

### Post Installation

1. rails g acts_as_viewable:install
2. rake db:migrate


### Configuration

Nothing to do


### Testing

ActsAsViewable uses RSpec for its test coverage

    rake spec

## Usage

```ruby
class Viewable < ActiveRecord::Base
  acts_as_viewable
end

class Viewer < ActiveRecord::Base
  acts_as_viewer
end

After is possible to use this way:

#Create a new visualization by the @viewer
@viewable.viewed_by(@viewer)
#Count the visualizations of this @viewable
@viewable.count_views
#Retrieve the visualizations that the @viewer made to this @viewable item
@viewer.views_of(@viewable)
```



## Credits


## License
Copyright (c) 2012 Ivo Reis, released under the MIT license

