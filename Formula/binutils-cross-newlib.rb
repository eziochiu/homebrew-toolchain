class BinutilsCrossNewlib < Formula
  desc "GNU Binutils for m68k cross-compiling"
  homepage "https://www.gnu.org/software/binutils/"
  url "http://gsdview.appspot.com/nativeclient-mirror/toolchain/newlib/newlib-2.0.0.tar.gz"
  sha256 "49c29e9129325e7c3b221aa829743ddcd796d024440e47c80fc0d6769af72d8a"

  def install
    system "./configure", "--disable-debug",
                          "--enable-lite-exit",
                          "--enable-newlib-nano-malloc",
                          "--enable-multilib",
                          "--disable-newlib-fvwrite-in-streami",
                          "--enable-newlib-nano-formatted-io",
                          "--target=m68k-elf",
                          "--prefix=#{prefix}"

    system "make"
    system "make", "install"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/m68k-elf-strings #{bin}/m68k-elf-strings")
  end
end
