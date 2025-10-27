Return-Path: <linux-gpio+bounces-27681-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0922C0E0B0
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 14:31:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D70AF4063F7
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 13:29:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 816CD2F5A05;
	Mon, 27 Oct 2025 13:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="jrYmVH4o"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mxout3.routing.net (mxout3.routing.net [134.0.28.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3FB28FFFB;
	Mon, 27 Oct 2025 13:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761571718; cv=none; b=jiG9UJ1u7xZLDu1rgEBrPzxb+ntOl88zSctpYXzBmW8hj8h0PfbnCf3hUMbVwwm9SHOIsCsvOqGWm63Nv/yl2BL300bTlycpMzc3/vfW7rsSSFls6zdhK4AGIFGjNvFk32eWueilOs23m8TNw2RGlGUYd3DZzb2+RA0SvXpShjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761571718; c=relaxed/simple;
	bh=B+zu/GGRFbXtPh4E0KgkbkhSC6rB9RAhrR2Yl4olsWw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VjtnSLEf66gESJlCEKMasduqrZ82u8yjuTcFA2D+QTlD+ZDCJnziu3mFJa2C4TM4mQhTRoo6ikjRF8gJq16fRYObaQalc4z1S7fk6x9uUz5tQ3YpW0dpMGBwkhmTfwTGu4jiq8icfA+3pWI9+YXYuSUKWGVaWPUPmPyf1nkZ33w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=jrYmVH4o; arc=none smtp.client-ip=134.0.28.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout3.routing.net (Postfix) with ESMTP id 0518460786;
	Mon, 27 Oct 2025 13:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1761571707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SuOGYjaH6/i4czC4LZa/oi245Wtm/No+fBKWmLcJy5k=;
	b=jrYmVH4o+mFRGmShU0uTTqwOsMYlQaRA0dMvsUJGEMdfMl5LNnmL2EIY6DfFno1EnHPvWL
	FIjC5M+QkVVzX+vaYJnOsUIv0eVhnxvXN3pgXxuWGVlrpjw3ifmKKFmlIRT4BJs+S+P6pl
	pNpO3D9E/rAoCtCEr7erF8NS479jee0=
Received: from frank-u24.. (fttx-pool-217.61.159.158.bambit.de [217.61.159.158])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id C695C1226C0;
	Mon, 27 Oct 2025 13:28:26 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	Sean Wang <sean.wang@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v1 4/6] arm64: dts: mt7988: Add devicetree for BananaPi R4 Pro
Date: Mon, 27 Oct 2025 14:28:14 +0100
Message-ID: <20251027132817.212534-5-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251027132817.212534-1-linux@fw-web.de>
References: <20251027132817.212534-1-linux@fw-web.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Frank Wunderlich <frank-w@public-files.de>

Add devicetree for Bpi-R4-Pro.

BananaPi R4 Pro is a MT7988A based board which exists in 2 different
hardware versions:

- 4E: 4 GB RAM and using internal 2.5G Phy for WAN-Combo
- 8X: 8 GB RAM and 2x Aeonsemi AS21010P 10G phys

common parts:

- MediaTek MT7988A Quad-core Arm Corex-A73,1.8GHz processor
- 8GB eMMC flash
- 256MB SPI-NAND Flash
- Micro SD card slot
- 1x 10G SFP+ WAN
- 1x 10G SFP+ LAN
- 4x 2.5G RJ45 LAN (MxL86252C)
- 1x 1G RJ45 LAN (MT7988 internal switch)
- 2x miniPCIe slots with PCIe3.0 2lane interface for Wi-Fi NIC
- 2x M.2 M-KEY slots with PCIe3.0 1lane interface for NVME SSD
- 3x M.2 B-KEY slots with USB3.2 for 5G Module (PCIe shared with key-m)
- 1x USB3.2 slot
- 1x USB2.0 slot
- 1x USB TypeC Debug Console
- 2x13 PIN Header for expanding application

https://docs.banana-pi.org/en/BPI-R4_Pro/BananaPi_BPI-R4_Pro

The PCIe is per default in key-m state and can be changed to key-b with
the pcie-overlays.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 arch/arm64/boot/dts/mediatek/Makefile         |   4 +
 .../mt7988a-bananapi-bpi-r4-pro-4e.dts        |  16 +
 .../mt7988a-bananapi-bpi-r4-pro-8x.dts        |  16 +
 .../mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi | 559 ++++++++++++++++++
 4 files changed, 595 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-4e.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index a4df4c21399e..8640e5f32d4b 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -24,6 +24,8 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986b-rfb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-2g5.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-emmc.dtbo
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-pro-4e.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-pro-8x.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-sd.dtbo
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8167-pumpkin.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm.dtb
@@ -111,4 +113,6 @@ DTC_FLAGS_mt7986a-bananapi-bpi-r3 := -@
 DTC_FLAGS_mt7986a-bananapi-bpi-r3-mini := -@
 DTC_FLAGS_mt7988a-bananapi-bpi-r4 := -@
 DTC_FLAGS_mt7988a-bananapi-bpi-r4-2g5 := -@
+DTC_FLAGS_mt7988a-bananapi-bpi-r4-pro-4e := -@
+DTC_FLAGS_mt7988a-bananapi-bpi-r4-pro-8x := -@
 DTC_FLAGS_mt8395-radxa-nio-12l := -@
diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-4e.dts b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-4e.dts
new file mode 100644
index 000000000000..c7ea6e88c4f4
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-4e.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2025 MediaTek Inc.
+ * Author: Frank Wunderlich <frank-w@public-files.de>
+ */
+
+/dts-v1/;
+
+#include "mt7988a-bananapi-bpi-r4-pro.dtsi"
+
+/ {
+	model = "Bananapi BPI-R4";
+	compatible = "bananapi,bpi-r4-pro-4e",
+		     "bananapi,bpi-r4-pro",
+		     "mediatek,mt7988a";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dts b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dts
new file mode 100644
index 000000000000..c9a0e69e9dd5
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2025 MediaTek Inc.
+ * Author: Frank Wunderlich <frank-w@public-files.de>
+ */
+
+/dts-v1/;
+
+#include "mt7988a-bananapi-bpi-r4-pro.dtsi"
+
+/ {
+	model = "Bananapi BPI-R4";
+	compatible = "bananapi,bpi-r4-pro-8x",
+		     "bananapi,bpi-r4-pro",
+		     "mediatek,mt7988a";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi
new file mode 100644
index 000000000000..44406e23c042
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi
@@ -0,0 +1,559 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2025 MediaTek Inc.
+ * Author: Sam.Shih <sam.shih@mediatek.com>
+ * Author: Frank Wunderlich <frank-w@public-files.de>
+ */
+
+/dts-v1/;
+
+#include "mt7988a.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/regulator/richtek,rt5190a-regulator.h>
+
+/*
+ * ----------------------------------- Bananapi Bpi R4 Pro PINs ---------------------------------
+ * |    | Function                               | Function                                |    |
+ * |----|----------------------------------------|-----------------------------------------|----|
+ * | 1  | 3V3                                    | 5V                                      | 2  |
+ * | 3  | GPIO18/I2C_1_SDA                       | 5V                                      | 4  |
+ * | 5  | GPIO17/I2C_1_SCL                       | GND                                     | 6  |
+ * | 7  | GPIO62/JTAG_JTRST_N/PWM6/I2P5G_LED1_P0 | GPIO59/JTAG_JTDO/UART2_TX/GBE_LED1_P1   | 8  |
+ * | 9  | GND                                    | GPIO58/JTAG_JTDI/UART2_RX/GBE_LED1_P0   | 10 |
+ * | 11 | GPIO81/UART1_TXD                       | GPIO51/PCM_CLK_I2S_BCLK                 | 12 |
+ * | 13 | GPIO80/UART1_RXD                       | GND                                     | 14 |
+ * | 15 | GPIO50/PCM_FS_I2S_LRCK                 | GPIO61/JTAG_JTCLK/UART2_RTS/GBE_LED1_P3 | 16 |
+ * | 17 | 3v3                                    | GPIO60/JTAG_JTMS/UART2_CTS/GBE_LED1_P2  | 18 |
+ * | 19 | GPIO30/SPI1_MOSI                       | GND                                     | 20 |
+ * | 21 | GPIO29/SPI1_MISO                       | GPIO53/PCM_DTX_I2S_DOUT                 | 22 |
+ * | 23 | GPIO31/SPI1_CLK                        | GPIO28/SPI1_CSB                         | 24 |
+ * | 25 | GND                                    | GPIO52/PCM_DRX_I2S_DIN                  | 26 |
+ * |----|----------------------------------------|-----------------------------------------|----|
+ */
+
+/ {
+	aliases {
+		ethernet0 = &gmac0;
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		/* PCA9548 (0-0070) provides 4 i2c channels */
+		i2c3 = &imux0;
+		i2c4 = &imux1_sfp1;
+		i2c5 = &imux2_sfp2;
+		i2c6 = &imux3_wifi;
+	};
+
+	chosen {
+		stdout-path = &serial0;
+		bootargs = "console=ttyS0,115200n1 \
+			    earlycon=uart8250,mmio32,0x11000000";
+	};
+
+	fan: pwm-fan {
+		compatible = "pwm-fan";
+		/* cooling level (0, 1, 2, 3) : (0% duty, 30% duty, 50% duty, 100% duty) */
+		cooling-levels = <0 80 128 255>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pwm0_pins>;
+		pwms = <&pwm 0 50000>;
+		#cooling-cells = <2>;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		button-reset {
+			label = "reset";
+			linux,code = <KEY_RESTART>;
+			gpios = <&pio 13 GPIO_ACTIVE_LOW>;
+		};
+
+		button-wps {
+			label = "WPS";
+			linux,code = <KEY_WPS_BUTTON>;
+			gpios = <&pio 14 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	gpio-leds {
+		compatible = "gpio-leds";
+
+		led_red: sys-led-red {
+			color = <LED_COLOR_ID_RED>;
+			gpios = <&pca9555 15 GPIO_ACTIVE_HIGH>;
+			default-state = "on";
+		};
+
+		led_blue: sys-led-blue {
+			color = <LED_COLOR_ID_BLUE>;
+			gpios = <&pca9555 14 GPIO_ACTIVE_HIGH>;
+			default-state = "on";
+		};
+	};
+
+	reg_1p8v: regulator-1p8v {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-1.8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_3p3v: regulator-3p3v {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-3.3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	/* SFP1 cage (LAN) */
+	sfp1: sfp1 {
+		compatible = "sff,sfp";
+		i2c-bus = <&imux1_sfp1>;
+		los-gpios = <&pio 70 GPIO_ACTIVE_HIGH>;//change4
+		mod-def0-gpios = <&pio 69 GPIO_ACTIVE_LOW>; //change3
+		tx-disable-gpios = <&pio 21 GPIO_ACTIVE_HIGH>; //change1
+		maximum-power-milliwatt = <3000>;
+	};
+
+	/* SFP2 cage (WAN) */
+	sfp2: sfp2 {
+		compatible = "sff,sfp";
+		i2c-bus = <&imux2_sfp2>;
+		los-gpios = <&pio 2 GPIO_ACTIVE_HIGH>;
+		mod-def0-gpios = <&pio 1 GPIO_ACTIVE_LOW>;
+		tx-disable-gpios = <&pio 0 GPIO_ACTIVE_HIGH>;
+		maximum-power-milliwatt = <3000>;
+	};
+};
+
+&cci {
+	proc-supply = <&rt5190_buck3>;
+};
+
+&cpu0 {
+	proc-supply = <&rt5190_buck3>;
+};
+
+&cpu1 {
+	proc-supply = <&rt5190_buck3>;
+};
+
+&cpu2 {
+	proc-supply = <&rt5190_buck3>;
+};
+
+&cpu3 {
+	proc-supply = <&rt5190_buck3>;
+};
+
+&cpu_thermal {
+	trips {
+		cpu_trip_hot: hot {
+			temperature = <120000>;
+			hysteresis = <2000>;
+			type = "hot";
+		};
+
+		cpu_trip_active_high: active-high {
+			temperature = <115000>;
+			hysteresis = <2000>;
+			type = "active";
+		};
+
+		cpu_trip_active_med: active-med {
+			temperature = <85000>;
+			hysteresis = <2000>;
+			type = "active";
+		};
+
+		cpu_trip_active_low: active-low {
+			temperature = <40000>;
+			hysteresis = <2000>;
+			type = "active";
+		};
+	};
+
+	cooling-maps {
+		map-cpu-active-high {
+			/* active: set fan to cooling level 2 */
+			cooling-device = <&fan 3 3>;
+			trip = <&cpu_trip_active_high>;
+		};
+
+		map-cpu-active-med {
+			/* active: set fan to cooling level 1 */
+			cooling-device = <&fan 2 2>;
+			trip = <&cpu_trip_active_med>;
+		};
+
+		map-cpu-active-low {
+			/* active: set fan to cooling level 0 */
+			cooling-device = <&fan 1 1>;
+			trip = <&cpu_trip_active_low>;
+		};
+	};
+};
+
+&fan {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pwm0_pins>;
+	pwms = <&pwm 0 50000>;
+	status = "okay";
+};
+
+&eth {
+	pinctrl-0 = <&mdio0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&gmac0 {
+	status = "okay";
+};
+
+&gsw_phy0 {
+	pinctrl-names = "gbe-led";
+	pinctrl-0 = <&gbe0_led0_pins>;
+};
+
+&gsw_phy0_led0 {
+	status = "okay";
+	color = <LED_COLOR_ID_YELLOW>;
+};
+
+&gsw_port0 {
+	label = "mgmt";
+};
+
+/* R4Pro has only port 0 connected, so disable the others */
+&gsw_phy1 {
+	status = "disabled";
+};
+
+&gsw_port1 {
+	status = "disabled";
+};
+
+&gsw_phy2 {
+	status = "disabled";
+};
+
+&gsw_port2 {
+	status = "disabled";
+};
+
+&gsw_phy3 {
+	status = "disabled";
+};
+
+&gsw_port3 {
+	status = "disabled";
+};
+
+&i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c0_pins>;
+	status = "okay";
+
+	rt5190a_64: rt5190a@64 {
+		compatible = "richtek,rt5190a";
+		reg = <0x64>;
+		vin2-supply = <&rt5190_buck1>;
+		vin3-supply = <&rt5190_buck1>;
+		vin4-supply = <&rt5190_buck1>;
+
+		regulators {
+			rt5190_buck1: buck1 {
+				regulator-name = "rt5190a-buck1";
+				regulator-min-microvolt = <5090000>;
+				regulator-max-microvolt = <5090000>;
+				regulator-allowed-modes =
+				<RT5190A_OPMODE_AUTO RT5190A_OPMODE_FPWM>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck2 {
+				regulator-name = "vcore";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <1400000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			rt5190_buck3: buck3 {
+				regulator-name = "vproc";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <1400000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck4 {
+				regulator-name = "rt5190a-buck4"; //1.8
+				regulator-min-microvolt = <850000>;
+				regulator-max-microvolt = <850000>;
+				regulator-allowed-modes =
+				<RT5190A_OPMODE_AUTO RT5190A_OPMODE_FPWM>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo {
+				regulator-name = "rt5190a-ldo";
+				regulator-min-microvolt = <1200000>; //1.8
+				regulator-max-microvolt = <1200000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+		};
+	};
+};
+
+&i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1_pins>;
+	status = "okay";
+};
+
+&i2c2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c2_1_pins>;
+	status = "okay";
+
+	pca9545: i2c-mux@70 {
+		reg = <0x70>;
+		compatible = "nxp,pca9545";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		imux0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			pca9555: i2c-gpio-expander@20 {
+				compatible = "nxp,pca9555";
+				gpio-controller;
+				#gpio-cells = <2>;
+				reg = <0x20>;
+			};
+
+			rtc@51 {
+				compatible = "nxp,pcf8563";
+				reg = <0x51>;
+			};
+
+			eeprom@57 {
+				compatible = "atmel,24c02";
+				reg = <0x57>;
+				address-width = <8>;
+				pagesize = <8>;
+				size = <256>;
+			};
+		};
+
+		imux1_sfp1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		imux2_sfp2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		imux3_wifi: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+	};
+};
+
+&int_2p5g_phy {
+	status = "disabled";
+};
+
+/* mPCIe SIM2 (11300000) */
+&pcie0 {
+	status = "okay";
+};
+
+/* mPCIe (11310000 near leds) SIM3 */
+&pcie1 {
+	status = "okay";
+};
+
+/* M.2 (11280000) 1L0 key-m SSD1 CN13 / key-b SIM1 CN15 */
+&pcie2 {
+	status = "okay";
+};
+
+/* M.2 (11290000) 1L1 key-m SSD2 CN14 / key-b SIM2 CN18 */
+&pcie3 {
+	status = "okay";
+};
+
+&pio {
+	gbe0_led0_pins: gbe0-led0-pins {
+		mux {
+			function = "led";
+			groups = "gbe0_led0";
+		};
+	};
+
+	i2c0_pins: i2c0-g0-pins {
+		mux {
+			function = "i2c";
+			groups = "i2c0_1";
+		};
+	};
+
+	i2c1_pins: i2c1-g0-pins {
+		mux {
+			function = "i2c";
+			groups = "i2c1_0";
+		};
+	};
+
+	i2c2_1_pins: i2c2-g1-pins {
+		mux {
+			function = "i2c";
+			groups = "i2c2_1";
+		};
+	};
+
+	mdio0_pins: mdio0-pins {
+		mux {
+			function = "eth";
+			groups = "mdc_mdio0";
+		};
+
+		conf {
+			pins = "SMI_0_MDC", "SMI_0_MDIO";
+			drive-strength = <8>;
+		};
+	};
+
+	mmc0_pins_emmc_51: mmc0-emmc-51-pins {
+		mux {
+			function = "flash";
+			groups = "emmc_51";
+		};
+	};
+
+	mmc0_pins_sdcard: mmc0-sdcard-pins {
+		mux {
+			function = "flash";
+			groups = "sdcard";
+		};
+	};
+
+	// 1L0 0=key-b (CN15), 1=key-m (CN13)
+	pcie-2-hog {
+		gpio-hog;
+		gpios = <79 GPIO_ACTIVE_HIGH>;
+		output-high;
+	};
+	// 1L1 0=key-b (CN18), 1=key-m (CN14)
+	pcie-3-hog {
+		gpio-hog;
+		gpios = <63 GPIO_ACTIVE_HIGH>;
+		output-high;
+	};
+
+	pwm0_pins: pwm0-pins {
+		mux {
+			groups = "pwm0";
+			function = "pwm";
+		};
+	};
+
+	spi0_flash_pins: spi0-flash-pins {
+		mux {
+			function = "spi";
+			groups = "spi0", "spi0_wp_hold";
+		};
+	};
+};
+
+&pwm {
+	status = "okay";
+};
+
+&serial0 {
+	status = "okay";
+};
+
+&spi0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi0_flash_pins>;
+	status = "okay";
+	spi_nand: nand@0 {
+		compatible = "spi-nand";
+		reg = <0>;
+		spi-max-frequency = <52000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+	};
+};
+
+&spi_nand {
+	partitions {
+		compatible = "fixed-partitions";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		partition@0 {
+			label = "bl2";
+			reg = <0x0 0x200000>;
+		};
+
+		partition@200000 {
+			label = "ubi";
+			reg = <0x200000 0xfe00000>;
+			compatible = "linux,ubi";
+		};
+	};
+};
+
+/* back USB */
+&ssusb0 {
+	/* Use U2P only instead of both U3P/U2P due to U3P serdes shared with pcie2 */
+	phys = <&xphyu2port0 PHY_TYPE_USB2>;
+	mediatek,u3p-dis-msk = <1>;
+	/delete-property/ mediatek,p0_speed_fixup;
+	status = "okay";
+};
+
+/* front USB */
+&ssusb1 {
+	status = "okay";
+};
+
+&switch {
+	dsa,member = <1 0>;
+	status = "okay";
+};
+
+&tphy {
+	status = "okay";
+};
+
+&watchdog {
+	status = "okay";
+};
+
+&xsphy {
+	status = "okay";
+};
-- 
2.43.0


