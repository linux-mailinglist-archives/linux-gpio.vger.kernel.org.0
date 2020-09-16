Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F78F26CB05
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Sep 2020 22:21:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727170AbgIPUV0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Sep 2020 16:21:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:43846 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727160AbgIPRau (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 16 Sep 2020 13:30:50 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.191])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1D3B922464;
        Wed, 16 Sep 2020 15:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600271894;
        bh=wdAkw2TjM1udxEqqVOzxHnXaiuAOFMCD3JyJ0x6GXJI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CEkiTIX+Fl0xgU9GaFowB3IBFoj0LdQvWJp6D/j5lf4NecsiG9e7rpukGJOxIsOGX
         OiHfB2CHjp8UzjXsoU4dCoauEfCjSPEEzbwnAko1gQFeuf/NUQwGG6LcEcvfRUlBi8
         pOcI/Xun6ff/784JHIbliYALEOTgbG6oNJuCy1EA=
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
Subject: [PATCH v3 05/15] arm64: dts: renesas: align GPIO hog names with dtschema
Date:   Wed, 16 Sep 2020 17:57:05 +0200
Message-Id: <20200916155715.21009-6-krzk@kernel.org>
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
 .../boot/dts/renesas/r8a77951-salvator-xs.dts      |  2 +-
 .../boot/dts/renesas/r8a77965-salvator-xs.dts      |  2 +-
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi           | 14 +++++++-------
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dts b/arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dts
index cef9da4376a3..e5922329a4b8 100644
--- a/arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dts
@@ -118,7 +118,7 @@
 };
 
 &pca9654 {
-	pcie_sata_switch {
+	pcie-sata-switch-hog {
 		gpio-hog;
 		gpios = <7 GPIO_ACTIVE_HIGH>;
 		output-low; /* enable SATA by default */
diff --git a/arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dts b/arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dts
index 5cef64605464..d7e621101af7 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dts
@@ -55,7 +55,7 @@
 };
 
 &pca9654 {
-	pcie_sata_switch {
+	pcie-sata-switch-hog {
 		gpio-hog;
 		gpios = <7 GPIO_ACTIVE_HIGH>;
 		output-low; /* enable SATA by default */
diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
index 202177706cde..e9ed2597f1c2 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
@@ -143,49 +143,49 @@
 		interrupt-parent = <&gpio6>;
 		interrupts = <8 IRQ_TYPE_EDGE_FALLING>;
 
-		audio_out_off {
+		audio-out-off-hog {
 			gpio-hog;
 			gpios = <0 GPIO_ACTIVE_HIGH>; /* P00 */
 			output-high;
 			line-name = "Audio_Out_OFF";
 		};
 
-		hub_pwen {
+		hub-pwen-hog {
 			gpio-hog;
 			gpios = <6 GPIO_ACTIVE_HIGH>;
 			output-high;
 			line-name = "HUB pwen";
 		};
 
-		hub_rst {
+		hub-rst-hog {
 			gpio-hog;
 			gpios = <7 GPIO_ACTIVE_HIGH>;
 			output-high;
 			line-name = "HUB rst";
 		};
 
-		otg_extlpn {
+		otg-extlpn-hog {
 			gpio-hog;
 			gpios = <9 GPIO_ACTIVE_HIGH>;
 			output-high;
 			line-name = "OTG EXTLPn";
 		};
 
-		otg_offvbusn {
+		otg-offvbusn-hog {
 			gpio-hog;
 			gpios = <8 GPIO_ACTIVE_HIGH>;
 			output-low;
 			line-name = "OTG OFFVBUSn";
 		};
 
-		sd-wifi-mux {
+		sd-wifi-mux-hog {
 			gpio-hog;
 			gpios = <5 GPIO_ACTIVE_HIGH>;
 			output-low;	/* Connect WL1837 */
 			line-name = "SD WiFi mux";
 		};
 
-		snd_rst {
+		snd-rst-hog {
 			gpio-hog;
 			gpios = <15 GPIO_ACTIVE_HIGH>; /* P17 */
 			output-high;
-- 
2.17.1

