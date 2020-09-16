Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DDBA26CBEF
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Sep 2020 22:37:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726773AbgIPUgi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Sep 2020 16:36:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:60440 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726876AbgIPRKa (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 16 Sep 2020 13:10:30 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.191])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CA7EF22473;
        Wed, 16 Sep 2020 15:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600271933;
        bh=euoNrh4CREhCtBrTlTDs/D23cyiar9mHO2VGZrvJGGw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=r7ZBSAWp7ngag0GivIYwEMRvi2kI5TJyoUxd2xusn24/6ovXSjFvdFXYscQlIvUlL
         gqpGyfwBEw0kKQGlha2BEP6GReJ4HpHYs1ZIL5ck1dgiJaZmcAsukmLwMClRxnlD9/
         4owCOsi3+7MgIuO0CrXIPLYDZ/BRpPcnZzBOBK/A=
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
Subject: [PATCH v3 10/15] ARM: dts: am3874: iceboard: fix GPIO expander reset GPIOs
Date:   Wed, 16 Sep 2020 17:57:10 +0200
Message-Id: <20200916155715.21009-11-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200916155715.21009-1-krzk@kernel.org>
References: <20200916155715.21009-1-krzk@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Correct the property for reset GPIOs of the GPIO expander.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/am3874-iceboard.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/am3874-iceboard.dts b/arch/arm/boot/dts/am3874-iceboard.dts
index 1bb57019d082..9423e9feaa10 100644
--- a/arch/arm/boot/dts/am3874-iceboard.dts
+++ b/arch/arm/boot/dts/am3874-iceboard.dts
@@ -195,7 +195,7 @@
 					"FMCA_PG_C2M", "FMCA_PRSNT_M2C_L", "FMCA_CLK_DIR", "SFP_LOS",
 					"FMCB_EN_12V0", "FMCB_EN_3V3", "FMCB_EN_VADJ", "FMCB_PG_M2C",
 					"FMCB_PG_C2M", "FMCB_PRSNT_M2C_L", "FMCB_CLK_DIR", "SFP_ModPrsL";
-				reset_gpios = <&gpio2 11 GPIO_ACTIVE_LOW>;
+				reset-gpios = <&gpio2 11 GPIO_ACTIVE_LOW>;
 			};
 
 			u42: pca9575@21 {
@@ -208,7 +208,7 @@
 					"QSFPA_LPMode", "QSFPB_ModPrsL", "QSFPB_IntL", "QSFPB_ResetL",
 					"SFP_TxFault", "SFP_TxDisable", "SFP_RS0", "SFP_RS1",
 					"QSFPB_ModSelL", "QSFPB_LPMode", "SEL_SFP", "ARM_MR";
-				reset_gpios = <&gpio2 11 GPIO_ACTIVE_LOW>;
+				reset-gpios = <&gpio2 11 GPIO_ACTIVE_LOW>;
 			};
 
 			u48: pca9575@22 {
@@ -227,7 +227,7 @@
 					"GP_SW5", "GP_SW6", "GP_SW7", "GP_SW8",
 					"GP_LED8", "GP_LED7", "GP_LED6", "GP_LED5",
 					"GP_LED4", "GP_LED3", "GP_LED2", "GP_LED1";
-				reset_gpios = <&gpio2 11 GPIO_ACTIVE_LOW>;
+				reset-gpios = <&gpio2 11 GPIO_ACTIVE_LOW>;
 			};
 
 			u59: pca9575@23 {
@@ -240,7 +240,7 @@
 					"GTX1V8PowerFault", "PHYAPowerFault", "PHYBPowerFault", "ArmPowerFault",
 					"BP_SLOW_GPIO0", "BP_SLOW_GPIO1", "BP_SLOW_GPIO2", "BP_SLOW_GPIO3",
 					"BP_SLOW_GPIO4", "BP_SLOW_GPIO5", "__unused_u59_p16", "__unused_u59_p17";
-				reset_gpios = <&gpio2 11 GPIO_ACTIVE_LOW>;
+				reset-gpios = <&gpio2 11 GPIO_ACTIVE_LOW>;
 			};
 
 			tmp100@48 { compatible = "ti,tmp100"; reg = <0x48>; };
-- 
2.17.1

