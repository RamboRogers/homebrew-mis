class Mis < Formula
  desc "Kubernetes Management and Inspection System"
  homepage "https://github.com/ramborogers/mis"
  version "0.1.1m"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/ramborogers/mis/releases/download/0.1.1m/mis-darwin-amd64"
      sha256 "5330fe2f44542eb946d32736553e7f3441dd0f830705b3a22302c113fedbde09"
    else
      url "https://github.com/ramborogers/mis/releases/download/0.1.1m/mis-darwin-arm64"
      sha256 "9fcc275e3ed8900639f35f644b6a049127a2036e8910f87ca189689cf949736e"
    end
  end

  def install
    if Hardware::CPU.intel?
      bin.install "mis-darwin-amd64" => "mis"
    else
      bin.install "mis-darwin-arm64" => "mis"
    end
  end

  test do
    system "\#{bin}/mis", "--version"
  end
end
