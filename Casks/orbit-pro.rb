# Homebrew cask для Orbit.PRO. Публикуется в tap Coderok-ru/homebrew-orbit-pro (Scripts/publish.sh):
#   brew install --cask coderok-ru/orbit-pro/orbit-pro
# Значения 1.2.0/6496f64b331dd9421e3775d54d3a70d1627ddde250aaee299faace8e6780674d подставляет Scripts/release.sh.
cask "orbit-pro" do
  version "1.2.0"
  sha256 "6496f64b331dd9421e3775d54d3a70d1627ddde250aaee299faace8e6780674d"

  url "https://github.com/Coderok-ru/orbit-pro-site/releases/download/v#{version}/Orbit.PRO-#{version}.dmg"
  name "Orbit.PRO"
  desc "Analysis, cleanup and tweaks for macOS — every action reversible"
  homepage "https://orbit-pro.ru/"

  livecheck do
    url "https://orbit-pro.ru/appcast.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: ">= :sonoma"

  app "Orbit.PRO.app"

  uninstall launchctl: [
              "com.coderok.orbitpro.helper",
              "com.coderok.orbitpro.menubar",
            ],
            quit:      [
              "com.coderok.orbitpro",
              "com.coderok.orbitpro.menubar",
            ]

  zap trash: [
    "~/Library/Application Support/Orbit.PRO",
    "~/Library/Preferences/com.coderok.orbitpro.plist",
    "~/Library/Preferences/com.coderok.orbitpro.menubar.plist",
    "~/Library/Caches/com.coderok.orbitpro",
  ]
end
