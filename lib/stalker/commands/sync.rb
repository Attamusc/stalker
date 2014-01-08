require 'logger'

module Stalker
  module Commands
    class Sync
      def initialize(source, dest, options)
        @source = source
        @dest = dest

        @logger = Logger.new(STDOUT)
        @logger.level = options[:verbose] ? Logger::DEBUG : Logger::INFO
        @logger.datetime_format = '%Y-%m-%d %I:%M:%S'
        @logger.formatter = proc do |severity, datetime, progname, msg|
          "#{datetime.strftime(@logger.datetime_format)}: #{msg}\n"
        end

      end

      # Stupid simple watcher for now
      def process_changes(changes)
        @logger.info Stalker::Colors.green("Syncing '#{@source}' to '#{@dest}'")

        result = `rsync --itemize-changes -rltz --executability --filter=':- .gitignore' -e ssh #{@source} #{@dest}`

        unless result.nil?
          @logger.debug Stalker::Colors.cyan("Changes:\n#{changes(result)}")
        end

        @logger.info Stalker::Colors.green("Synced '#{@source}' to '#{@dest}'\n")
      end

      private
        def changes(raw)
          raw.split(/\n/).reduce([]) do |acc, change|
            acc << change.sub(/.* /, '')
          end.join("\n")
        end
    end
  end
end
