Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 329CF26CBE5
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Sep 2020 22:36:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727138AbgIPUgK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Sep 2020 16:36:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:60438 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726875AbgIPRKa (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 16 Sep 2020 13:10:30 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.191])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1F6AD22461;
        Wed, 16 Sep 2020 15:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600271880;
        bh=9vEz3caNfDoekMkEldtsPOm1s72Th5+Yg8h2PhuTrWE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=z9wtEeqt/JraOAI++7Sw3c5y0+wH5uSW/cG82+wCWWTeYC8nzG1PE5U5WTNGb/ov7
         d/MfZ92um48Sz4n4c/2Enf+ZGjzFUIwZHG+0MbRGNKWHbYqfFl3EvgNENxPC34x3V/
         3UV/SNr1NEXh8mmsals6L0Pk2qI7dwJNeybtfV+c=
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
Subject: [PATCH v3 03/15] arm64: dts: mediatek: fix tca6416 reset GPIOs in pumpkin
Date:   Wed, 16 Sep 2020 17:57:03 +0200
Message-Id: <20200916155715.21009-4-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200916155715.21009-1-krzk@kernel.org>
References: <20200916155715.21009-1-krzk@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Correct the property for reset GPIOs of tca6416 GPIO expander.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
index dfceffe6950a..29d8cf6df46b 100644
--- a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
@@ -56,7 +56,7 @@
 	tca6416: gpio@20 {
 		compatible = "ti,tca6416";
 		reg = <0x20>;
-		rst-gpio = <&pio 65 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&pio 65 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&tca6416_pins>;
 
-- 
2.17.1

