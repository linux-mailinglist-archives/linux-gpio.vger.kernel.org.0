Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DC2E2D8DA0
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Dec 2020 14:56:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407077AbgLMNz6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Dec 2020 08:55:58 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:35019 "EHLO
        esa3.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407074AbgLMNz6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Dec 2020 08:55:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1607867757; x=1639403757;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=h53uB8DldUFUjxykUeLYLGTvXTE8o2cohPuBevq/K5w=;
  b=JigQMm06qzjvy88rkLj6EuXRus2ecL92zbZwCXG/e8l7YFX7RwyhErPN
   8Q93FI7TLMXHIdJqiN6MH6Ec0YFJstr8TbvxZMe2j0o+X5V+3bg1YLHMa
   QXh04ZGsOMcSjD+Sl6nsxVQWbI4Rm0GsNFmn/Kju94vO022PYUsmWoQ/C
   8C008tOfMn9ce2KexZqEJG+Gg9kgbY6aZZKh3P5Xe5Wc19O71675hOyOJ
   OFHMa3QQCPfew5DERuj3ewnaiXO50bWweZOB4Wm50dugLDahMFcHgaHGx
   TAOuilEfYi3qCsCb+iUjIKOnuqwdDNqmC5zc9ddC8ATT1zySYQj1meKgG
   A==;
IronPort-SDR: 1R523o4sfoN1tNTQQ/t1wCx45cv0xtBOhM5e3B6v0tqnmx6yWwGl4AQeuHkL6qKDKb4d27sqND
 doZSZ6TU+5/+g7A1skY75b5SXJkcRHIDHxCI3kOCVgD8d6jkgSG0Y7gwfA9FH13H5X7bRBLxNi
 OITdk0uOZVyCYk2QNQ8xBPt+p5gV4dDoc1bWyM6kroWG3cKkz0OP3zQiSu4ONV42X3NxvV73gx
 Sgtft+uiz2l1NByrreG80zzunkGUuZcOLMtND9ACZWJulyXWlrcaQHabDfGdyiz848164xPDkG
 F2Q=
X-IronPort-AV: E=Sophos;i="5.78,416,1599494400"; 
   d="scan'208";a="159494646"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 13 Dec 2020 21:51:43 +0800
IronPort-SDR: UHRrLtNYkIO4BddvN+K/PzSNb1Uyzgd1PpTzYA1YGEfYFfn8adn7zTBXg0mZTN7dfjxOxG66sY
 OOi6jDq+W4cprdN8jSzVuZ7C0KdfYOHq8af2/i0o06hfypc0LWkh8AbQc+oQo4OTCPVzVO2qyE
 d+iaw4/NXK/NlKH9rnWpyuR2/UwzdCwUd5dByDUtLs9kTwOdHoalQ1kfMZbrK6BPPWcPLObNLU
 2qTlNX87wbgl5Vuw5JQr2/M8/g6/C3Gf9VEIPj2KSSIhIw7Bgc2Fn8hQcrjznOSZXEcF5DU7nQ
 Y4Xr+6AHALdXlTKVZzdeSDQm
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2020 05:35:29 -0800
IronPort-SDR: Fg58QJh9wN2uDJs3s3FecIc88iV6+EDBxC2wa1M0e3b/rSz0gfA3TUuPM/9mvqHnoAB+RDH65l
 xftu4nEVmxYRIgcLYLwUKnMLUrFzaOnutwqoFWknMNxp0QFfZ7k5WsaKdgFxdJ3BJyp6kzap8G
 txo4rkf2N9q8DmtvDM2rew4ijveTfnoGUvOJpOupWoLhnYN9JTq96Olte9dGNBDp07VgqUN94y
 hn+hXjW5px1dwGgSrx6yTKM1PgJauXGVl+v9XVAKAufR+Sj/ULELVLkTcfAiNZ0MNHonPlNaIA
 6l4=
WDCIronportException: Internal
Received: from phd004806.ad.shared (HELO twashi.fujisawa.hgst.com) ([10.84.71.197])
  by uls-op-cesaip01.wdc.com with ESMTP; 13 Dec 2020 05:51:42 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v10 21/23] riscv: Add Kendryte KD233 board device tree
Date:   Sun, 13 Dec 2020 22:50:54 +0900
Message-Id: <20201213135056.24446-22-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201213135056.24446-1-damien.lemoal@wdc.com>
References: <20201213135056.24446-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a device tree for the Canaan Kendryte KD233 development board.
This device tree enables LEDs, some gpios and spi/mmc SD card device.
The WS2812B RGB LED and the 10 position rotary dip switch present on
the board are left undefined.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 arch/riscv/boot/dts/canaan/k210_kd233.dts | 178 ++++++++++++++++++++++
 1 file changed, 178 insertions(+)
 create mode 100644 arch/riscv/boot/dts/canaan/k210_kd233.dts

diff --git a/arch/riscv/boot/dts/canaan/k210_kd233.dts b/arch/riscv/boot/dts/canaan/k210_kd233.dts
new file mode 100644
index 000000000000..44852a27df93
--- /dev/null
+++ b/arch/riscv/boot/dts/canaan/k210_kd233.dts
@@ -0,0 +1,178 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2019-20 Sean Anderson <seanga2@gmail.com>
+ * Copyright (C) 2020 Western Digital Corporation or its affiliates.
+ */
+
+/dts-v1/;
+
+#include "k210.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+
+/ {
+	model = "Kendryte KD233";
+	compatible = "canaan,kendryte-kd233",
+		     "canaan,kendryte-k210";
+
+	chosen {
+		bootargs = "earlycon console=ttySIF0";
+		stdout-path = "serial0:115200n8";
+	};
+
+	gpio-leds {
+		compatible = "gpio-leds";
+
+		led0 {
+			gpios = <&gpio0 8 GPIO_ACTIVE_LOW>;
+		};
+
+		led1 {
+			gpios = <&gpio0 9 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		key0 {
+			label = "KEY0";
+			linux,code = <BTN_0>;
+			gpios = <&gpio0 10 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,format = "i2s";
+		status = "disabled";
+
+		simple-audio-card,cpu {
+			sound-dai = <&i2s0 0>;
+		};
+
+		simple-audio-card,codec {
+			sound-dai = <&mic>;
+		};
+	};
+
+	mic: mic {
+		#sound-dai-cells = <0>;
+		compatible = "memsensing,msm261s4030h0";
+		status = "disabled";
+	};
+};
+
+&fpioa {
+	pinctrl-0 = <&jtag_pinctrl>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	jtag_pinctrl: jtag-pinmux {
+		pinmux = <K210_FPIOA(0, K210_PCF_JTAG_TCLK)>,
+			 <K210_FPIOA(1, K210_PCF_JTAG_TDI)>,
+			 <K210_FPIOA(2, K210_PCF_JTAG_TMS)>,
+			 <K210_FPIOA(3, K210_PCF_JTAG_TDO)>;
+	};
+
+	uarths_pinctrl: uarths-pinmux {
+		pinmux = <K210_FPIOA(4, K210_PCF_UARTHS_RX)>,
+			 <K210_FPIOA(5, K210_PCF_UARTHS_TX)>;
+	};
+
+	spi0_pinctrl: spi0-pinmux {
+		pinmux = <K210_FPIOA(6, K210_PCF_GPIOHS20)>,  /* cs */
+			 <K210_FPIOA(7, K210_PCF_SPI0_SCLK)>, /* wr */
+			 <K210_FPIOA(8, K210_PCF_GPIOHS21)>;  /* dc */
+	};
+
+	dvp_pinctrl: dvp-pinmux {
+		pinmux = <K210_FPIOA(9, K210_PCF_SCCB_SCLK)>,
+			 <K210_FPIOA(10, K210_PCF_SCCB_SDA)>,
+			 <K210_FPIOA(11, K210_PCF_DVP_RST)>,
+			 <K210_FPIOA(12, K210_PCF_DVP_VSYNC)>,
+			 <K210_FPIOA(13, K210_PCF_DVP_PWDN)>,
+			 <K210_FPIOA(14, K210_PCF_DVP_XCLK)>,
+			 <K210_FPIOA(15, K210_PCF_DVP_PCLK)>,
+			 <K210_FPIOA(17, K210_PCF_DVP_HSYNC)>;
+	};
+
+	gpiohs_pinctrl: gpiohs-pinmux {
+		pinmux = <K210_FPIOA(16, K210_PCF_GPIOHS0)>,
+			 <K210_FPIOA(20, K210_PCF_GPIOHS4)>, /* Rot. dip sw line 8 */
+			 <K210_FPIOA(21, K210_PCF_GPIOHS5)>, /* Rot. dip sw line 4 */
+			 <K210_FPIOA(22, K210_PCF_GPIOHS6)>, /* Rot. dip sw line 2 */
+			 <K210_FPIOA(23, K210_PCF_GPIOHS7)>, /* Rot. dip sw line 1 */
+			 <K210_FPIOA(24, K210_PCF_GPIOHS8)>,
+			 <K210_FPIOA(25, K210_PCF_GPIOHS9)>,
+			 <K210_FPIOA(26, K210_PCF_GPIOHS10)>;
+	};
+
+	spi1_pinctrl: spi1-pinmux {
+		pinmux = <K210_FPIOA(29, K210_PCF_SPI1_SCLK)>,
+			 <K210_FPIOA(30, K210_PCF_SPI1_D0)>,
+			 <K210_FPIOA(31, K210_PCF_SPI1_D1)>,
+			 <K210_FPIOA(32, K210_PCF_GPIOHS16)>; /* cs */
+	};
+
+	i2s0_pinctrl: i2s0-pinmux {
+		pinmux = <K210_FPIOA(33, K210_PCF_I2S0_IN_D0)>,
+			 <K210_FPIOA(34, K210_PCF_I2S0_WS)>,
+			 <K210_FPIOA(35, K210_PCF_I2S0_SCLK)>;
+	};
+};
+
+&uarths0 {
+	pinctrl-0 = <&uarths_pinctrl>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&gpio0 {
+	pinctrl-0 = <&gpiohs_pinctrl>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&i2s0 {
+	#sound-dai-cells = <1>;
+	pinctrl-0 = <&i2s0_pinctrl>;
+	pinctrl-names = "default";
+};
+
+&dvp0 {
+	pinctrl-0 = <&dvp_pinctrl>;
+	pinctrl-names = "default";
+};
+
+&spi0 {
+	pinctrl-0 = <&spi0_pinctrl>;
+	pinctrl-names = "default";
+	num-cs = <1>;
+	cs-gpios = <&gpio0 20 GPIO_ACTIVE_HIGH>;
+
+	panel@0 {
+		compatible = "ilitek,ili9341";
+		reg = <0>;
+		dc-gpios = <&gpio0 21 GPIO_ACTIVE_HIGH>;
+		spi-max-frequency = <15000000>;
+		status = "disabled";
+	};
+};
+
+&spi1 {
+	pinctrl-0 = <&spi1_pinctrl>;
+	pinctrl-names = "default";
+	num-cs = <1>;
+	cs-gpios = <&gpio0 16 GPIO_ACTIVE_LOW>;
+	status = "okay";
+
+	slot@0 {
+		compatible = "mmc-spi-slot";
+		reg = <0>;
+		voltage-ranges = <3300 3300>;
+		spi-max-frequency = <25000000>;
+		broken-cd;
+	};
+};
-- 
2.29.2

