class Post < ActiveRecord::Base

  belongs_to :user

  attr_accessible :body, :public, :title, :image

  validates :title, presence: true, length: { in: 5..128 }
  validates :body, presence: true, length: { in: 10..4000 }
  validates :public, inclusion: { in: [true, false] }

  has_attached_file :image, styles: { medium: '600x200', large: '920x300' }, default_url: '/images/:style/missing.jpg'

  validates_attachment :image,
                        content_type: { content_type: ["image/jpeg", "image/png", "images/jpg", "image/gif"]}

  # Class method
  def self.public_posts(params)
  	# Post.where(public: true).paginate(page: params[:page])
  	# page: params[:page], order: 'created_at DESC', per_page: 3
  	where(public: true).order('created_at DESC')
  end

end
