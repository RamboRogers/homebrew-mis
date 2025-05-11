class Mis < Formula
  desc "Kubernetes Management and Inspection System"
  homepage "https://github.com/ramborogers/mis"
  version "0.2.0m"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/ramborogers/mis/releases/download/0.2.0m/mis-darwin-amd64"
      sha256 "2205c565b00031ebbf08fdf85a77fe013600ac6a96d5a1c801c7a5d91b97e10f"
    else
      url "https://github.com/ramborogers/mis/releases/download/0.2.0m/mis-darwin-arm64"
      sha256 "b55cc002cb27eeb252f22b5eb68879b5e1aabd2d14cc1d8fa943d274e0793ef1"
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
