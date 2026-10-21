cask "linger" do
  version "1.4.0"
  sha256 "d4f300eee419367cb5b50cdde66d3d9a9f312e8d7fc05d33384236f7176b26c5"

  url "https://lingermac.com/updates/Linger-#{version}.dmg"
  name "Linger"
  desc "Keeps your screenshots on screen until you've used them"
  homepage "https://lingermac.com/"

  livecheck do
    url "https://lingermac.com/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :ventura

  app "Linger.app"

  # Anonymous install counter (GoatCounter — no personal data, see https://lingermac.goatcounter.com).
  # Homebrew doesn't track installs for third-party taps on its own, so this is the only way to
  # know how many people install via brew. Fails silently and never blocks the install.
  postflight_steps do
    run "/usr/bin/curl",
        args:           ["-fsS", "--max-time", "3", "-o", "/dev/null",
                         "https://lingermac.goatcounter.com/count?p=brew-install&t=Homebrew+install&e=1"],
        must_succeed:   false,
        network_access: true
  end

  uninstall quit: "com.jakesamuelson.linger"

  zap trash: [
    "~/Library/Caches/com.jakesamuelson.linger",
    "~/Library/Preferences/com.jakesamuelson.linger.plist",
  ]

  caveats do
    <<~EOS
      Installing pings an anonymous counter (no personal data) so we know roughly how
      many people use Homebrew to install Linger. See https://lingermac.goatcounter.com.
    EOS
  end
end
