require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php56Amqp < AbstractPhp56Extension
  init
  homepage "http://pecl.php.net/package/amqp"
  url "http://pecl.php.net/get/amqp-1.6.0beta3.tgz"
  sha256 "4209dbd96355a0610b42a636621b0b2b34169ef64f8067197a1a5a78a5784ac7"
  version "1.6.0beta3"
  head "https://github.com/pdezwart/php-amqp.git"

  depends_on "rabbitmq-c"

  def install
    Dir.chdir "amqp-#{version}" unless build.head?

    ENV.universal_binary if build.universal?

    safe_phpize
    system "./configure", "--prefix=#{prefix}",
                          phpconfig
    system "make"
    prefix.install "modules/amqp.so"
    write_config_file if build.with? "config-file"
  end
end
