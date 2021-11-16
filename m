Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5367845327F
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Nov 2021 13:55:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236473AbhKPM6m (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Nov 2021 07:58:42 -0500
Received: from mail-lf1-f45.google.com ([209.85.167.45]:37470 "EHLO
        mail-lf1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236536AbhKPM6L (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Nov 2021 07:58:11 -0500
Received: by mail-lf1-f45.google.com with SMTP id c32so52985456lfv.4;
        Tue, 16 Nov 2021 04:55:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZNPDHxYI4sB4L1Wdku41vgCHS19KWodVnP9uBEUZsuk=;
        b=3gwCoEe9N4zUjNIaYpq3DA81pIPWyg8vOy//vB46FBybgvxILDCZi5ULQxp5+ahHAg
         CgRb5MnZxuUcX76vIpuROSbg3WQpPN1AKQmU5V2oGLlTjpyQR5CHThiilsNrgQr+zOxw
         eiXH50B6nzdY4/8PJl9jyduVvUukY2OBer/omMnSslW9jrxvybCaBne1vP+hBdsPrvnL
         3Yu82hL0yssTduImh7QEKo5L63rYhBULhlQeG+VOJ3gTkBWPVskbcunnchSYaSn0UC/b
         jdDVGnb9x3B17R7/IInrX0uVhw4l7fS7jS6qJmEJ3j80bx2DzHty4l3Be21MpmFfKDaa
         ZW1g==
X-Gm-Message-State: AOAM530Av8HSjjskqslaMxLmYktXK1zKqEm++8aMDjtZslAR1CbtzvGp
        CenekbO6E/4979GwUtLNUsw=
X-Google-Smtp-Source: ABdhPJxVVozOpBEEgWs4P69bTOZGvztsoeGGpLFNgpMmLYNAAPfNWlwbql3XXH/LDQJ16YT5e0G7aw==
X-Received: by 2002:ac2:4e09:: with SMTP id e9mr6154204lfr.657.1637067312567;
        Tue, 16 Nov 2021 04:55:12 -0800 (PST)
Received: from fedora (dc73szyyyyyyyyyyyyycy-3.rev.dnainternet.fi. [2001:14ba:16ee:fa00::4])
        by smtp.gmail.com with ESMTPSA id u10sm1754099lfb.209.2021.11.16.04.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 04:55:12 -0800 (PST)
Date:   Tue, 16 Nov 2021 14:55:05 +0200
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
Subject: [PATCH RESEND 4/4] MAINTAINERS: bd70528: Drop ROHM BD70528 drivers
Message-ID: <90b0565c0eb9429b0962f08d45292a5a9ebe5cea.1637066805.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1637066805.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="M4/f+kVKs7D4QH40"
Content-Disposition: inline
In-Reply-To: <cover.1637066805.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--M4/f+kVKs7D4QH40
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
index 7a2345ce8521..c3ebc417ba41 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16445,27 +16445,19 @@ ROHM POWER MANAGEMENT IC DEVICE DRIVERS
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

--M4/f+kVKs7D4QH40
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmGTqikACgkQeFA3/03a
ocU2kQf/UWyOtgaRL16+/eyQdHD6yjtNWvzsZgWYniosLzDBGZeaZZ8ABrk6tfYu
+PdSUR4gMv2Q3oHJQqXsSIMC5Jjky220fXJaV/13Pq2Hch/1hpC2yztZw69I7njY
gWFl8viLHVFwdro3ND+y/4pl7hR5cJq1HMyfnEqcbNIR+t1UU1kQkrBKijSskJSE
tFQKRoBiqBAzpDqFBpoo+MqzP1B2eWvtGx0ecyQsQCVspEee/WJIXrnnHVOxTwns
2ILgipTmhb/SOXCJ/8b08XsrrxWUvHBQbPhueFR+7pyahAXC1tRYFb4+NLAx44K5
nzCYihP7dHsA3mZ1mVQmZ5UnE90kBA==
=2Qy8
-----END PGP SIGNATURE-----

--M4/f+kVKs7D4QH40--
