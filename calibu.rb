# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Calibu < Formula
  homepage "https://github.com/arpg/Calibu"
#  url "https://github.com/arpg/Node/archive/node-2.0.tar.gz"
#  sha1 "ea9b151ac9f0afd584a2680db77bd4828ef99357"
  head "https://github.com/arpg/Calibu.git", :branch => "master"

  depends_on "cmake" => :build 

  option "with-matlab","build library with matlab dependencies enabled"
  depends_on "gflags"
  depends_on "glog"
  depends_on "eigen"
  depends_on "cvars"
  depends_on "sophus"
  depends_on "opencv3" => :recommended
  depends_on "opencv"  => :optional
  depends_on "ceres-solver"

  def install
    cmake_args = std_cmake_args

    if build.with? "matlab"
      cmake_args << "-DBUILD_MATLAB=ON"
    else
      cmake_args << "-DBUILD_MATLAB=OFF"
    end
    
    system "cmake", ".", *cmake_args, "-DCMAKE_BUILD_TYPE=Release"
    system "make"
    system "make", "install"
  end
end

