class Mis < Formula
  desc "Kubernetes Management and Inspection System"
  homepage "https://github.com/ramborogers/mis"
  version "0.1.1m" # Default to 0.1.0 if VERSION is not set

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/ramborogers/mis/releases/download/\#{version}/mis-darwin-amd64"
      sha256 "68d43a06be63bf0a44b11481774d9325fc45597e10ff9247c9a706cfdbcdb3a2"
    else
      url "https://github.com/ramborogers/mis/releases/download/\#{version}/mis-darwin-arm64"
      sha256 "56edd8fbeceb591b319059b2ae36235d73bee7cb8faa23d8bc8749f027cdcde3"
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
    system "#{bin}/mis", "--version"
  end
end
