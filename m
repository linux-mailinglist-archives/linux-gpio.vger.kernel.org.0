Return-Path: <linux-gpio+bounces-26493-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C5254B91FE0
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 17:39:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF9B2440353
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 15:36:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01BB12E7BD3;
	Mon, 22 Sep 2025 15:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="xY9gh6OL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFE32E7BB3;
	Mon, 22 Sep 2025 15:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758554839; cv=none; b=GYY5WxYWJKG5k17JbeTpg5ncMAwiYqNvMEIXuAPwwXk/1bA+okwN+whxet8rvEg/cRS5/oU9dwKGRuiQ0crMkmj1LThsQ1N+X0WNX1AFcm8MgFMywfZE9VelWBenALg9g6fkpLF3/oFJIKHlHLXnUnHZicfsdWJewUbfeJZ8CSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758554839; c=relaxed/simple;
	bh=eilL7EMcxkFrk7yqkv5eRAaBBjlspJGLuN94fFROlHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TMPH3QS9ikvrI+jgpsYG9P+Hd8EqKLyJ83iLZncY5hLJ8Gs1OTHwaGjXNM80GDtuWlkn0tOFcmEaUnOyF4/LdAYSVHughiHs7YO+QPTPjZcrgsF8B302hvtN4M0oNK9rspXYFNYtb2LLlF+gtNpxAfHqtJWQ3H3r3/qBx3xsQp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=xY9gh6OL; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 96F6D4E40D9D;
	Mon, 22 Sep 2025 15:27:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6D29060635;
	Mon, 22 Sep 2025 15:27:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 756B7102F1965;
	Mon, 22 Sep 2025 17:27:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758554835; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=tmBBrQpk6eRci8IPSFdygrTLGby6api2PRo6vkAg8M4=;
	b=xY9gh6OLGG5sTnftGqTr4AzWBr2eYzjc7zw5MKL02SGtIebpPHosTxy3Z+Xx3LohD+FUEu
	NY3Y/paHj6mspUkdYyzfDuSB3ESpt1gavJjt6wvi9Xi2U+wZdJts5+cllVEuEemFQDQGyV
	+3g5ICWUPAAeoZ3M/HA7MSKyBPXXCwO4csEYUtcycOl+ps6m2/CmxK3q3PscTsALPZX5sl
	G5q1kYiobnPr8ssFEGIVOCeq1P7iCjxz/WpOW8QxrmqaDImtrne8N+w3yB8dZzKuT8N8H+
	jz69cZfn3FbtvdtwcQ9rkTdWroDWS1uihACzImgcCta4+/rySUMfbD0oZDowng==
From: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Saravana Kannan <saravanak@google.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: Phil Edworthy <phil.edworthy@renesas.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v4 8/8] ARM: dts: r9a06g032: Add support for GPIO interrupts
Date: Mon, 22 Sep 2025 17:26:39 +0200
Message-ID: <20250922152640.154092-9-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250922152640.154092-1-herve.codina@bootlin.com>
References: <20250922152640.154092-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

In the RZ/N1 SoC, the GPIO interrupts are multiplexed using the GPIO
Interrupt Multiplexer.

Add the multiplexer node and connect GPIO interrupt lines to the
multiplexer.

The interrupt-map available in the multiplexer node has to be updated in
dts files depending on the GPIO usage. Indeed, the usage of an interrupt
for a GPIO is board dependent.

Up to 8 GPIOs can be used as an interrupt line (one per multiplexer
output interrupt).

Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
---
 arch/arm/boot/dts/renesas/r9a06g032.dtsi | 43 ++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r9a06g032.dtsi b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
index da977cdd8487..bd8160887091 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032.dtsi
+++ b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
@@ -534,6 +534,14 @@ gpio0a: gpio-port@0 {
 				#gpio-cells = <2>;
 				snps,nr-gpios = <32>;
 				reg = <0>;
+
+				interrupt-controller;
+				interrupt-parent = <&gpioirqmux>;
+				interrupts = < 0  1  2  3  4  5  6  7
+					       8  9 10 11 12 13 14 15
+					      16 17 18 19 20 21 22 23
+					      24 25 26 27 28 29 30 31 >;
+				#interrupt-cells = <2>;
 			};
 
 			/* GPIO0b[0..1]   connected to pins GPIO1..2   */
@@ -576,6 +584,14 @@ gpio1a: gpio-port@0 {
 				#gpio-cells = <2>;
 				snps,nr-gpios = <32>;
 				reg = <0>;
+
+				interrupt-controller;
+				interrupt-parent = <&gpioirqmux>;
+				interrupts = < 32 33 34 35 36 37 38 39
+					       40 41 42 43 44 45 46 47
+					       48 49 50 51 52 53 54 55
+					       56 57 58 59 60 61 62 63 >;
+				#interrupt-cells = <2>;
 			};
 
 			/* GPIO1b[0..1]   connected to pins GPIO55..56 */
@@ -608,6 +624,14 @@ gpio2a: gpio-port@0 {
 				#gpio-cells = <2>;
 				snps,nr-gpios = <32>;
 				reg = <0>;
+
+				interrupt-controller;
+				interrupt-parent = <&gpioirqmux>;
+				interrupts = < 64 65 66 67 68 69 70 71
+					       72 73 74 75 76 77 78 79
+					       80 81 82 83 84 85 86 87
+					       88 89 90 91 92 93 94 95 >;
+				#interrupt-cells = <2>;
 			};
 
 			/* GPIO2b[0..9] connected to pins GPIO160..169 */
@@ -620,6 +644,25 @@ gpio2b: gpio-port@1 {
 			};
 		};
 
+		gpioirqmux: interrupt-controller@51000480 {
+			compatible = "renesas,r9a06g032-gpioirqmux", "renesas,rzn1-gpioirqmux";
+			reg = <0x51000480 0x20>;
+			#interrupt-cells = <1>;
+			#address-cells = <0>;
+			interrupt-map-mask = <0x7f>;
+
+			/*
+			 * interrupt-map has to be updated according to GPIO
+			 * usage. The src irq (0 field) has to be updated with
+			 * the needed GPIO interrupt number.
+			 * More items can be added (up to 8). Those items must
+			 * define one GIC interrupt line among 103 to 110.
+			 */
+			interrupt-map = <0 &gic GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
+
+			status = "disabled";
+		};
+
 		can0: can@52104000 {
 			compatible = "renesas,r9a06g032-sja1000", "renesas,rzn1-sja1000";
 			reg = <0x52104000 0x800>;
-- 
2.51.0


