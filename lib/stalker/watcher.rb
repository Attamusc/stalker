require 'listen'

module Stalker
  class Watcher
    def initialize(directory = '.', cmd)
      @directory = directory
      @cmd = cmd
    end

    def watch!
      @listener = Listen::Listener.new(@directory) do |modified, created, removed|
        if @cmd.respond_to?(:process_changes)
          @cmd.process_changes({
            modified: modified,
            created: created,
            removed: removed
          })
        end
      end

      @listener.start
    end
  end
end
