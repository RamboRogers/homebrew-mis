class Mis < Formula
  desc "Kubernetes Management and Inspection System"
  homepage "https://github.com/ramborogers/mis"
  version "0.1.2m"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/ramborogers/mis/releases/download/0.1.2m/mis-darwin-amd64"
      sha256 "a3daf07ca07e0ff6d8a4feea51b346a4c97ec3fabfaacc014e50188bfe35109a"
    else
      url "https://github.com/ramborogers/mis/releases/download/0.1.2m/mis-darwin-arm64"
      sha256 "34006e7d7457c8f15b74d42338f93c9d3c9bf4b2a68993d4e636343eb5291ce6"
    end
  end

  def install
    if Hardware::CPU.intel?
      bin.install "mis-darwin-amd64" => "mis"
    else
      bin.install "mis-darwin-arm64" => "mis"
    end

    # Remove quarantine attribute
    system "xattr", "-d", "com.apple.quarantine", "#{bin}/mis"
  rescue
    # Ignore if xattr fails (in case attribute doesn't exist)
    nil
  end

  test do
    system "\#{bin}/mis", "--version"
  end
end
