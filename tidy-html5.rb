require 'formula'

class TidyHtml5 < Formula
  homepage 'http://w3c.github.com/tidy-html5/'
  head 'https://github.com/w3c/tidy-html5.git'

  def install
    ENV.deparallelize
    system "make -C build/gmake/"
    system "make install -C build/gmake"
  end

  def test
    tidy
  end
end
