Return-Path: <linux-gpio+bounces-27290-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B93BEFD27
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 10:09:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BE203E776B
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 08:08:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20E172EA15C;
	Mon, 20 Oct 2025 08:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bZeBvWv9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FD82E9EA0;
	Mon, 20 Oct 2025 08:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760947672; cv=none; b=giT/bZlQLPb7B6zKTpMNPCG6mLFfUMcRlIe9b7xbFzjiJLg3DTEl5Z6FCpGoLK/TPt6iEL6c6qEAheqnwVaBQJFzmE2uxV/jXzVG0vFfPupEjDnGrIy2RiUl/L3iFUpWMKX+dsn3TUWb59zyiaRCO1jr6XZo485Tnrf+2e3ZCXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760947672; c=relaxed/simple;
	bh=OkSPrFWBzJqmpcBkiJnkAkNzSqW+f6VlYQOuuG+uDoE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HwsSeSK74KthmWiBFWf8mmbvaRx+j47dCMLmS5GahOAj8htdBPDxNXIBQDY1kfuYf/go3pv800sX3SXdBc34lcRr5o0frKZ5tWboql4u1R9UbNny8C9m0fgmnKTtE3EGUVXLHDz5HjVuay6hVKmToOgdvJFXDjEWPQSpx5oEEoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=bZeBvWv9; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 454251A153E;
	Mon, 20 Oct 2025 08:07:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1AAB9606D5;
	Mon, 20 Oct 2025 08:07:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1A849102F239F;
	Mon, 20 Oct 2025 10:07:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760947668; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=UKvWtvWTfI8KQNkAVFptdK5jHd3WbuqX80pTTkdbWbU=;
	b=bZeBvWv9QCtMTlWJTWSrVQ8cv4e6b6xjvP4dmHZogWb0KfAIv54pujmeAOZNwBe+fOOIv3
	XdztjGgw6y3/9exe1WUVdsorYJSAMlObHVM+qBlsxDZp9Rn+R8dFO9wYa7Fpg6hiEKwEg0
	2ujbEJSOmpcSE3z5E3qWBNmlNiXAZCxcsyTDa2QAMl3vvXnyyD9o8z3njd/Op2IsDEsp+D
	tuTgO4H8y508vMj59n/JJ1H6MNSPZUNu0TBFNwHqAmKQ3VlE1e+gxmiqeq7Vj8QPFOIVo6
	AqU2bYxJDS80o2Wcamt493j+NA50UHqb+5dUxzTN6N9JuHfQgYSwERrnvAEThQ==
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
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v5 5/8] ARM: dts: r9a06g032: Add GPIO controllers
Date: Mon, 20 Oct 2025 10:06:41 +0200
Message-ID: <20251020080648.13452-6-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251020080648.13452-1-herve.codina@bootlin.com>
References: <20251020080648.13452-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add GPIO controllers (Synosys DesignWare IPs) available in the
r9a06g032 (RZ/N1D) SoC.

Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm/boot/dts/renesas/r9a06g032.dtsi | 121 +++++++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r9a06g032.dtsi b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
index 13a60656b044..da977cdd8487 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032.dtsi
+++ b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
@@ -499,6 +499,127 @@ gic: interrupt-controller@44101000 {
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
+			status = "disabled";
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
+				gpio-controller;
+				#gpio-cells = <2>;
+				snps,nr-gpios = <32>;
+				reg = <0>;
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
+				gpio-controller;
+				#gpio-cells = <2>;
+				snps,nr-gpios = <32>;
+				reg = <1>;
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
+			status = "disabled";
+
+			/* GPIO1a[0..4]  connected to pins GPIO69..73 */
+			/* GPIO1a[5..31] connected to pins GPIO95..121 */
+			gpio1a: gpio-port@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells = <2>;
+				snps,nr-gpios = <32>;
+				reg = <0>;
+			};
+
+			/* GPIO1b[0..1]   connected to pins GPIO55..56 */
+			/* GPIO1b[2..4]   connected to pins GPIO59..61 */
+			/* GPIO1b[5..25]  connected to pins GPIO74..94 */
+			/* GPIO1b[26..31] connected to pins GPIO150..155 */
+			gpio1b: gpio-port@1 {
+				compatible = "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells = <2>;
+				snps,nr-gpios = <32>;
+				reg = <1>;
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
+			status = "disabled";
+
+			/* GPIO2a[0..27]  connected to pins GPIO122..149 */
+			/* GPIO2a[28..31] connected to pins GPIO156..159 */
+			gpio2a: gpio-port@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells = <2>;
+				snps,nr-gpios = <32>;
+				reg = <0>;
+			};
+
+			/* GPIO2b[0..9] connected to pins GPIO160..169 */
+			gpio2b: gpio-port@1 {
+				compatible = "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells = <2>;
+				snps,nr-gpios = <10>;
+				reg = <1>;
+			};
+		};
+
 		can0: can@52104000 {
 			compatible = "renesas,r9a06g032-sja1000", "renesas,rzn1-sja1000";
 			reg = <0x52104000 0x800>;
-- 
2.51.0


