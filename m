Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 348CC2D8D93
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Dec 2020 14:55:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407064AbgLMNzR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Dec 2020 08:55:17 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:35019 "EHLO
        esa3.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394765AbgLMNzQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Dec 2020 08:55:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1607867716; x=1639403716;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pv8JZtQB/72JVAORh2Chi7j0O6QOFyYxn8e6KGe0E38=;
  b=SQyBYoctXgfUpTf9pFba0jAcm+ZCZMmo6YbHP41tgT/rVmxB9xyHKiAh
   inp3v60kJ6c5pDhd0T5g+RCsuat8XOk43PLRTkG9UrHRC6+s61W8lS6fF
   1OhAWCfekQdFLQS3qO5zndW0GTwmzNIWloMLjGHji0LRK3wlCE9kaBfPz
   530bD6kQIxWeROUvQHFfv5vM99F5NZT6y3/pfcYhNV1UFKklt4mD60Mhl
   k9IgkL9cHuE2DH/tEr7SvKAPA/Ejusi7qT6eEZy4C8mqzmoU5NdVfNGc8
   aD5Ia2I01M9MKAvzbm4xamZkLrLY39KZ/+FnhL+7gxA2w9nHsrBFyiJPq
   A==;
IronPort-SDR: Gvx5b1JF9u9fP1zweS3A4iWZwqOy4CiSjzfZ2CPrZVaQioIQjiuAzG9KLkHwoH6FxTtPqBFF1z
 UScy3lnZ+nkWqYgkwjMy0oYgWy6PRhe1llzMC0gRTai7iTq9AMhp/D07z5MpsKkjv7mT/oc8JG
 4+wzVqBwbEx1Tl/NLHdIlZItmz4uuXHgHJNYLGJk6IkOsRgV8S1t/RzUlF+4uriOqh7/+LC1wY
 JtHTuQFIER9Aotsl517ydtpUXmYulZfXqOJwNZ3liPbCjiJ7lR/RuSuEuxBJr1mSRLa7Nk6UJg
 qx4=
X-IronPort-AV: E=Sophos;i="5.78,416,1599494400"; 
   d="scan'208";a="159494633"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 13 Dec 2020 21:51:35 +0800
IronPort-SDR: XRJICMQYiTNInh0gp6X/NVDD+7aVyGDMnYjGjFVJ9Jdt2krO8GFMKFgZs9JHY+6vOc3qSWb3p9
 v9gkTbJJnDuwQBO9dnh5AE1gk0OuZZpxkN+Oz7xMOXAqhA4QQiRheUhBAKiHg9KvtqzUjuZ/m0
 ePr5F8yC7zUsW910X5G9ymGL+rwBteZd/xonUwyQWBji9x8BLyklbFT6BNMxL0THIq7Vo+yrf8
 pZU9JFLpyhnjZNWzgFh0e/mGjT+w2DlNkDbMFlDUcAxycUo4q/jGjmL1JJAFzbGwXv/KUbfssp
 wPm99gECssG7WPDfMjZZ0VIr
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2020 05:35:20 -0800
IronPort-SDR: /UI5Ud7nbJBpB1zMMreT6dOLr4krdv136CvorlxbCrgV/kxWXjIgemxEnkCyAdE6GUvC4b9/hm
 aOsOnQWN94RJZ6cuNhOw8z+GP+uMYW58Z+YLmr0gf/OM6yeRgL0KvLHUSoP4Wj3FHJd4KwoO/C
 sGcqrsM5kaDLmUr6JkZ+rMBAupecxGYRr+JTfOFOosIXXp2k8GkigtYxq6mwlpLuaqPHOG1UKx
 MDaccgL+I/P17S6ClBDEyM9TAsL4kT1ZjuvGc+jyqVRaw3zkuAbQ4PF6dT43j0vzbsssN5tdYv
 rIw=
WDCIronportException: Internal
Received: from phd004806.ad.shared (HELO twashi.fujisawa.hgst.com) ([10.84.71.197])
  by uls-op-cesaip01.wdc.com with ESMTP; 13 Dec 2020 05:51:33 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v10 17/23] riscv: Add SiPeed MAIX BiT board device tree
Date:   Sun, 13 Dec 2020 22:50:50 +0900
Message-Id: <20201213135056.24446-18-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201213135056.24446-1-damien.lemoal@wdc.com>
References: <20201213135056.24446-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a device tree for the SiPeed MAIX BiT and MAIX BiTm boards. This
device tree enables LEDs, gpio, i2c and spi/mmc SD card devices.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 arch/riscv/boot/dts/canaan/k210_maix_bit.dts | 227 +++++++++++++++++++
 1 file changed, 227 insertions(+)
 create mode 100644 arch/riscv/boot/dts/canaan/k210_maix_bit.dts

diff --git a/arch/riscv/boot/dts/canaan/k210_maix_bit.dts b/arch/riscv/boot/dts/canaan/k210_maix_bit.dts
new file mode 100644
index 000000000000..a5a40f9cf812
--- /dev/null
+++ b/arch/riscv/boot/dts/canaan/k210_maix_bit.dts
@@ -0,0 +1,227 @@
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
+	model = "SiPeed MAIX BiT";
+	compatible = "sipeed,maix-bitm", "sipeed,maix-bit",
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
+		green {
+			gpios = <&gpio1_0 4 GPIO_ACTIVE_LOW>;
+		};
+
+		red {
+			gpios = <&gpio1_0 5 GPIO_ACTIVE_LOW>;
+		};
+
+		blue {
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
+	pinctrl-names = "default";
+	pinctrl-0 = <&jtag_pinctrl>;
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
+			 <K210_FPIOA(9, K210_PCF_GPIO1)>,
+			 <K210_FPIOA(10, K210_PCF_GPIO2)>,
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
+		pinmux = <K210_FPIOA(30, K210_PCF_I2C1_SCLK)>,
+			 <K210_FPIOA(31, K210_PCF_I2C1_SDA)>;
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
+		dc-gpios = <&gpio0 22 GPIO_ACTIVE_HIGH>;
+		spi-max-frequency = <15000000>;
+		spi-cs-high;
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

