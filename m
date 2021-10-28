Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55A5143DD9F
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Oct 2021 11:19:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230166AbhJ1JWH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Oct 2021 05:22:07 -0400
Received: from mail-lf1-f44.google.com ([209.85.167.44]:34793 "EHLO
        mail-lf1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230124AbhJ1JWH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Oct 2021 05:22:07 -0400
Received: by mail-lf1-f44.google.com with SMTP id u11so12224703lfs.1;
        Thu, 28 Oct 2021 02:19:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2mmhTTP4Qy+KhAe38thA6Tq/Dy9B7Ar6r4uzxdubI4Q=;
        b=ciLO7bO0DhIfhf8AUnww8ZyL9uTHC9CXJnGz4v0sIDoPSNCH+PO+jnXfR1Q519z6yb
         PqhNbXveXjd95RJU1MaDalwebhhQR+BFGj8D9SqRJ1alXiDBLpHNZ/aOkOcjIklA0+ev
         w6JGgK/kYNpYbix+pX2RpEUDIUwqqPU4hge5kVTJ9aII2ky+Ptis8saGWKNIwDfmDz4j
         BODhlrmpKLiLhlFR6tBADIkH9YKBsphJMcsVxwMygZONy85E3N0xLgHmuM/ZOR4tni8j
         rBYJcfJMlpGHKHVcP8apRjcJwnIUQThWrPnY7bfCj89HWbEygbTAfpBYwKEbo+BTRnvU
         ml1Q==
X-Gm-Message-State: AOAM5322OXopGTNCfo3SAqkTutjJ/EGkKCcPn8Ugnln9km7XvGVWAZXv
        15k8RdhewTXInQ8Dwf9bC0oJsfZIbpc=
X-Google-Smtp-Source: ABdhPJx6UcY0PEhhRnmhp+U9YlaEzFRijCH63lG0Pn2VHDPYNTTmzxdAczl6JsQKxF3/u+PEnH/vvA==
X-Received: by 2002:a05:6512:33a9:: with SMTP id i9mr3091960lfg.82.1635412779433;
        Thu, 28 Oct 2021 02:19:39 -0700 (PDT)
Received: from fedora (d44bs26yxfwtfmx4yyk-4.rev.dnainternet.fi. [2001:14bb:c6:2fb:6813:24a0:454f:2])
        by smtp.gmail.com with ESMTPSA id u6sm256389lfs.21.2021.10.28.02.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 02:19:38 -0700 (PDT)
Date:   Thu, 28 Oct 2021 12:19:32 +0300
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
Subject: [RESEND PATCH 4/4] MAINTAINERS: bd70528: Drop ROHM BD70528 drivers
Message-ID: <6b8819238dfe43e356c2c5035c5ffe487257bf70.1635412162.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1635412162.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="twiyDOCo1fYStRp7"
Content-Disposition: inline
In-Reply-To: <cover.1635412162.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--twiyDOCo1fYStRp7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The only known BD70528 use-cases are such that the PMIC is controlled
=66rom separate MCU which is not running Linux. I am not aware of
any Linux driver users. Furthermore, it seems there is no demand for
this IC.

Ease the maintenance burden and drop the driver.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 MAINTAINERS | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f26920f0fa65..08d19fed6609 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16173,27 +16173,19 @@ ROHM POWER MANAGEMENT IC DEVICE DRIVERS
 R:	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
 L:	linux-power@fi.rohmeurope.com
 S:	Supported
-F:	Documentation/devicetree/bindings/mfd/rohm,bd70528-pmic.txt
-F:	Documentation/devicetree/bindings/regulator/rohm,bd70528-regulator.txt
 F:	drivers/clk/clk-bd718x7.c
-F:	drivers/gpio/gpio-bd70528.c
 F:	drivers/gpio/gpio-bd71815.c
 F:	drivers/gpio/gpio-bd71828.c
-F:	drivers/mfd/rohm-bd70528.c
 F:	drivers/mfd/rohm-bd71828.c
 F:	drivers/mfd/rohm-bd718x7.c
 F:	drivers/mfd/rohm-bd9576.c
-F:	drivers/power/supply/bd70528-charger.c
-F:	drivers/regulator/bd70528-regulator.c
 F:	drivers/regulator/bd71815-regulator.c
 F:	drivers/regulator/bd71828-regulator.c
 F:	drivers/regulator/bd718x7-regulator.c
 F:	drivers/regulator/bd9576-regulator.c
 F:	drivers/regulator/rohm-regulator.c
 F:	drivers/rtc/rtc-bd70528.c
-F:	drivers/watchdog/bd70528_wdt.c
 F:	drivers/watchdog/bd9576_wdt.c
-F:	include/linux/mfd/rohm-bd70528.h
 F:	include/linux/mfd/rohm-bd71815.h
 F:	include/linux/mfd/rohm-bd71828.h
 F:	include/linux/mfd/rohm-bd718x7.h
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

--twiyDOCo1fYStRp7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmF6ayQACgkQeFA3/03a
ocUZcggAp94TIsWGCkaYj4DD9jsBdfY3JaSk4zSi/pHUvIsUeT2gyMKd/1LKNbo4
mXpip3I5XpAADZTZ1MBb7/0P/AD8xvhyCokMJckY8xaW35khYaD06CZgRE+BPKeT
iI8osA3on9EGd+FGNlrjxsV7Vk/qSjpa+b0m0cTuXQ7Md2DXuuxczEJx/z6BTV47
3AvRPAT8veUvQ8nkER/MjqOfBpUipGjKN70v6ZPxPCgMYEcFYQKpiI/xGdHBa/8Y
mri7f9vQtasylLwmDsoxeDl657vmwoFB+U80fRCUgNrCugqfLoGL1LxI9CelYLdk
4IMG8wQsmFs+9HaCGjrisArJxrCCyA==
=y3nR
-----END PGP SIGNATURE-----

--twiyDOCo1fYStRp7--
