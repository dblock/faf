module Faf
  class Forks
    include Enumerable

    attr_reader :repo

    def initialize(repo, _options = {})
      @repo = repo
    end

    def each
      forks.each do |f|
        yield(f)
      end
    end

    private

    def forks
      @forks ||= get_forks
    end

    def get_forks(_options = {})
      query = <<-GRAPHQL
        query($owner: String!, $name: String!, $cursor: String) {
          repository(owner: $owner, name: $name) {
            forks(first: 10, after: $cursor) {
              edges {
                cursor
                node {
                  nameWithOwner
                  pushedAt
                }
              }
            }
          }
        }
      GRAPHQL

      query_options = {
        owner: repo.owner,
        name: repo.name
      }

      forks = []

      loop do
        response = Faf::Connection.query(query, query_options)
        edges = response.data.repository.forks.edges if response
        break unless edges && edges.any?
        edges.each do |edge|
          query_options[:cursor] = edge.cursor
          node = edge.node
          forks << Faf::Repo.new(node.name_with_owner, pushed_at: Time.parse(node.pushed_at))
        end
      end

      forks.sort_by(&:pushed_at).reverse
    end
  end
end
