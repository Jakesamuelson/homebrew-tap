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

  # Anonymous install counter (GoatCounter — no personal data, see https://lingermac.goatcounter.com).
  # Homebrew doesn't track installs for third-party taps on its own, so this is the only way to
  # know how many people install via brew. Fails silently and never blocks the install.
  postflight do
    system_command "/usr/bin/curl",
                    args: ["-fsS", "--max-time", "3", "-o", "/dev/null",
                           "https://lingermac.goatcounter.com/count?p=brew-install&t=Homebrew+install&e=1"],
                    must_succeed: false
  end

  caveats do
    <<~EOS
      Installing pings an anonymous counter (no personal data) so we know roughly how
      many people use Homebrew to install Linger. See https://lingermac.goatcounter.com.
    EOS
  end

  uninstall quit: "com.jakesamuelson.linger"

  zap trash: [
    "~/Library/Preferences/com.jakesamuelson.linger.plist",
    "~/Library/Caches/com.jakesamuelson.linger",
  ]
end
