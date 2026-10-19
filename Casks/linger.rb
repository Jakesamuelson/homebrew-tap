cask "linger" do
  version "1.0.4"
  sha256 "64fb71f8dc2bbe35eae58a500bc82092a372410b2869b1289296068daf4b2a75"

  url "https://lingermac.com/updates/Linger-#{version}.dmg"
  name "Linger"
  desc "Keeps your screenshots on screen until you've used them"
  homepage "https://lingermac.com/"

  auto_updates true
  depends_on macos: ">= :ventura"

  app "Linger.app"

  uninstall quit: "com.jakesamuelson.linger"

  zap trash: [
    "~/Library/Preferences/com.jakesamuelson.linger.plist",
    "~/Library/Caches/com.jakesamuelson.linger",
  ]
end
