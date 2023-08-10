require 'rails_helper'

RSpec.describe Group, type: :model do
  @user = User.create(name: 'abbas')
  subject do
    Group.new(name: 'Amazon', icon: Rack::Test::UploadedFile.new('spec/assets/daraz.jpg'))
  end
  before { subject.save }
  it 'name should be available' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'Icon should be valid' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end
end
