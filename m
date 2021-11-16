Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28AEB453273
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Nov 2021 13:53:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236380AbhKPM4M (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Nov 2021 07:56:12 -0500
Received: from mail-lj1-f170.google.com ([209.85.208.170]:35733 "EHLO
        mail-lj1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236448AbhKPM4J (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Nov 2021 07:56:09 -0500
Received: by mail-lj1-f170.google.com with SMTP id 1so43079002ljv.2;
        Tue, 16 Nov 2021 04:53:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ot5QByzapUbt63Y95u+7rcl+mTMUQY+f+slT7q3GVNU=;
        b=Heed1R07O9LvJ0DhMrMaJgyYCXGy8bnnKk1iwiHqxSqqZ0ITkoXyF2kSQ/mOGbcVXV
         vBDeVlYAlM6E3AaM26GSkGUPMA2HCTeNHiBdiZACWxGsJjs/TUelnN9uHmaBxChgUnXn
         KQFTzshFpDYI7TjVszJTaUBQTRcYg9G7M8cPk7mOLlhafBCYrsKfACpQ/KROso5ahiTY
         J7kiKQKgFbjXDJhwmi8fNizQ/VZ2ekNEiJuJBxISTQBAusD9NHn6oh7nl6A/iNXFzT6F
         BsJvFMPyVe69Tl/uY1p22LpVlagXgEvAVgWLAx26/DeFemATJhwQJfLEppaI99rKx9p8
         P78w==
X-Gm-Message-State: AOAM533Y1Jj5F31alsN2QrjkC/kgARPjgvGS2RKfzUZW2u2sF9cGek5g
        lh8zhPs89o9jZDGAVLfGm3E=
X-Google-Smtp-Source: ABdhPJxWjaW1tTmBme3sX2l+tztWLcmH644zevOSLiz5gjaLX3eGM9T5covvewc/3gqpbPF+dCFhHw==
X-Received: by 2002:a2e:150c:: with SMTP id s12mr6796679ljd.470.1637067191572;
        Tue, 16 Nov 2021 04:53:11 -0800 (PST)
Received: from fedora (dc73szyyyyyyyyyyyyycy-3.rev.dnainternet.fi. [2001:14ba:16ee:fa00::4])
        by smtp.gmail.com with ESMTPSA id r132sm1080468lff.206.2021.11.16.04.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 04:53:11 -0800 (PST)
Date:   Tue, 16 Nov 2021 14:53:03 +0200
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
Subject: [PATCH RESEND 1/4] dt-bindings: mfd: regulator: Drop BD70528 support
Message-ID: <64c88990270d9a22508446ef2fe3b6a2622a0b01.1637066805.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1637066805.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Y5ynlw03rpAmGNU1"
Content-Disposition: inline
In-Reply-To: <cover.1637066805.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--Y5ynlw03rpAmGNU1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The only known BD70528 use-cases are such that the PMIC is controlled
=66rom separate MCU which is not running Linux. I am not aware of
any Linux driver users. Furthermore, it seems there is no demand for
this IC. Let's ease the maintenance burden and drop the driver. We can
always add it back if there is sudden need for it.

Acked-by: Rob Herring <robh@kernel.org>
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

--Y5ynlw03rpAmGNU1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmGTqa8ACgkQeFA3/03a
ocUGOgf/WNbN07JAv2GAC3VB2NcNDyLjyqcXlEVx8uS6Ompu0mgezGo59OkJTT0T
8hZuq5PqUBPZtPsRXgg8B1DrPeCGYB+DZI04DjRh+Ouw70DbYLqwPYASTX3InVIs
/pDZO9qi7x1R2+KaxB1LeAyly+ivy4rO2mNR87hOpNyE+zj63pzsW0j4W2LBPqV9
buovGcNTaR6ZBJ3CqLfOdMD+NuG89lLvSDaqP37LP/DDXILnK+gU2cjfyeqxzM6w
bygbl6zUDbie8Wz99fbu6vplriNguLT3n5WZNQu+1+HmyXEhGDwZsF36oLAGqbLm
MY0Rn2yembXJJbk6MVIGf7b/TDkELQ==
=fp2m
-----END PGP SIGNATURE-----

--Y5ynlw03rpAmGNU1--
