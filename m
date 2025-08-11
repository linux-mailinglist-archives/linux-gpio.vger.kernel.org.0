Return-Path: <linux-gpio+bounces-24208-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B21CFB2127E
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 18:47:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 855334621DB
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 16:39:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64FFD29BD8A;
	Mon, 11 Aug 2025 16:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="dF/VohVw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FF1296BBB;
	Mon, 11 Aug 2025 16:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754930376; cv=none; b=RQD7kbZmaNAEGpHZOB7Alq9OVrf82OYhbycm0w86pE1JSVL58C9xSOdN3W0MnKvizWRun3F78vaLbfR7a/RYMlB7LOJEvKHUUIJcMsVpVgWQGdhQhNqath3JI2MJ/bBGYvyKiSPJW03metbgsf7nkAkSEuHIdFvIuwsTZaaWHvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754930376; c=relaxed/simple;
	bh=CImX2ZC8/O9nTsmiCTmo3jTXIWUuTcllD4/cgqtt4O4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cr2TLyn2rAW5gJWdABrQPrj+cFBfwUByOxzXXOkMO27p/bvf02BdS0n64BUojaFsBL6XC2mRKswTAkFprBTbNns10V3obFVGei0fncllYmunXViJKcpCXRjz7l/OmCRJeve43JwDeEm13dGAOOMcsx59SBV4IWYokBEz0SakRdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=dF/VohVw; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 3570725D17;
	Mon, 11 Aug 2025 18:39:33 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n-X6d5Lyl1oP; Mon, 11 Aug 2025 18:39:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1754930372; bh=CImX2ZC8/O9nTsmiCTmo3jTXIWUuTcllD4/cgqtt4O4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dF/VohVwEOAaJpnwJCQGUkpI32kKHPEXLvENEaO66IUsFCiirmwoBOD1Gx8hU8vOK
	 RKI70kZ7QX8kA+TTPdEMQ4YOot113K9edUgmAaztQfxQ+T1hleTVex8C0MChv4uVBA
	 F01kdFjxaSPqUoI30qDUj/PGT75HjEvsIcy6g49gExXweiR8c46V0qccrAA/9FGfID
	 kqFOgE7U+mcGbRn/41QrQiWR4fhdNRVg+k1DTRLr7VCqmZkdWUPLaXUw43B9u4wbch
	 jmmnaHtF1T5ZbY3U2kSzfXiPxoXVTJaaNJzwtHW9VFpBFGhwMWgvwayrjwJ/CwcXke
	 u401OEmB+DZRQ==
From: Yao Zi <ziyao@disroot.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Mingcong Bai <jeffbai@aosc.io>,
	Kexy Biscuit <kexybiscuit@aosc.io>,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH 3/3] LoongArch: dts: Add pinctrl configuration for Loongson 2K0300
Date: Mon, 11 Aug 2025 16:37:50 +0000
Message-ID: <20250811163749.47028-5-ziyao@disroot.org>
In-Reply-To: <20250811163749.47028-2-ziyao@disroot.org>
References: <20250811163749.47028-2-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the pin controller for Loongson 2K0300 SoC. As default settings
for the existing UARTs, pinctrls are added and multiplexed to pins taken
corresponding UART as main functionaility.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 arch/loongarch/boot/dts/loongson-2k0300.dtsi | 39 ++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/loongarch/boot/dts/loongson-2k0300.dtsi b/arch/loongarch/boot/dts/loongson-2k0300.dtsi
index d909a4eca312..a8ad8bd43f5d 100644
--- a/arch/loongarch/boot/dts/loongson-2k0300.dtsi
+++ b/arch/loongarch/boot/dts/loongson-2k0300.dtsi
@@ -9,6 +9,8 @@
 #include <dt-bindings/clock/loongson,ls2k0300-clk.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 
+#define PINMUX(pin, func)	(((pin) << 8) | func)
+
 / {
 	compatible = "loongson,ls2k0300";
 	#address-cells = <2>;
@@ -55,6 +57,35 @@ clk: clock-controller@16000400 {
 			#clock-cells = <1>;
 		};
 
+		pinctrl: pinctrl@16000490 {
+			compatible = "loongson,ls2k0300-pinctrl";
+			reg = <0x0 0x16000490 0x0 0x20>,
+			      <0x0 0x16000110 0x0 0x4>;
+			reg-names = "mux", "drive";
+
+			func-uart {
+				uart0_pins: uart0-pins {
+					pinmux = <PINMUX(40, 0x3)>,
+						 <PINMUX(41, 0x3)>;
+				};
+
+				uart1_pins: uart1-pins {
+					pinmux = <PINMUX(42, 0x3)>,
+						 <PINMUX(43, 0x3)>;
+				};
+
+				uart2_pins: uart2-pins {
+					pinmux = <PINMUX(44, 0x3)>,
+						 <PINMUX(45, 0x3)>;
+				};
+
+				uart3_pins: uart3-pins {
+					pinmux = <PINMUX(46, 0x3)>,
+						 <PINMUX(47, 0x3)>;
+				};
+			};
+		};
+
 		liointc0: interrupt-controller@16001400 {
 			compatible = "loongson,liointc-2.0";
 			reg = <0x0 0x16001400 0x0 0x40>,
@@ -100,6 +131,8 @@ uart0: serial@16100000 {
 			interrupt-parent = <&liointc0>;
 			interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
 			no-loopback-test;
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart0_pins>;
 			status = "disabled";
 		};
 
@@ -109,6 +142,8 @@ uart1: serial@16100400 {
 			interrupt-parent = <&liointc0>;
 			interrupts = <1 IRQ_TYPE_LEVEL_HIGH>;
 			no-loopback-test;
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart1_pins>;
 			status = "disabled";
 		};
 
@@ -118,6 +153,8 @@ uart2: serial@16100800 {
 			interrupt-parent = <&liointc0>;
 			interrupts = <2 IRQ_TYPE_LEVEL_HIGH>;
 			no-loopback-test;
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart2_pins>;
 			status = "disabled";
 		};
 
@@ -127,6 +164,8 @@ uart3: serial@16100c00 {
 			interrupt-parent = <&liointc0>;
 			interrupts = <2 IRQ_TYPE_LEVEL_HIGH>;
 			no-loopback-test;
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart3_pins>;
 			status = "disabled";
 		};
 
-- 
2.50.1


