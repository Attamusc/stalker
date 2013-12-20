require 'thor'

module Stalker
  class Cli < Thor
    desc 'rsync [DIR] [DEST]', 'Watch DIR and rsync to DEST on change'
    def rsync(dir, dest)
      command = Stalker::Commands::Rsync.new(dir, dest)
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
