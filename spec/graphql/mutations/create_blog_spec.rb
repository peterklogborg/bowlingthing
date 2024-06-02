require 'rails_helper'

RSpec.describe Mutations::CreateBlog, "blog mutation" do
  context "with params provided from by mutation" do
    let(:user) {
      User.create(
        first_name: "f",
        last_name: "l",
        email: "a@e.d"
      )
    }
    it "creates an blog" do
      blog = Mutations::CreateBlog.new(object: nil, context: nil, field: nil)
        .resolve(title: "some-t", description: "a-descri", user_id: user.id)

      expect(blog).to eql(Blog.last)
    end

    it "fails if the user doest exist" do
      expect {  
        blog = Mutations::CreateBlog.new(object: nil, context: nil, field: nil)
          .resolve(title: "some-t", description: "a-descri", user_id: -4)

      }.to raise_error("error user blank")      
    end
  end
end