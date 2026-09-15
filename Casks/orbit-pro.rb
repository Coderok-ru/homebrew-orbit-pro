# Homebrew cask для Orbit.PRO. Публикуется в tap Coderok-ru/homebrew-orbit-pro (Scripts/publish.sh):
#   brew install --cask coderok-ru/orbit-pro/orbit-pro
# Значения 1.3.0/fe87d339e155ef60486c231cd5532156a80b5ac07e26fda2192538f9d881b9da подставляет Scripts/release.sh.
cask "orbit-pro" do
  version "1.3.0"
  sha256 "fe87d339e155ef60486c231cd5532156a80b5ac07e26fda2192538f9d881b9da"

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
