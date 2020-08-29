Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB7B2256697
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Aug 2020 11:41:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727995AbgH2JlE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 29 Aug 2020 05:41:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:36950 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727987AbgH2JlB (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 29 Aug 2020 05:41:01 -0400
Received: from localhost.localdomain (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 67C5E2068E;
        Sat, 29 Aug 2020 09:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598694060;
        bh=kImBBmuhu/2Fp4wOJCBofByIbokLDzO/4iErCHq10JA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Og97O8+86G+Z64ojsr/NDHzye0kFUDvcNaAPHHrLCe68HBYQO2pBRo5vVHgT38dEk
         3h5+1yGLUEGIyGZMWH8lv8XDq2RTXIJKGvX5w5YQ+4svk5/0KKOZR2Zvq79o1qehMl
         gLX/QS9udz8jWjADY+O10zvNCjjbF5W2ReJkJNhA=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Stefan Agner <stefan@agner.ch>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 6/6] ARM: dts: vf: Fix PCA95xx GPIO expander properties on ZII CFU1
Date:   Sat, 29 Aug 2020 11:40:24 +0200
Message-Id: <20200829094024.31842-6-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200829094024.31842-1-krzk@kernel.org>
References: <20200829094024.31842-1-krzk@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The PCA95xx GPIO expander requires GPIO controller properties to operate
properly.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/vf610-zii-cfu1.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/vf610-zii-cfu1.dts b/arch/arm/boot/dts/vf610-zii-cfu1.dts
index 64e0e9509226..e76a7ebd5dc9 100644
--- a/arch/arm/boot/dts/vf610-zii-cfu1.dts
+++ b/arch/arm/boot/dts/vf610-zii-cfu1.dts
@@ -226,6 +226,7 @@
 		compatible = "nxp,pca9554";
 		reg = <0x22>;
 		gpio-controller;
+		#gpio-cells = <2>;
 	};
 
 	lm75@48 {
-- 
2.17.1

