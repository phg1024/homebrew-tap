cask "cadabra" do
  version "1.4.2"
  sha256 "a946428e4c284345ce0283c6175fd470c5a4c12c2a6ed03155e7ce6d13868465"

  url "https://github.com/phg1024/Cadabra/releases/download/v#{version}/Cadabra-#{version}.dmg"
  name "Cadabra"
  desc "On-device dictation: hold a key, speak, and the text appears at the cursor"
  homepage "https://phg1024.github.io/Cadabra/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Cadabra.app"

  zap trash: [
    "~/Library/Application Support/Cadabra",
    "~/Library/Preferences/com.peihongguo.Cadabra.plist",
  ]

  caveats <<~EOS
    Cadabra isn't notarized by Apple yet, so macOS stops it the first time.
    Open it once, then allow it in System Settings › Privacy & Security › Open Anyway.
    Or, in Terminal:
      xattr -dr com.apple.quarantine "#{appdir}/Cadabra.app"
  EOS
end
