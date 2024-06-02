require 'rails_helper'

RSpec.describe User, type: :model do
  context "new users" do
    it "has last name Doe" do
      expect(User.new.name).to include "Doe"
    end

    it "has a gender neutral first name" do
      expect(User.new.name).to start_with "Jaime"
    end
  end
end
