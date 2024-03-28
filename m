Return-Path: <linux-gpio+bounces-4771-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6513188FF5D
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Mar 2024 13:43:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18EA11F2542A
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Mar 2024 12:43:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 578AC7F7EE;
	Thu, 28 Mar 2024 12:40:52 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa2.ltts.com (unknown [14.140.155.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441637F7C9;
	Thu, 28 Mar 2024 12:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=14.140.155.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711629652; cv=none; b=FQXF1rgT5WZoUZZ2tG8doeiubzOFxzZm9ljNMtVcUbJds2xOdkJ7MBaCPTlxTu/k5MoznALGc2UdKMXQqQ1zdkuWGMsjZgjww4AIta6vkuW94Yg2bjnjsTnLFkHxMLyFMSzch30kyiA25WOuvNnvyU9WIA2oEHc8o4d2ayZKyYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711629652; c=relaxed/simple;
	bh=/z6DZH45bLOkfq/gVueWFPb4M8m52qtDKhLklz3wx38=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=guQ+pzGP7ZyfzT+uxfJBduEd7sBKZ6ef3laxSP2Yucx6a0YjI7vICAPpwFOy5v1/EGkEA/CQJzBBEtM7dRxeD5oSHgfeS7UE17ArPeyrBQBghG2pqzLWvWq9BKahnZxOFNUn7zGe6Fxel8JuJvG2a+TzgXX4W0xnmfr5dk4ssNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ltts.com; spf=pass smtp.mailfrom=ltts.com; arc=none smtp.client-ip=14.140.155.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ltts.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ltts.com
IronPort-SDR: iF3koM0wYBvL3kuqhducpBgPrf6LR3Dcr0Rp8ylMqq7XSmsZPM+t3eseU5MyxwRrTuz/d4CNps
 TMta2LxiKn1w==
Received: from unknown (HELO localhost.localdomain) ([192.168.34.55])
  by esa2.ltts.com with ESMTP; 28 Mar 2024 18:10:46 +0530
From: Bhargav Raviprakash <bhargav.r@ltts.com>
To: linux-kernel@vger.kernel.org
Cc: m.nirmaladevi@ltts.com,
	lee@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	jpanis@baylibre.com,
	devicetree@vger.kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linus.walleij@linaro.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	nm@ti.com,
	vigneshr@ti.com,
	kristo@kernel.org,
	eblanc@baylibre.com,
	Bhargav Raviprakash <bhargav.r@ltts.com>
Subject: [PATCH v5 11/11] arch: arm64: dts: ti: k3-am62p5-sk: Add TPS65224 PMIC support in AM62P dts
Date: Thu, 28 Mar 2024 18:10:16 +0530
Message-Id: <20240328124016.161959-12-bhargav.r@ltts.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240328124016.161959-1-bhargav.r@ltts.com>
References: <20240328124016.161959-1-bhargav.r@ltts.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for TPS65224 PMIC in device tree of AM62P EVM. Adds regulator
configuration, pinmux configurations and pmic device nodes.

Signed-off-by: Bhargav Raviprakash <bhargav.r@ltts.com>
---
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts | 95 +++++++++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
index 1773c05f7..5d8e4321b 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
@@ -112,6 +112,16 @@ vddshv_sdio: regulator-3 {
 		bootph-all;
 	};
 
+	vcc_3v3_main: regulator-4 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_3v3_main";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vmain_pd>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
 	leds {
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
@@ -580,6 +590,12 @@ &main_uart1 {
 &mcu_pmx0 {
 	bootph-all;
 
+	pmic_irq_pins_default: pmic-irq-default-pins {
+		pinctrl-single,pins = <
+			AM62PX_MCU_IOPAD(0x000, PIN_INPUT, 7) /* (B10) MCU_GPIO0_0 */
+		>;
+	};
+
 	wkup_uart0_pins_default: wkup-uart0-default-pins {
 		pinctrl-single,pins = <
 			AM62PX_MCU_IOPAD(0x02c, PIN_INPUT, 0)	/* (C7) WKUP_UART0_CTSn */
@@ -589,6 +605,13 @@ AM62PX_MCU_IOPAD(0x028, PIN_OUTPUT, 0)	/* (D7) WKUP_UART0_TXD */
 		>;
 		bootph-all;
 	};
+
+	wkup_i2c0_pins_default: wkup-i2c0-default-pins {
+		pinctrl-single,pins = <
+			AM62PX_MCU_IOPAD(0x04c, PIN_INPUT, 0) /* (A13) WKUP_I2C0_SCL */
+			AM62PX_MCU_IOPAD(0x050, PIN_INPUT, 0) /* (C11) WKUP_I2C0_SDA */
+		>;
+	};
 };
 
 &wkup_uart0 {
@@ -599,6 +622,78 @@ &wkup_uart0 {
 	bootph-all;
 };
 
+&wkup_i2c0 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&wkup_i2c0_pins_default>;
+	clock-frequency = <400000>;
+
+	tps65224: pmic@48 {
+		compatible = "ti,tps65224-q1";
+		reg = <0x48>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pmic_irq_pins_default>;
+		interrupt-parent = <&mcu_gpio0>;
+		interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
+		ti,primary-pmic;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		buck12-supply = <&vcc_3v3_main>;
+		buck3-supply = <&vcc_3v3_main>;
+		buck4-supply = <&vcc_3v3_main>;
+
+		ldo1-supply = <&vcc_3v3_main>;
+		ldo2-supply = <&vcc_3v3_main>;
+		ldo3-supply = <&vcc1v8_sys>;
+
+		regulators {
+			vcc_core: buck12 {
+				regulator-name = "vcc_core_buck12";
+				regulator-min-microvolt = <715000>;
+				regulator-max-microvolt = <895000>;
+				regulator-always-on;
+			};
+
+			vcc1v8_sys: buck3 {
+				regulator-name = "vcc1v8_sys_buck3";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+
+			vcc1v1: buck4 {
+				regulator-name = "vcc1v1_buck4";
+				regulator-min-microvolt = <1100000>;
+				regulator-max-microvolt = <1100000>;
+				regulator-always-on;
+			};
+
+			vdda1v8: ldo1 {
+				regulator-name = "vdda1v8_ldo1";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+
+			dvdd3v3: ldo2 {
+				regulator-name = "dvdd3v3_ldo2";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			vcc_0v85: ldo3 {
+				regulator-name = "vcc_0v85_ldo3";
+				regulator-min-microvolt = <850000>;
+				regulator-max-microvolt = <850000>;
+				regulator-always-on;
+			};
+		};
+	};
+};
+
 /* mcu_gpio0 and mcu_gpio_intr are reserved for mcu firmware usage */
 &mcu_gpio0 {
 	status = "reserved";
-- 
2.25.1


