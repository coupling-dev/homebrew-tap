class Archfit < Formula
  desc "Architecture-fitness checks for AI agents and CI"
  homepage "https://github.com/coupling-dev/archfit"
  version "0.9.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/coupling-dev/archfit/releases/download/v#{version}/archfit-v#{version}-darwin-arm64"
      sha256 "4f39b9b233b8e2daa4961e0625eae5b1d9fab6d30667c414fa85ea61885e51e6"
    else
      url "https://github.com/coupling-dev/archfit/releases/download/v#{version}/archfit-v#{version}-darwin-amd64"
      sha256 "3cf287681c05188270fc828229f2aa6e9af69a1fb97838c7c6872ff9bca9851b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/coupling-dev/archfit/releases/download/v#{version}/archfit-v#{version}-linux-arm64"
      sha256 "912dee12ad42dfe4a31916e1d0834d832877c847a975b65511954b69ec026490"
    else
      url "https://github.com/coupling-dev/archfit/releases/download/v#{version}/archfit-v#{version}-linux-amd64"
      sha256 "be04076e5a9e7d669fd2a778f71eebd0a403c7c4a28c70060e6087c7104e679d"
    end
  end

  def install
    binary_name = if OS.mac?
      Hardware::CPU.arm? ? "archfit-v#{version}-darwin-arm64" : "archfit-v#{version}-darwin-amd64"
    else
      Hardware::CPU.arm? ? "archfit-v#{version}-linux-arm64" : "archfit-v#{version}-linux-amd64"
    end

    bin.install binary_name => "archfit"
  end

  test do
    assert_match "archfit version", shell_output("#{bin}/archfit --version")
  end
end
