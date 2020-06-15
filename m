Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4FD61F98CC
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2020 15:33:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730600AbgFONdj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jun 2020 09:33:39 -0400
Received: from esa1.microchip.iphmx.com ([68.232.147.91]:62259 "EHLO
        esa1.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730586AbgFONdd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Jun 2020 09:33:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1592228012; x=1623764012;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rRTIXOzrYA0AtMeoJg5RqciWe1e7/mnpkRYykpgr3sA=;
  b=yyIHAQ1C28Ys7ujDrpEbxWMCU073o53ykWnr9UDhxts2+cvkO0e+4S50
   KgHxeoetgOfl+nqtDMPZrKwe/9/Z54qpaPIkYsxJ4NA80ay191fk3FGAW
   Yxx4pbx0iG0TxmcupujoFg5zGdN+hH9Cz94yXuODbG/0OeCm/tbIQuop6
   iXJxitprD7hpYklpQbWA5zp1LpadXtXgupJFMpgkxA8VB1c26a338r968
   BP+skCS42D4u/cAKau9jQWknhWfHBRSSUjmqcKu0Wfy7n/NvhRQaCirQG
   imiY3NPIg8sRQ3R5dqhQvoYIzeULmFGCHA/VE2GPKehhFA+XzmaWt7xNQ
   w==;
IronPort-SDR: 5ofjhwF7QOHeq5AcCXwJ+TCUOP6Bt3/KzVZaXS2RqLWGFgxXxu3bnMWA7BEvIaFLyg3OI1Ou9h
 i7b6ZK1wZSveaP9j6QTOp71W32s4P7z/ihAr4gd5uPBycPOOcXwapyFCW8jhag58e+l7tyBMHx
 4RuAUA8J/QCH3am5KHoZbPPuUX2gjDWwtq0Lr7ngschjtg7quruj8UiVWD+5D12iyh1pHTrCJ8
 WuS1vRm0M+bEBdrPnkvECVGuUDhw+Pbud7FXADyoQOAOD7d7l5mfNTpiROppoQXC39yofNwhQ9
 Ppg=
X-IronPort-AV: E=Sophos;i="5.73,514,1583218800"; 
   d="scan'208";a="83619533"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Jun 2020 06:33:32 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 15 Jun 2020 06:33:28 -0700
Received: from soft-dev15.microsemi.net (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Mon, 15 Jun 2020 06:33:28 -0700
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     SoC Team <soc@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Olof Johansson <olof@lixom.net>,
        "Michael Turquette" <mturquette@baylibre.com>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v3 10/10] arm64: dts: sparx5: Add i2c devices, i2c muxes
Date:   Mon, 15 Jun 2020 15:32:42 +0200
Message-ID: <20200615133242.24911-11-lars.povlsen@microchip.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200615133242.24911-1-lars.povlsen@microchip.com>
References: <20200615133242.24911-1-lars.povlsen@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch adds i2c devices and muxes to the Sparx5 reference boards.

Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
---
 arch/arm64/boot/dts/microchip/sparx5.dtsi     |  38 +++
 .../boot/dts/microchip/sparx5_pcb125.dts      |   4 +
 .../dts/microchip/sparx5_pcb134_board.dtsi    | 237 ++++++++++++++++++
 .../dts/microchip/sparx5_pcb135_board.dtsi    |  77 ++++++
 .../boot/dts/microchip/sparx5_pcb_common.dtsi |   4 +
 5 files changed, 360 insertions(+)

diff --git a/arch/arm64/boot/dts/microchip/sparx5.dtsi b/arch/arm64/boot/dts/microchip/sparx5.dtsi
index 161846caf9c94..cf712e80615da 100644
--- a/arch/arm64/boot/dts/microchip/sparx5.dtsi
+++ b/arch/arm64/boot/dts/microchip/sparx5.dtsi
@@ -170,6 +170,44 @@ uart2_pins: uart2-pins {
 				pins = "GPIO_26", "GPIO_27";
 				function = "uart2";
 			};
+
+			i2c_pins: i2c-pins {
+				pins = "GPIO_14", "GPIO_15";
+				function = "twi";
+			};
+
+			i2c2_pins: i2c2-pins {
+				pins = "GPIO_28", "GPIO_29";
+				function = "twi2";
+			};
+		};
+
+		i2c0: i2c@600101000 {
+			compatible = "snps,designware-i2c";
+			status = "disabled";
+			pinctrl-0 = <&i2c_pins>;
+			pinctrl-names = "default";
+			reg = <0x6 0x00101000 0x100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-sda-hold-time-ns = <300>;
+			clock-frequency = <100000>;
+			clocks = <&ahb_clk>;
+		};
+
+		i2c1: i2c@600103000 {
+			compatible = "snps,designware-i2c";
+			status = "disabled";
+			pinctrl-0 = <&i2c2_pins>;
+			pinctrl-names = "default";
+			reg = <0x6 0x00103000 0x100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+			i2c-sda-hold-time-ns = <300>;
+			clock-frequency = <100000>;
+			clocks = <&ahb_clk>;
 		};
 	};
 };
diff --git a/arch/arm64/boot/dts/microchip/sparx5_pcb125.dts b/arch/arm64/boot/dts/microchip/sparx5_pcb125.dts
index d7f985f7ee020..91ee5b6cfc37a 100644
--- a/arch/arm64/boot/dts/microchip/sparx5_pcb125.dts
+++ b/arch/arm64/boot/dts/microchip/sparx5_pcb125.dts
@@ -15,3 +15,7 @@ memory@0 {
 		reg = <0x00000000 0x00000000 0x10000000>;
 	};
 };
+
+&i2c1 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/microchip/sparx5_pcb134_board.dtsi b/arch/arm64/boot/dts/microchip/sparx5_pcb134_board.dtsi
index 9b2aec400101b..18a535a043686 100644
--- a/arch/arm64/boot/dts/microchip/sparx5_pcb134_board.dtsi
+++ b/arch/arm64/boot/dts/microchip/sparx5_pcb134_board.dtsi
@@ -7,9 +7,246 @@
 #include "sparx5_pcb_common.dtsi"
 
 /{
+	aliases {
+	    i2c0   = &i2c0;
+	    i2c100 = &i2c100;
+	    i2c101 = &i2c101;
+	    i2c102 = &i2c102;
+	    i2c103 = &i2c103;
+	    i2c104 = &i2c104;
+	    i2c105 = &i2c105;
+	    i2c106 = &i2c106;
+	    i2c107 = &i2c107;
+	    i2c108 = &i2c108;
+	    i2c109 = &i2c109;
+	    i2c110 = &i2c110;
+	    i2c111 = &i2c111;
+	    i2c112 = &i2c112;
+	    i2c113 = &i2c113;
+	    i2c114 = &i2c114;
+	    i2c115 = &i2c115;
+	    i2c116 = &i2c116;
+	    i2c117 = &i2c117;
+	    i2c118 = &i2c118;
+	    i2c119 = &i2c119;
+	};
+
 	gpio-restart {
 		compatible = "gpio-restart";
 		gpios = <&gpio 37 GPIO_ACTIVE_LOW>;
 		priority = <200>;
 	};
 };
+
+&gpio {
+	i2cmux_pins_i: i2cmux-pins-i {
+	       pins = "GPIO_16", "GPIO_17", "GPIO_18", "GPIO_19",
+		      "GPIO_20", "GPIO_22", "GPIO_36", "GPIO_35",
+		      "GPIO_50", "GPIO_51", "GPIO_56", "GPIO_57";
+		function = "twi_scl_m";
+		output-low;
+	};
+	i2cmux_0: i2cmux-0 {
+		pins = "GPIO_16";
+		function = "twi_scl_m";
+		output-high;
+	};
+	i2cmux_1: i2cmux-1 {
+		pins = "GPIO_17";
+		function = "twi_scl_m";
+		output-high;
+	};
+	i2cmux_2: i2cmux-2 {
+		pins = "GPIO_18";
+		function = "twi_scl_m";
+		output-high;
+	};
+	i2cmux_3: i2cmux-3 {
+		pins = "GPIO_19";
+		function = "twi_scl_m";
+		output-high;
+	};
+	i2cmux_4: i2cmux-4 {
+		pins = "GPIO_20";
+		function = "twi_scl_m";
+		output-high;
+	};
+	i2cmux_5: i2cmux-5 {
+		pins = "GPIO_22";
+		function = "twi_scl_m";
+		output-high;
+	};
+	i2cmux_6: i2cmux-6 {
+		pins = "GPIO_36";
+		function = "twi_scl_m";
+		output-high;
+	};
+	i2cmux_7: i2cmux-7 {
+		pins = "GPIO_35";
+		function = "twi_scl_m";
+		output-high;
+	};
+	i2cmux_8: i2cmux-8 {
+		pins = "GPIO_50";
+		function = "twi_scl_m";
+		output-high;
+	};
+	i2cmux_9: i2cmux-9 {
+		pins = "GPIO_51";
+		function = "twi_scl_m";
+		output-high;
+	};
+	i2cmux_10: i2cmux-10 {
+		pins = "GPIO_56";
+		function = "twi_scl_m";
+		output-high;
+	};
+	i2cmux_11: i2cmux-11 {
+		pins = "GPIO_57";
+		function = "twi_scl_m";
+		output-high;
+	};
+};
+
+&axi {
+	i2c0_imux: i2c0-imux@0 {
+		compatible = "i2c-mux-pinctrl";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-parent = <&i2c0>;
+	};
+	i2c0_emux: i2c0-emux@0 {
+		compatible = "i2c-mux-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-parent = <&i2c0>;
+	};
+};
+
+&i2c0_imux {
+	pinctrl-names =
+		"i2c100", "i2c101", "i2c102", "i2c103",
+		"i2c104", "i2c105", "i2c106", "i2c107",
+		"i2c108", "i2c109", "i2c110", "i2c111", "idle";
+	pinctrl-0 = <&i2cmux_0>;
+	pinctrl-1 = <&i2cmux_1>;
+	pinctrl-2 = <&i2cmux_2>;
+	pinctrl-3 = <&i2cmux_3>;
+	pinctrl-4 = <&i2cmux_4>;
+	pinctrl-5 = <&i2cmux_5>;
+	pinctrl-6 = <&i2cmux_6>;
+	pinctrl-7 = <&i2cmux_7>;
+	pinctrl-8 = <&i2cmux_8>;
+	pinctrl-9 = <&i2cmux_9>;
+	pinctrl-10 = <&i2cmux_10>;
+	pinctrl-11 = <&i2cmux_11>;
+	pinctrl-12 = <&i2cmux_pins_i>;
+	i2c100: i2c_sfp1 {
+		reg = <0x0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+	i2c101: i2c_sfp2 {
+		reg = <0x1>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+	i2c102: i2c_sfp3 {
+		reg = <0x2>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+	i2c103: i2c_sfp4 {
+		reg = <0x3>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+	i2c104: i2c_sfp5 {
+		reg = <0x4>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+	i2c105: i2c_sfp6 {
+		reg = <0x5>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+	i2c106: i2c_sfp7 {
+		reg = <0x6>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+	i2c107: i2c_sfp8 {
+		reg = <0x7>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+	i2c108: i2c_sfp9 {
+		reg = <0x8>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+	i2c109: i2c_sfp10 {
+		reg = <0x9>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+	i2c110: i2c_sfp11 {
+		reg = <0xa>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+	i2c111: i2c_sfp12 {
+		reg = <0xb>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+};
+
+&i2c0_emux {
+	mux-gpios = <&gpio 55 GPIO_ACTIVE_HIGH
+		     &gpio 60 GPIO_ACTIVE_HIGH
+		     &gpio 61 GPIO_ACTIVE_HIGH
+		     &gpio 54 GPIO_ACTIVE_HIGH>;
+	idle-state = <0x8>;
+	i2c112: i2c_sfp13 {
+		reg = <0x0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+	i2c113: i2c_sfp14 {
+		reg = <0x1>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+	i2c114: i2c_sfp15 {
+		reg = <0x2>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+	i2c115: i2c_sfp16 {
+		reg = <0x3>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+	i2c116: i2c_sfp17 {
+		reg = <0x4>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+	i2c117: i2c_sfp18 {
+		reg = <0x5>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+	i2c118: i2c_sfp19 {
+		reg = <0x6>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+	i2c119: i2c_sfp20 {
+		reg = <0x7>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+};
diff --git a/arch/arm64/boot/dts/microchip/sparx5_pcb135_board.dtsi b/arch/arm64/boot/dts/microchip/sparx5_pcb135_board.dtsi
index 9b2aec400101b..d71f11a10b3d2 100644
--- a/arch/arm64/boot/dts/microchip/sparx5_pcb135_board.dtsi
+++ b/arch/arm64/boot/dts/microchip/sparx5_pcb135_board.dtsi
@@ -7,9 +7,86 @@
 #include "sparx5_pcb_common.dtsi"
 
 /{
+	aliases {
+	    i2c0   = &i2c0;
+	    i2c152 = &i2c152;
+	    i2c153 = &i2c153;
+	    i2c154 = &i2c154;
+	    i2c155 = &i2c155;
+	};
+
 	gpio-restart {
 		compatible = "gpio-restart";
 		gpios = <&gpio 37 GPIO_ACTIVE_LOW>;
 		priority = <200>;
 	};
 };
+
+&gpio {
+	i2cmux_pins_i: i2cmux-pins-i {
+	       pins = "GPIO_35", "GPIO_36",
+		      "GPIO_50", "GPIO_51";
+		function = "twi_scl_m";
+		output-low;
+	};
+	i2cmux_s29: i2cmux-0 {
+		pins = "GPIO_35";
+		function = "twi_scl_m";
+		output-high;
+	};
+	i2cmux_s30: i2cmux-1 {
+		pins = "GPIO_36";
+		function = "twi_scl_m";
+		output-high;
+	};
+	i2cmux_s31: i2cmux-2 {
+		pins = "GPIO_50";
+		function = "twi_scl_m";
+		output-high;
+	};
+	i2cmux_s32: i2cmux-3 {
+		pins = "GPIO_51";
+		function = "twi_scl_m";
+		output-high;
+	};
+};
+
+&axi {
+	i2c0_imux: i2c0-imux@0 {
+		compatible = "i2c-mux-pinctrl";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-parent = <&i2c0>;
+	};
+};
+
+&i2c0_imux {
+	pinctrl-names =
+		"i2c152", "i2c153", "i2c154", "i2c155",
+		"idle";
+	pinctrl-0 = <&i2cmux_s29>;
+	pinctrl-1 = <&i2cmux_s30>;
+	pinctrl-2 = <&i2cmux_s31>;
+	pinctrl-3 = <&i2cmux_s32>;
+	pinctrl-4 = <&i2cmux_pins_i>;
+	i2c152: i2c_sfp1 {
+		reg = <0x0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+	i2c153: i2c_sfp2 {
+		reg = <0x1>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+	i2c154: i2c_sfp3 {
+		reg = <0x2>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+	i2c155: i2c_sfp4 {
+		reg = <0x3>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+};
diff --git a/arch/arm64/boot/dts/microchip/sparx5_pcb_common.dtsi b/arch/arm64/boot/dts/microchip/sparx5_pcb_common.dtsi
index 1f99d0db1284f..9d1a082de3e29 100644
--- a/arch/arm64/boot/dts/microchip/sparx5_pcb_common.dtsi
+++ b/arch/arm64/boot/dts/microchip/sparx5_pcb_common.dtsi
@@ -13,3 +13,7 @@ &uart0 {
 &uart1 {
 	status = "okay";
 };
+
+&i2c0 {
+	status = "okay";
+};
-- 
2.27.0

