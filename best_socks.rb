# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class BestSocks < Formula
  desc "with AppsBox for MacOS"
  homepage "https://www.cordaware.com/eng/bestsocks"
  url "https://download.cordaware.com/best/best_socks/1.1.0/best_socks-macosx.zip"
  sha256 "0c90406b8e5ffa755edf2c5bbe7b6776ab13e640be94a7e6acb496928c3659f6"
  license "Proprietary"
  
  def install
    # Extract app file
    system "unzip", "./app/best_apps.app.zip"
    system "rm", "-r", "app"

    # Copy files
    system "cp", "-R", ".", "#{prefix}"
  end
end
