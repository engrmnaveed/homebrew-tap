class Du16x < Formula
  desc "Disk space explorer for the terminal"
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
      url "https://github.com/engrmnaveed/diskuse16x/releases/download/v#{version}/diskuse16x-aarch64-apple-darwin.tar.gz"
      sha256 "2ed7aa23c1194a05680563cffddad8ced2977e343118c9c1752352dd3bb8cc36"
    end
    on_intel do
      url "https://github.com/engrmnaveed/diskuse16x/releases/download/v#{version}/diskuse16x-x86_64-apple-darwin.tar.gz"
      sha256 "da2e732d92544515edad31a00c98c8e574ca95cd1fda7cf5ecf1dec61c30b9da"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/engrmnaveed/diskuse16x/releases/download/v#{version}/diskuse16x-aarch64-unknown-linux-musl.tar.gz"
      sha256 "cc5e329fe1bed1f87ca9ffe17dfbd9c461fee5e6c58e3ac49128783ba7a30d9a"
    end
    on_intel do
      url "https://github.com/engrmnaveed/diskuse16x/releases/download/v#{version}/diskuse16x-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b867b67e3f1e05b335dc781819f2fc86cb96cd788426bec1ca9759910c2fcd24"
    end
  end

  conflicts_with "du16x-pro", because: "both install the `diskuse16x` and `du16x` commands"

  def install
    bin.install "diskuse16x"
    bin.install_symlink "diskuse16x" => "du16x"
    doc.install Dir["*.md"], "example-report.json"
  end

  test do
    assert_equal "diskuse16x #{version}", shell_output("#{bin}/diskuse16x --version").strip
    assert_equal "diskuse16x #{version}", shell_output("#{bin}/du16x --version").strip
    (testpath/"folder/file").write "DiskUse16x"
    report = JSON.parse(shell_output("#{bin}/diskuse16x scan #{testpath}/folder --json"))
    assert_equal "basic", report["edition"]
  end
end
