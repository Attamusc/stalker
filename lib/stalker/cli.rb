require 'thor'

module Stalker
  class Cli < Thor
    desc 'sync [DIR] [DEST]', 'Watch DIR and rsync to DEST on change'
    option :verbose, type: :boolean
    def sync(dir, dest)
      command = Stalker::Commands::Sync.new(dir, dest, options)
      watcher = Stalker::Watcher.new(dir, command)

      watcher.watch!

      # Trap error so that sleep doesn't throw an error when the user
      # kills the process
      Signal.trap('INT') do
        exit
      end

      puts "Listening to #{dir}"
      sleep
    end
  end
end
