class BinutilsCrossM68k < Formula
  desc "GNU Binutils for m68k cross-compiling"
  homepage "https://www.gnu.org/software/binutils/"
  url "http://www.mirrorservice.org/sites/ftp.gnu.org/gnu/binutils/binutils-2.23.1.tar.bz2"
  sha256 "2ab2e5b03e086d12c6295f831adad46b3e1410a3a234933a2e8fac66cb2e7a19"

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--target=m68k-elf",
                          "--prefix=#{prefix}"

    system "make"
    system "make", "install"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/m68k-elf-strings #{bin}/m68k-elf-strings")
  end
end
