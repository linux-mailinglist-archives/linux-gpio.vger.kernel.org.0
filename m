Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A81A285DE7
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Oct 2020 13:12:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728066AbgJGLM2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Oct 2020 07:12:28 -0400
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:23567 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726812AbgJGLMZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Oct 2020 07:12:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1602069145; x=1633605145;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UhCLBLuu3mzVk3c7IwuTaa+FhI94pNsN1Q+l5nc21eY=;
  b=IXLllB89coWuxfuU0xfMDtAu4PT8poBBVMI5jcFzrudmjZM0ppf2Ulwt
   jLJhDYWBrkt2/rh7YombtMGlt/Tljhdzt/nPSAo/pkz5Eh3yCelm9MdyP
   lkFezIoBjl5lCqbjUPvwaOpetgiJF0O5MT4X3E382a8E4zY71C9vWExWR
   JjwWXwu1onG57AcrztpQUMGG0c1NAURGV3rGsOML+WPP99V0kCyKT6cOe
   02g1CZDIS3N6BsX6FlzqJGQIEMYTjCSKtNNLAZOcTFQ0WPIAYKTMOG9y9
   6NS3o4S7fLO5qP6wWAMQIlJUowBL9GHlv9m0bqY6fa6aAhtUz46rAf9Oq
   w==;
IronPort-SDR: uV08xq8+bVzMolcUx4+rDG5edTev0en0FxOC6z+VwEtjYUe+bbrzi+oqd9y/ypvDjHEvNoSy70
 XfQFwooV7+xdeM1Q3BluMAdkbGn4x6usG6hlGp50aCQDTnuXeDkeZZcvS9c14gzvgn6GGObwpi
 kdnmqPUfYYNXvotwnoYvNah53x2IH3ve6OICCmlceLkmbMXT0fGWGhVmyCjB4yTS/tRCXaYq24
 TF6W3TztzWhD3zSLO6NYTGNu5Cqz0VvQnUUfjyaEdALYmEGfbpSYTnnZMbCDhgpokV+47XWmeg
 oMM=
X-IronPort-AV: E=Sophos;i="5.77,346,1596524400"; 
   d="scan'208";a="93726022"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Oct 2020 04:12:24 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 7 Oct 2020 04:12:23 -0700
Received: from soft-dev10.microsemi.net (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Wed, 7 Oct 2020 04:12:04 -0700
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v4 3/3] arm64: dts: sparx5: Add SGPIO devices
Date:   Wed, 7 Oct 2020 13:11:45 +0200
Message-ID: <20201007111145.2306213-4-lars.povlsen@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201007111145.2306213-1-lars.povlsen@microchip.com>
References: <20201007111145.2306213-1-lars.povlsen@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This adds SGPIO devices for the Sparx5 SoC and configures it for the
applicable reference boards.

Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
---
 arch/arm64/boot/dts/microchip/sparx5.dtsi     |  91 ++++++
 .../boot/dts/microchip/sparx5_pcb125.dts      |   5 +
 .../dts/microchip/sparx5_pcb134_board.dtsi    | 258 ++++++++++++++++++
 .../dts/microchip/sparx5_pcb135_board.dtsi    |  55 ++++
 4 files changed, 409 insertions(+)

diff --git a/arch/arm64/boot/dts/microchip/sparx5.dtsi b/arch/arm64/boot/dts/microchip/sparx5.dtsi
index 1def30e6b728..d64621d1213b 100644
--- a/arch/arm64/boot/dts/microchip/sparx5.dtsi
+++ b/arch/arm64/boot/dts/microchip/sparx5.dtsi
@@ -231,6 +231,22 @@ si2_pins: si2-pins {
 				function = "si2";
 			};
 
+			sgpio0_pins: sgpio-pins {
+				pins = "GPIO_0", "GPIO_1", "GPIO_2", "GPIO_3";
+				function = "sg0";
+			};
+
+			sgpio1_pins: sgpio1-pins {
+				pins = "GPIO_4", "GPIO_5", "GPIO_12", "GPIO_13";
+				function = "sg1";
+			};
+
+			sgpio2_pins: sgpio2-pins {
+				pins = "GPIO_30", "GPIO_31", "GPIO_32",
+				       "GPIO_33";
+				function = "sg2";
+			};
+
 			uart_pins: uart-pins {
 				pins = "GPIO_10", "GPIO_11";
 				function = "uart";
@@ -261,6 +277,81 @@ emmc_pins: emmc-pins {
 			};
 		};
 
+		sgpio0: gpio@61101036c {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "microchip,sparx5-sgpio";
+			status = "disabled";
+			clocks = <&sys_clk>;
+			pinctrl-0 = <&sgpio0_pins>;
+			pinctrl-names = "default";
+			reg = <0x6 0x1101036c 0x100>;
+			sgpio_in0: gpio@0 {
+				compatible = "microchip,sparx5-sgpio-bank";
+				reg = <0>;
+				gpio-controller;
+				#gpio-cells = <3>;
+				ngpios = <96>;
+			};
+			sgpio_out0: gpio@1 {
+				compatible = "microchip,sparx5-sgpio-bank";
+				reg = <1>;
+				gpio-controller;
+				#gpio-cells = <3>;
+				ngpios = <96>;
+			};
+		};
+
+		sgpio1: gpio@611010484 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "microchip,sparx5-sgpio";
+			status = "disabled";
+			clocks = <&sys_clk>;
+			pinctrl-0 = <&sgpio1_pins>;
+			pinctrl-names = "default";
+			reg = <0x6 0x11010484 0x100>;
+			sgpio_in1: gpio@0 {
+				compatible = "microchip,sparx5-sgpio-bank";
+				reg = <0>;
+				gpio-controller;
+				#gpio-cells = <3>;
+				ngpios = <96>;
+			};
+			sgpio_out1: gpio@1 {
+				compatible = "microchip,sparx5-sgpio-bank";
+				reg = <1>;
+				gpio-controller;
+				#gpio-cells = <3>;
+				ngpios = <96>;
+			};
+		};
+
+		sgpio2: gpio@61101059c {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "microchip,sparx5-sgpio";
+			status = "disabled";
+			clocks = <&sys_clk>;
+			pinctrl-0 = <&sgpio2_pins>;
+			pinctrl-names = "default";
+			reg = <0x6 0x1101059c 0x100>;
+			sgpio_in2: gpio@0 {
+				reg = <0>;
+				compatible = "microchip,sparx5-sgpio-bank";
+				gpio-controller;
+				#gpio-cells = <3>;
+				ngpios = <96>;
+			};
+			sgpio_out2: gpio@1 {
+				compatible = "microchip,sparx5-sgpio-bank";
+				reg = <1>;
+				gpio-controller;
+				#gpio-cells = <3>;
+				ngpios = <96>;
+			};
+		};
+
 		i2c0: i2c@600101000 {
 			compatible = "snps,designware-i2c";
 			status = "disabled";
diff --git a/arch/arm64/boot/dts/microchip/sparx5_pcb125.dts b/arch/arm64/boot/dts/microchip/sparx5_pcb125.dts
index 6b2da7c7520c..9baa085d7861 100644
--- a/arch/arm64/boot/dts/microchip/sparx5_pcb125.dts
+++ b/arch/arm64/boot/dts/microchip/sparx5_pcb125.dts
@@ -69,6 +69,11 @@ spi-flash@9 {
 	};
 };
 
+&sgpio0 {
+	status = "okay";
+	microchip,sgpio-port-ranges = <0 23>;
+};
+
 &i2c1 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/microchip/sparx5_pcb134_board.dtsi b/arch/arm64/boot/dts/microchip/sparx5_pcb134_board.dtsi
index 35984785d611..4f1512b0e871 100644
--- a/arch/arm64/boot/dts/microchip/sparx5_pcb134_board.dtsi
+++ b/arch/arm64/boot/dts/microchip/sparx5_pcb134_board.dtsi
@@ -36,6 +36,242 @@ gpio-restart {
 		gpios = <&gpio 37 GPIO_ACTIVE_LOW>;
 		priority = <200>;
 	};
+
+	leds {
+		compatible = "gpio-leds";
+		led@0 {
+			label = "twr0:green";
+			gpios = <&sgpio_out0 8 0 GPIO_ACTIVE_LOW>;
+		};
+		led@1 {
+			label = "twr0:yellow";
+			gpios = <&sgpio_out0 8 1 GPIO_ACTIVE_LOW>;
+		};
+		led@2 {
+			label = "twr1:green";
+			gpios = <&sgpio_out0 9 0 GPIO_ACTIVE_LOW>;
+		};
+		led@3 {
+			label = "twr1:yellow";
+			gpios = <&sgpio_out0 9 1 GPIO_ACTIVE_LOW>;
+		};
+		led@4 {
+			label = "twr2:green";
+			gpios = <&sgpio_out0 10 0 GPIO_ACTIVE_LOW>;
+		};
+		led@5 {
+			label = "twr2:yellow";
+			gpios = <&sgpio_out0 10 1 GPIO_ACTIVE_LOW>;
+		};
+		led@6 {
+			label = "twr3:green";
+			gpios = <&sgpio_out0 11 0 GPIO_ACTIVE_LOW>;
+		};
+		led@7 {
+			label = "twr3:yellow";
+			gpios = <&sgpio_out0 11 1 GPIO_ACTIVE_LOW>;
+		};
+		led@8 {
+			label = "eth12:green";
+			gpios = <&sgpio_out0 12 0 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+		led@9 {
+			label = "eth12:yellow";
+			gpios = <&sgpio_out0 12 1 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+		led@10 {
+			label = "eth13:green";
+			gpios = <&sgpio_out0 13 0 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+		led@11 {
+			label = "eth13:yellow";
+			gpios = <&sgpio_out0 13 1 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+		led@12 {
+			label = "eth14:green";
+			gpios = <&sgpio_out0 14 0 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+		led@13 {
+			label = "eth14:yellow";
+			gpios = <&sgpio_out0 14 1 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+		led@14 {
+			label = "eth15:green";
+			gpios = <&sgpio_out0 15 0 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+		led@15 {
+			label = "eth15:yellow";
+			gpios = <&sgpio_out0 15 1 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+		led@16 {
+			label = "eth48:green";
+			gpios = <&sgpio_out1 16 0 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+		led@17 {
+			label = "eth48:yellow";
+			gpios = <&sgpio_out1 16 1 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+		led@18 {
+			label = "eth49:green";
+			gpios = <&sgpio_out1 17 0 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+		led@19 {
+			label = "eth49:yellow";
+			gpios = <&sgpio_out1 17 1 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+		led@20 {
+			label = "eth50:green";
+			gpios = <&sgpio_out1 18 0 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+		led@21 {
+			label = "eth50:yellow";
+			gpios = <&sgpio_out1 18 1 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+		led@22 {
+			label = "eth51:green";
+			gpios = <&sgpio_out1 19 0 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+		led@23 {
+			label = "eth51:yellow";
+			gpios = <&sgpio_out1 19 1 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+		led@24 {
+			label = "eth52:green";
+			gpios = <&sgpio_out1 20 0 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+		led@25 {
+			label = "eth52:yellow";
+			gpios = <&sgpio_out1 20 1 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+		led@26 {
+			label = "eth53:green";
+			gpios = <&sgpio_out1 21 0 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+		led@27 {
+			label = "eth53:yellow";
+			gpios = <&sgpio_out1 21 1 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+		led@28 {
+			label = "eth54:green";
+			gpios = <&sgpio_out1 22 0 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+		led@29 {
+			label = "eth54:yellow";
+			gpios = <&sgpio_out1 22 1 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+		led@30 {
+			label = "eth55:green";
+			gpios = <&sgpio_out1 23 0 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+		led@31 {
+			label = "eth55:yellow";
+			gpios = <&sgpio_out1 23 1 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+		led@32 {
+			label = "eth56:green";
+			gpios = <&sgpio_out1 24 0 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+		led@33 {
+			label = "eth56:yellow";
+			gpios = <&sgpio_out1 24 1 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+		led@34 {
+			label = "eth57:green";
+			gpios = <&sgpio_out1 25 0 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+		led@35 {
+			label = "eth57:yellow";
+			gpios = <&sgpio_out1 25 1 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+		led@36 {
+			label = "eth58:green";
+			gpios = <&sgpio_out1 26 0 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+		led@37 {
+			label = "eth58:yellow";
+			gpios = <&sgpio_out1 26 1 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+		led@38 {
+			label = "eth59:green";
+			gpios = <&sgpio_out1 27 0 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+		led@39 {
+			label = "eth59:yellow";
+			gpios = <&sgpio_out1 27 1 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+		led@40 {
+			label = "eth60:green";
+			gpios = <&sgpio_out1 28 0 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+		led@41 {
+			label = "eth60:yellow";
+			gpios = <&sgpio_out1 28 1 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+		led@42 {
+			label = "eth61:green";
+			gpios = <&sgpio_out1 29 0 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+		led@43 {
+			label = "eth61:yellow";
+			gpios = <&sgpio_out1 29 1 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+		led@44 {
+			label = "eth62:green";
+			gpios = <&sgpio_out1 30 0 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+		led@45 {
+			label = "eth62:yellow";
+			gpios = <&sgpio_out1 30 1 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+		led@46 {
+			label = "eth63:green";
+			gpios = <&sgpio_out1 31 0 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+		led@47 {
+			label = "eth63:yellow";
+			gpios = <&sgpio_out1 31 1 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+	};
 };
 
 &spi0 {
@@ -54,6 +290,28 @@ spi-flash@9 {
 	};
 };
 
+&sgpio0 {
+	status = "okay";
+	microchip,sgpio-port-ranges = <8 15>;
+	gpio@0 {
+		ngpios = <64>;
+	};
+	gpio@1 {
+		ngpios = <64>;
+	};
+};
+
+&sgpio1 {
+	status = "okay";
+	microchip,sgpio-port-ranges = <24 31>;
+	gpio@0 {
+		ngpios = <64>;
+	};
+	gpio@1 {
+		ngpios = <64>;
+	};
+};
+
 &gpio {
 	i2cmux_pins_i: i2cmux-pins-i {
 	       pins = "GPIO_16", "GPIO_17", "GPIO_18", "GPIO_19",
diff --git a/arch/arm64/boot/dts/microchip/sparx5_pcb135_board.dtsi b/arch/arm64/boot/dts/microchip/sparx5_pcb135_board.dtsi
index 7de66806b14b..66381271bef9 100644
--- a/arch/arm64/boot/dts/microchip/sparx5_pcb135_board.dtsi
+++ b/arch/arm64/boot/dts/microchip/sparx5_pcb135_board.dtsi
@@ -20,6 +20,50 @@ gpio-restart {
 		gpios = <&gpio 37 GPIO_ACTIVE_LOW>;
 		priority = <200>;
 	};
+
+	leds {
+		compatible = "gpio-leds";
+		led@0 {
+			label = "eth60:yellow";
+			gpios = <&sgpio_out1 28 0 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+		led@1 {
+			label = "eth60:green";
+			gpios = <&sgpio_out1 28 1 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+		led@2 {
+			label = "eth61:yellow";
+			gpios = <&sgpio_out1 29 0 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+		led@3 {
+			label = "eth61:green";
+			gpios = <&sgpio_out1 29 1 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+		led@4 {
+			label = "eth62:yellow";
+			gpios = <&sgpio_out1 30 0 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+		led@5 {
+			label = "eth62:green";
+			gpios = <&sgpio_out1 30 1 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+		led@6 {
+			label = "eth63:yellow";
+			gpios = <&sgpio_out1 31 0 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+		led@7 {
+			label = "eth63:green";
+			gpios = <&sgpio_out1 31 1 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+	};
 };
 
 &gpio {
@@ -67,6 +111,17 @@ spi-flash@9 {
 	};
 };
 
+&sgpio1 {
+	status = "okay";
+	microchip,sgpio-port-ranges = <24 31>;
+	gpio@0 {
+		ngpios = <64>;
+	};
+	gpio@1 {
+		ngpios = <64>;
+	};
+};
+
 &axi {
 	i2c0_imux: i2c0-imux@0 {
 		compatible = "i2c-mux-pinctrl";
-- 
2.25.1

