# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Scenegraph < Formula
  homepage "https://github.com/arpg/SceneGraph"
#  url "https://github.com/arpg/Node/archive/node-2.0.tar.gz"
#  sha1 "ea9b151ac9f0afd584a2680db77bd4828ef99357"
  head "https://github.com/arpg/SceneGraph.git", :branch => "master"

  depends_on "cmake" => :build
  depends_on "eigen"
  depends_on "glew"
  depends_on "cvars"
  depends_on "assimp"
#  depends_on "osxglut"

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    system "cmake", ".", *std_cmake_args, "-DCMAKE_BUILD_TYPE=Release"
    system "make", "install"
  end
end

