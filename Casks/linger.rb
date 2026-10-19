cask "linger" do
  version "1.0.3"
  sha256 "0dd2524dba4cf7e484586800be73230ffe9f3984d76fcb5f828b244b881e7fce"

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
