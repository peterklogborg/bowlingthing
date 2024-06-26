# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject

    field :create_blog, mutation: Mutations::CreateBlog
  end
end
