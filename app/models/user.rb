class User < ApplicationRecord
  authenticates_with_sorcery!

  attr_accessor :return_to
end
