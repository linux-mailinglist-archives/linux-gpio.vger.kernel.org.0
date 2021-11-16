Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A42B845326D
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Nov 2021 13:52:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236416AbhKPMyk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Nov 2021 07:54:40 -0500
Received: from mail-lf1-f44.google.com ([209.85.167.44]:44882 "EHLO
        mail-lf1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236419AbhKPMyb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Nov 2021 07:54:31 -0500
Received: by mail-lf1-f44.google.com with SMTP id y26so52864565lfa.11;
        Tue, 16 Nov 2021 04:51:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=yMZdLc0itEQoTqQfqIXuPm4mS531GYsllTBmdC22W8k=;
        b=pVEukXQWQyIw0OWHUUrEzhntoZPCdA6eUUgkCmWdZfTv1/+vourNTfsas2hUpGIxV+
         iOSbI/0EGdUD6qp4a5doi6emvehlonyUDLI6RFIx71pnihQEMqyIT+c8sIFYKE5+4F/Q
         tIv/Euav4a9Ql8UC3GAlXkvAboj7pYtR4erc0Ix75EmoilL/YQQFaG9gJSGAFWKMAI/L
         FcxkyOGxxtxFMxLtfkhpObrBlW0tvnmq5eIKhgPvvXdam2IRKLjY9Q2IT0LVw8vlL0vZ
         UjmzUp4gs0CKsyx75iykVQ5piRbRGL8DEOu+KnRWWW9pwl3AtWFwwDuYUVGP++p6m7dq
         CQNQ==
X-Gm-Message-State: AOAM531MSQuubOc6sC1QrHtCD8HadhpPiwK5sEsKpqfhW+44/ZQN2zQs
        uJF+FjcTzu9bCGLGXDXouMo=
X-Google-Smtp-Source: ABdhPJz8TQGXIdLqv+u6P3yj4v5TA9/jWD7OycisgmKiTDozQN6W8krTXSi7MsAi8fRJNLoDKxpX9w==
X-Received: by 2002:a05:6512:30d:: with SMTP id t13mr6318894lfp.305.1637067092724;
        Tue, 16 Nov 2021 04:51:32 -0800 (PST)
Received: from fedora (dc73szyyyyyyyyyyyyycy-3.rev.dnainternet.fi. [2001:14ba:16ee:fa00::4])
        by smtp.gmail.com with ESMTPSA id r19sm1549453lff.207.2021.11.16.04.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 04:51:32 -0800 (PST)
Date:   Tue, 16 Nov 2021 14:51:25 +0200
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
Subject: [PATCH RESEND 0/4] Drop ROHM BD70528 support
Message-ID: <cover.1637066805.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="T3O/JhDqIhfusFP9"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--T3O/JhDqIhfusFP9
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

--T3O/JhDqIhfusFP9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmGTqT4ACgkQeFA3/03a
ocXSzQgAsYhNZRVUx7ruZ7rX6N2tnReW7PL6XP4rvhb37XjP+WPym/L2ZUVrTtjn
rwjgVD8pYWMFQpHiuLZXfoHdOuntBf/SiRtlXDK1/aRG48xp8fy5XgcJz1qVGhyK
17l4U0B+4YuH/SnTKkbcUbx8DwduaJR2weZoRi0bhIL9jemVz5lhZ4zeaO5P0dJ2
ysMIZtfx7TxCYZ2CuQ5BoPoHHBkMWBIgcu56WOAjU91RPOSrb81++OwZX/dEgaIX
S2x07kOlL00NYLP7ibna0cIb4IFP/EcpvrmeHGNpZqtplR0kfhNAZnMbKbFm88y0
5yojDpdtsRNidbNHbnmvAFTYZK+foA==
=HsDr
-----END PGP SIGNATURE-----

--T3O/JhDqIhfusFP9--
