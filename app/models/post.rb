class Post < ActiveRecord::Base

  belongs_to :user

  attr_accessible :body, :public, :title

  validates :title, presence: true, length: { in: 5..128 }
  validates :body, presence: true, length: { in: 10..4000 }
  validates :public, inclusion: { in: [true, false] }

  # Class method
  def self.public_posts(params)
  	# Post.where(public: true).paginate(page: params[:page])
  	# page: params[:page], order: 'created_at DESC', per_page: 3
  	where(public: true)
  end

end