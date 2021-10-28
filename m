Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B992C43DD96
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Oct 2021 11:18:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230102AbhJ1JVQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Oct 2021 05:21:16 -0400
Received: from mail-lf1-f49.google.com ([209.85.167.49]:34604 "EHLO
        mail-lf1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229791AbhJ1JVP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Oct 2021 05:21:15 -0400
Received: by mail-lf1-f49.google.com with SMTP id u11so12220738lfs.1;
        Thu, 28 Oct 2021 02:18:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6ydrOl3rQ78mwORkXuTpnA/n1UjLXKc/I7o63rT5IqU=;
        b=qmAjEgiBSsdIe3g33nKGpoCp70QdWCyhDz0W6rs/kSmiUu9NEly8AXxtzO622kGcC0
         JBOEGByLgtIm5DSo+CJZaXzSCE3Xx+pghBKW37xZ98wyrjjV+CEgvuVe6bxHvVZYPf2S
         Jja5aE/kMlB70Mqcb3lHaT+8BYRjULX46hgerExOnQMRvNR34SHYN1ugsvrtH3vcAAe/
         JaAi+bArsxh90RVOnoLi+m/D03DE59ekfMR2zTb98Qz4iKy4sn4BgOYmkagPBcjyX4p5
         NWH5WXDEsM0Fl2Bkz8co6WKiSF9GF1ZaKZbb9bj6YzMFkElQdg3YcYqSUwi5K2uHnmME
         hncQ==
X-Gm-Message-State: AOAM533VifKeMKlHDib8MMYGPU6d2vAVY5vgnicWsQA8C2yrtTBqZi4g
        R44X23ihg2dBuOgz5TxxKYM=
X-Google-Smtp-Source: ABdhPJy+4UKFLPJQfSGmG44FUwuZ5RobfJNtLVG07TFLjWCkBHuJbkogTStZ/Ab+8+jLY3GU6gyMcg==
X-Received: by 2002:a05:6512:3b5:: with SMTP id v21mr3130037lfp.352.1635412727558;
        Thu, 28 Oct 2021 02:18:47 -0700 (PDT)
Received: from fedora (d44bs26yxfwtfmx4yyk-4.rev.dnainternet.fi. [2001:14bb:c6:2fb:6813:24a0:454f:2])
        by smtp.gmail.com with ESMTPSA id g18sm252290lfr.286.2021.10.28.02.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 02:18:46 -0700 (PDT)
Date:   Thu, 28 Oct 2021 12:18:40 +0300
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
Subject: [RESEND PATCH 1/4] dt-bindings: mfd: regulator: Drop BD70528 support
Message-ID: <637f8aa5f1d65d54c90ed165c2476c32dff53c26.1635412162.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1635412162.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gw+Kyfq4H69uWwQG"
Content-Disposition: inline
In-Reply-To: <cover.1635412162.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--gw+Kyfq4H69uWwQG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The only known BD70528 use-cases are such that the PMIC is controlled
=66rom separate MCU which is not running Linux. I am not aware of
any Linux driver users. Furthermore, it seems there is no demand for
this IC. Let's ease the maintenance burden and drop the driver. We can
always add it back if there is sudden need for it.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 .../bindings/mfd/rohm,bd70528-pmic.txt        | 102 ------------------
 .../regulator/rohm,bd70528-regulator.txt      |  68 ------------
 2 files changed, 170 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd70528-pmic=
=2Etxt
 delete mode 100644 Documentation/devicetree/bindings/regulator/rohm,bd7052=
8-regulator.txt

diff --git a/Documentation/devicetree/bindings/mfd/rohm,bd70528-pmic.txt b/=
Documentation/devicetree/bindings/mfd/rohm,bd70528-pmic.txt
deleted file mode 100644
index 386eec06cf08..000000000000
--- a/Documentation/devicetree/bindings/mfd/rohm,bd70528-pmic.txt
+++ /dev/null
@@ -1,102 +0,0 @@
-* ROHM BD70528 Power Management Integrated Circuit bindings
-
-BD70528MWV is an ultra-low quiescent current general purpose, single-chip,
-power management IC for battery-powered portable devices. The IC
-integrates 3 ultra-low current consumption buck converters, 3 LDOs and 2
-LED Drivers. Also included are 4 GPIOs, a real-time clock (RTC), a 32kHz
-clock gate, high-accuracy VREF for use with an external ADC, flexible
-dual-input power path, 10 bit SAR ADC for battery temperature monitor and
-1S battery charger with scalable charge currents.
-
-Required properties:
- - compatible		: Should be "rohm,bd70528"
- - reg			: I2C slave address.
- - interrupts		: The interrupt line the device is connected to.
- - interrupt-controller	: To indicate BD70528 acts as an interrupt control=
ler.
- - #interrupt-cells	: Should be 2. Usage is compliant to the 2 cells
-			  variant of ../interrupt-controller/interrupts.txt
- - gpio-controller	: To indicate BD70528 acts as a GPIO controller.
- - #gpio-cells		: Should be 2. The first cell is the pin number and
-			  the second cell is used to specify flags. See
-			  ../gpio/gpio.txt for more information.
- - #clock-cells		: Should be 0.
- - regulators:		: List of child nodes that specify the regulators.
-			  Please see ../regulator/rohm,bd70528-regulator.txt
-
-Optional properties:
- - clock-output-names	: Should contain name for output clock.
-
-Example:
-/* External oscillator */
-osc: oscillator {
-	compatible =3D "fixed-clock";
-	#clock-cells =3D <1>;
-	clock-frequency  =3D <32768>;
-	clock-output-names =3D "osc";
-};
-
-pmic: pmic@4b {
-	compatible =3D "rohm,bd70528";
-	reg =3D <0x4b>;
-	interrupt-parent =3D <&gpio1>;
-	interrupts =3D <29 IRQ_TYPE_LEVEL_LOW>;
-	clocks =3D <&osc 0>;
-	#clock-cells =3D <0>;
-	clock-output-names =3D "bd70528-32k-out";
-	#gpio-cells =3D <2>;
-	gpio-controller;
-	interrupt-controller;
-	#interrupt-cells =3D <2>;
-
-	regulators {
-		buck1: BUCK1 {
-			regulator-name =3D "buck1";
-			regulator-min-microvolt =3D <1200000>;
-			regulator-max-microvolt =3D <3400000>;
-			regulator-boot-on;
-			regulator-ramp-delay =3D <125>;
-		};
-		buck2: BUCK2 {
-			regulator-name =3D "buck2";
-			regulator-min-microvolt =3D <1200000>;
-			regulator-max-microvolt =3D <3300000>;
-			regulator-boot-on;
-			regulator-ramp-delay =3D <125>;
-		};
-		buck3: BUCK3 {
-			regulator-name =3D "buck3";
-			regulator-min-microvolt =3D <800000>;
-			regulator-max-microvolt =3D <1800000>;
-			regulator-boot-on;
-			regulator-ramp-delay =3D <250>;
-		};
-		ldo1: LDO1 {
-			regulator-name =3D "ldo1";
-			regulator-min-microvolt =3D <1650000>;
-			regulator-max-microvolt =3D <3300000>;
-			regulator-boot-on;
-		};
-		ldo2: LDO2 {
-			regulator-name =3D "ldo2";
-			regulator-min-microvolt =3D <1650000>;
-			regulator-max-microvolt =3D <3300000>;
-			regulator-boot-on;
-		};
-
-		ldo3: LDO3 {
-			regulator-name =3D "ldo3";
-			regulator-min-microvolt =3D <1650000>;
-			regulator-max-microvolt =3D <3300000>;
-		};
-		led_ldo1: LED_LDO1 {
-			regulator-name =3D "led_ldo1";
-			regulator-min-microvolt =3D <200000>;
-			regulator-max-microvolt =3D <300000>;
-		};
-		led_ldo2: LED_LDO2 {
-			regulator-name =3D "led_ldo2";
-			regulator-min-microvolt =3D <200000>;
-			regulator-max-microvolt =3D <300000>;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/regulator/rohm,bd70528-regul=
ator.txt b/Documentation/devicetree/bindings/regulator/rohm,bd70528-regulat=
or.txt
deleted file mode 100644
index 698cfc3bc3dd..000000000000
--- a/Documentation/devicetree/bindings/regulator/rohm,bd70528-regulator.txt
+++ /dev/null
@@ -1,68 +0,0 @@
-ROHM BD70528 Power Management Integrated Circuit regulator bindings
-
-Required properties:
- - regulator-name: should be "buck1", "buck2", "buck3", "ldo1", "ldo2", "l=
do3",
-		   "led_ldo1", "led_ldo2"
-
-List of regulators provided by this controller. BD70528 regulators node
-should be sub node of the BD70528 MFD node. See BD70528 MFD bindings at
-Documentation/devicetree/bindings/mfd/rohm,bd70528-pmic.txt
-
-The valid names for BD70528 regulator nodes are:
-BUCK1, BUCK2, BUCK3, LDO1, LDO2, LDO3, LED_LDO1, LED_LDO2
-
-Optional properties:
-- Any optional property defined in bindings/regulator/regulator.txt
-
-Example:
-regulators {
-	buck1: BUCK1 {
-		regulator-name =3D "buck1";
-		regulator-min-microvolt =3D <1200000>;
-		regulator-max-microvolt =3D <3400000>;
-		regulator-boot-on;
-		regulator-ramp-delay =3D <125>;
-	};
-	buck2: BUCK2 {
-		regulator-name =3D "buck2";
-		regulator-min-microvolt =3D <1200000>;
-		regulator-max-microvolt =3D <3300000>;
-		regulator-boot-on;
-		regulator-ramp-delay =3D <125>;
-	};
-	buck3: BUCK3 {
-		regulator-name =3D "buck3";
-		regulator-min-microvolt =3D <800000>;
-		regulator-max-microvolt =3D <1800000>;
-		regulator-boot-on;
-		regulator-ramp-delay =3D <250>;
-	};
-	ldo1: LDO1 {
-		regulator-name =3D "ldo1";
-		regulator-min-microvolt =3D <1650000>;
-		regulator-max-microvolt =3D <3300000>;
-		regulator-boot-on;
-	};
-	ldo2: LDO2 {
-		regulator-name =3D "ldo2";
-		regulator-min-microvolt =3D <1650000>;
-		regulator-max-microvolt =3D <3300000>;
-		regulator-boot-on;
-	};
-
-	ldo3: LDO3 {
-		regulator-name =3D "ldo3";
-		regulator-min-microvolt =3D <1650000>;
-		regulator-max-microvolt =3D <3300000>;
-	};
-	led_ldo1: LED_LDO1 {
-		regulator-name =3D "led_ldo1";
-		regulator-min-microvolt =3D <200000>;
-		regulator-max-microvolt =3D <300000>;
-	};
-	led_ldo2: LED_LDO2 {
-		regulator-name =3D "led_ldo2";
-		regulator-min-microvolt =3D <200000>;
-		regulator-max-microvolt =3D <300000>;
-	};
-};
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

--gw+Kyfq4H69uWwQG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmF6avAACgkQeFA3/03a
ocWyKAgAzE7+6mxPWXQDFCslhPFa3dh8BvEqw04Toz4nVyskAFxmbGDDp0irUBg5
6gzKvCpBwITPQ4HIFbesj8wg4p18BL7nXrEeA4dFuDztqY/L76gjtfENf2Hia+iT
lCwgyio/8RhIwF1WxYsIc7bZxRsBT3FrNjmQIkxKiDJLC/rQiyc/CrL1t+xbyCwG
cVqMdEfQzTreikReq34qt7dcdhXPG/jTIGrZcppcackLV0OHGExXbUk24nS7K6LJ
GUUXRZLtPpWqjq0cZbhRvmyYPsElSsvW//xW2Isqy1x0146Fxj71uXXjAijb2Rvq
vQqWTTXmWVe1gwPtW+djxSQhh3aH6Q==
=7x4y
-----END PGP SIGNATURE-----

--gw+Kyfq4H69uWwQG--
