require 'spec_helper'

describe Activity do
  before(:all) do
    Activity.create!(:user_id => 1, :body => '#ruby #rails @pblittle #hugo rocks for &james_dean')
    Activity.create!(:user_id => 1, :body => '#ruby #rails @jackhq #mercury rocks for &bob_smith')
    Activity.create!(:user_id => 1, :body => '#ruby #rails @akennedy ruby tweets rocks for &james_dean')
    Activity.create!(:user_id => 1, :body => '#ruby #rails @rdniller #mercury rocks for &james_dean')

  end
  
  subject do
    Activity
  end

  it "should search for topics" do
    subject.search('#ruby').count.should == 4
  end
  
  it "should search for at_users" do
    subject.search('@jackhq').count.should == 1
  end
  
  it "should search for people" do
    subject.search('&james_dean').count.should == 3
  end
  
  
  
end
