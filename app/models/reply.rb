class Reply < ApplicationRecord
  belongs_to :tweet
  belongs_to :user
end

# While your implementation for Reply works great here, I would think about how could
# you unify this model with Tweet (since a Reply is just a Tweet that happens to be
# in reponse to another Tweet). Depending on how you set this up, you may still have a Reply
# model, but using it as a join instead of holding the content of what someone says.
