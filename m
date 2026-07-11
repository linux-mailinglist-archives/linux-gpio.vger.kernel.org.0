Return-Path: <linux-gpio+bounces-39919-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VgjJNn6wUmqKSQMAu9opvQ
	(envelope-from <linux-gpio+bounces-39919-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 23:07:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D9A742EAD
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 23:07:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=nabladev.com header.s=dkim header.b=auBz7epO;
	dmarc=pass (policy=reject) header.from=nabladev.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39919-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39919-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 91C733048A05
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2026 21:02:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2E9E32E6BD;
	Sat, 11 Jul 2026 21:02:12 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72466318B85;
	Sat, 11 Jul 2026 21:01:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783803732; cv=none; b=g47KBSA7A2YnKvOuJ5B6eRob18V2McOQiD2fvFlHemJqDFsWXcGYUcS5fYFW0gYf1UeAM7UbHLgovjQNGDHrYV0zi4wBTcj4C6XSMMkobW9eJEns9DjnFG5kXKVNkTd7aIH0jZdwxhoGRJI69LD2TGl4jFDo0Vitsugwoe/nXa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783803732; c=relaxed/simple;
	bh=R/c1Jp+w18lsMBX92SmZjaQutB56rrveUHrBc1llIHU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hzyOFk9AohLBPHqHxcywmDIQPWcp3RJwlkO0qz7dr47UaKX62tZTzU8+1rwPUC1H8cMQXWS9pHtatORZqOp/1Hpj0mAbcz+Oyw8a13TbLGTgmonAE/34WX3e9J1EYlvRN+gbDCCnaFWGMUS1upbho+cD5LZ3GBqumyvJbxMILmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=auBz7epO; arc=none smtp.client-ip=178.251.229.89
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4086511985A;
	Sat, 11 Jul 2026 23:01:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1783803714; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=vHQaeXhnoMqqWEtw50z+9qpGZM6r2DxrOqHi++a9hDM=;
	b=auBz7epOi7X90FydoeFMyH9gn8vybj69rbfSnyRHJvBEjAW0oaK3sCmz+B8ZxQBnBU/HfA
	cqW5U5aanoKgD85hwbiXjdqgBMNG7J12teyuf9HbHCSUr49FuHf64ecw/kLGSjhMwKeCjt
	Y1JKX+S6sIzHZ/1vNHTm2cNZteFTWBK4E5w+tgbnBs97vQ5O4lzZHvWrApkjxUq0ufGwg1
	EBeBvHiMtSaOh25kesk9URYUhr2lc78DwPZJOe8Kb9nJksjv564b7ZlEi7EaUCnoNT8EDm
	4QhyVvTGzhRVuGnvuzgBcmBf/+W9uYWC1prCTpm9gjxLmMpcmJN9obfQnArp2w==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 09/10] arm64: dts: st: Add support for DH electronics STM32MP23xx/STM32MP25xx DHCOS SoM and Breakout Board and DHSBC
Date: Sat, 11 Jul 2026 22:59:38 +0200
Message-ID: <20260711210131.236025-10-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260711210131.236025-1-marex@nabladev.com>
References: <20260711210131.236025-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nabladev.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[nabladev.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39919-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[marex@nabladev.com,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-kernel@lists.infradead.org,m:marex@nabladev.com,m:alexandre.torgue@foss.st.com,m:brgl@kernel.org,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:kernel@dh-electronics.com,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[nabladev.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marex@nabladev.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 42D9A742EAD

This stm32mp25xx-dhcos-bb board is a stack of DHCOS SoM based on
STM32MP25xx SoC (1200MHz / crypto capabilities) populated on SoM
Breakout Board, the stm32mp255c-dhcos-dhsbc is the SoM populated
on DHSBC carrier board. The stm32mp23xx-dhcos-bb is a stack with
STM32MP23xx SoC.

The SoM contains the following peripherals:
- STPMIC (power delivery)
- 4GiB LPDDR4 memory
- eMMC and SDIO WiFi module

The Breakout Board carrier board contains the following peripherals:
- USB-C peripheral port, power supply plug

The DHSBC carrier board contains the following peripherals:
- Two RGMII Ethernet ports
- MicroSD slot
- LVDS connector
- MIPI CSI2 connector
- USB-A Host port, USB-C power supply plug
- USB-C / DP port
- Expansion connector

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 arch/arm64/boot/dts/st/Makefile               |  10 +
 arch/arm64/boot/dts/st/stm32mp23xc.dtsi       |   7 +
 .../boot/dts/st/stm32mp23xx-dhcos-bb.dts      |  15 +
 .../boot/dts/st/stm32mp23xx-dhcos-som.dtsi    |  51 ++
 ...mp255c-dhcos-dhsbc-overlay-imx219-x10.dtso | 111 +++++
 .../boot/dts/st/stm32mp255c-dhcos-dhsbc.dts   | 189 ++++++++
 arch/arm64/boot/dts/st/stm32mp25xc.dtsi       |   7 +
 .../boot/dts/st/stm32mp25xx-dhcos-bb.dts      |  15 +
 .../boot/dts/st/stm32mp25xx-dhcos-som.dtsi    |  51 ++
 .../boot/dts/st/stm32mp2xxx-dhcos-som.dtsi    | 442 ++++++++++++++++++
 10 files changed, 898 insertions(+)
 create mode 100644 arch/arm64/boot/dts/st/stm32mp23xc.dtsi
 create mode 100644 arch/arm64/boot/dts/st/stm32mp23xx-dhcos-bb.dts
 create mode 100644 arch/arm64/boot/dts/st/stm32mp23xx-dhcos-som.dtsi
 create mode 100644 arch/arm64/boot/dts/st/stm32mp255c-dhcos-dhsbc-overlay-imx219-x10.dtso
 create mode 100644 arch/arm64/boot/dts/st/stm32mp255c-dhcos-dhsbc.dts
 create mode 100644 arch/arm64/boot/dts/st/stm32mp25xc.dtsi
 create mode 100644 arch/arm64/boot/dts/st/stm32mp25xx-dhcos-bb.dts
 create mode 100644 arch/arm64/boot/dts/st/stm32mp25xx-dhcos-som.dtsi
 create mode 100644 arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi

diff --git a/arch/arm64/boot/dts/st/Makefile b/arch/arm64/boot/dts/st/Makefile
index 63908113ae36b..8614554caedd3 100644
--- a/arch/arm64/boot/dts/st/Makefile
+++ b/arch/arm64/boot/dts/st/Makefile
@@ -1,6 +1,16 @@
 # SPDX-License-Identifier: GPL-2.0-only
+
+stm32mp255c-dhcos-dhsbc-overlay-imx219-x10-dtbs := \
+	stm32mp255c-dhcos-dhsbc.dtb \
+	stm32mp255c-dhcos-dhsbc-overlay-imx219-x10.dtbo
+
 dtb-$(CONFIG_ARCH_STM32) += \
 	stm32mp215f-dk.dtb \
 	stm32mp235f-dk.dtb \
+	stm32mp23xx-dhcos-bb.dtb \
+	stm32mp25xx-dhcos-bb.dtb \
+	stm32mp255c-dhcos-dhsbc.dtb \
+	stm32mp255c-dhcos-dhsbc-overlay-imx219-x10.dtb \
+	stm32mp255c-dhcos-dhsbc-overlay-imx219-x10.dtbo \
 	stm32mp257f-dk.dtb \
 	stm32mp257f-ev1.dtb
diff --git a/arch/arm64/boot/dts/st/stm32mp23xc.dtsi b/arch/arm64/boot/dts/st/stm32mp23xc.dtsi
new file mode 100644
index 0000000000000..56872fb1deeb0
--- /dev/null
+++ b/arch/arm64/boot/dts/st/stm32mp23xc.dtsi
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-3-Clause)
+/*
+ * Copyright (C) 2026 Marek Vasut <marex@nabladev.com>
+ */
+
+/ {
+};
diff --git a/arch/arm64/boot/dts/st/stm32mp23xx-dhcos-bb.dts b/arch/arm64/boot/dts/st/stm32mp23xx-dhcos-bb.dts
new file mode 100644
index 0000000000000..125c76fe3e7be
--- /dev/null
+++ b/arch/arm64/boot/dts/st/stm32mp23xx-dhcos-bb.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-3-Clause)
+/*
+ * Copyright (C) 2026 Marek Vasut <marex@nabladev.com>
+ */
+
+/dts-v1/;
+
+#include "stm32mp235.dtsi"
+#include "stm32mp23xc.dtsi"
+#include "stm32mp23xx-dhcos-som.dtsi"
+
+/ {
+	model = "DH electronics STM32MP23xx DHCOS Breakout Board";
+	compatible = "dh,stm32mp231a-dhcos-bb", "dh,stm32mp231a-dhcos-som", "st,stm32mp231";
+};
diff --git a/arch/arm64/boot/dts/st/stm32mp23xx-dhcos-som.dtsi b/arch/arm64/boot/dts/st/stm32mp23xx-dhcos-som.dtsi
new file mode 100644
index 0000000000000..ffdcceb2fa237
--- /dev/null
+++ b/arch/arm64/boot/dts/st/stm32mp23xx-dhcos-som.dtsi
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+/*
+ * Copyright (C) 2025-2026 Marek Vasut <marex@nabladev.com>
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+#include "stm32mp25-pinctrl.dtsi"
+#include "stm32mp25xxak-pinctrl.dtsi"
+#include "stm32mp2xxx-dhcos-som.dtsi"
+
+/ {
+	model = "DH electronics STM32MP23xx DHCOS SoM";
+	compatible = "dh,stm32mp231a-dhcos-som", "st,stm32mp231";
+
+	aliases {
+		serial1 = &usart1;
+		serial2 = &usart2;
+	};
+};
+
+&rv3032 {
+	interrupts-extended = <&gpiod 10 IRQ_TYPE_EDGE_FALLING>;
+};
+
+/* Bluetooth */
+&usart1 {
+	pinctrl-names = "default", "sleep", "idle";
+	pinctrl-0 = <&usart1_pins_a>;
+	pinctrl-1 = <&usart1_sleep_pins_a>;
+	pinctrl-2 = <&usart1_idle_pins_a>;
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "infineon,cyw55572-bt";
+		brcm,requires-autobaud-mode;
+		max-speed = <3000000>;
+		shutdown-gpios = <&ioexp 2 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&usart2 {
+	pinctrl-names = "default", "sleep", "idle";
+	pinctrl-0 = <&usart2_pins_b>;
+	pinctrl-1 = <&usart2_sleep_pins_b>;
+	pinctrl-2 = <&usart2_idle_pins_b>;
+	uart-has-rtscts;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/st/stm32mp255c-dhcos-dhsbc-overlay-imx219-x10.dtso b/arch/arm64/boot/dts/st/stm32mp255c-dhcos-dhsbc-overlay-imx219-x10.dtso
new file mode 100644
index 0000000000000..fbec84eb7720f
--- /dev/null
+++ b/arch/arm64/boot/dts/st/stm32mp255c-dhcos-dhsbc-overlay-imx219-x10.dtso
@@ -0,0 +1,111 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-3-Clause)
+/*
+ * Copyright (C) 2026 Marek Vasut <marex@nabladev.com>
+ *
+ * Set up pipeline for raw bayer capture:
+ * $ media-ctl -d platform:48030000.dcmipp -r
+ * $ media-ctl -d platform:48030000.dcmipp -l '"48020000.csi":1->"dcmipp_input":0[1]'
+ * $ media-ctl -d platform:48030000.dcmipp -l "'dcmipp_input':1->'dcmipp_dump_postproc':0[1]"
+ * $ media-ctl -d platform:48030000.dcmipp --set-v4l2 "'imx219 0-0010':0[fmt:SRGGB8_1X8/1920x1080]"
+ * $ media-ctl -d platform:48030000.dcmipp --set-v4l2 "'48020000.csi':1[fmt:SRGGB8_1X8/1920x1080]"
+ * $ media-ctl -d platform:48030000.dcmipp --set-v4l2 "'dcmipp_input':1[fmt:SRGGB8_1X8/1920x1080 field:none]"
+ * $ media-ctl -d platform:48030000.dcmipp --set-v4l2 "'dcmipp_dump_postproc':0[compose:(0,0)/1920x1080]"
+ * $ media-ctl -d platform:48030000.dcmipp --set-v4l2 "'dcmipp_dump_postproc':1[fmt:SRGGB8_1X8/1920x1080]"
+ * $ v4l2-ctl -d /dev/video0 --set-fmt-video=width=1920,height=1080,pixelformat=RGGB
+ *
+ * Capture frame using v4l2-ctl:
+ * $ v4l2-ctl -d /dev/video0 --stream-mmap --stream-count=1 --stream-to=/frame.raw
+ *
+ * Capture frame using gstreamer:
+ * $ gst-launch-1.0 v4l2src device=/dev/video0 num-buffers=1 ! \
+ *                  video/x-bayer,width=1920,height=1080,format=rggb ! \
+ *                  bayer2rgb ! jpegenc ! filesink location=/test.jpg
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	clk_cam_x10: clk-cam-j1 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+	};
+
+	/* Page 29 / CSI_IF_CN / J1 */
+	reg_cam_x10: reg-cam-j1 {
+		compatible = "regulator-fixed";
+		regulator-name = "cam-X10";
+		enable-active-high;
+		gpios = <&ioexp 13 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&csi {
+	vdd-supply = <&scmi_vddcore>;
+	vdda18-supply = <&scmi_v1v8>;
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			csi_sink: endpoint {
+				remote-endpoint = <&imx219_x10_out>;
+				data-lanes = <1 2>;
+				bus-type = <4>;
+			};
+		};
+		port@1 {
+			reg = <1>;
+
+			csi_source: endpoint {
+				remote-endpoint = <&dcmipp_0>;
+			};
+		};
+	};
+};
+
+&dcmipp {
+	status = "okay";
+
+	port {
+		dcmipp_0: endpoint {
+			remote-endpoint = <&csi_source>;
+			bus-type = <4>;
+		};
+	};
+};
+
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	cam@10 {
+		compatible = "sony,imx219";
+		reg = <0x10>;
+
+		clocks = <&clk_cam_x10>;
+
+		VANA-supply = <&reg_cam_x10>;
+		VDIG-supply = <&reg_cam_x10>;
+		VDDL-supply = <&reg_cam_x10>;
+
+		orientation = <2>;
+		rotation = <0>;
+
+		port {
+			imx219_x10_out: endpoint {
+				clock-noncontinuous;
+				link-frequencies = /bits/ 64 <456000000>;
+				data-lanes = <1 2>;
+				remote-endpoint = <&csi_sink>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/st/stm32mp255c-dhcos-dhsbc.dts b/arch/arm64/boot/dts/st/stm32mp255c-dhcos-dhsbc.dts
new file mode 100644
index 0000000000000..1d750d2787d6f
--- /dev/null
+++ b/arch/arm64/boot/dts/st/stm32mp255c-dhcos-dhsbc.dts
@@ -0,0 +1,189 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-3-Clause)
+/*
+ * Copyright (C) 2025-2026 Marek Vasut <marex@nabladev.com>
+ */
+
+/dts-v1/;
+
+#include "stm32mp255.dtsi"
+#include "stm32mp25xc.dtsi"
+#include "stm32mp25xx-dhcos-som.dtsi"
+
+/ {
+	model = "DH electronics STM32MP255C DHCOS DHSBC";
+	compatible = "dh,stm32mp255c-dhcos-dhsbc", "dh,stm32mp255c-dhcos-som", "st,stm32mp255";
+
+	aliases {
+		ethernet0 = &ethernet1;
+		ethernet1 = &ethernet2;
+	};
+};
+
+&ethernet1 {
+	phy-handle = <&ethphy1>;
+	phy-mode = "rgmii-id";
+	pinctrl-0 = <&eth1_mdio_pins_a &eth1_rgmii_pins_a>;
+	pinctrl-1 = <&eth1_mdio_sleep_pins_a &eth1_rgmii_sleep_pins_a>;
+	pinctrl-names = "default", "sleep";
+	st,ext-phyclk;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "snps,dwmac-mdio";
+
+		ethphy1: ethernet-phy@1 {
+			/* RTL8211F */
+			compatible = "ethernet-phy-id001c.c916";
+			interrupt-parent = <&gpioc>;
+			interrupts = <6 IRQ_TYPE_LEVEL_LOW>;
+			reg = <1>;
+			realtek,clkout-disable;
+			realtek,clkout-ssc-enable;
+			realtek,rxc-ssc-enable;
+			realtek,sysclk-ssc-enable;
+			reset-assert-us = <15000>;
+			reset-deassert-us = <55000>;
+			reset-gpios = <&ioexp 1 GPIO_ACTIVE_LOW>;
+
+			leds {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				led@0 {
+					reg = <0>;
+					color = <LED_COLOR_ID_GREEN>;
+					function = LED_FUNCTION_WAN;
+					linux,default-trigger = "netdev";
+				};
+
+				led@1 {
+					reg = <1>;
+					color = <LED_COLOR_ID_YELLOW>;
+					function = LED_FUNCTION_WAN;
+					linux,default-trigger = "netdev";
+				};
+			};
+		};
+	};
+};
+
+&ethernet2 {
+	phy-handle = <&ethphy2>;
+	phy-mode = "rgmii-id";
+	pinctrl-0 = <&eth2_mdio_pins_a &eth2_rgmii_pins_b>;
+	pinctrl-1 = <&eth2_mdio_sleep_pins_a &eth2_rgmii_sleep_pins_b>;
+	pinctrl-names = "default", "sleep";
+	st,ext-phyclk;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "snps,dwmac-mdio";
+
+		ethphy2: ethernet-phy@1 {
+			/* RTL8211F */
+			compatible = "ethernet-phy-id001c.c916";
+			interrupt-parent = <&gpiog>;
+			interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+			reg = <1>;
+			realtek,clkout-disable;
+			realtek,clkout-ssc-enable;
+			realtek,rxc-ssc-enable;
+			realtek,sysclk-ssc-enable;
+			reset-assert-us = <15000>;
+			reset-deassert-us = <55000>;
+			reset-gpios = <&ioexp 0 GPIO_ACTIVE_LOW>;
+
+			leds {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				led@0 {
+					reg = <0>;
+					color = <LED_COLOR_ID_GREEN>;
+					function = LED_FUNCTION_LAN;
+					linux,default-trigger = "netdev";
+				};
+
+				led@1 {
+					reg = <1>;
+					color = <LED_COLOR_ID_YELLOW>;
+					function = LED_FUNCTION_LAN;
+					linux,default-trigger = "netdev";
+				};
+			};
+		};
+	};
+};
+
+&gpioa {
+	gpio-line-names = "DHSBC_HW-CODE_0", "DHSBC_HW-CODE_1", "DHSBC_HW-CODE_2", "",
+			  "DHCOS-E", "DHCOS-J", "", "",
+			  "DHCOS-D", "", "", "",
+			  "", "", "", "";
+};
+
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&i2c2_pins_a>;
+	pinctrl-1 = <&i2c2_sleep_pins_a>;
+	i2c-scl-rising-time-ns = <57>;
+	i2c-scl-falling-time-ns = <7>;
+	clock-frequency = <400000>;
+	status = "okay";
+};
+
+&scmi_vddio1 {
+	regulator-min-microvolt = <1800000>;
+	regulator-max-microvolt = <3300000>;
+	regulator-settling-time-up-us = <1000>;
+	regulator-settling-time-down-us = <100000>;
+};
+
+&sdmmc1 {
+	pinctrl-names = "default", "opendrain", "sleep";
+	pinctrl-0 = <&sdmmc1_b4_pins_b>;
+	pinctrl-1 = <&sdmmc1_b4_od_pins_b>;
+	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
+	cd-gpios = <&ioexp 8 GPIO_ACTIVE_HIGH>;
+	disable-wp;
+	st,neg-edge;
+	bus-width = <4>;
+	vmmc-supply = <&scmi_v3v3>;
+	vqmmc-supply = <&scmi_vddio1>;
+	sd-uhs-sdr12;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-ddr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};
+
+&spi1 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&spi1_pins_a>;
+	pinctrl-1 = <&spi1_sleep_pins_a>;
+	cs-gpios = <&gpioh 3 0>;
+	status = "okay";
+
+	st33htph: tpm@0 {
+		compatible = "st,st33htpm-spi", "tcg,tpm_tis-spi";
+		reg = <0>;
+		interrupt-parent = <&gpioa>;
+		interrupts = <5 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&gpioh 2 GPIO_ACTIVE_LOW>;
+		spi-max-frequency = <24000000>;
+	};
+};
+
+&spi8 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&spi8_pins_b>;
+	pinctrl-1 = <&spi8_sleep_pins_b>;
+	cs-gpios = <&gpioz 6 0>;
+};
diff --git a/arch/arm64/boot/dts/st/stm32mp25xc.dtsi b/arch/arm64/boot/dts/st/stm32mp25xc.dtsi
new file mode 100644
index 0000000000000..56872fb1deeb0
--- /dev/null
+++ b/arch/arm64/boot/dts/st/stm32mp25xc.dtsi
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-3-Clause)
+/*
+ * Copyright (C) 2026 Marek Vasut <marex@nabladev.com>
+ */
+
+/ {
+};
diff --git a/arch/arm64/boot/dts/st/stm32mp25xx-dhcos-bb.dts b/arch/arm64/boot/dts/st/stm32mp25xx-dhcos-bb.dts
new file mode 100644
index 0000000000000..cf66e8e48c99a
--- /dev/null
+++ b/arch/arm64/boot/dts/st/stm32mp25xx-dhcos-bb.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-3-Clause)
+/*
+ * Copyright (C) 2025-2026 Marek Vasut <marex@nabladev.com>
+ */
+
+/dts-v1/;
+
+#include "stm32mp255.dtsi"
+#include "stm32mp25xc.dtsi"
+#include "stm32mp25xx-dhcos-som.dtsi"
+
+/ {
+	model = "DH electronics STM32MP25xx DHCOS Breakout Board";
+	compatible = "dh,stm32mp251a-dhcos-bb", "dh,stm32mp251a-dhcos-som", "st,stm32mp251";
+};
diff --git a/arch/arm64/boot/dts/st/stm32mp25xx-dhcos-som.dtsi b/arch/arm64/boot/dts/st/stm32mp25xx-dhcos-som.dtsi
new file mode 100644
index 0000000000000..23c25ea086445
--- /dev/null
+++ b/arch/arm64/boot/dts/st/stm32mp25xx-dhcos-som.dtsi
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+/*
+ * Copyright (C) 2025-2026 Marek Vasut <marex@nabladev.com>
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+#include "stm32mp25-pinctrl.dtsi"
+#include "stm32mp25xxak-pinctrl.dtsi"
+#include "stm32mp2xxx-dhcos-som.dtsi"
+
+/ {
+	model = "DH electronics STM32MP25xx DHCOS SoM";
+	compatible = "dh,stm32mp251a-dhcos-som", "st,stm32mp251";
+
+	aliases {
+		serial1 = &uart8;
+		serial2 = &uart9;
+	};
+};
+
+&rv3032 {
+	interrupts-extended = <&gpioi 10 IRQ_TYPE_EDGE_FALLING>;
+};
+
+/* Bluetooth */
+&uart8 {
+	pinctrl-names = "default", "sleep", "idle";
+	pinctrl-0 = <&uart8_pins_a>;
+	pinctrl-1 = <&uart8_sleep_pins_a>;
+	pinctrl-2 = <&uart8_idle_pins_a>;
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "infineon,cyw55572-bt";
+		brcm,requires-autobaud-mode;
+		max-speed = <3000000>;
+		shutdown-gpios = <&ioexp 2 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&uart9 {
+	pinctrl-names = "default", "sleep", "idle";
+	pinctrl-0 = <&uart9_pins_a>;
+	pinctrl-1 = <&uart9_sleep_pins_a>;
+	pinctrl-2 = <&uart9_idle_pins_a>;
+	uart-has-rtscts;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi b/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
new file mode 100644
index 0000000000000..330c7c6768b6c
--- /dev/null
+++ b/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
@@ -0,0 +1,442 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+/*
+ * Copyright (C) 2025-2026 Marek Vasut <marex@nabladev.com>
+ */
+
+/ {
+	aliases {
+		mmc0 = &sdmmc2;
+		mmc1 = &sdmmc3;
+		serial0 = &usart6;
+		serial1 = &uart8;
+		eeprom0 = &eeprom0;
+		eeprom0wl = &eeprom0wl;
+		rtc0 = &rv3032;
+		rtc1 = &rtc;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x1 0x0>;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/* Internal RAM reserved memory declaration */
+		tfa_bl31: tfa-bl31@a000000 {
+			reg = <0x0 0xa000000 0x0 0x20000>;
+			no-map;
+		};
+
+		hpdma1_lli: hpdma1-lli@a020000 {
+			reg = <0x0 0xa020000 0x0 0xf0f0>;
+			no-map;
+		};
+
+		hpdma2_lli: hpdma2-lli@a02f0f0 {
+			reg = <0x0 0xa02f0f0 0x0 0xf0f0>;
+			no-map;
+		};
+
+		hpdma3_lli: hpdma3-lli@a03e1e0 {
+			reg = <0x0 0xa03e1e0 0x0 0x1e20>;
+			no-map;
+		};
+
+		bsec_mirror: bsec-mirror@a040000 {
+			reg = <0x0 0xa040000 0x0 0x1000>;
+			no-map;
+		};
+
+		scmi_cid2_s: scmi-cid2-s@a041000 {
+			reg = <0x0 0xa041000 0x0 0x1000>;
+			no-map;
+		};
+
+		scmi_cid2_ns: scmi-cid2-ns@a042000 {
+			reg = <0x0 0xa042000 0x0 0x1000>;
+			no-map;
+		};
+
+		cm33_sram1: cm33-sram1@a043000 {
+			reg = <0x0 0xa043000 0x0 0x1d000>;
+			no-map;
+		};
+
+		cm33_sram2: cm33-sram2@a060000 {
+			reg = <0x0 0xa060000 0x0 0x20000>;
+			no-map;
+		};
+
+		cm33_retram: cm33-retram@a080000 {
+			reg = <0x0 0xa080000 0x0 0x1f000>;
+			no-map;
+		};
+
+		ddr_param: ddr-param@a09f000 {
+			reg = <0x0 0xa09f000 0x0 0x1000>;
+			no-map;
+		};
+
+		cm0_cube_fw: cm0-cube-fw@200C0000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x200C0000 0x0 0x4000>;
+			no-map;
+		};
+
+		cm0_cube_data: cm0-cube-data@200C4000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x200C4000 0x0 0x2000>;
+			no-map;
+		};
+
+		ipc_shmem_2: ipc-shmem-2@200C6000{
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x200C6000 0x0 0x2000>;
+			no-map;
+		};
+
+		/* Backup RAM reserved memory declaration */
+		bl31_lowpower: bl31-lowpower@42000000 {
+			reg = <0x0 0x42000000 0x0 0x1000>;
+			no-map;
+		};
+
+		tfm_its: tfm-its@42001000 {
+			reg = <0x0 0x42001000 0x0 0x1000>;
+			no-map;
+		};
+
+		/* Octo Memory Manager reserved memory declaration */
+		mm_ospi1: mm-ospi@60000000 {
+			reg = <0x0 0x60000000 0x0 0x10000000>;
+			no-map;
+		};
+
+		/* DDR reserved memory declaration */
+		tfm_code: tfm-code@80000000 {
+			reg = <0x0 0x80000000 0x0 0x100000>;
+			no-map;
+		};
+
+		cm33_cube_fw: cm33-cube-fw@80100000 {
+			reg = <0x0 0x80100000 0x0 0x800000>;
+			no-map;
+		};
+
+		tfm_data: tfm-data@80900000 {
+			reg = <0x0 0x80900000 0x0 0x100000>;
+			no-map;
+		};
+
+		cm33_cube_data: cm33-cube-data@80a00000 {
+			reg = <0x0 0x80a00000 0x0 0x800000>;
+			no-map;
+		};
+
+		ipc_shmem_1: ipc-shmem-1@81200000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x81200000 0x0 0xf8000>;
+			no-map;
+		};
+
+		vdev0vring0: vdev0vring0@812f8000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x812f8000 0x0 0x1000>;
+			no-map;
+		};
+
+		vdev0vring1: vdev0vring1@812f9000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x812f9000 0x0 0x1000>;
+			no-map;
+		};
+
+		vdev0buffer: vdev0buffer@812fa000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x812fa000 0x0 0x6000>;
+			no-map;
+		};
+
+		spare1: spare1@81300000 {
+			reg = <0x0 0x81300000 0x0 0xcc0000>;
+			no-map;
+		};
+
+		bl31_context: bl31-context@81fc0000 {
+			reg = <0x0 0x81fc0000 0x0 0x40000>;
+			no-map;
+		};
+
+		op_tee: op-tee@82000000 {
+			reg = <0x0 0x82000000 0x0 0x2000000>;
+			no-map;
+		};
+
+		gpu_reserved: gpu-reserved@fa800000 {
+			reg = <0x0 0xfa800000 0x0 0x4000000>;
+			no-map;
+		};
+
+		ltdc_sec_layer: ltdc-sec-layer@fe800000 {
+			reg = <0x0 0xfe800000 0x0 0x800000>;
+			no-map;
+		};
+
+		ltdc_sec_rotation: ltdc-sec-rotation@ff000000 {
+			reg = <0x0 0xff000000 0x0 0x1000000>;
+			no-map;
+		};
+
+		/* global autoconfigured region for contiguous allocations */
+		linux,cma {
+			compatible = "shared-dma-pool";
+			reusable;
+			alloc-ranges = <0 0x80000000 0 0x80000000>;
+			size = <0x0 0x8000000>;
+			alignment = <0x0 0x2000>;
+			linux,cma-default;
+		};
+	};
+
+	sdio_pwrseq: sdio-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		post-power-on-delay-ms = <50>;
+		reset-gpios = <&ioexp 3 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&arm_wdt {
+	timeout-sec = <32>;
+	status = "okay";
+};
+
+&gpioa {
+	gpio-line-names = "", "DHCOS-M", "DHCOS-K", "DHCOS-L",
+			  "DHCOS-E", "DHCOS-J", "", "",
+			  "DHCOS-D", "", "", "",
+			  "", "", "", "";
+};
+
+&gpiof {
+	gpio-line-names = "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "DHCOS_RAM-CODE_2";
+};
+
+&gpiog {
+	gpio-line-names = "", "", "", "",
+			  "", "", "", "",
+			  "", "DHCOS_RAM-CODE_0", "DHCOS_RAM-CODE_1", "",
+			  "", "", "DHCOS-F", "DHCOS_HW-CODE_0";
+};
+
+&gpioh {
+	gpio-line-names = "", "", "DHCOS-I", "DHCOS-N",
+			  "", "", "DHCOS-O", "DHCOS-H",
+			  "DHCOS-G", "", "", "",
+			  "", "", "", "";
+};
+
+&gpioi {
+	gpio-line-names = "DHCOS_HW-CODE_1", "DHCOS_HW-CODE_2", "", "",
+			  "", "", "", "",
+			  "", "DHCOS-C", "", "",
+			  "", "", "", "";
+};
+
+&gpioz {
+	gpio-line-names = "", "", "DHCOS-A", "DHCOS-B",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "";
+};
+
+&i2c8 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&i2c8_pins_b>;
+	pinctrl-1 = <&i2c8_sleep_pins_b>;
+	i2c-scl-rising-time-ns = <57>;
+	i2c-scl-falling-time-ns = <7>;
+	clock-frequency = <400000>;
+	status = "okay";
+
+	ioexp: gpio@20 {
+		compatible = "kinetic,kts1622", "ti,tcal6416";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupts-extended = <&gpiod 11 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		wakeup-source;
+
+		gpio-line-names =
+			"#ETH1_RST_P0_0", "#ETH0_RST_P0_1",
+			"BT_REG_ON_P0_2", "WL_REG_ON_P0_3",
+			"USB1_PWR_EN_P0_4", "USB1_PWR_STAT_P0_5",
+			"USB0_PWR_EN_P0_6", "USB0_PWR_STAT_P0_7",
+			"SDIO0_CD_P1_0", "USB0_SS_SEL_P1_1",
+			"#PCIe_RST_1_2", "#PCIe_Wake_P1_3",
+			"#QSPI_RST_P1_4", "#CSI0_PWDN_P1_5",
+			"#CSI0_RST_P1_6", "#ETH3_RST_P1_7";
+	};
+
+	eeprom0: eeprom@50 {
+		compatible = "atmel,24c256";	/* ST M24256 */
+		reg = <0x50>;
+		pagesize = <64>;
+	};
+
+	rv3032: rtc@51 {
+		compatible = "microcrystal,rv3032";
+		reg = <0x51>;
+		wakeup-source;
+	};
+
+	eeprom0wl: eeprom@58 {
+		compatible = "st,24256e-wl";	/* ST M24256E WL page of 0x50 */
+		pagesize = <64>;
+		reg = <0x58>;
+	};
+};
+
+&ommanager {
+	memory-region = <&mm_ospi1>;
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&ospi_port1_clk_pins_a
+		     &ospi_port1_io03_pins_a
+		     &ospi_port1_cs0_pins_a>;
+	pinctrl-1 = <&ospi_port1_clk_sleep_pins_a
+		     &ospi_port1_io03_sleep_pins_a
+		     &ospi_port1_cs0_sleep_pins_a>;
+	pinctrl-names = "default", "sleep";
+	status = "okay";
+};
+
+&ospi1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	memory-region = <&mm_ospi1>;
+	status = "okay";
+
+	flash0: flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
+		spi-max-frequency = <100000000>;
+	};
+};
+
+&rtc {
+	status = "okay";
+};
+
+&scmi_regu {
+	scmi_vddcore: regulator@b {
+		reg = <VOLTD_SCMI_STPMIC2_BUCK2>;
+		regulator-name = "vddcore";
+	};
+
+	regulator@c {
+		reg = <VOLTD_SCMI_STPMIC2_BUCK3>;
+		regulator-name = "vddgpu";
+		regulator-always-on;
+	};
+
+	scmi_v1v8: regulator@e {
+		reg = <VOLTD_SCMI_STPMIC2_BUCK5>;
+		regulator-name = "v1v8";
+		regulator-always-on;
+	};
+
+	scmi_v3v3: regulator@10 {
+		reg = <VOLTD_SCMI_STPMIC2_BUCK7>;
+		regulator-name = "v3v3";
+		regulator-always-on;
+	};
+
+	scmi_vdd_emmc: regulator@12 {
+		reg = <VOLTD_SCMI_STPMIC2_LDO2>;
+		regulator-name = "vdd_emmc";
+	};
+
+	scmi_vdd3v3_usb: regulator@14 {
+		reg = <VOLTD_SCMI_STPMIC2_LDO4>;
+		regulator-name = "vdd3v3_usb";
+	};
+
+	scmi_vdd_sdcard: regulator@17 {
+		reg = <VOLTD_SCMI_STPMIC2_LDO7>;
+		regulator-name = "vdd_sdcard";
+	};
+};
+
+&scmi_vddio3 {
+	regulator-always-on;
+};
+
+&scmi_vddio4 {
+	regulator-always-on;
+};
+
+&sdmmc2 {
+	pinctrl-names = "default", "opendrain", "sleep";
+	pinctrl-0 = <&sdmmc2_b4_pins_a &sdmmc2_d47_pins_a>;
+	pinctrl-1 = <&sdmmc2_b4_od_pins_a &sdmmc2_d47_pins_a>;
+	pinctrl-2 = <&sdmmc2_b4_sleep_pins_a &sdmmc2_d47_sleep_pins_a>;
+	non-removable;
+	no-sd;
+	no-sdio;
+	st,neg-edge;
+	bus-width = <8>;
+	vmmc-supply = <&scmi_vdd_emmc>;
+	vqmmc-supply = <&scmi_vddio2>;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	status = "okay";
+};
+
+&sdmmc3 {
+	pinctrl-names = "default", "opendrain", "sleep";
+	pinctrl-0 = <&sdmmc3_b4_pins_b>;
+	pinctrl-1 = <&sdmmc3_b4_od_pins_b>;
+	pinctrl-2 = <&sdmmc3_b4_sleep_pins_b>;
+	bus-width = <4>;
+	keep-power-in-suspend;
+	non-removable;
+	no-sd;
+	no-mmc;
+	st,neg-edge;
+	vmmc-supply = <&scmi_v3v3>;
+	vqmmc-supply = <&scmi_v1v8>;
+	mmc-pwrseq = <&sdio_pwrseq>;
+	status = "okay";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	brcmf: wifi@1 {	/* muRata 2FY */
+		reg = <1>;
+		compatible = "brcm,bcm4329-fmac";
+	};
+};
+
+&usart6 {
+	pinctrl-names = "default", "idle", "sleep";
+	pinctrl-0 = <&usart6_pins_b>;
+	pinctrl-1 = <&usart6_idle_pins_b>;
+	pinctrl-2 = <&usart6_sleep_pins_b>;
+	/delete-property/dmas;
+	/delete-property/dma-names;
+	status = "okay";
+};
-- 
2.53.0


