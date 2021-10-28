Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC6A643DD93
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Oct 2021 11:18:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230025AbhJ1JU4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Oct 2021 05:20:56 -0400
Received: from mail-lf1-f50.google.com ([209.85.167.50]:38615 "EHLO
        mail-lf1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229791AbhJ1JUz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Oct 2021 05:20:55 -0400
Received: by mail-lf1-f50.google.com with SMTP id x27so12185692lfu.5;
        Thu, 28 Oct 2021 02:18:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=mjPq0XcN0WLHESSI9z9AYQIHnwtAkQDq1tNfhK+52Uo=;
        b=GDzVUq2J6svMktygy7mdVGLEGls0htECPWBZMmJjVlNEQB7kfXRTcPq0HfGfJf9Q9Q
         uTuV6WN6IZrjtsf4b0wpQ9jfXX0SZK1pnp3FxkCV3GnuYosTLP739I8/hHXSIhxzWPzm
         f4DXtWxvCxvnP7+o2WWuA2dTXUPLRdSrnOa+uuTQPM3jrx0cKyaT62j7kEqN4lmrRANM
         9FNohd8jT5s1mgmN8NxhfWH1KG6uUqrHPBSeWds1Wvh3bWGMIbtOtnUfbztuEE6cJFtM
         p0FuyVDGYOWjGcVL/ARbHrPmfDZZvBBUwDUlukCBjMewcaWUaMXxyEvrLVGMSBZT/KLr
         0Xcw==
X-Gm-Message-State: AOAM531T0KlHsBy1VpMQYz9NsbKJoOz37DcxREZXkuxBETYTQ1afmDkG
        Cy9dByfAH/0DTMH4vI1cSIM=
X-Google-Smtp-Source: ABdhPJzyutiN63N10FgeVkDEzId/Yw/uQH4v8u/oTMsZl71U25VvAfYD/00vxtofi0y4WuPEQzDdIQ==
X-Received: by 2002:a05:6512:3d11:: with SMTP id d17mr3041224lfv.481.1635412707647;
        Thu, 28 Oct 2021 02:18:27 -0700 (PDT)
Received: from fedora (d44bs26yxfwtfmx4yyk-4.rev.dnainternet.fi. [2001:14bb:c6:2fb:6813:24a0:454f:2])
        by smtp.gmail.com with ESMTPSA id bq3sm253760lfb.173.2021.10.28.02.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 02:18:26 -0700 (PDT)
Date:   Thu, 28 Oct 2021 12:18:19 +0300
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
Cc:     lukas.bulwahn@gmail.com, Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-power@fi.rohmeurope.com
Subject: [RESEND PATCH 0/4] Drop ROHM BD70528 support
Message-ID: <cover.1635412162.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jgJ3F0fUJZ1Qj6F7"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--jgJ3F0fUJZ1Qj6F7
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


base-commit: 3906fe9bb7f1a2c8667ae54e967dc8690824f4ea
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

--jgJ3F0fUJZ1Qj6F7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmF6asUACgkQeFA3/03a
ocVy/gf/bkPqEDZsdcNjSeitRlW92B96tpu91eClQ88S3R+MTW9k+45bsZF0ySnl
r6ApfBGwvhnckNaZp5BYBbU+RzVMa4M1BY4b7u5UcWgfn7FfS3HJEHiOUNazKHqx
RqcGOPC+F4qhZNigR5LqlGvlf5dV746F+NQMAWV5iscRB2LcWVXbv4Oj4G+RWhf4
fwaKrM/VyIeTUTxl8U55mu6itRospX4lfblW4jcfaeYvYENTPC7iiNT2g8YxBwNd
H44KQ7eXAEjmlngReXt5pZFjSFFBw65yvwwk77XKPtctdHo4J3c4PvWqGoUTtDjj
ayAjthaJ1Fbv6eugkeo50jVPG0uxFA==
=ELES
-----END PGP SIGNATURE-----

--jgJ3F0fUJZ1Qj6F7--
