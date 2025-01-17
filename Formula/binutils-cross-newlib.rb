class BinutilsCrossNewlib < Formula
  desc "GNU Binutils for m68k cross-compiling"
  homepage "https://www.gnu.org/software/binutils/"
  url "http://gsdview.appspot.com/nativeclient-mirror/toolchain/newlib/newlib-2.0.0.tar.gz"
  sha256 "49c29e9129325e7c3b221aa829743ddcd796d024440e47c80fc0d6769af72d8a"
  
  depends_on "binutils-cross-m68k"

  def install
    system "./configure", "--enable-lite-exit",
                          "--target=m68k-elf",
                          "--with-as=#{Formula["binutils-cross-m68k"].opt_bin}/m68k-elf-as",
                          "--with-ld=#{Formula["binutils-cross-m68k"].opt_bin}/m68k-elf-ld",
                          "--with-ranlib=#{Formula["binutils-cross-m68k"].opt_bin}/m68k-elf-ranlib",
                          "--with-readelf=#{Formula["binutils-cross-m68k"].opt_bin}/m68k-elf-readelf",
                          "--disable-newlib-supplied-syscalls",
                          "--disable-newlib-io-float",
                          "--disable-newlib-multithread",
                          "--prefix=#{prefix}"

    system "make"
    system "make", "install"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/m68k-elf-strings #{bin}/m68k-elf-strings")
  end
end
