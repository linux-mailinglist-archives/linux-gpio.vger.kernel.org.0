Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEC2BACBA9
	for <lists+linux-gpio@lfdr.de>; Sun,  8 Sep 2019 10:51:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727397AbfIHIvh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 8 Sep 2019 04:51:37 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:37380 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727359AbfIHIvh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 8 Sep 2019 04:51:37 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 2057981F98; Sun,  8 Sep 2019 10:51:20 +0200 (CEST)
Date:   Sun, 8 Sep 2019 10:51:33 +0200
From:   Pavel Machek <pavel@denx.de>
To:     johan@kernel.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org, sfr@canb.auug.org.au
Subject: next-20190904: build failure in cp210x usb serial, gpio related?
Message-ID: <20190908085133.GA7233@amd>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="pWyiEgJYm5f9v55/"
Content-Disposition: inline
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--pWyiEgJYm5f9v55/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

I'm getting this compiling the -next:

  CC      drivers/net/wireless/intel/iwlwifi/mvm/mac80211.o
  In file included from drivers/usb/serial/cp210x.c:23:
  ./include/linux/gpio/driver.h:722:19: error: static declaration of
  =E2=80=98gpiochip_lock_as_irq=E2=80=99 follows non-static declaration
    722 | static inline int gpiochip_lock_as_irq(struct gpio_chip
  *chip,
        |                   ^~~~~~~~~~~~~~~~~~~~
	./include/linux/gpio/driver.h:706:5: note: previous
  declaration of =E2=80=98gpiochip_lock_as_irq=E2=80=99 was here
    706 | int gpiochip_lock_as_irq(struct gpio_chip *chip, unsigned
  int offset);
        |     ^~~~~~~~~~~~~~~~~~~~
	./include/linux/gpio/driver.h:729:20: error: static
  declaration of =E2=80=98gpiochip_unlock_as_irq=E2=80=99 follows non-static
  declaration
    729 | static inline void gpiochip_unlock_as_irq(struct gpio_chip
  *chip,
        |                    ^~~~~~~~~~~~~~~~~~~~~~
	./include/linux/gpio/driver.h:707:6: note: previous
  declaration of =E2=80=98gpiochip_unlock_as_irq=E2=80=99 was here
    707 | void gpiochip_unlock_as_irq(struct gpio_chip *chip, unsigned
  int offset);
        |      ^~~~~~~~~~~~~~~~~~~~~~
	make[3]: *** [scripts/Makefile.build:265:
  drivers/usb/serial/cp210x.o] Error 1
  make[2]: *** [scripts/Makefile.build:509: drivers/usb/serial] Error
  2
  make[2]: *** Waiting for unfinished jobs....
    CC      drivers/gpu/drm/ttm/ttm_page_alloc.o
      AR      drivers/usb/storage/built-in.a


Sounds like some fixes are needed in gpio headers?

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--pWyiEgJYm5f9v55/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl10wRUACgkQMOfwapXb+vLlawCgqNaKqkY7OUYCIvmBJpOo5ED/
fnYAoMN62O2sGHsH/wpY5Yak8O6eapEL
=Kujg
-----END PGP SIGNATURE-----

--pWyiEgJYm5f9v55/--
