Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC37926C774
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Sep 2020 20:26:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728025AbgIPS0d (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Sep 2020 14:26:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:56702 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728005AbgIPSZl (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 16 Sep 2020 14:25:41 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.191])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5532D22483;
        Wed, 16 Sep 2020 15:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600271964;
        bh=9+RfyEFgUiqDasaKjUmJhx8ihT+9S1w76ne+qVMEqf4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ReHiMVSOrY2Tpq0R2x5H8Q1vVDBWzXBmBLfc5eualaPr0xKGjC/n447miOTwo3Jzt
         qomZTiLgNjLrdb3j9uOc6o/IyZ8iFtxuuPBGGb+BdMQnJohy2I79//wT/C3XFYzosB
         WayaEjb97JjD+jDpgfQYPk+QzJ7dqdbUcl7BRxbI=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v3 14/15] ARM: dts: armada: align GPIO hog names with dtschema
Date:   Wed, 16 Sep 2020 17:57:14 +0200
Message-Id: <20200916155715.21009-15-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200916155715.21009-1-krzk@kernel.org>
References: <20200916155715.21009-1-krzk@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The convention for node names is to use hyphens, not underscores.
dtschema for pca95xx expects GPIO hogs to end with 'hog' prefix.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/armada-388-clearfog.dts  |  4 ++--
 arch/arm/boot/dts/armada-388-clearfog.dtsi | 10 +++++-----
 arch/arm/boot/dts/armada-388-helios4.dts   |  6 +++---
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/armada-388-clearfog.dts b/arch/arm/boot/dts/armada-388-clearfog.dts
index 20f8d4667753..4140a5303b48 100644
--- a/arch/arm/boot/dts/armada-388-clearfog.dts
+++ b/arch/arm/boot/dts/armada-388-clearfog.dts
@@ -73,13 +73,13 @@
 	 * 14-SFP_TX_DISABLE
 	 * 15-SFP_MOD_DEF0
 	 */
-	pcie2_0_clkreq {
+	pcie2-0-clkreq-hog {
 		gpio-hog;
 		gpios = <4 GPIO_ACTIVE_LOW>;
 		input;
 		line-name = "pcie2.0-clkreq";
 	};
-	pcie2_0_w_disable {
+	pcie2-0-w-disable-hog {
 		gpio-hog;
 		gpios = <7 GPIO_ACTIVE_LOW>;
 		output-low;
diff --git a/arch/arm/boot/dts/armada-388-clearfog.dtsi b/arch/arm/boot/dts/armada-388-clearfog.dtsi
index a0aa1d188f0c..f8a06ae4a3c9 100644
--- a/arch/arm/boot/dts/armada-388-clearfog.dtsi
+++ b/arch/arm/boot/dts/armada-388-clearfog.dtsi
@@ -141,31 +141,31 @@
 		#gpio-cells = <2>;
 		reg = <0x20>;
 
-		pcie1_0_clkreq {
+		pcie1-0-clkreq-hog {
 			gpio-hog;
 			gpios = <0 GPIO_ACTIVE_LOW>;
 			input;
 			line-name = "pcie1.0-clkreq";
 		};
-		pcie1_0_w_disable {
+		pcie1-0-w-disable-hog {
 			gpio-hog;
 			gpios = <3 GPIO_ACTIVE_LOW>;
 			output-low;
 			line-name = "pcie1.0-w-disable";
 		};
-		usb3_ilimit {
+		usb3-ilimit-hog {
 			gpio-hog;
 			gpios = <5 GPIO_ACTIVE_LOW>;
 			input;
 			line-name = "usb3-current-limit";
 		};
-		usb3_power {
+		usb3-power-hog {
 			gpio-hog;
 			gpios = <6 GPIO_ACTIVE_HIGH>;
 			output-high;
 			line-name = "usb3-power";
 		};
-		m2_devslp {
+		m2-devslp-hog {
 			gpio-hog;
 			gpios = <11 GPIO_ACTIVE_HIGH>;
 			output-low;
diff --git a/arch/arm/boot/dts/armada-388-helios4.dts b/arch/arm/boot/dts/armada-388-helios4.dts
index fb49df2a3bce..b3728de3bd3f 100644
--- a/arch/arm/boot/dts/armada-388-helios4.dts
+++ b/arch/arm/boot/dts/armada-388-helios4.dts
@@ -166,19 +166,19 @@
 					interrupt-controller;
 					#interrupt-cells = <2>;
 
-					board_rev_bit_0 {
+					board-rev-bit-0-hog {
 						gpio-hog;
 						gpios = <0 GPIO_ACTIVE_LOW>;
 						input;
 						line-name = "board-rev-0";
 					};
-					board_rev_bit_1 {
+					board-rev-bit-1-hog {
 						gpio-hog;
 						gpios = <1 GPIO_ACTIVE_LOW>;
 						input;
 						line-name = "board-rev-1";
 					};
-					usb3_ilimit {
+					usb3-ilimit-hog {
 						gpio-hog;
 						gpios = <5 GPIO_ACTIVE_HIGH>;
 						input;
-- 
2.17.1

