Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69BEE41AFD4
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Sep 2021 15:18:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240839AbhI1NT6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Sep 2021 09:19:58 -0400
Received: from mail-lf1-f54.google.com ([209.85.167.54]:36615 "EHLO
        mail-lf1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240659AbhI1NT6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Sep 2021 09:19:58 -0400
Received: by mail-lf1-f54.google.com with SMTP id b20so92896022lfv.3;
        Tue, 28 Sep 2021 06:18:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=i/lR6NwimiIzuHfvOiHLk3GhSnmADt6zy4H/L/R1gHo=;
        b=N8ugTcAgxxx9YYY7OBA7HKbpofGOAYT0xQsQ4cd2IWt4LBpBwIzDCvoIaTwRVK+Xfz
         K3MJxCC7KVUkTJN6A4qo9IklisLuruJHVP06jxvL+EZyai5hlB27qTEPd4WzlqGF4pcA
         0QzIuu12wwYnfO4D2Nqx3P7zrv330hskpeCaTw8IhxBO45Vw4PoriVXKkF27FdgyFw/J
         Whr/ibwbb17bydH8zo63CS8CuzBhPUEThXpQt6lKrYj2x3qgBFg8TgsN44KXkpylRfkx
         Kxt2VH4I8cSfa3+awl9LxhHmgLyARd1517qpoRzB9yvcvVe6PCGjEBlACTV8DShyyYwF
         OwiA==
X-Gm-Message-State: AOAM5304/D4XiMSonyI9l6Fxq11eJjryMbn+G3s+XtdlgPEXKBsVEP+3
        WzegoCg0J55ayCKroA1kziU=
X-Google-Smtp-Source: ABdhPJw3ztTksAhFbPw0+WdjRo5UpgolYMK9FwsHpRW9NEpgUFDLv8wW1sdKbIuYchR7KWak4R+v9w==
X-Received: by 2002:ac2:4c4e:: with SMTP id o14mr5917896lfk.482.1632835097454;
        Tue, 28 Sep 2021 06:18:17 -0700 (PDT)
Received: from fedora (dc7vkhyyyyyyyyyyyyydy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::6])
        by smtp.gmail.com with ESMTPSA id n9sm1915364lfe.188.2021.09.28.06.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 06:18:16 -0700 (PDT)
Date:   Tue, 28 Sep 2021 16:18:10 +0300
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
Subject: [PATCH 4/4] MAINTAINERS: bd70528: Drop ROHM BD70528 drivers
Message-ID: <63213170d8b2a481879bd67b2fac4d9784dd7d55.1632833622.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1632833622.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="drLU7DZbqH3AMVuR"
Content-Disposition: inline
In-Reply-To: <cover.1632833622.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--drLU7DZbqH3AMVuR
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
index 5b33791bb8e9..22c30775b218 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16166,27 +16166,19 @@ ROHM POWER MANAGEMENT IC DEVICE DRIVERS
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

--drLU7DZbqH3AMVuR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmFTFhIACgkQeFA3/03a
ocW7fAgAlMZaa9eYvTBvF/WFaeGADRyXKe1gEYIrcUZJtIEEmgIQAAIbTLIoSYy+
37QBku/fC81dBN0ruNvU3oUhrEHRXyWm/2aKejSLgNjAv1dvCj0EEHJDvoe6O2uC
H73AhxVqdqd+XxOvf46K+LUVC4WE18bIx4Rxdt2XpYJf3L9LJrvml9FVqqYPF9xQ
SU5y52W2D1UEcbGofU2ebI8ZvNnm/UcyMunFjyZri6b3Zp7FNIG87vypVUByPD7x
NfrjnvlBN8Xqs5P+7REnwtKu3OyaiZg2sh2OlZWi4QJQH9fXw4RxVCcXKLeXcmBP
w7f8ODshEAwswcatUUGeXG2acXQvuw==
=7Sn6
-----END PGP SIGNATURE-----

--drLU7DZbqH3AMVuR--
