Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04A896F916
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2019 07:56:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727379AbfGVF4D (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jul 2019 01:56:03 -0400
Received: from mout.gmx.net ([212.227.17.22]:47885 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725811AbfGVF4C (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 22 Jul 2019 01:56:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1563774937;
        bh=+7xibqiOrfqzdG9I/qPfuNDq74fZDnvGQXxeXOUPkdM=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Az3ZwkzfFi3un3t2CJhzaY0nE23b84+gU6aAbzOmGkF4HUUS1I/1AbF24Bc4Cs6yV
         x3H68oDXs4h8r3H3q086A6/ErlivVw8KfTrBACQKRJGvTbtsdWnXh7nBKFuRehBPRQ
         zfD77YN+clMO/e6JgKVRIYjRFpSI/gEcJcv9HoUQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.98]) by mail.gmx.com (mrgmx102
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0LcVOE-1iFS7q4570-00jnzz; Mon, 22
 Jul 2019 07:55:37 +0200
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
Subject: [PATCH 03/18] ARM: dts: bcm283x: Move BCM2835/6/7 specific to bcm2835-common.dtsi
Date:   Mon, 22 Jul 2019 07:54:34 +0200
Message-Id: <1563774880-8061-4-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563774880-8061-1-git-send-email-wahrenst@gmx.net>
References: <1563774880-8061-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:pFGS43b3bYWxRkUHpdBBKHiYIa0SVUbBG41rLoR+cerMQ39kW6Y
 K/wGbtv6KHncc370WPwvB3XLMjjybkRhIH6T24lye0Fc8WHZ0QuBjkQGg/NdCjUxibhFxfN
 O+2/0zTcxLVpot7gZkzLSpsMXe1ADWpMGEVkJF6fFdzt/pT06e2nT3A+afQXnqfvWKYu888
 vcCLg55WZkSI1g3qFTL2g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Rm/DzJpZPxw=:BJF4b72kTUQTefH3w0NYBN
 CkDKug/zSQ4qwNyAaMsNvw2OZK3n8EFRMP72o0J5qrofQ1Wd8xlvSQ7TYXCOTZXsB93X8sCL7
 KtQKeOJDGQTJk+bWJ5LWjU095EuNviP8BRt05a+NZYE1fuDskA+HMtGw4+AiKjrc/zdv7eh5r
 GtQ/oz5XCjDeYg2U8S2BnqLkiuNo6eTKj2cAT51/+GdvGMV7ez6SjAiYsXiclnS/n9xgQH7pE
 wqtB6eqdOnVjeqO5+7O0zBjo7I/ClRaF9Xd+ZvzPVwDex/jbzZ6icgzulMMnmUGuY+xG6ZFKR
 b/FBk5xPvZK78fv/onWcvTDAe0L1JxFF/NiSacxhf/MWtLq3XIoI/+K/4qHyjeKEA0E8y51iv
 JgTj9SQh7jHFQTvuLMFCV8p66B94I07QSrWklQqrWVHjscSQ9TJkF5X9zI5U+9TklBmlxSfjA
 oEnaxdgSCK3nQqSh1kbtJCOUnAQaJY2MjD0/YlOI03muhPbsqyh1XRhkIGeqmVUZmPv0+mf1b
 dQi5GQw90QJlZXrbDdvpSZnpTcwoUwfBwCyKXQ2/NF+1olcKcNmtjmC/Q7x84f5i/qd0dPdgQ
 SwizGc/+K7E4SizQvrEAAaBmtLjIiPImfHRo9RNASo8eZdQkS4pkhClQ7NynKpB9nnNTyC4Bo
 70cz9hNy8vqeRquisHBY/FDlarUpUb6m3MJ4cnyCKSpRF8YbK/p6TrBbcvjZlwR4d91fBrcyL
 w1CDqoZDrV8UnBR0w4mAExCSKD8K7Lf/RmA/FMFT/ZiLY8Vty9F8Ws2luwc7iv+9Y5Fnx4kwl
 zTKlVAK0Aczs35nptEfdXZe6yQ84TPNbWGyVNukbahO+0YXyjr7J5lvcpH0YfO/dVeYymZspV
 C7l6gx3AV83KZNb6Zl4oMkQY5tvfioPIqZXOrD4+ctHuIDMjDP23SkUO6PZNw2+9HruBGeeJ8
 m/OIadoCB6wHwWAVZlavT3mZAP4en2XqyAyIChYT216u5j6I/XqkIpsE4VOmDru+MR+Cq2CCi
 eqlwWwPgxXFHHtgDWRdO0X8FHNuJuyrkwCoKA6JRCuqDmJbOYj3eJ5JbxLP2HVg1AAkhWD5+i
 pBa1UP814VH/Mg=
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

As preparation we want all common BCM2711 + BCM2835/6/7 functions in
bcm283x.dtsi and all BCM2835/6/7 specific in the new bcm2835-common.dtsi.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 arch/arm/boot/dts/bcm2835-common.dtsi | 177 +++++++++++++++++++++++++++++=
+++++
 arch/arm/boot/dts/bcm2835.dtsi        |   1 +
 arch/arm/boot/dts/bcm2836.dtsi        |   1 +
 arch/arm/boot/dts/bcm2837.dtsi        |   1 +
 arch/arm/boot/dts/bcm283x.dtsi        | 152 +----------------------------
 5 files changed, 181 insertions(+), 151 deletions(-)
 create mode 100644 arch/arm/boot/dts/bcm2835-common.dtsi

diff --git a/arch/arm/boot/dts/bcm2835-common.dtsi b/arch/arm/boot/dts/bcm=
2835-common.dtsi
new file mode 100644
index 0000000..84c2e1b
=2D-- /dev/null
+++ b/arch/arm/boot/dts/bcm2835-common.dtsi
@@ -0,0 +1,177 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/* This include file covers the common peripherals and configuration betw=
een
+ * bcm2835, bcm2836 and bcm2837 implementations.
+ */
+
+/ {
+	interrupt-parent =3D <&intc>;
+
+	soc {
+		timer@7e003000 {
+			compatible =3D "brcm,bcm2835-system-timer";
+			reg =3D <0x7e003000 0x1000>;
+			interrupts =3D <1 0>, <1 1>, <1 2>, <1 3>;
+			/* This could be a reference to BCM2835_CLOCK_TIMER,
+			 * but we don't have the driver using the common clock
+			 * support yet.
+			 */
+			clock-frequency =3D <1000000>;
+		};
+
+		dma: dma@7e007000 {
+			compatible =3D "brcm,bcm2835-dma";
+			reg =3D <0x7e007000 0xf00>;
+			interrupts =3D <1 16>,
+				     <1 17>,
+				     <1 18>,
+				     <1 19>,
+				     <1 20>,
+				     <1 21>,
+				     <1 22>,
+				     <1 23>,
+				     <1 24>,
+				     <1 25>,
+				     <1 26>,
+				     /* dma channel 11-14 share one irq */
+				     <1 27>,
+				     <1 27>,
+				     <1 27>,
+				     <1 27>,
+				     /* unused shared irq for all channels */
+				     <1 28>;
+			interrupt-names =3D "dma0",
+					  "dma1",
+					  "dma2",
+					  "dma3",
+					  "dma4",
+					  "dma5",
+					  "dma6",
+					  "dma7",
+					  "dma8",
+					  "dma9",
+					  "dma10",
+					  "dma11",
+					  "dma12",
+					  "dma13",
+					  "dma14",
+					  "dma-shared-all";
+			#dma-cells =3D <1>;
+			brcm,dma-channel-mask =3D <0x7f35>;
+		};
+
+		intc: interrupt-controller@7e00b200 {
+			compatible =3D "brcm,bcm2835-armctrl-ic";
+			reg =3D <0x7e00b200 0x200>;
+			interrupt-controller;
+			#interrupt-cells =3D <2>;
+		};
+
+		pm: watchdog@7e100000 {
+			compatible =3D "brcm,bcm2835-pm", "brcm,bcm2835-pm-wdt";
+			#power-domain-cells =3D <1>;
+			#reset-cells =3D <1>;
+			reg =3D <0x7e100000 0x114>,
+			      <0x7e00a000 0x24>;
+			clocks =3D <&clocks BCM2835_CLOCK_V3D>,
+				 <&clocks BCM2835_CLOCK_PERI_IMAGE>,
+				 <&clocks BCM2835_CLOCK_H264>,
+				 <&clocks BCM2835_CLOCK_ISP>;
+			clock-names =3D "v3d", "peri_image", "h264", "isp";
+			system-power-controller;
+		};
+
+		thermal: thermal@7e212000 {
+			compatible =3D "brcm,bcm2835-thermal";
+			reg =3D <0x7e212000 0x8>;
+			clocks =3D <&clocks BCM2835_CLOCK_TSENS>;
+			#thermal-sensor-cells =3D <0>;
+			status =3D "disabled";
+		};
+
+		v3d: v3d@7ec00000 {
+			compatible =3D "brcm,bcm2835-v3d";
+			reg =3D <0x7ec00000 0x1000>;
+			interrupts =3D <1 10>;
+		};
+
+		vc4: gpu {
+			compatible =3D "brcm,bcm2835-vc4";
+		};
+	};
+
+	usbphy: phy {
+		compatible =3D "usb-nop-xceiv";
+		#phy-cells =3D <0>;
+	};
+};
+
+&cpu_thermal {
+	thermal-sensors =3D <&thermal>;
+};
+
+&gpio {
+	i2c_slave_gpio18: i2c_slave_gpio18 {
+		brcm,pins =3D <18 19 20 21>;
+		brcm,function =3D <BCM2835_FSEL_ALT3>;
+	};
+
+	jtag_gpio4: jtag_gpio4 {
+		brcm,pins =3D <4 5 6 12 13>;
+		brcm,function =3D <BCM2835_FSEL_ALT5>;
+	};
+
+	pwm0_gpio12: pwm0_gpio12 {
+		brcm,pins =3D <12>;
+		brcm,function =3D <BCM2835_FSEL_ALT0>;
+	};
+	pwm0_gpio18: pwm0_gpio18 {
+		brcm,pins =3D <18>;
+		brcm,function =3D <BCM2835_FSEL_ALT5>;
+	};
+	pwm0_gpio40: pwm0_gpio40 {
+		brcm,pins =3D <40>;
+		brcm,function =3D <BCM2835_FSEL_ALT0>;
+	};
+	pwm1_gpio13: pwm1_gpio13 {
+		brcm,pins =3D <13>;
+		brcm,function =3D <BCM2835_FSEL_ALT0>;
+	};
+	pwm1_gpio19: pwm1_gpio19 {
+		brcm,pins =3D <19>;
+		brcm,function =3D <BCM2835_FSEL_ALT5>;
+	};
+	pwm1_gpio41: pwm1_gpio41 {
+		brcm,pins =3D <41>;
+		brcm,function =3D <BCM2835_FSEL_ALT0>;
+	};
+	pwm1_gpio45: pwm1_gpio45 {
+		brcm,pins =3D <45>;
+		brcm,function =3D <BCM2835_FSEL_ALT0>;
+	};
+};
+
+&hdmi {
+	dmas =3D <&dma 17>;
+	dma-names =3D "audio-rx";
+};
+
+&i2s {
+	dmas =3D <&dma 2>, <&dma 3>;
+	dma-names =3D "tx", "rx";
+};
+
+&sdhost {
+	dmas =3D <&dma 13>;
+	dma-names =3D "rx-tx";
+};
+
+&spi {
+	dmas =3D <&dma 6>, <&dma 7>;
+	dma-names =3D "tx", "rx";
+};
+
+&usb {
+	phys =3D <&usbphy>;
+	phy-names =3D "usb2-phy";
+};
diff --git a/arch/arm/boot/dts/bcm2835.dtsi b/arch/arm/boot/dts/bcm2835.dt=
si
index a5c3824..53bf457 100644
=2D-- a/arch/arm/boot/dts/bcm2835.dtsi
+++ b/arch/arm/boot/dts/bcm2835.dtsi
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #include "bcm283x.dtsi"
+#include "bcm2835-common.dtsi"

 / {
 	compatible =3D "brcm,bcm2835";
diff --git a/arch/arm/boot/dts/bcm2836.dtsi b/arch/arm/boot/dts/bcm2836.dt=
si
index c933e84..82d6c46 100644
=2D-- a/arch/arm/boot/dts/bcm2836.dtsi
+++ b/arch/arm/boot/dts/bcm2836.dtsi
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #include "bcm283x.dtsi"
+#include "bcm2835-common.dtsi"

 / {
 	compatible =3D "brcm,bcm2836";
diff --git a/arch/arm/boot/dts/bcm2837.dtsi b/arch/arm/boot/dts/bcm2837.dt=
si
index beb6c50..9e95fee 100644
=2D-- a/arch/arm/boot/dts/bcm2837.dtsi
+++ b/arch/arm/boot/dts/bcm2837.dtsi
@@ -1,4 +1,5 @@
 #include "bcm283x.dtsi"
+#include "bcm2835-common.dtsi"

 / {
 	compatible =3D "brcm,bcm2837";
diff --git a/arch/arm/boot/dts/bcm283x.dtsi b/arch/arm/boot/dts/bcm283x.dt=
si
index 2d191fc..4329b17 100644
=2D-- a/arch/arm/boot/dts/bcm283x.dtsi
+++ b/arch/arm/boot/dts/bcm283x.dtsi
@@ -18,7 +18,6 @@
 / {
 	compatible =3D "brcm,bcm2835";
 	model =3D "BCM2835";
-	interrupt-parent =3D <&intc>;
 	#address-cells =3D <1>;
 	#size-cells =3D <1>;

@@ -36,8 +35,6 @@
 			polling-delay-passive =3D <0>;
 			polling-delay =3D <1000>;

-			thermal-sensors =3D <&thermal>;
-
 			trips {
 				cpu-crit {
 					temperature	=3D <80000>;
@@ -56,85 +53,12 @@
 		#address-cells =3D <1>;
 		#size-cells =3D <1>;

-		timer@7e003000 {
-			compatible =3D "brcm,bcm2835-system-timer";
-			reg =3D <0x7e003000 0x1000>;
-			interrupts =3D <1 0>, <1 1>, <1 2>, <1 3>;
-			/* This could be a reference to BCM2835_CLOCK_TIMER,
-			 * but we don't have the driver using the common clock
-			 * support yet.
-			 */
-			clock-frequency =3D <1000000>;
-		};
-
 		txp@7e004000 {
 			compatible =3D "brcm,bcm2835-txp";
 			reg =3D <0x7e004000 0x20>;
 			interrupts =3D <1 11>;
 		};

-		dma: dma@7e007000 {
-			compatible =3D "brcm,bcm2835-dma";
-			reg =3D <0x7e007000 0xf00>;
-			interrupts =3D <1 16>,
-				     <1 17>,
-				     <1 18>,
-				     <1 19>,
-				     <1 20>,
-				     <1 21>,
-				     <1 22>,
-				     <1 23>,
-				     <1 24>,
-				     <1 25>,
-				     <1 26>,
-				     /* dma channel 11-14 share one irq */
-				     <1 27>,
-				     <1 27>,
-				     <1 27>,
-				     <1 27>,
-				     /* unused shared irq for all channels */
-				     <1 28>;
-			interrupt-names =3D "dma0",
-					  "dma1",
-					  "dma2",
-					  "dma3",
-					  "dma4",
-					  "dma5",
-					  "dma6",
-					  "dma7",
-					  "dma8",
-					  "dma9",
-					  "dma10",
-					  "dma11",
-					  "dma12",
-					  "dma13",
-					  "dma14",
-					  "dma-shared-all";
-			#dma-cells =3D <1>;
-			brcm,dma-channel-mask =3D <0x7f35>;
-		};
-
-		intc: interrupt-controller@7e00b200 {
-			compatible =3D "brcm,bcm2835-armctrl-ic";
-			reg =3D <0x7e00b200 0x200>;
-			interrupt-controller;
-			#interrupt-cells =3D <2>;
-		};
-
-		pm: watchdog@7e100000 {
-			compatible =3D "brcm,bcm2835-pm", "brcm,bcm2835-pm-wdt";
-			#power-domain-cells =3D <1>;
-			#reset-cells =3D <1>;
-			reg =3D <0x7e100000 0x114>,
-			      <0x7e00a000 0x24>;
-			clocks =3D <&clocks BCM2835_CLOCK_V3D>,
-				 <&clocks BCM2835_CLOCK_PERI_IMAGE>,
-				 <&clocks BCM2835_CLOCK_H264>,
-				 <&clocks BCM2835_CLOCK_ISP>;
-			clock-names =3D "v3d", "peri_image", "h264", "isp";
-			system-power-controller;
-		};
-
 		clocks: cprman@7e101000 {
 			compatible =3D "brcm,bcm2835-cprman";
 			#clock-cells =3D <1>;
@@ -184,8 +108,7 @@
 			interrupt-controller;
 			#interrupt-cells =3D <2>;

-			/* Defines pin muxing groups according to
-			 * BCM2835-ARM-Peripherals.pdf page 102.
+			/* Defines common pin muxing groups
 			 *
 			 * While each pin can have its mux selected
 			 * for various functions individually, some
@@ -263,15 +186,7 @@
 				brcm,pins =3D <44 45>;
 				brcm,function =3D <BCM2835_FSEL_ALT2>;
 			};
-			i2c_slave_gpio18: i2c_slave_gpio18 {
-				brcm,pins =3D <18 19 20 21>;
-				brcm,function =3D <BCM2835_FSEL_ALT3>;
-			};

-			jtag_gpio4: jtag_gpio4 {
-				brcm,pins =3D <4 5 6 12 13>;
-				brcm,function =3D <BCM2835_FSEL_ALT5>;
-			};
 			jtag_gpio22: jtag_gpio22 {
 				brcm,pins =3D <22 23 24 25 26 27>;
 				brcm,function =3D <BCM2835_FSEL_ALT4>;
@@ -286,35 +201,6 @@
 				brcm,function =3D <BCM2835_FSEL_ALT2>;
 			};

-			pwm0_gpio12: pwm0_gpio12 {
-				brcm,pins =3D <12>;
-				brcm,function =3D <BCM2835_FSEL_ALT0>;
-			};
-			pwm0_gpio18: pwm0_gpio18 {
-				brcm,pins =3D <18>;
-				brcm,function =3D <BCM2835_FSEL_ALT5>;
-			};
-			pwm0_gpio40: pwm0_gpio40 {
-				brcm,pins =3D <40>;
-				brcm,function =3D <BCM2835_FSEL_ALT0>;
-			};
-			pwm1_gpio13: pwm1_gpio13 {
-				brcm,pins =3D <13>;
-				brcm,function =3D <BCM2835_FSEL_ALT0>;
-			};
-			pwm1_gpio19: pwm1_gpio19 {
-				brcm,pins =3D <19>;
-				brcm,function =3D <BCM2835_FSEL_ALT5>;
-			};
-			pwm1_gpio41: pwm1_gpio41 {
-				brcm,pins =3D <41>;
-				brcm,function =3D <BCM2835_FSEL_ALT0>;
-			};
-			pwm1_gpio45: pwm1_gpio45 {
-				brcm,pins =3D <45>;
-				brcm,function =3D <BCM2835_FSEL_ALT0>;
-			};
-
 			sdhost_gpio48: sdhost_gpio48 {
 				brcm,pins =3D <48 49 50 51 52 53>;
 				brcm,function =3D <BCM2835_FSEL_ALT0>;
@@ -410,8 +296,6 @@
 			reg =3D <0x7e202000 0x100>;
 			interrupts =3D <2 24>;
 			clocks =3D <&clocks BCM2835_CLOCK_VPU>;
-			dmas =3D <&dma 13>;
-			dma-names =3D "rx-tx";
 			status =3D "disabled";
 		};

@@ -419,10 +303,6 @@
 			compatible =3D "brcm,bcm2835-i2s";
 			reg =3D <0x7e203000 0x24>;
 			clocks =3D <&clocks BCM2835_CLOCK_PCM>;
-
-			dmas =3D <&dma 2>,
-			       <&dma 3>;
-			dma-names =3D "tx", "rx";
 			status =3D "disabled";
 		};

@@ -431,8 +311,6 @@
 			reg =3D <0x7e204000 0x200>;
 			interrupts =3D <2 22>;
 			clocks =3D <&clocks BCM2835_CLOCK_VPU>;
-			dmas =3D <&dma 6>, <&dma 7>;
-			dma-names =3D "tx", "rx";
 			#address-cells =3D <1>;
 			#size-cells =3D <0>;
 			status =3D "disabled";
@@ -490,14 +368,6 @@

 		};

-		thermal: thermal@7e212000 {
-			compatible =3D "brcm,bcm2835-thermal";
-			reg =3D <0x7e212000 0x8>;
-			clocks =3D <&clocks BCM2835_CLOCK_TSENS>;
-			#thermal-sensor-cells =3D <0>;
-			status =3D "disabled";
-		};
-
 		aux: aux@7e215000 {
 			compatible =3D "brcm,bcm2835-aux";
 			#clock-cells =3D <1>;
@@ -620,8 +490,6 @@
 			clocks =3D <&clocks BCM2835_PLLH_PIX>,
 				 <&clocks BCM2835_CLOCK_HSM>;
 			clock-names =3D "pixel", "hdmi";
-			dmas =3D <&dma 17>;
-			dma-names =3D "audio-rx";
 			status =3D "disabled";
 		};

@@ -633,19 +501,6 @@
 			#size-cells =3D <0>;
 			clocks =3D <&clk_usb>;
 			clock-names =3D "otg";
-			phys =3D <&usbphy>;
-			phy-names =3D "usb2-phy";
-		};
-
-		v3d: v3d@7ec00000 {
-			compatible =3D "brcm,bcm2835-v3d";
-			reg =3D <0x7ec00000 0x1000>;
-			interrupts =3D <1 10>;
-			power-domains =3D <&pm BCM2835_POWER_DOMAIN_GRAFX_V3D>;
-		};
-
-		vc4: gpu {
-			compatible =3D "brcm,bcm2835-vc4";
 		};
 	};

@@ -671,9 +526,4 @@
 			clock-frequency =3D <480000000>;
 		};
 	};
-
-	usbphy: phy {
-		compatible =3D "usb-nop-xceiv";
-		#phy-cells =3D <0>;
-	};
 };
=2D-
2.7.4

