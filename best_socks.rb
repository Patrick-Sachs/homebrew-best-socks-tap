# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class BestSocks < Formula
  desc "with AppsBox for MacOS"
  homepage "https://www.cordaware.com/eng/bestsocks"
  url "https://download.cordaware.com/best/best_socks/1.1.0/best_socks-macosx.zip"
  sha256 "0c90406b8e5ffa755edf2c5bbe7b6776ab13e640be94a7e6acb496928c3659f6"
  license "Proprietary"
  bottle :unneeded

  def install
    (var/"log/best_socks").mkpath

    # Extract app file
    #system "unzip", "./app/best_apps.app.zip"
    system "rm", "-r", "app"

    # Copy files
    system "cp", "-R", ".", "#{prefix}"

    # Create DMG
    #system "hdiutil", "create", "#{prefix}/best_apps.dmg", "-ov", "-volname", "CordawareAppsbox", "-fs", "HFS+", "-srcfolder", "best_apps.app"
    # system "open", "best_apps.dmg"
    # system "rm", "-r", "best_apps.app"

    # Cannot create dmg in homebrew installer!
  end

  def plist; <<~EOS
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
      <key>Label</key>
      <string>#{plist_name}</string>
      <key>ProgramArguments</key>
      <array>
        <string>#{prefix}/bin/best_socks</string>
        <string>foreground</string>
      </array>
      <key>RunAtLoad</key>
      <true/>
      <key>KeepAlive</key>
      <false/>
      <key>WorkingDirectory</key>
      <string>#{prefix}</string>
      <key>StandardErrorPath</key>
      <string>#{var}/log/best_socks/error.log</string>
      <key>StandardOutPath</key>
      <string>#{var}/log/best_socks/debug.log</string>
      <key>HardResourceLimits</key>
      <dict>
        <key>NumberOfFiles</key>
        <integer>64000</integer>
      </dict>
      <key>SoftResourceLimits</key>
      <dict>
        <key>NumberOfFiles</key>
        <integer>64000</integer>
      </dict>
    </dict>
    </plist>
  EOS
  end
end
