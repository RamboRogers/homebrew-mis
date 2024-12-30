class Mis < Formula
  desc "Kubernetes Management and Inspection System"
  homepage "https://github.com/ramborogers/mis"
  version "0.1.1m"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/ramborogers/mis/releases/download/0.1.1m/mis-darwin-amd64"
      sha256 "6128b3432875e0e9af07638630d5d9dd733f5a3c5be9462709e0ae9f8928809f"
    else
      url "https://github.com/ramborogers/mis/releases/download/0.1.1m/mis-darwin-arm64"
      sha256 "6395e3472524956061d9aa51888bb62fcefb7f36a9df6c2f4138c2b7ab6ad6d1"
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
