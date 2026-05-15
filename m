Return-Path: <linux-gpio+bounces-36884-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MIyIAZh0BmrpjwIAu9opvQ
	(envelope-from <linux-gpio+bounces-36884-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 03:19:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D3D54856E
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 03:19:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 94F09301A27D
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 01:18:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FC5C372683;
	Fri, 15 May 2026 01:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R3SyGum8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E3336AB76;
	Fri, 15 May 2026 01:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778807893; cv=none; b=RKF4v3ULKZtjGqkiSjYWznvXVMhn/QoeL3cwDrDQBFZA+a/GoJKGgvI8KHVNUvtk2BWd2j/8nrlSKUppsd3v/kzuO2HYLBXruuXqTxe6LHovhoF5chfC0rYsmv2UDLiWcHxCgKq+dDu8OYqgIjfUS4aVGbR2HvBV8NuPc9ur/wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778807893; c=relaxed/simple;
	bh=U+zoo1UfoWv0yo/Mpvoq8zAtMT7b0RuL9dkWAOW+NwA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dZq0YuWM4wjHsomRHOIX2HqA5WYhwcSorNYBA9L+0l2QF85Wtaw3JcEuKtLhsU/1KmMzGeBIw2wmio/RCMAwB5XiS5tFSKK0O5GYdAv2O/ZEYTcH4Byixv7B8nGPCzAOWimxdgjnLNYRIH/l+fe+u/fR+g9pToWoXfjTHLSauEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R3SyGum8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 32E13C2BCB3;
	Fri, 15 May 2026 01:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778807893;
	bh=U+zoo1UfoWv0yo/Mpvoq8zAtMT7b0RuL9dkWAOW+NwA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=R3SyGum8cbnFvGCyyDO7Gs1wx4PI4jGVv30IVt/LMx+TIKcoWdlRX7E6ytDeuoaov
	 wu3Z9Nwh1aAHQQesnV5NwSnH/jlQQLiYgl8DmjT5LRSk7y0GUz3b8PtIpDnfDDCbBJ
	 +TeRXibWeCi+0sN7GVYTGIApg/JMoUAj1y25Y74dC8cbLxmG+JMmzULgcR/Jg+rynx
	 x4AGic84Sp8I5wPnxfuo+L51jZhENvMhfs7QYrd96p6oM0GY46pyODXcCNvRCxmrz0
	 BDwQ4ZXto1Mtxf9d4ttQEmO+aRbbScbJLx54wPcYSGx1xmyIMwdoqorYe7RznANUTX
	 m///aH4l16yaw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A28CCD4F46;
	Fri, 15 May 2026 01:18:13 +0000 (UTC)
From: Jia Wang via B4 Relay <devnull+wangjia.ultrarisc.com@kernel.org>
Date: Fri, 15 May 2026 09:18:04 +0800
Subject: [PATCH 8/9] riscv: dts: ultrarisc: add Milk-V Titan board device
 tree
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-ultrarisc-pinctrl-v1-8-bf559589ea8a@ultrarisc.com>
References: <20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com>
In-Reply-To: <20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Jia Wang <wangjia@ultrarisc.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778807890; l=7121;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=xX1Mb67eueb8njtg09s4f3y/jZXeNZx3JHf6ugsERgg=;
 b=hO9vbV/B71IzWvgeBG1C/Y3C9z9QXaKWDM4yTnc6xy/nC8RaxNRqRQQhO6Qf+AEN+QbbdWczR
 oBI7NBSDAL+AfHRZBimTcRSzhzmIknJrYko1v+ZssmHXmlxdUDdDzv7
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-Endpoint-Received: by B4 Relay for wangjia@ultrarisc.com/20260515 with
 auth_id=779
X-Original-From: Jia Wang <wangjia@ultrarisc.com>
Reply-To: wangjia@ultrarisc.com
X-Rspamd-Queue-Id: C2D3D54856E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36884-lists,linux-gpio=lfdr.de,wangjia.ultrarisc.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	DBL_PROHIBIT(0.00)[0.0.0.68:email,0.0.0.2:email];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-0.999];
	HAS_REPLYTO(0.00)[wangjia@ultrarisc.com];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ultrarisc.com:email,ultrarisc.com:mid,ultrarisc.com:replyto,0.0.0.1:email,0.0.0.0:email]
X-Rspamd-Action: no action

From: Jia Wang <wangjia@ultrarisc.com>

Milk-V Titan is an ITX motherboard based on the UltraRISC DP1000 SoC.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
 arch/riscv/boot/dts/ultrarisc/Makefile             |   1 +
 .../dts/ultrarisc/dp1000-milkv-titan-pinctrl.dtsi  | 107 ++++++++++++
 .../boot/dts/ultrarisc/dp1000-milkv-titan.dts      | 182 +++++++++++++++++++++
 3 files changed, 290 insertions(+)

diff --git a/arch/riscv/boot/dts/ultrarisc/Makefile b/arch/riscv/boot/dts/ultrarisc/Makefile
index d01a770d3cba..9c27256a2f67 100644
--- a/arch/riscv/boot/dts/ultrarisc/Makefile
+++ b/arch/riscv/boot/dts/ultrarisc/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_ULTRARISC) += dp1000-milkv-titan.dtb
 dtb-$(CONFIG_ARCH_ULTRARISC) += dp1000-rongda-m0.dtb
diff --git a/arch/riscv/boot/dts/ultrarisc/dp1000-milkv-titan-pinctrl.dtsi b/arch/riscv/boot/dts/ultrarisc/dp1000-milkv-titan-pinctrl.dtsi
new file mode 100644
index 000000000000..053206190ec7
--- /dev/null
+++ b/arch/riscv/boot/dts/ultrarisc/dp1000-milkv-titan-pinctrl.dtsi
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright(C) 2026 UltraRISC Technology (Shanghai) Co., Ltd.
+ */
+
+#include "dp1000.dtsi"
+
+&pmx0 {
+	i2c0_pins: i2c0-pins {
+		pins = "PA12", "PA13";
+		function = "func0";
+		bias-pull-up;
+		drive-strength = <33>;
+	};
+
+	i2c1_pins: i2c1-pins {
+		pins = "PB6", "PB7";
+		function = "func0";
+		bias-pull-up;
+		drive-strength = <33>;
+	};
+
+	i2c2_pins: i2c2-pins {
+		pins = "PC0", "PC1";
+		function = "func0";
+		bias-pull-up;
+		drive-strength = <33>;
+	};
+
+	i2c3_pins: i2c3-pins {
+		pins = "PC2", "PC3";
+		function = "func0";
+		bias-pull-up;
+		drive-strength = <33>;
+	};
+
+	io_pins: io-pins {
+		pins = "PA10", "PA15", "PB0", "PB1", "PB2", "PD6", "PD7";
+		function = "gpio";
+		bias-pull-up;
+		drive-strength = <33>;
+	};
+
+	gpio_keys_pins: gpio-keys-pins {
+		pins = "PA4", "PA11", "PA14";
+		function = "gpio";
+		bias-pull-up;
+		drive-strength = <33>;
+	};
+
+	mux_dcdc_pins: mux-dcdc-pins {
+		pins = "PA5";
+		function = "gpio";
+	};
+
+	mux_i2c3_pins: mux-i2c3-pins {
+		pins = "PA6";
+		function = "gpio";
+	};
+
+	mux_uart0_pins: mux-uart0-pins {
+		pins = "PA7";
+		function = "gpio";
+	};
+
+	spi0_pins: spi0-pins {
+		pins = "PD0", "PD1", "PD2", "PD3", "PD4", "PD5";
+		function = "func1";
+		bias-pull-up;
+		drive-strength = <33>;
+	};
+
+	spi1_pins: spi1-pins {
+		pins = "PA0", "PA1", "PA2", "PA3";
+		function = "func0";
+		bias-pull-up;
+		drive-strength = <33>;
+	};
+
+	uart0_pins: uart0-pins {
+		pins = "PA8", "PA9";
+		function = "func1";
+		bias-pull-up;
+		drive-strength = <33>;
+	};
+
+	uart1_pins: uart1-pins {
+		pins = "PB4", "PB5";
+		function = "func0";
+		bias-pull-up;
+		drive-strength = <33>;
+	};
+
+	uart2_pins: uart2-pins {
+		pins = "PC4", "PC5";
+		function = "func0";
+		bias-pull-up;
+		drive-strength = <33>;
+	};
+
+	uart3_pins: uart3-pins {
+		pins = "PC6", "PC7";
+		function = "func0";
+		bias-pull-up;
+		drive-strength = <33>;
+	};
+};
diff --git a/arch/riscv/boot/dts/ultrarisc/dp1000-milkv-titan.dts b/arch/riscv/boot/dts/ultrarisc/dp1000-milkv-titan.dts
new file mode 100644
index 000000000000..21d85c03abe1
--- /dev/null
+++ b/arch/riscv/boot/dts/ultrarisc/dp1000-milkv-titan.dts
@@ -0,0 +1,182 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright(C) 2026 UltraRISC Technology (Shanghai) Co., Ltd.
+ */
+
+#include "dp1000-milkv-titan-pinctrl.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/input/gpio-keys.h>
+#include <dt-bindings/leds/common.h>
+
+/ {
+	model = "Milk-V Titan";
+	compatible = "milkv,titan", "ultrarisc,dp1000";
+
+	aliases {
+		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
+		serial3 = &uart3;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	gpio-poweroff {
+		compatible = "gpio-poweroff";
+		gpios = <&gpio_b 0 GPIO_ACTIVE_LOW>;
+		active-delay-ms = <100>;
+
+		status = "disabled";
+	};
+
+	gpio-restart {
+		compatible = "gpio-restart";
+		gpios = <&gpio_b 1 GPIO_ACTIVE_LOW>;
+		active-delay = <100>;
+
+		status = "disabled";
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&gpio_keys_pins>;
+
+		key-wakeup-0 {
+			label = "Wake-Up";
+			gpios = <&gpio_a 14 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_WAKEUP>;
+			linux,input-type = <EV_KEY>;
+			debounce-interval = <10>;
+			wakeup-source;
+			wakeup-event-action = <EV_ACT_DEASSERTED>;
+		};
+
+		key-wakeup-1 {
+			label = "Power";
+			gpios = <&gpio_a 11 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_POWER>;
+			linux,input-type = <EV_KEY>;
+			debounce-interval = <10>;
+			wakeup-source;
+			wakeup-event-action = <EV_ACT_DEASSERTED>;
+		};
+
+		key-wakeup-2 {
+			label = "Wake-Up-by-USB";
+			gpios = <&gpio_a 4 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_WAKEUP>;
+			linux,input-type = <EV_KEY>;
+			debounce-interval = <10>;
+			wakeup-source;
+			wakeup-event-action = <EV_ACT_DEASSERTED>;
+		};
+	};
+};
+
+&i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c0_pins>;
+};
+
+&i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1_pins>;
+};
+
+&i2c2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c2_pins>;
+
+	rtc@68 {
+		compatible = "st,m41t11";
+		reg = <0x68>;
+	};
+};
+
+&i2c3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c3_pins>;
+};
+
+&spi0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi0_pins>;
+};
+
+&spi1 {
+	num-cs = <1>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi1_pins>;
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pins>;
+};
+
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart1_pins>;
+};
+
+&uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart2_pins>;
+};
+
+&uart3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart3_pins>;
+};
+
+&gpio {
+	pinctrl-names = "default";
+	pinctrl-0 = <&io_pins &mux_dcdc_pins &mux_i2c3_pins &mux_uart0_pins>;
+};
+
+&ethernet {
+	phy-handle = <&phy0>;
+	/*
+	 * RTL8211F: board timing uses PHY strap delays; keep plain "rgmii".
+	 * Enabling PHY internal delays via "rgmii-id" breaks Ethernet traffic.
+	 */
+	phy-mode = "rgmii";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		phy0: phy@0 {
+			reg = <0x00>;
+
+			leds {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				led@1 {
+					label = "eth-link";
+					reg = <0x01>;
+					color = <LED_COLOR_ID_YELLOW>;
+					function = LED_FUNCTION_INDICATOR;
+					default-state = "keep";
+					linux,default-trigger = "netdev";
+				};
+
+				led@2 {
+					label = "eth-activity";
+					reg = <0x02>;
+					color = <LED_COLOR_ID_GREEN>;
+					function = LED_FUNCTION_ACTIVITY;
+					default-state = "keep";
+					linux,default-trigger = "netdev";
+				};
+			};
+		};
+	};
+};

-- 
2.34.1



