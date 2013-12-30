module Stalker
  class Colors
    def self.black(txt)           "\033[30m#{txt}\033[0m" end
    def self.red(txt);            "\033[31m#{txt}\033[0m" end
    def self.green(txt);          "\033[32m#{txt}\033[0m" end
    def self.brown(txt);          "\033[33m#{txt}\033[0m" end
    def self.blue(txt);           "\033[34m#{txt}\033[0m" end
    def self.magenta(txt);        "\033[35m#{txt}\033[0m" end
    def self.cyan(txt);           "\033[36m#{txt}\033[0m" end
    def self.gray(txt);           "\033[37m#{txt}\033[0m" end
    def self.bg_black(txt);       "\033[40m#{txt}\033[0m" end
    def self.bg_red(txt);         "\033[41m#{txt}\033[0m" end
    def self.bg_green(txt);       "\033[42m#{txt}\033[0m" end
    def self.bg_brown(txt);       "\033[43m#{txt}\033[0m" end
    def self.bg_blue(txt);        "\033[44m#{txt}\033[0m" end
    def self.bg_magenta(txt);     "\033[45m#{txt}\033[0m" end
    def self.bg_cyan(txt);        "\033[46m#{txt}\033[0m" end
    def self.bg_gray(txt);        "\033[47m#{txt}\033[0m" end
    def self.bold(txt);           "\033[1m#{txt}\033[22m" end
    def self.reverse_color(txt);  "\033[7m#{txt}\033[27m" end
  end
end
