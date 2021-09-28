Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39D3441AFBB
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Sep 2021 15:16:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240746AbhI1NRi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Sep 2021 09:17:38 -0400
Received: from mail-lf1-f45.google.com ([209.85.167.45]:42753 "EHLO
        mail-lf1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240816AbhI1NRh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Sep 2021 09:17:37 -0400
Received: by mail-lf1-f45.google.com with SMTP id x27so7713705lfa.9;
        Tue, 28 Sep 2021 06:15:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=J70y0RcekLuAThWi+dMOpKgCkAPkQ5ZoKIWdISoAhmM=;
        b=H1LdWtp+87xuT59Q5ZsyClNzGL5zjXKtMrBXvUaQAPHgGeibDg2knbk+pHzR5oZ61q
         PmqcSjV3/1fqf3/Rs7FGE07SN8yDLGHFNXLUPRn34jjBPTKrl9EqzficebUDxP98BdKg
         Nkkfv5ce54VLz+wydOifNM6iFgd5O8QTKv7gOX8C1R6DKYjqi9rertubRwCHnlvVkhAV
         IhU9sm07N5MqTtGIuYWkAV9MjC3KjSy/QxTzBJZOx/8A427CX0edVA3U/0NreUjAhkxn
         aarSSIsZqUp5K5SZ38bsl8ig+hlrrW1kycABf2wMUOrutc6SDuiW5qwyYnEnAdoV9f3g
         X3Ag==
X-Gm-Message-State: AOAM530LYfXuUOwQQTRP6kpsK8W6mdAN9Ss1unfE4XBB5tSGj3yE+RvI
        pw8XTAA5mDKRAU6W4wZ/NX8=
X-Google-Smtp-Source: ABdhPJw0sAVm7KJEpvXwDoIfUK771x4WbMBMxoJ/RcfrNGY5B2To4ZQWDsqiYmVd2pCEADL6ASKenA==
X-Received: by 2002:a05:651c:4ca:: with SMTP id e10mr6000344lji.259.1632834956475;
        Tue, 28 Sep 2021 06:15:56 -0700 (PDT)
Received: from fedora (dc7vkhyyyyyyyyyyyyydy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::6])
        by smtp.gmail.com with ESMTPSA id p8sm1739774lft.242.2021.09.28.06.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 06:15:55 -0700 (PDT)
Date:   Tue, 28 Sep 2021 16:15:48 +0300
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-power@fi.rohmeurope.com,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        lukas.bulwahn@gmail.com
Subject: [PATCH 0/4] Drop ROHM BD70528 support
Message-ID: <cover.1632833622.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="1XNZ1F0Pgb03K+Pi"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--1XNZ1F0Pgb03K+Pi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Drop ROHM BD70528 support

Unfortunately there has not been a big demand for ROHM BD70528
IC. The few users I know control PMIC from separate M4-core,
which is not running Linux. I am not aware of any users of this
Linux driver.

While I did really like this IC and writing the drivers for it,
seems like these drivers are becoming useless burden. So, I see
no point in maintaining them. Let's just drop the drivers if
there is no objections to this series. :(

The regulator, WDG and power-supply drivers were already dropped.

The RTC and clk drivers remain in use by few other ROHM IC drivers.
Nevertheless, they are already converted to not depend the BD70528
defines during previous cycle.

This series cleans the remaining pieces, GPIO, MFD, dt-bindings and
MAINTAINER entries. The GPIO code uses defines from MFD - but the GPIO
part is also depending on MFD KConfig entry - so there should be no
breakages even if the patches were applied to respective subsystem trees
and were not carried via single tree.

---

Matti Vaittinen (9):
  dt-bindings: mfd: regulator: Drop BD70528 support
  rtc: bd70528: Drop BD70528 support
  watchdog: bd70528 drop bd70528 support
  regulator: bd70528: Drop BD70528 support
  clk: bd718xx: Drop BD70528 support
  gpio: bd70528 Drop BD70528 support
  power: supply: Drop BD70528 support
  mfd: bd70528: Drop BD70528 support
  MAINTAINERS: bd70528: Drop ROHM BD70528 drivers

 .../bindings/mfd/rohm,bd70528-pmic.txt        | 102 ---
 .../regulator/rohm,bd70528-regulator.txt      |  68 --
 MAINTAINERS                                   |   8 -
 drivers/clk/Kconfig                           |   6 +-
 drivers/clk/clk-bd718x7.c                     |  11 +-
 drivers/gpio/Kconfig                          |  11 -
 drivers/gpio/Makefile                         |   1 -
 drivers/gpio/gpio-bd70528.c                   | 230 ------
 drivers/mfd/Kconfig                           |  17 -
 drivers/mfd/Makefile                          |   1 -
 drivers/mfd/rohm-bd70528.c                    | 314 --------
 drivers/power/supply/Kconfig                  |   9 -
 drivers/power/supply/Makefile                 |   1 -
 drivers/power/supply/bd70528-charger.c        | 710 ------------------
 drivers/regulator/Kconfig                     |  11 -
 drivers/regulator/Makefile                    |   1 -
 drivers/regulator/bd70528-regulator.c         | 283 -------
 drivers/rtc/Kconfig                           |   4 +-
 drivers/rtc/rtc-bd70528.c                     | 316 +-------
 drivers/watchdog/Kconfig                      |  12 -
 drivers/watchdog/Makefile                     |   1 -
 drivers/watchdog/bd70528_wdt.c                | 291 -------
 include/linux/mfd/rohm-bd70528.h              | 391 ----------
 include/linux/mfd/rohm-generic.h              |   1 -
 24 files changed, 18 insertions(+), 2782 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd70528-pmic=
=2Etxt
 delete mode 100644 Documentation/devicetree/bindings/regulator/rohm,bd7052=
8-regulator.txt
 delete mode 100644 drivers/gpio/gpio-bd70528.c
 delete mode 100644 drivers/mfd/rohm-bd70528.c
 delete mode 100644 drivers/power/supply/bd70528-charger.c
 delete mode 100644 drivers/regulator/bd70528-regulator.c
 delete mode 100644 drivers/watchdog/bd70528_wdt.c
 delete mode 100644 include/linux/mfd/rohm-bd70528.h


base-commit: c4681547bcce777daf576925a966ffa824edd09d
--=20
2.25.4


--=20
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =3D]=20

Matti Vaittinen (4):
  dt-bindings: mfd: regulator: Drop BD70528 support
  gpio: bd70528 Drop BD70528 support
  mfd: bd70528: Drop BD70528 support
  MAINTAINERS: bd70528: Drop ROHM BD70528 drivers

 .../bindings/mfd/rohm,bd70528-pmic.txt        | 102 -----
 .../regulator/rohm,bd70528-regulator.txt      |  68 ---
 MAINTAINERS                                   |   8 -
 drivers/gpio/Kconfig                          |  11 -
 drivers/gpio/Makefile                         |   1 -
 drivers/gpio/gpio-bd70528.c                   | 230 -----------
 drivers/mfd/Kconfig                           |  17 -
 drivers/mfd/Makefile                          |   1 -
 drivers/mfd/rohm-bd70528.c                    | 314 --------------
 include/linux/mfd/rohm-bd70528.h              | 389 ------------------
 include/linux/mfd/rohm-generic.h              |   1 -
 11 files changed, 1142 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd70528-pmic=
=2Etxt
 delete mode 100644 Documentation/devicetree/bindings/regulator/rohm,bd7052=
8-regulator.txt
 delete mode 100644 drivers/gpio/gpio-bd70528.c
 delete mode 100644 drivers/mfd/rohm-bd70528.c
 delete mode 100644 include/linux/mfd/rohm-bd70528.h


base-commit: 5816b3e6577eaa676ceb00a848f0fd65fe2adc29
--=20
2.31.1


--=20
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =3D]=20

--1XNZ1F0Pgb03K+Pi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmFTFW4ACgkQeFA3/03a
ocVaAQgAuleT1MPoHWCfXjiRCNhHg+YdUJvOE2OFKH1xzQbOe8VDlQ1EJHsd6GkR
RIvs9fi5lgLvH0JUAseqcMlASQUWyO7UyiZwSno6O12TX5wRHa36S3wW067PvOq2
yx901Y6o9Kh2ItTxa2c1VuJPrYkhmbXFGBJiWhXGbTX+TUqyLHI0c+/HJj959NmS
s1/khU20m0hCScSn/gao/XLKi77FYxTsBcXKgFveiY01G9GmODw+OFmelQRKgU0/
7z+MeExPL5Z51fg2u7HHB0h9eBtWIFfL8aM9EHCeIsVdB3i2Im6fnrS4U0mSAxVG
GjTYZX3hZ9qs5Uok1r/TxOctck6o9w==
=U8Jj
-----END PGP SIGNATURE-----

--1XNZ1F0Pgb03K+Pi--
