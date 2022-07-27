class BinutilsCrossNewlib < Formula
  desc "GNU Binutils for m68k cross-compiling"
  homepage "https://www.gnu.org/software/binutils/"
  url "http://gsdview.appspot.com/nativeclient-mirror/toolchain/newlib/newlib-2.0.0.tar.gz"
  sha256 "2ab2e5b03e086d12c6295f831adad46b3e1410a3a234933a2e8fac66cb2e7a19"

  def install
    system "./newlib/configure", "--disable-debug",
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
