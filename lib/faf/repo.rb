module Faf
  class Repo
    attr_reader :owner
    attr_reader :name
    attr_reader :pushed_at

    def initialize(url, options = {})
      @owner, @name = url.split('/', 2)
      @pushed_at = options[:pushed_at]
    end

    def forks
      @forks ||= Faf::Forks.new(self)
    end

    def fork_count
      repository.fork_count
    end

    def repository
      data.repository
    end

    def url
      "https://github.com/#{owner}/#{name}"
    end

    def to_s
      "#{url} (#{pushed_at.ago_in_words})"
    end

    private

    def data
      @data ||= get_data.data
    end

    def get_data
      query = <<-GRAPHQL
        query($owner: String!, $name: String!) {
          repository(owner: $owner, name: $name) {
            name
            forkCount
          }
        }
      GRAPHQL

      query_options = {
        owner: owner,
        name: name
      }

      Faf::Connection.query(query, query_options)
    end
  end
end
