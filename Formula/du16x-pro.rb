class Du16xPro < Formula
  desc "Disk space explorer for the terminal, Pro edition"
  homepage "https://github.com/engrmnaveed/diskuse16x"
  version "1.0.0"
  license "MIT"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  on_macos do
    depends_on macos: :sonoma

    on_arm do
      url "https://github.com/engrmnaveed/diskuse16x/releases/download/v#{version}/diskuse16x-pro-aarch64-apple-darwin.tar.gz"
      sha256 "b7c2c133cd6048ce5524ca7fad8e0fd9eaf86bd7c42bd1a97d8d5e57e30a4b0e"
    end
    on_intel do
      url "https://github.com/engrmnaveed/diskuse16x/releases/download/v#{version}/diskuse16x-pro-x86_64-apple-darwin.tar.gz"
      sha256 "cba0826a55aad10c42bdf50984a80c7d37d020646d70b492625cc3a6daf268da"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/engrmnaveed/diskuse16x/releases/download/v#{version}/diskuse16x-pro-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f938832589f27ae609aff2cfe0f3867a7e13903e724acddd8db35807b694e439"
    end
    on_intel do
      url "https://github.com/engrmnaveed/diskuse16x/releases/download/v#{version}/diskuse16x-pro-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1c3d81d86aa2e335a3acfab5c26b26c8ba771a90da8e89f1592e4845fe1f3e24"
    end
  end

  conflicts_with "du16x", because: "both install the `diskuse16x` and `du16x` commands"

  def install
    bin.install "diskuse16x"
    bin.install_symlink "diskuse16x" => "du16x"
    doc.install Dir["*.md"], "example-report.json"
  end

  test do
    assert_equal "diskuse16x #{version} (pro)", shell_output("#{bin}/diskuse16x --version").strip
    assert_equal "diskuse16x #{version} (pro)", shell_output("#{bin}/du16x --version").strip
    (testpath/"folder/file").write "DiskUse16x"
    report = JSON.parse(shell_output("#{bin}/diskuse16x scan #{testpath}/folder --json"))
    assert_equal "pro", report["edition"]
  end
end
