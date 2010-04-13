require 'spec_helper'

describe Activity do

  subject do
    Activity.create!(
      :user_id => 1,
      :body => 'Hello @jackhq, do you have any #patients named &johnny_patient'
    )
  end

  it { should be_true }
  
  it "should have jackhq in the [to] attribute" do
    subject.at_users.should == ['jackhq']
  end
  
  it "should have patients in the [topics] attribute" do
    subject.topics.should == ['patients']
  end
  
  it "should have johnny_patient in the [people] attribute" do
    subject.people.should == ['johnny_patient']
    
  end

  it "should have several to, topics, and people" do
    subject.body = "Hello @jackhq, @pblittle, @akennedy \nhow is #summer of #code going with &jim_smith and &brian_adams"
    subject.save
    subject.at_users.should == ['jackhq','pblittle','akennedy']
    subject.topics.should == ['summer','code']
    subject.people.should == ['jim_smith','brian_adams']
    
  end
  
  
  it "should not let body exceed 140 characters" do
    text = ''
    200.times do 
        text += "X" 
    end
    subject.body = text
    subject.should_not be_valid
  end

  
  
  
end
