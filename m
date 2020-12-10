Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 629662D51E8
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Dec 2020 04:47:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730459AbgLJDqX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 22:46:23 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:39153 "EHLO
        esa2.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731151AbgLJDok (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2020 22:44:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1607572678; x=1639108678;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0xTfXsu3DDtBbgGH41+1SkWGBKaUBnpGcTeNcSlsTNc=;
  b=RGq7mDdE4oGTwhb+0ZADUrqdbLb++k32kkBQXyzwvgPRKtmLfvy37mzj
   OkRAeBMIZWILQ2En3P92aSFeHFJCzBbyvbKi/WXXpXfm5hDJClXe/zqAP
   J1Qt5TZ7/JdQum3CFuLLXo1Ko6Ns8mGhRN3ZwVWjuArwY/EvLvOdFnEaK
   HNpAMp0rbMVMcEeAk+MfJmjKVH590wq3qOeXyq3W31z9YUsTEFipDGk1/
   H2ReiOubeN9R9LDGp6KhL7mXcGVs4xbwRqnqJyw0l+YdcNwCKRftT4A6I
   ukbsVH8HunoeVs6sZMSBgIcW6BX6dEt7/BFNFNzwrjTZIqnAyZwx4Hstt
   w==;
IronPort-SDR: hHk5wBCJ5ilxlDn6xyf4+yVG5zPnpcShlxaNXF2pZh/BgGcPdQ4ydLpQkKUG1ToQFqxT2a2N/v
 FzPtgQRA8k+OtPoGqWTimzvldunF3+NAI3dVcdmZAwgU3CzftIDFDlsqGThfKAf+Mwe+ET6M82
 +B2UBVXE1PU6rzP/BNOBgpNRLQukF9n0+PvuEAvFzWCCBUjEYuyvuBhqu4ebieu/kHPvHl95Hi
 crLNCfCXNJMC8HXmwr0X/b4srEUOhkxBvE3e9MLgDIYBWFMAFhUwMTRm23Gc6pM7yRho1QsMEY
 9G0=
X-IronPort-AV: E=Sophos;i="5.78,407,1599494400"; 
   d="scan'208";a="258551249"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 10 Dec 2020 11:52:09 +0800
IronPort-SDR: wpSoHytS7BS1E784lv2u94qlM8ZBeA2z0g3lENn4RB/xzbUpfUM1AXfGB3FBopvRXHiMIInjqd
 B9QJ14pDvXTOwFHcQYCIviYdUvzZh4aOk=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2020 19:24:44 -0800
IronPort-SDR: kpTMgbHXWNz+mZUzd2zEV9zuNpPKAvEUvRVVeU3wBr2UnyL8jJ3OHSrUICqTGHXtFxpzygedXO
 j08zXj0M/ggQ==
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com) ([10.84.71.173])
  by uls-op-cesaip01.wdc.com with ESMTP; 09 Dec 2020 19:40:46 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v7 17/22] riscv: Add SiPeed MAIX DOCK board device tree
Date:   Thu, 10 Dec 2020 12:39:58 +0900
Message-Id: <20201210034003.222297-18-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201210034003.222297-1-damien.lemoal@wdc.com>
References: <20201210034003.222297-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a device tree for the SiPeed MAIX DOCK m1 and m1w boards. This
device tree enables LEDs, gpio, i2c and spi/mmc SD card devices.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 arch/riscv/boot/dts/canaan/k210_maix_dock.dts | 229 ++++++++++++++++++
 1 file changed, 229 insertions(+)
 create mode 100644 arch/riscv/boot/dts/canaan/k210_maix_dock.dts

diff --git a/arch/riscv/boot/dts/canaan/k210_maix_dock.dts b/arch/riscv/boot/dts/canaan/k210_maix_dock.dts
new file mode 100644
index 000000000000..abeaa9bad761
--- /dev/null
+++ b/arch/riscv/boot/dts/canaan/k210_maix_dock.dts
@@ -0,0 +1,229 @@
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
+	model = "SiPeed MAIX Dock";
+	compatible = "sipeed,maix-dock-m1wm", "sipeed,maix-dock-m1",
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
+		/*
+		 * Note: the board specification document green on gpio #4,
+		 * red on gpio #5 and blue on gpio #6. However, the board
+		 * is actually wired differently as defined here.
+		 */
+		blue {
+			gpios = <&gpio1_0 4 GPIO_ACTIVE_LOW>;
+		};
+
+		green {
+			gpios = <&gpio1_0 5 GPIO_ACTIVE_LOW>;
+		};
+
+		red {
+			gpios = <&gpio1_0 6 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		boot {
+			label = "BOOT";
+			linux,code = <BTN_0>;
+			gpios = <&gpio0 0 GPIO_ACTIVE_LOW>;
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
+	gpio_pinctrl: gpio-pinmux {
+		pinmux = <K210_FPIOA(8, K210_PCF_GPIO0)>,
+			 <K210_FPIOA(11, K210_PCF_GPIO3)>,
+			 <K210_FPIOA(12, K210_PCF_GPIO4)>,
+			 <K210_FPIOA(13, K210_PCF_GPIO5)>,
+			 <K210_FPIOA(14, K210_PCF_GPIO6)>,
+			 <K210_FPIOA(15, K210_PCF_GPIO7)>;
+	};
+
+	gpiohs_pinctrl: gpiohs-pinmux {
+		pinmux = <K210_FPIOA(16, K210_PCF_GPIOHS0)>,
+			 <K210_FPIOA(17, K210_PCF_GPIOHS1)>,
+			 <K210_FPIOA(21, K210_PCF_GPIOHS5)>,
+			 <K210_FPIOA(22, K210_PCF_GPIOHS6)>,
+			 <K210_FPIOA(23, K210_PCF_GPIOHS7)>,
+			 <K210_FPIOA(24, K210_PCF_GPIOHS8)>,
+			 <K210_FPIOA(25, K210_PCF_GPIOHS9)>,
+			 <K210_FPIOA(32, K210_PCF_GPIOHS16)>,
+			 <K210_FPIOA(33, K210_PCF_GPIOHS17)>,
+			 <K210_FPIOA(34, K210_PCF_GPIOHS18)>,
+			 <K210_FPIOA(35, K210_PCF_GPIOHS19)>;
+	};
+
+	i2s0_pinctrl: i2s0-pinmux {
+		pinmux = <K210_FPIOA(18, K210_PCF_I2S0_SCLK)>,
+			 <K210_FPIOA(19, K210_PCF_I2S0_WS)>,
+			 <K210_FPIOA(20, K210_PCF_I2S0_IN_D0)>;
+	};
+
+	dvp_pinctrl: dvp-pinmux {
+		pinmux = <K210_FPIOA(40, K210_PCF_SCCB_SDA)>,
+			 <K210_FPIOA(41, K210_PCF_SCCB_SCLK)>,
+			 <K210_FPIOA(42, K210_PCF_DVP_RST)>,
+			 <K210_FPIOA(43, K210_PCF_DVP_VSYNC)>,
+			 <K210_FPIOA(44, K210_PCF_DVP_PWDN)>,
+			 <K210_FPIOA(45, K210_PCF_DVP_HSYNC)>,
+			 <K210_FPIOA(46, K210_PCF_DVP_XCLK)>,
+			 <K210_FPIOA(47, K210_PCF_DVP_PCLK)>;
+	};
+
+	spi0_pinctrl: spi0-pinmux {
+		pinmux = <K210_FPIOA(36, K210_PCF_GPIOHS20)>,  /* cs */
+			 <K210_FPIOA(37, K210_PCF_GPIOHS21)>,  /* rst */
+			 <K210_FPIOA(38, K210_PCF_GPIOHS22)>,  /* dc */
+			 <K210_FPIOA(39, K210_PCF_SPI0_SCLK)>; /* wr */
+	};
+
+	spi1_pinctrl: spi1-pinmux {
+		pinmux = <K210_FPIOA(26, K210_PCF_SPI1_D1)>,
+			 <K210_FPIOA(27, K210_PCF_SPI1_SCLK)>,
+			 <K210_FPIOA(28, K210_PCF_SPI1_D0)>,
+			 <K210_FPIOA(29, K210_PCF_GPIOHS13)>; /* cs */
+	};
+
+	i2c1_pinctrl: i2c1-pinmux {
+		pinmux = <K210_FPIOA(9, K210_PCF_I2C1_SCLK)>,
+			 <K210_FPIOA(10, K210_PCF_I2C1_SDA)>;
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
+&gpio1 {
+	pinctrl-0 = <&gpio_pinctrl>;
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
+&i2c1 {
+	pinctrl-0 = <&i2c1_pinctrl>;
+	pinctrl-names = "default";
+	clock-frequency = <400000>;
+	status = "okay";
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
+		compatible = "sitronix,st7789v";
+		reg = <0>;
+		reset-gpios = <&gpio0 21 GPIO_ACTIVE_LOW>;
+		dc-gpios = <&gpio0 22 0>;
+		spi-max-frequency = <15000000>;
+		status = "disabled";
+	};
+};
+
+&spi1 {
+	pinctrl-0 = <&spi1_pinctrl>;
+	pinctrl-names = "default";
+	num-cs = <1>;
+	cs-gpios = <&gpio0 13 GPIO_ACTIVE_LOW>;
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
+
+&spi3 {
+	spi-flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <50000000>;
+		m25p,fast-read;
+		broken-flash-reset;
+	};
+};
-- 
2.29.2

