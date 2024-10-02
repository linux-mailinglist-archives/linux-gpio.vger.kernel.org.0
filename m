Return-Path: <linux-gpio+bounces-10729-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E15298DF35
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 17:32:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DCD64B2C5F9
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 15:26:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 618E31D0F5D;
	Wed,  2 Oct 2024 15:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=getgoogleoff.me header.i=@getgoogleoff.me header.b="jPIPXd16"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BBD1D0E3E;
	Wed,  2 Oct 2024 15:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727882760; cv=none; b=POchAtQmjyZAXhaKvpS0EW0EbUazpfgs0VlKtBbu0jhfY0cwcHXwH2cnFSWGXDRVU4FnWt8uE9xdqKrrsnDCdoFLvD05u/oc7QjEqklmTbLnVE6UvhnJxXFl0ORJwD750/PhaFSXR1tcRh9T7latszrjfnFNB6tTfW2a3iRlYck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727882760; c=relaxed/simple;
	bh=ITATyZ4Z+JHoH86vgKBaXuWqxfB+G2/InUmiUueNFLA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aSqVaZUSSzftRPrQ/+eFcC9WwozmDjPaLkftBn+H71iiBfrQcIZPq4a0Y6mUWZb9jDEDjozEKPMI6pG2ACEcqA05B+cfSI+G5Wi8m7szd2W/+uJiJt4I38Il85y5i45dLjQfYHoGkxCJDStVq4AhxcsdAfjQgFhPo5MZLUUkHac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=getgoogleoff.me; spf=pass smtp.mailfrom=getgoogleoff.me; dkim=pass (2048-bit key) header.d=getgoogleoff.me header.i=@getgoogleoff.me header.b=jPIPXd16; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=getgoogleoff.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=getgoogleoff.me
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 0509823D44;
	Wed,  2 Oct 2024 17:25:56 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tzvAgrXXORiJ; Wed,  2 Oct 2024 17:25:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=getgoogleoff.me;
	s=mail; t=1727882755;
	bh=ITATyZ4Z+JHoH86vgKBaXuWqxfB+G2/InUmiUueNFLA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jPIPXd16eRR9wg0bg4AD9qSRzsZQhY8z0SyHccssez9pFwI9QNnCWnbDC+CSqy8uJ
	 oLZZM0DRotJeirV6sqOd/cP7mXT9VN3pfMhrkPSf05TGNA0OzKbVEcS6DTC/HNN7eV
	 eKxnGXUUl4M3WM1OX5Dyd11XvUFUEWt3WxSV3YPuwbBgPBLKJXzJrA3oQWYUq4HjW3
	 OR68PaE3rgi8W6DtAZbd9cOIiylurmGkGvRkIVnM+gsRq8jdCkilGPtrVtTryntv0+
	 QZy4sS62F069K/ED1fWOtghiukfEt0RT8PZyFXjNaFsbp/UHzdbqfEfMLxtXZEopmy
	 I210gKnUI+Qng==
From: Karl Chan <exxxxkc@getgoogleoff.me>
To: linux-arm-msm@vger.kernel.org
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	linus.walleij@linaro.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Karl Chan <exxxxkc@getgoogleoff.me>
Subject: [PATCH v3 2/5] arm64: dts: qcom: add Linksys EA9350 V3
Date: Wed,  2 Oct 2024 23:24:16 +0800
Message-ID: <20241002152419.30364-3-exxxxkc@getgoogleoff.me>
In-Reply-To: <20241002152419.30364-1-exxxxkc@getgoogleoff.me>
References: <20241002152419.30364-1-exxxxkc@getgoogleoff.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree source for Linksys EA9350 V3 which is a WiFi router based on the IPQ5018 SoC.

As of now , only the UART,USB,USB LED,buttons is working.The front PWM LED require the IPQ PWM driver.Therefore the PWM LED isn't configed in the tree.

Also The original firmware from Linksys can only boot ARM32 kernels.

As of now There seems to be no way to boot ARM64 kernels on those device.

However, it is possible to use this device tree by compiling an ARM32 kernel instead.

Signed-off-by: Karl Chan <exxxxkc@getgoogleoff.me>
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/ipq5018-linksys-jamaica.dts | 107 ++++++++++++++++++
 2 files changed, 108 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/ipq5018-linksys-jamaica.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index ae002c7cf126..5c6fac2cc8c5 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -10,6 +10,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8039-t2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8094-sony-xperia-kitakami-karin_windy.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-linksys-jamaica.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-rdp432-c2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-tplink-archer-ax55-v1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp441.dtb
diff --git a/arch/arm64/boot/dts/qcom/ipq5018-linksys-jamaica.dts b/arch/arm64/boot/dts/qcom/ipq5018-linksys-jamaica.dts
new file mode 100644
index 000000000000..2fe18733f9ca
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/ipq5018-linksys-jamaica.dts
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
+
+/dts-v1/;
+
+/*
+ * NOTE: The original firmware from Linksys can only boot ARM32 kernels.
+ *
+ * As of now There seems to be no way to boot ARM64 kernels on those device.
+ *
+ * However, it is possible to use this device tree by compiling an ARM32 kernel
+ * instead. For clarity and build testing this device tree is maintained next
+ * to the other IPQ5018 device trees. However, it is actually used through
+ * arch/arm/boot/dts/qcom/qcom-ipq5018-linksys-jamaica.dts
+ */
+
+#include "ipq5018.dtsi"
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/gpio/gpio.h>
+
+
+/ {
+	model = "Linksys EA9350 V3";
+	compatible = "linksys,jamaica", "qcom,ipq5018";
+
+	aliases {
+		serial0 = &blsp1_uart1;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-0 = <&button_pins>;
+		pinctrl-names = "default";
+
+		button-0 {
+			label = "reset";
+			linux,code = <KEY_RESTART>;
+			gpios = <&tlmm 28 GPIO_ACTIVE_LOW>;
+			debounce-interval = <60>;
+		};
+
+		button-1 {
+			label = "wps";
+			linux,code = <KEY_WPS_BUTTON>;
+			gpios = <&tlmm 27 GPIO_ACTIVE_LOW>;
+			debounce-interval = <60>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-0 = <&led_pins>;
+		pinctrl-names = "default";
+
+		led-0 {
+			color = <LED_COLOR_ID_WHITE>;
+			function = LED_FUNCTION_USB;
+			gpios = <&tlmm 19 GPIO_ACTIVE_HIGH>;
+		};
+	};
+};
+
+&blsp1_uart1 {
+	pinctrl-0 = <&uart1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&sleep_clk {
+	clock-frequency = <32000>;
+};
+
+&tlmm {
+	button_pins: button-pins-state {
+		pins = "gpio27", "gpio28";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-up;
+	};
+
+	led_pins: led-pins-state {
+		pins = "gpio19";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};
+
+&usb {
+	status = "okay";
+};
+
+&usb_dwc {
+	dr_mode = "host";
+};
+
+&usbphy0 {
+	status = "okay";
+};
+
+&xo_board_clk {
+	clock-frequency = <24000000>;
+};
-- 
2.46.1


