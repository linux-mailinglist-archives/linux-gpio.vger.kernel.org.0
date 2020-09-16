Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39F4F26C760
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Sep 2020 20:25:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727843AbgIPSZu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Sep 2020 14:25:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:56740 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727789AbgIPSZn (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 16 Sep 2020 14:25:43 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.191])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E571022472;
        Wed, 16 Sep 2020 15:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600271901;
        bh=Ty18eFbR1LQ96gqxXM+8sE2Q1P8WRnMu4EObDZv2/zk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hcD1MRTTKLJUVNVTe1M/7hjIPTwl4PEdGwc3NKI5mW7umBw+PpdChTixDl/LPB3ZO
         EyF6tdHwuE94pBwX9llb65GacZaR+ZzMafTewQzccZUQ8DMpU1Apm/fxMhxvLlHcxs
         xWcx3ouuKgd6ZaZ9hM0Af5dMetJnlE/0JTGUazA4=
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
Subject: [PATCH v3 06/15] arm64: dts: ti: align GPIO hog names with dtschema
Date:   Wed, 16 Sep 2020 17:57:06 +0200
Message-Id: <20200916155715.21009-7-krzk@kernel.org>
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
 arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
index 648267284582..456e7818b521 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
@@ -407,7 +407,7 @@
 		gpio-controller;
 		#gpio-cells = <2>;
 
-		p09 {
+		p09-hog {
 			/* P11 - MCASP/TRACE_MUX_S0 */
 			gpio-hog;
 			gpios = <9 GPIO_ACTIVE_HIGH>;
@@ -415,7 +415,7 @@
 			line-name = "MCASP/TRACE_MUX_S0";
 		};
 
-		p10 {
+		p10-hog {
 			/* P12 - MCASP/TRACE_MUX_S1 */
 			gpio-hog;
 			gpios = <10 GPIO_ACTIVE_HIGH>;
-- 
2.17.1

