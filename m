Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8258F6F922
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2019 07:56:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727395AbfGVF4H (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jul 2019 01:56:07 -0400
Received: from mout.gmx.net ([212.227.17.21]:58793 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727407AbfGVF4G (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 22 Jul 2019 01:56:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1563774938;
        bh=bMN5HaH7xs5OZI3fgydBkJ1gPM3MHOTFQvPIB1gYS7c=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=AwFDE/YySr0GdGHIZmfP53fgwqRgOCKx16WpA6xGERQjIWtRG6aGsfOirYqDxVL0e
         /GcVyBML+tKD+IuozYeUfUHfUUbf6n84gIiDGEZJ6Rbd7OQXtPNggk0cWjqwygCF5q
         Cb3neq5NA5ocuE9smWmu82nzSAUampsAQfUqwZu8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.98]) by mail.gmx.com (mrgmx102
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0MFz0E-1hbjeW2byg-00Eqxb; Mon, 22
 Jul 2019 07:55:38 +0200
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Matthias Brugger <mbrugger@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>
Cc:     bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-mmc@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 05/18] ARM: dts: bcm283x: Define memory at board level
Date:   Mon, 22 Jul 2019 07:54:36 +0200
Message-Id: <1563774880-8061-6-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563774880-8061-1-git-send-email-wahrenst@gmx.net>
References: <1563774880-8061-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:X3xwkgbaTPJx1LgEFk4hJ11u0bJ5hSD3ydEnoGP91/5YDumjkEq
 7xTve7hfbhDN9BqwDcmMKCrrjTWl2bXMtvUMiiJbYQrmeUwPdyPTsmaALS1mpbhSVBdD/s0
 TtdUXg7SX+RnRbOBcNpb69Ykzzd/waAkbKAStqt6cA8UZ0mgzB6ShkRCYwooyjII1XctQLS
 TYqmXtE/GJRNVs1tYRGdw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:p0bBXSMhw48=:pR4PKOamJEV9esR7U1N/Ac
 k9OSI1+vFb3GFbkolnEtJUAJ3bhHAX2W/CR7xEMOh+4V5MIysIByCFpMAcOH9bGl6gmtCrlxG
 HrFgVdDmmTvvzNi+WxHsCDfpE678EcJ3Xs7Wjp1ty9S2tr4FMx4V4+TEafpV06RiriCfTN5xZ
 P+XXG39LhB0usd+GN3CLw7fCt93KEBCP1zdUlAVrC8nerl/WC2fmQSGMWrsvEweKKK7/7AGpK
 ZPuz4LcLj4olHRGjdMDMwO8XKaOhA46w0AoPv7IPxx6IKZ+Se668Ypjm9OSAe+ikInliFUCOI
 8oW81u1v5jGpezwOgAlNtjag9QuLgNrQquEMNkRBVV+nOzBqFoXTJqexe9huxfZxQ2bO7UhHj
 gLcP4reRZsnxHtZ/mgrD7mORoF95h2o1v84xn7v2Kwt/oGr4DnQLRupzwxAf5YhYSvuL2xSKy
 rnanLzasj1AaTNpVJpVcqULFbH9guRIJ0XCmx/7wa7u5JwCUh+b4D703DHxVXTVGCGr9BQYNP
 s+YkpX/W9dIfMdrM6vhJN36P1lmYen2sv7LRw2t59Uf3E6OoozHewAqz6CjjXD+P+m47EGyy3
 4tBjFfVYcquppLiHOUWpnlnSlGLSvCdX03lnNLgq6tcnf5eHm34XYdAtuAj2DdSQfBP+ouqef
 V5Zx1IG7eAr341zwPTx9mcS146L6/4Yv3ztZ4QJ8Ne/FovSvAJkyVwobhQ5WcaAG/IirVZWfa
 uSGonTbIKJ3dfdkAaeWIGpq7+OFGpgCipENmNuTponND5rWcEpLgAIEtnBK18ZjddyFefDLvg
 +Sm7bHGmtNuonXKw8FOhwlqvjHuDyEDpfrTNlOtfzpBiyeP/mSliAVmStQUL0e/MdIGUIjDVr
 sD1Ie6LGJ3pLpUlKSOg/hDFEivhbRfwa3c/JWk3OyiYReHoGRNN1Coieo6LTvxr/JPYqztAiF
 x6+/QFrkIW+WMBjco4RW3akDMuHQLYSjIn4ZYWEnV+fSfZDaTgO2y1jLnt0AqZ3z6xrgABDr6
 2xw7JfZisu5Z/EuFLpjUdBFmgbKhwvsSIvc3CUVbCdx1H35PafIZfKExVU/AFcqrJs0MCv2rl
 mOSsEDlEFmgh0I=
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Now with the varity of several RPi boards, the memory should be defined
at board level. This step gives us the chance to fix the memory size
of the RPi 1 B+, Zero (incl. W) and Compute Module 1.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 arch/arm/boot/dts/bcm2835-rpi-a-plus.dts   | 5 +++++
 arch/arm/boot/dts/bcm2835-rpi-a.dts        | 5 +++++
 arch/arm/boot/dts/bcm2835-rpi-b-plus.dts   | 5 +++++
 arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts   | 5 +++++
 arch/arm/boot/dts/bcm2835-rpi-b.dts        | 5 +++++
 arch/arm/boot/dts/bcm2835-rpi-cm1.dtsi     | 5 +++++
 arch/arm/boot/dts/bcm2835-rpi-zero-w.dts   | 5 +++++
 arch/arm/boot/dts/bcm2835-rpi-zero.dts     | 5 +++++
 arch/arm/boot/dts/bcm2835-rpi.dtsi         | 5 -----
 arch/arm/boot/dts/bcm2836-rpi-2-b.dts      | 1 +
 arch/arm/boot/dts/bcm2837-rpi-3-a-plus.dts | 1 +
 arch/arm/boot/dts/bcm2837-rpi-3-b-plus.dts | 1 +
 arch/arm/boot/dts/bcm2837-rpi-3-b.dts      | 1 +
 arch/arm/boot/dts/bcm2837-rpi-cm3.dtsi     | 1 +
 14 files changed, 45 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/bcm2835-rpi-a-plus.dts b/arch/arm/boot/dts/=
bcm2835-rpi-a-plus.dts
index cb3f08d..5b42e9a 100644
=2D-- a/arch/arm/boot/dts/bcm2835-rpi-a-plus.dts
+++ b/arch/arm/boot/dts/bcm2835-rpi-a-plus.dts
@@ -8,6 +8,11 @@
 	compatible =3D "raspberrypi,model-a-plus", "brcm,bcm2835";
 	model =3D "Raspberry Pi Model A+";

+	memory@0 {
+		device_type =3D "memory";
+		reg =3D <0 0x10000000>;
+	};
+
 	leds {
 		act {
 			gpios =3D <&gpio 47 GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm/boot/dts/bcm2835-rpi-a.dts b/arch/arm/boot/dts/bcm28=
35-rpi-a.dts
index 2d167d9..b716214 100644
=2D-- a/arch/arm/boot/dts/bcm2835-rpi-a.dts
+++ b/arch/arm/boot/dts/bcm2835-rpi-a.dts
@@ -8,6 +8,11 @@
 	compatible =3D "raspberrypi,model-a", "brcm,bcm2835";
 	model =3D "Raspberry Pi Model A";

+	memory@0 {
+		device_type =3D "memory";
+		reg =3D <0 0x10000000>;
+	};
+
 	leds {
 		act {
 			gpios =3D <&gpio 16 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts b/arch/arm/boot/dts/=
bcm2835-rpi-b-plus.dts
index 83a3a60..3318082 100644
=2D-- a/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts
+++ b/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts
@@ -9,6 +9,11 @@
 	compatible =3D "raspberrypi,model-b-plus", "brcm,bcm2835";
 	model =3D "Raspberry Pi Model B+";

+	memory@0 {
+		device_type =3D "memory";
+		reg =3D <0 0x20000000>;
+	};
+
 	leds {
 		act {
 			gpios =3D <&gpio 47 GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts b/arch/arm/boot/dts/=
bcm2835-rpi-b-rev2.dts
index b6b4fea..97d7eb5 100644
=2D-- a/arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts
+++ b/arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts
@@ -9,6 +9,11 @@
 	compatible =3D "raspberrypi,model-b-rev2", "brcm,bcm2835";
 	model =3D "Raspberry Pi Model B rev2";

+	memory@0 {
+		device_type =3D "memory";
+		reg =3D <0 0x10000000>;
+	};
+
 	leds {
 		act {
 			gpios =3D <&gpio 16 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm/boot/dts/bcm2835-rpi-b.dts b/arch/arm/boot/dts/bcm28=
35-rpi-b.dts
index b5782fa..37e02a1 100644
=2D-- a/arch/arm/boot/dts/bcm2835-rpi-b.dts
+++ b/arch/arm/boot/dts/bcm2835-rpi-b.dts
@@ -9,6 +9,11 @@
 	compatible =3D "raspberrypi,model-b", "brcm,bcm2835";
 	model =3D "Raspberry Pi Model B";

+	memory@0 {
+		device_type =3D "memory";
+		reg =3D <0 0x10000000>;
+	};
+
 	leds {
 		act {
 			gpios =3D <&gpio 16 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm/boot/dts/bcm2835-rpi-cm1.dtsi b/arch/arm/boot/dts/bc=
m2835-rpi-cm1.dtsi
index ef22c2d..58059c2 100644
=2D-- a/arch/arm/boot/dts/bcm2835-rpi-cm1.dtsi
+++ b/arch/arm/boot/dts/bcm2835-rpi-cm1.dtsi
@@ -10,6 +10,11 @@
 		};
 	};

+	memory@0 {
+		device_type =3D "memory";
+		reg =3D <0 0x20000000>;
+	};
+
 	reg_3v3: fixed-regulator {
 		compatible =3D "regulator-fixed";
 		regulator-name =3D "3V3";
diff --git a/arch/arm/boot/dts/bcm2835-rpi-zero-w.dts b/arch/arm/boot/dts/=
bcm2835-rpi-zero-w.dts
index 5ecc403..f38f388 100644
=2D-- a/arch/arm/boot/dts/bcm2835-rpi-zero-w.dts
+++ b/arch/arm/boot/dts/bcm2835-rpi-zero-w.dts
@@ -12,6 +12,11 @@
 	compatible =3D "raspberrypi,model-zero-w", "brcm,bcm2835";
 	model =3D "Raspberry Pi Zero W";

+	memory@0 {
+		device_type =3D "memory";
+		reg =3D <0 0x20000000>;
+	};
+
 	chosen {
 		/* 8250 auxiliary UART instead of pl011 */
 		stdout-path =3D "serial1:115200n8";
diff --git a/arch/arm/boot/dts/bcm2835-rpi-zero.dts b/arch/arm/boot/dts/bc=
m2835-rpi-zero.dts
index 84c7035..5fd0686 100644
=2D-- a/arch/arm/boot/dts/bcm2835-rpi-zero.dts
+++ b/arch/arm/boot/dts/bcm2835-rpi-zero.dts
@@ -12,6 +12,11 @@
 	compatible =3D "raspberrypi,model-zero", "brcm,bcm2835";
 	model =3D "Raspberry Pi Zero";

+	memory@0 {
+		device_type =3D "memory";
+		reg =3D <0 0x20000000>;
+	};
+
 	leds {
 		act {
 			gpios =3D <&gpio 47 GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm/boot/dts/bcm2835-rpi.dtsi b/arch/arm/boot/dts/bcm283=
5-rpi.dtsi
index 40bac52e..f5125b7 100644
=2D-- a/arch/arm/boot/dts/bcm2835-rpi.dtsi
+++ b/arch/arm/boot/dts/bcm2835-rpi.dtsi
@@ -1,11 +1,6 @@
 #include <dt-bindings/power/raspberrypi-power.h>

 / {
-	memory@0 {
-		device_type =3D "memory";
-		reg =3D <0 0x10000000>;
-	};
-
 	leds {
 		compatible =3D "gpio-leds";

diff --git a/arch/arm/boot/dts/bcm2836-rpi-2-b.dts b/arch/arm/boot/dts/bcm=
2836-rpi-2-b.dts
index f97ec95..6a89999 100644
=2D-- a/arch/arm/boot/dts/bcm2836-rpi-2-b.dts
+++ b/arch/arm/boot/dts/bcm2836-rpi-2-b.dts
@@ -10,6 +10,7 @@
 	model =3D "Raspberry Pi 2 Model B";

 	memory@0 {
+		device_type =3D "memory";
 		reg =3D <0 0x40000000>;
 	};

diff --git a/arch/arm/boot/dts/bcm2837-rpi-3-a-plus.dts b/arch/arm/boot/dt=
s/bcm2837-rpi-3-a-plus.dts
index 7f4437a..0e29aaa 100644
=2D-- a/arch/arm/boot/dts/bcm2837-rpi-3-a-plus.dts
+++ b/arch/arm/boot/dts/bcm2837-rpi-3-a-plus.dts
@@ -14,6 +14,7 @@
 	};

 	memory@0 {
+		device_type =3D "memory";
 		reg =3D <0 0x20000000>;
 	};

diff --git a/arch/arm/boot/dts/bcm2837-rpi-3-b-plus.dts b/arch/arm/boot/dt=
s/bcm2837-rpi-3-b-plus.dts
index c6fa34c..a1487ae 100644
=2D-- a/arch/arm/boot/dts/bcm2837-rpi-3-b-plus.dts
+++ b/arch/arm/boot/dts/bcm2837-rpi-3-b-plus.dts
@@ -15,6 +15,7 @@
 	};

 	memory@0 {
+		device_type =3D "memory";
 		reg =3D <0 0x40000000>;
 	};

diff --git a/arch/arm/boot/dts/bcm2837-rpi-3-b.dts b/arch/arm/boot/dts/bcm=
2837-rpi-3-b.dts
index ce71f57..a36bfdb 100644
=2D-- a/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
+++ b/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
@@ -15,6 +15,7 @@
 	};

 	memory@0 {
+		device_type =3D "memory";
 		reg =3D <0 0x40000000>;
 	};

diff --git a/arch/arm/boot/dts/bcm2837-rpi-cm3.dtsi b/arch/arm/boot/dts/bc=
m2837-rpi-cm3.dtsi
index 81399b2..7c3cb7e 100644
=2D-- a/arch/arm/boot/dts/bcm2837-rpi-cm3.dtsi
+++ b/arch/arm/boot/dts/bcm2837-rpi-cm3.dtsi
@@ -5,6 +5,7 @@

 / {
 	memory@0 {
+		device_type =3D "memory";
 		reg =3D <0 0x40000000>;
 	};

=2D-
2.7.4

