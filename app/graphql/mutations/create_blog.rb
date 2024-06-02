module Mutations
  class CreateBlog < Mutations::BaseMutation
    argument :title, String, required: true
    argument :description, String, required: true
    argument :user_id, Integer, required: true

    type Types::BlogType

    def resolve(title:, description:, user_id:)
      blog = Blog.create(
        title: title,
        description: description,
        user_id: user_id)
      unless blog.id
        raise blog.errors.map{|e| "error #{e.attribute} #{e.type}"}.to_sentence
      end
      blog
    end
  end
end