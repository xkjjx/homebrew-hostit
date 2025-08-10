# frozen_string_literal: true

class Hostit < Formula
  desc 'easily host files through the CLI'
  homepage 'https://hostit.kjonasj.com'
  url 'https://github.com/xkjjx/hostit/archive/refs/tags/v0.0.1.tar.gz'
  sha256 '5f026ea12129ea66ed8d678c76aa2c419102b32bee58fcd9817d831ecf9b6a5c'
  license 'MIT'

  depends_on 'go' => :build

  def install
    system 'go', 'build', *std_go_args(ldflags: '-s -w')
  end

  test do
    assert_match 'Usage:', shell_output("#{bin}/hostit 2>&1", 1)
  end
end

