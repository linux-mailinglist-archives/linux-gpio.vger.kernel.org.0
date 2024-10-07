Return-Path: <linux-gpio+bounces-10979-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD392993371
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 18:36:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B7361C20EB7
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 16:36:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 713271DC07D;
	Mon,  7 Oct 2024 16:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=getgoogleoff.me header.i=@getgoogleoff.me header.b="LqSOjuX9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3DC1DC056;
	Mon,  7 Oct 2024 16:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728318965; cv=none; b=BMoNe6VEBrpc3dMSMIHG6ywQ6WnoISb7d0tFnvKbBzpZloW+wIcNdw44wStaUEnPM/d1krL9A/CoCAbYjd+btLqhZXtYe1/bqsm7ikZFy4eeqNB62Exp7bnWK2cTb/v2aBozcr+TrmoedF5Y+SXazkw+VotkDul75EpnMxAvAns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728318965; c=relaxed/simple;
	bh=3J7lS4vo42fJFOZkHZb24RgCSwL74kuwtS6Fy4pH4+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a/woOQowmIXOFeW4YmqV3VTUE8E4AvGh2bwWeRkzR39rYocb2LWKAmYMes3tHDfe1Jya8b8dsxl1WVSJ1jiRSJnMEBZ4h20Lm/ZQcScgNoNjrk1Wq4WDdMaJTLn32a2iEB/C/uM95RyjAwkjw4J/2CSCEY0keMBp8BnU73spEVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=getgoogleoff.me; spf=pass smtp.mailfrom=getgoogleoff.me; dkim=pass (2048-bit key) header.d=getgoogleoff.me header.i=@getgoogleoff.me header.b=LqSOjuX9; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=getgoogleoff.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=getgoogleoff.me
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 9B89923FB5;
	Mon,  7 Oct 2024 18:36:01 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f6VDx4q6rNHq; Mon,  7 Oct 2024 18:36:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=getgoogleoff.me;
	s=mail; t=1728318961;
	bh=3J7lS4vo42fJFOZkHZb24RgCSwL74kuwtS6Fy4pH4+g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LqSOjuX9i80Ox6kMKAoENcj63/IonIqxMn9gWU3xD2MiLfel1O7mWWC3r74Y/eLpQ
	 +aKo8DpBqCmcGcwkEoWVo8xdntud4GsyFQon854sia14zcEbiqtQo6mJ4HVibbWh4/
	 LWPEFBjo3HGBwydOOqLr0vh2ZU6OdFbh7jlxAloYgnGF2mzW6CVMirpurwVxqEuqBk
	 8hw2QB+RruuTCWXIqx/+64JbPO7S92Q+PjhjiSgMSyuPlADhJlUk54u3PWmGX2myd2
	 CSWfRzQicidbcqlV2lVkswkvEILbtcd+G12Y8MmO5zGplW1Xv5aS78bv0VkZV4U0Af
	 R+9KvKNDkPYXg==
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
Subject: [PATCH v6 2/5] arm64: dts: qcom: add Linksys EA9350 V3
Date: Tue,  8 Oct 2024 00:34:11 +0800
Message-ID: <20241007163414.32458-3-exxxxkc@getgoogleoff.me>
In-Reply-To: <20241007163414.32458-1-exxxxkc@getgoogleoff.me>
References: <20241007163414.32458-1-exxxxkc@getgoogleoff.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree source for Linksys EA9350 V3
which is a WiFi router based on the IPQ5018 SoC.
As of now , only the UART,USB,USB LED,buttons is working.
The front PWM LED require the IPQ PWM driver.
Therefore the PWM LED isn't configed in the tree.

The original firmware of EA9350V3 from Linksys can only boot ARM32 kernels.
However there seem to a identical device that come with 64bit firmware.
Also There are seems to be no way to boot ARM64 kernels on EA9350.

Therefore,the only way to boot on EA9350 V3 is using this tree and a 32bit kernel.

Signed-off-by: Karl Chan <exxxxkc@getgoogleoff.me>
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/ipq5018-linksys-jamaica.dts | 109 ++++++++++++++++++
 2 files changed, 110 insertions(+)
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
index 000000000000..26dac104bca1
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/ipq5018-linksys-jamaica.dts
@@ -0,0 +1,109 @@
+// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
+
+/dts-v1/;
+
+/*
+ * NOTE: The original firmware of EA9350 V3 from Linksys can only boot ARM32 kernels.
+ * However there seem to a identical device that come with 64bit firmware.
+ * Also There are seems to be no way to boot ARM64 kernels on EA9350.
+ *
+ * Therefore,the only way to boot on EA9350 V3 is using this tree and a 32bit kernel.
+ *
+ * For clarity and build testing this device tree is maintained next
+ * to the other IPQ5018 device trees. However, on EA9350 V3
+ * it is actually used through
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
2.46.2


