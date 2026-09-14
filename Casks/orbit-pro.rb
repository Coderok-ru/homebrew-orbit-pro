# Homebrew cask для Orbit.PRO. Публикуется в tap Coderok-ru/homebrew-orbit-pro (Scripts/publish.sh):
#   brew install --cask coderok-ru/orbit-pro/orbit-pro
# Значения 0.1.0/85be83b9df26fbf9453c9ebaee34e95a07a1c3e42a74e5e6a3fa34fe8afe48a4 подставляет Scripts/release.sh.
cask "orbit-pro" do
  version "0.1.0"
  sha256 "85be83b9df26fbf9453c9ebaee34e95a07a1c3e42a74e5e6a3fa34fe8afe48a4"

  url "https://github.com/Coderok-ru/orbit-pro-site/releases/download/v#{version}/Orbit.PRO-#{version}.dmg"
  name "Orbit.PRO"
  desc "Analysis, cleanup and tweaks for macOS — every action reversible"
  homepage "https://coderok-ru.github.io/orbit-pro-site/"

  livecheck do
    url "https://coderok-ru.github.io/orbit-pro-site/appcast.xml"
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
