require "formula"

class GitCmdHub < Formula
  homepage "https://github.com/ingydotnet/git-hub"
  url "https://github.com/ingydotnet/git-hub/archive/0.1.4.tar.gz"
  sha256 "d0cad0035c396aa83f7b660543267ccc5427b9f334a00fba218846c180df144b"

  def install
    inreplace 'Makefile' do |f|
      # Prevent the makefile from installing outside of the prefix
      f.gsub! '$(shell git --exec-path | sed \'s/.*://\')', '$(PREFIX)/bin'
    end

    inreplace 'lib/git-hub' do |f|
      # Fix the hardcoded directory to match Homebrew's structure
      f.gsub! "SELFDIR=\"$(cd -P `dirname $BASH_SOURCE` && pwd -P)\"", "SELFDIR=#{bin}"
    end

    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "[ -f #{File.join(man1, "git-hub.1")} ]"
    system "[ -f #{File.join(bin, "git-hub")} ]"
  end
end
