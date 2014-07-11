require 'rails_helper'

RSpec.describe Micropost, :type => :model do
  it do
    expect(Micropost.new.valid?).to be_falsy
  end

  it do
    expect(Micropost.new(content: "content").valid?).to be_truthy
  end
end
