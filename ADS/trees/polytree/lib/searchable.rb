module Searchable

    def dfs(target_value)
        return self if @value == target_value

        @children.each do |child|
          search_result = child.dfs(target_value)
          return search_result if search_result
        end

        nil
    end

      def bfs(target_value)
        queue = [self]

        while !queue.empty?
          node = queue.shift
          return node if node.value == target_value
          queue.push(*node.children)
        end

      nil
      end
      
end