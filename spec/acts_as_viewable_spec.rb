require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe :ActsAsViewable do

  before :each do
    clean_database
    @viewer = Viewer.create
    @viewable = Viewable.create
  end

  it "should increment the view"  do
    expect{
      @viewable.viewed_by(@viewer)
    }.should change(ActsAsViewable::View, :count).by(1)
  end

  it "should retrieve the view count" do
    @viewable.viewed_by(@viewer)
    @viewable.count_views.should == 1
  end

  it "should retrieve the visualizations by viewer" do
    @viewable.viewed_by(@viewer)
    @viewable.viewed_by(@viewer)
    @viewer.views_of(@viewable).count.should == 2
  end

end
