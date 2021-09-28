Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E8EC41AFC6
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Sep 2021 15:16:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240884AbhI1NST (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Sep 2021 09:18:19 -0400
Received: from mail-lf1-f46.google.com ([209.85.167.46]:45904 "EHLO
        mail-lf1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240887AbhI1NSS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Sep 2021 09:18:18 -0400
Received: by mail-lf1-f46.google.com with SMTP id u18so90992310lfd.12;
        Tue, 28 Sep 2021 06:16:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ue7KN/ejnJ6Twjq8u+MC86qEGjaDt9I6RkU5ABc6vKg=;
        b=lEe64RMVaq/BXotJcXSsypRsvZ7Q9mt2cQ/s7dhSyvb4NA2bO/6yp/yoe06HRivM0V
         EUFTpEBr6plEXY2dDLtfRjagv+5fTVGXitQHqZZ6kJZTs5t21xmob47Xw6TkyA2s3iFW
         B7y34rQuknuPW9wX4EveHeaHN2+CB82XwSv3CZO7PWFrkWQ/aEjBBY4+LLO/h6IdRIc0
         ctaSbDuytfwZ8U8sSAiz4bbACmOtJxqNcAokwZ21r6+HFFNw7H8NjgYwjdHy+nUdF4oV
         Xp85US2k+id2D7TkjkGfTrVLQ0hB4evhH5yXFjoCTz04ww3hN0FTZgj+hCQnfE78TGXE
         ycwQ==
X-Gm-Message-State: AOAM5319NFLysMetmz6UnvonvGjdjoj0PKOL+P/hdja7mawdosTfrcnH
        7JfQVluuywQmPuf7LUqUWfo6N7TUwONPpg==
X-Google-Smtp-Source: ABdhPJxvv/PKIEMiVsj5dNAjNi/hWRKA5eHUE6x9tnk/KqKLbwr9VO7h3Km+MnCguEnWLr/WsuDMiQ==
X-Received: by 2002:a05:651c:228:: with SMTP id z8mr5602116ljn.507.1632834989360;
        Tue, 28 Sep 2021 06:16:29 -0700 (PDT)
Received: from fedora (dc7vkhyyyyyyyyyyyyydy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::6])
        by smtp.gmail.com with ESMTPSA id 1sm1922133lfq.49.2021.09.28.06.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 06:16:28 -0700 (PDT)
Date:   Tue, 28 Sep 2021 16:16:21 +0300
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
        Matti Vaittinen <mazziesaccount@gmail.com>
Subject: [PATCH 1/4] dt-bindings: mfd: regulator: Drop BD70528 support
Message-ID: <451dce9a738d1437f31fd32753b24a11461bb355.1632833622.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1632833622.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Oza5UbXA+kaWh/Ac"
Content-Disposition: inline
In-Reply-To: <cover.1632833622.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--Oza5UbXA+kaWh/Ac
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

--Oza5UbXA+kaWh/Ac
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmFTFaUACgkQeFA3/03a
ocUNeggA1XfIPhOVwyXugNrKEnoSEpUR9n+x/uNQoF1CZh6oXBfKQ5r3BdjQKtlF
KidyVRTVpomS75XG9wVx4ahoLIe2aNmn/H8waJSSTs83py5dilrdB4ErbTx4Ogwa
Y1j/SpZbzs5VTetYIoXoW5v1f5BgIjqholpfJlqUfepnqN27RKcyIj0t9T0coOzw
RrCGwwxIiZ/0Llh1oQXIJdazLZVDtAEr/ddjeE3cr9IKQr/jQ8CIcfYiGCqk/kKk
3lfpalfs0w39qY7BbUZYT2Stkj3zkbaxkm6KWIktdtnczU7sOzRL6PIs6p0fHWuX
ZtdHihAiB5bGnJOLXq/yAqk32FwlSA==
=r633
-----END PGP SIGNATURE-----

--Oza5UbXA+kaWh/Ac--
