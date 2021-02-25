class Author

attr_accessor :name

@@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def posts
        Post.all.select {|post| post.author == self}
    end

    def add_post(post)
        post.author = self
    end

    def add_post_by_title(post_title)
        post_title = Post.new(post_title)
        post_title.author = self
    end

    def self.post_count
      post_counts = []
        @@all.map do |individual_author|
         post_counts << individual_author.posts.count
      end
      post_counts.sum
    end

end