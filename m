Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CA9A2D24B1
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Dec 2020 08:39:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727167AbgLHHib (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Dec 2020 02:38:31 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:58712 "EHLO
        esa6.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726391AbgLHHib (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Dec 2020 02:38:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1607413111; x=1638949111;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1dP7+RVvtD0fNcGcuRcgQIeBe2zsNSk0araRxFvsAas=;
  b=QqtHT+1Eb1wsTgHZAK+/MeFVCxMw1NnHNUGbs9h0Dm0xZt63X4FXrHjK
   2O7CCCUxP1091sEVKZQQc5IR320lr63BjUorGPJeNaqxr25wHEKXP+yVU
   X6p8vTiTKHgBd+Y0nN1ixqK+fIqEWunbfIKLfKA5lGMSU9DiF8ChF4dlx
   ALC5R6MUMlN7F4nHmmVLmQNT4xf11N/8NUnzS0VwVuUXCuX86CtleqzV3
   nFbyIQQZ+DcC+6Sw1HT4pNs5m/y0vra4qpysLZepmF7bZAWql+2xIoqtr
   rT52ZTt/+ptfDf02vruYtRczYFJcFfCwgjUk2WvDyodDFrUzBBzjqfMSL
   Q==;
IronPort-SDR: 2xHsPmNuYVDFA5xFGk07zJcxa49p126EL8RYnJW/4dVm547DXb6+DKLV3ir9sniwn02EUM5j3r
 M7vJ03UoPVz8RvI5oLToe1Dkg9uLsJMSYx75iCtWZ1lH+35Avd8cFpLsxOKypUEaZ1DoW65XPW
 surskdqr0jK3VrLdbOBDEocT3mbetDZYvsetkN1bKMecyNM69VW5uSgrhyhiMLcXkg8NLp55Lp
 9BKWMw0jWbXNL9mHY0S+nFGukBcuFqiO6eefj6cmpFOPIoO/TndULsBnFxSX5OXVAupQ9nKG7a
 cNQ=
X-IronPort-AV: E=Sophos;i="5.78,401,1599494400"; 
   d="scan'208";a="155876689"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 08 Dec 2020 15:34:39 +0800
IronPort-SDR: 03bUjMyxIAW9yUGLEHFfqY3zD7JCIHQRjJLzL/DRs+MCWB11bIP7bwvbyrvQA17FASjenh04AE
 kNQc7R9lEFJpVx0nx2TUmkENb+4uPf9wU=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2020 23:18:40 -0800
IronPort-SDR: 3ShS17g25EZEUenpy0nZuABPE5dFBSm0takFum+X+6R5LtLcm4LEvpf8C+BzYJQ4H/mYlFvbM5
 u5D2uU0GEwIQ==
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com) ([10.84.71.173])
  by uls-op-cesaip02.wdc.com with ESMTP; 07 Dec 2020 23:34:37 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v5 19/21] riscv: Add Kendryte KD233 board device tree
Date:   Tue,  8 Dec 2020 16:33:53 +0900
Message-Id: <20201208073355.40828-20-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201208073355.40828-1-damien.lemoal@wdc.com>
References: <20201208073355.40828-1-damien.lemoal@wdc.com>
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
2.28.0

