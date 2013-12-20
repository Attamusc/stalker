module Stalker
  module Commands
    class Rsync
      def initialize(source, dest)
        @source = source
        @dest = dest
      end

      # Stupid simple watcher for now
      def process_changes(changes)
        puts "Syncing '#{@source}' to '#{@dest}'"
        `rsync -rltz --executability --filter=':- .gitignore' -e ssh #{@source} #{@dest}`
      end
    end
  end
end
