Return-Path: <linux-gpio+bounces-29561-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E624CBE768
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Dec 2025 16:03:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 491E1301411B
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Dec 2025 15:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6289A342151;
	Mon, 15 Dec 2025 14:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="yS3qWP8b"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5984E34105A
	for <linux-gpio@vger.kernel.org>; Mon, 15 Dec 2025 14:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765808954; cv=none; b=cOektW4WeK5YWhzZ8cmKXPN5wUBQybOIIhzx9ZBZChrjWNNdviXk8EBy4bBFsE5Hdj50NaG7PwNtw1Pr0tasOexjZ3f5+iWyMAMR2QVLh/Nu73E1/aF/hu4YmEN5h5R+p50SYiRxp1GNZV7mWOnAM3DkXwziWSM2np5bB3IRKAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765808954; c=relaxed/simple;
	bh=3qZMN6RqFSkMZbjjHoXPFV3t/T0/XqJcG5tYrD4IzyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sjPPj8bFboJaHArbWGbpVkba+6gYos8WsU4LxTcaAnigpIBUKpi0a/5RRCE165ubW/wT5NQ4wa6ZOYDBd+wOioFqO2/CQ5/YHYnK/iqoGx10YNLWbG+EteqXREeJ/f5yCo3sihMWBKGQeyKJqeym0JLR24HQtCoSQ3wPc2ZvAmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=yS3qWP8b; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C2035C19D1E;
	Mon, 15 Dec 2025 14:28:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2831160664;
	Mon, 15 Dec 2025 14:29:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 211F611942423;
	Mon, 15 Dec 2025 15:29:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765808950; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=9uIq4HEaC4OUxNjP3TUa7jndQAMD2PvbQyB6H7Zp4Qw=;
	b=yS3qWP8b0bUfmXSCmV8j4k/dxSTR6ZznsFBFI+EMYjYSUHoiY+LTg6p1xCPu3O/Hm/ws5D
	vA6sYb3zJgDBtmwJ0bZXi/swztb/6ayqzowR6C1R0SjK4iUroEAmhdnuQKnUw4mzhD0DEe
	BvhgQlblvk5KxtB0vFmLNKzUZRm3RJ3QlqCIJdHWccJLjQ9c0n+QoxmCBohRb5eL3flE6d
	/QPoG7skDg49r3THOHbk3Xxsw9FJPXdW6gUcuiteMX52+qBqXyuF+aVqRcIqj2UuMx7VM5
	DFC9yjfu2hIBCi8eKH4Z4LMY87r2NK6nB/972sgNr++k/xB7nDO42Nw0lEmSTw==
From: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Saravana Kannan <saravanak@google.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v7 5/8] ARM: dts: r9a06g032: Add GPIO controllers
Date: Mon, 15 Dec 2025 15:28:27 +0100
Message-ID: <20251215142836.167101-6-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215142836.167101-1-herve.codina@bootlin.com>
References: <20251215142836.167101-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add GPIO controllers (Synopsys DesignWare IPs) available in the
r9a06g032 (RZ/N1D) SoC.

Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/renesas/r9a06g032.dtsi | 118 +++++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r9a06g032.dtsi b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
index 8debb77803bb..06d35a83f6e1 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032.dtsi
+++ b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
@@ -509,6 +509,124 @@ gic: interrupt-controller@44101000 {
 				<GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIGH)>;
 		};
 
+		/*
+		 * The GPIO mapping to the corresponding pins is not obvious.
+		 * See the hardware documentation for details.
+		 */
+		gpio0: gpio@5000b000 {
+			compatible = "snps,dw-apb-gpio";
+			reg = <0x5000b000 0x80>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&sysctrl R9A06G032_HCLK_GPIO0>;
+			clock-names = "bus";
+
+			/* GPIO0a[0]      connected to pin  GPIO0      */
+			/* GPIO0a[1..2]   connected to pins GPIO3..4   */
+			/* GPIO0a[3..4]   connected to pins GPIO9..10  */
+			/* GPIO0a[5]      connected to pin  GPIO12     */
+			/* GPIO0a[6..7]   connected to pins GPIO15..16 */
+			/* GPIO0a[8..9]   connected to pins GPIO21..22 */
+			/* GPIO0a[10]     connected to pin  GPIO24     */
+			/* GPIO0a[11..12] connected to pins GPIO27..28 */
+			/* GPIO0a[13..14] connected to pins GPIO33..34 */
+			/* GPIO0a[15]     connected to pin  GPIO36     */
+			/* GPIO0a[16..17] connected to pins GPIO39..40 */
+			/* GPIO0a[18..19] connected to pins GPIO45..46 */
+			/* GPIO0a[20]     connected to pin  GPIO48     */
+			/* GPIO0a[21..22] connected to pins GPIO51..52 */
+			/* GPIO0a[23..24] connected to pins GPIO57..58 */
+			/* GPIO0a[25..31] connected to pins GPIO62..68 */
+			gpio0a: gpio-port@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				reg = <0>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				snps,nr-gpios = <32>;
+			};
+
+			/* GPIO0b[0..1]   connected to pins GPIO1..2   */
+			/* GPIO0b[2..5]   connected to pins GPIO5..8   */
+			/* GPIO0b[6]      connected to pin  GPIO11     */
+			/* GPIO0b[7..8]   connected to pins GPIO13..14 */
+			/* GPIO0b[9..12]  connected to pins GPIO17..20 */
+			/* GPIO0b[13]     connected to pin  GPIO23     */
+			/* GPIO0b[14..15] connected to pins GPIO25..26 */
+			/* GPIO0b[16..19] connected to pins GPIO29..32 */
+			/* GPIO0b[20]     connected to pin  GPIO35     */
+			/* GPIO0b[21..22] connected to pins GPIO37..38 */
+			/* GPIO0b[23..26] connected to pins GPIO41..44 */
+			/* GPIO0b[27]     connected to pin  GPIO47     */
+			/* GPIO0b[28..29] connected to pins GPIO49..50 */
+			/* GPIO0b[30..31] connected to pins GPIO53..54 */
+			gpio0b: gpio-port@1 {
+				compatible = "snps,dw-apb-gpio-port";
+				reg = <1>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				snps,nr-gpios = <32>;
+			};
+		};
+
+		gpio1: gpio@5000c000 {
+			compatible = "snps,dw-apb-gpio";
+			reg = <0x5000c000 0x80>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&sysctrl R9A06G032_HCLK_GPIO1>;
+			clock-names = "bus";
+
+			/* GPIO1a[0..4]  connected to pins GPIO69..73 */
+			/* GPIO1a[5..31] connected to pins GPIO95..121 */
+			gpio1a: gpio-port@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				reg = <0>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				snps,nr-gpios = <32>;
+			};
+
+			/* GPIO1b[0..1]   connected to pins GPIO55..56 */
+			/* GPIO1b[2..4]   connected to pins GPIO59..61 */
+			/* GPIO1b[5..25]  connected to pins GPIO74..94 */
+			/* GPIO1b[26..31] connected to pins GPIO150..155 */
+			gpio1b: gpio-port@1 {
+				compatible = "snps,dw-apb-gpio-port";
+				reg = <1>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				snps,nr-gpios = <32>;
+			};
+		};
+
+		gpio2: gpio@5000d000 {
+			compatible = "snps,dw-apb-gpio";
+			reg = <0x5000d000 0x80>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&sysctrl R9A06G032_HCLK_GPIO2>;
+			clock-names = "bus";
+
+			/* GPIO2a[0..27]  connected to pins GPIO122..149 */
+			/* GPIO2a[28..31] connected to pins GPIO156..159 */
+			gpio2a: gpio-port@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				reg = <0>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				snps,nr-gpios = <32>;
+			};
+
+			/* GPIO2b[0..9] connected to pins GPIO160..169 */
+			gpio2b: gpio-port@1 {
+				compatible = "snps,dw-apb-gpio-port";
+				reg = <1>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				snps,nr-gpios = <10>;
+			};
+		};
+
 		can0: can@52104000 {
 			compatible = "renesas,r9a06g032-sja1000", "renesas,rzn1-sja1000";
 			reg = <0x52104000 0x800>;
-- 
2.52.0


