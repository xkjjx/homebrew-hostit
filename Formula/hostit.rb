# frozen_string_literal: true

class Hostit < Formula
  desc 'easily host files through the CLI'
  homepage 'https://hostit.kjonasj.com'
  url 'https://github.com/xkjjx/hostit/archive/refs/tags/v0.0.2.tar.gz'
  sha256 'c07e4afc095a0301e6f1d7265794355e5ee908fc907f66c97aeda7b5bda7ce71'
  license 'MIT'
  version "0.0.2"

  depends_on 'go' => :build

  def install
    system 'go', 'build', *std_go_args(ldflags: '-s -w')
  end

  test do
    assert_match 'Usage:', shell_output("#{bin}/hostit 2>&1", 1)
  end
end

