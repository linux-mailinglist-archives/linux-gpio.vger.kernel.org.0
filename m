Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 745E126C542
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Sep 2020 18:41:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726520AbgIPQlj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Sep 2020 12:41:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:46296 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726578AbgIPQg2 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 16 Sep 2020 12:36:28 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.191])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6614422470;
        Wed, 16 Sep 2020 15:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600271923;
        bh=z54NT2te4cQqCwvnxGuhIvp2W2PqIQwX8Rfrwo03n6k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HK32OVkYHkBdJOofLkJ+eUoiFHxyVHCmMnup/A7LJvnMbmFRiwsgEMgYtwJqubXXq
         JCspG3tYh6jh9B4NAgWMrK96wSIlk+dYeGSlk9dnzukQSbkIiOSIKR8DOI5Es5fyRl
         4yJvpL+qxOp5+HXbERF/ET+85d6NF+YAf9Huy1sY=
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
Subject: [PATCH v3 09/15] ARM: dts: am335x: t335: align GPIO hog names with dtschema
Date:   Wed, 16 Sep 2020 17:57:09 +0200
Message-Id: <20200916155715.21009-10-krzk@kernel.org>
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
 arch/arm/boot/dts/am335x-sbc-t335.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/am335x-sbc-t335.dts b/arch/arm/boot/dts/am335x-sbc-t335.dts
index a3f6bc4072d9..81e4453687ba 100644
--- a/arch/arm/boot/dts/am335x-sbc-t335.dts
+++ b/arch/arm/boot/dts/am335x-sbc-t335.dts
@@ -155,13 +155,13 @@
 		gpio-controller;
 		#gpio-cells = <2>;
 		reg = <0x26>;
-		dvi_ena {
+		dvi-ena-hog {
 			gpio-hog;
 			gpios = <13 GPIO_ACTIVE_HIGH>;
 			output-high;
 			line-name = "dvi-enable";
 		};
-		lcd_ena {
+		lcd-ena-hog {
 			gpio-hog;
 			gpios = <11 GPIO_ACTIVE_HIGH>;
 			output-high;
-- 
2.17.1

