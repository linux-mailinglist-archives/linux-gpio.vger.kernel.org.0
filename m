Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62EEE2C1D0C
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Nov 2020 05:38:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729302AbgKXEiL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Nov 2020 23:38:11 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:36189 "EHLO
        esa6.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729276AbgKXEiK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Nov 2020 23:38:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1606192691; x=1637728691;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1dP7+RVvtD0fNcGcuRcgQIeBe2zsNSk0araRxFvsAas=;
  b=HoKsiXHAUsIixQ5WiPVQspE7UbnRJbD51bx/t+pHYX4MvM4obt299HoN
   L75wVDVgE15r+zrprOEotEPj7FHAUBNvPTgGO81WiqA8yf62EKzF+O2Nv
   Ghf3beuGfzWQzVkk1qlOiX4prqIy8d5rnYJiwOrYZGjw06tD2IsncQ5td
   CXwXuysPFN7dKLfmnpzbdsmv7YdhI6jixcSjGqBSb6b90zZ5SdpH0R8UF
   0F0xoqhCZ1z5iKdud2FX3TrR7yWrKibvmK7B4sI33nPJTSzu4TlQkFaMo
   /0YW7f7nvThs0e4och24v8nGV5p5QaO1PfAROSTx049SzggMubTZ02xYc
   Q==;
IronPort-SDR: XgtC6h7P5xWhJsQnUTb8e5JPzYfXNNPciZY2PWHJjwiMeKg0AUy6mkb/sjyeskOfDU9E4xf0ca
 oZ4HpYgTnX7a1JYOHP71EQ7KDbl6yXdm/PHCRD+F+CVTDhgPx6fc3dgVHKcP1COB+Qc6QpLHKC
 huiTZdb3ONtR3OCxzZn6/u+Uzfj2pwYmiuzvZCG4ueD0DpIECZWWJggBGyOD8jK6W0DxT4droi
 w0mFGvm0qXv+xP0U0WnAz9YjinnglMyfsyBIjCg841BeCXe/nl/IMkSIT1Hcx9usB6rToioPss
 nzg=
X-IronPort-AV: E=Sophos;i="5.78,365,1599494400"; 
   d="scan'208";a="154498209"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 24 Nov 2020 12:38:11 +0800
IronPort-SDR: snMLKUEBv55y7PK2jGKDtNiBQGjk7DeOz8K3kZ0qL0vpyIqEV9JTyWB8LNMmTajUjOU1a/hVC7
 842yvIgUTr+5kPr6fXtDnUqaMe4WZfnBM=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 20:23:55 -0800
IronPort-SDR: Ahnm3ls3G+H1PJwgL+jinvc1XsEWWo1vKMp8+s7814X4Ha5mjf6xaltKprdPngfmgEyT5TgeE3
 ee6gWNiKGiWQ==
WDCIronportException: Internal
Received: from hdrdzf2.ad.shared (HELO twashi.fujisawa.hgst.com) ([10.84.71.163])
  by uls-op-cesaip01.wdc.com with ESMTP; 23 Nov 2020 20:38:08 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v2 19/21] riscv: Add Kendryte KD233 board device tree
Date:   Tue, 24 Nov 2020 13:37:26 +0900
Message-Id: <20201124043728.199852-20-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201124043728.199852-1-damien.lemoal@wdc.com>
References: <20201124043728.199852-1-damien.lemoal@wdc.com>
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

