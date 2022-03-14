Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06BEE4D8690
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Mar 2022 15:17:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232623AbiCNOSQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Mar 2022 10:18:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242222AbiCNOSP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Mar 2022 10:18:15 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF4B719C2B
        for <linux-gpio@vger.kernel.org>; Mon, 14 Mar 2022 07:17:05 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1nTlVL-0004zU-B8; Mon, 14 Mar 2022 15:16:59 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nTlVL-000f32-Ji; Mon, 14 Mar 2022 15:16:58 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nTlVJ-0097au-EO; Mon, 14 Mar 2022 15:16:57 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-clk@vger.kernel.org, kernel@pengutronix.de,
        linux-gpio@vger.kernel.org
Subject: [PATCH v8 07/16] gpio: vf610: Simplify error handling in probe
Date:   Mon, 14 Mar 2022 15:16:34 +0100
Message-Id: <20220314141643.22184-8-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220314141643.22184-1-u.kleine-koenig@pengutronix.de>
References: <20220314141643.22184-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2888; i=uwe@kleine-koenig.org; h=from:subject; bh=Dq67GJWI0h4L8WkYxDyaqd3dARkdTA4rj3Fyv3NX2P0=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBiL04Apa3/7po70we0OsQEOmgMvEYlPY+6i4PmwzMh LxpdWwWJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYi9OAAAKCRDB/BR4rcrsCe8eCA CFj2DlaWpIHhiwkJiYB+1ZyfgdhiLgqubWRs/HIE+t3YXNpDHSyZb/I6tBwRI5OxljbD8k+FJ56Avy wFjb/SBl9U8A7UhtY75pjmXZ506HahvN0iZar5vJyJ55oY0r3LnhRu1+MoqMvL9Qx5V/dmbuLI+m3B kp7ObVBKp6dmAhIFGDcsBzsoYlONVIKcaGUEl6L1zXW37mh8xUVINmg83RMnsEwfvxX3KHovkOKesZ DXQWx8ymGBDp1FIo4giRJZ9KUq8uOdfILfWXauCbJS59fPUwuil4LBk0121uX79i/9cQ64qOYjWG1O SNFJv+uSKqBdGaxcDCh238ZgAOo6l3
X-Developer-Key: i=uwe@kleine-koenig.org; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Instead of manually enabling and registering a devm cleanup handler that
disables the clock, use devm_clk_get_enabled(). Also replace the handling
of the optional clocks by using a variant of clk_get_optional().

The resulting code is a tad stricter than the previous code as errors from
clk_get() (apart from -ENOENT) make vf610_gpio_probe() return an error.
This is however an improvement.

Also make the clock pointers local variables instead of a member of driver
data, as they are only used in .probe().

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpio/gpio-vf610.c | 45 +++++++--------------------------------
 1 file changed, 8 insertions(+), 37 deletions(-)

diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
index 20780c35da1b..4a6ad2e8d1a1 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -34,8 +34,6 @@ struct vf610_gpio_port {
 	void __iomem *gpio_base;
 	const struct fsl_gpio_soc_data *sdata;
 	u8 irqc[VF610_GPIO_PER_PORT];
-	struct clk *clk_port;
-	struct clk *clk_gpio;
 	int irq;
 };
 
@@ -232,11 +230,6 @@ static int vf610_gpio_irq_set_wake(struct irq_data *d, u32 enable)
 	return 0;
 }
 
-static void vf610_gpio_disable_clk(void *data)
-{
-	clk_disable_unprepare(data);
-}
-
 static int vf610_gpio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -245,6 +238,8 @@ static int vf610_gpio_probe(struct platform_device *pdev)
 	struct gpio_chip *gc;
 	struct gpio_irq_chip *girq;
 	struct irq_chip *ic;
+	struct clk *clk_port;
+	struct clk *clk_gpio;
 	int i;
 	int ret;
 
@@ -265,37 +260,13 @@ static int vf610_gpio_probe(struct platform_device *pdev)
 	if (port->irq < 0)
 		return port->irq;
 
-	port->clk_port = devm_clk_get(dev, "port");
-	ret = PTR_ERR_OR_ZERO(port->clk_port);
-	if (!ret) {
-		ret = clk_prepare_enable(port->clk_port);
-		if (ret)
-			return ret;
-		ret = devm_add_action_or_reset(dev, vf610_gpio_disable_clk,
-					       port->clk_port);
-		if (ret)
-			return ret;
-	} else if (ret == -EPROBE_DEFER) {
-		/*
-		 * Percolate deferrals, for anything else,
-		 * just live without the clocking.
-		 */
-		return ret;
-	}
+	clk_port = devm_clk_get_optional_enabled(dev, "port");
+	if (IS_ERR(clk_port))
+		return PTR_ERR(clk_port);
 
-	port->clk_gpio = devm_clk_get(dev, "gpio");
-	ret = PTR_ERR_OR_ZERO(port->clk_gpio);
-	if (!ret) {
-		ret = clk_prepare_enable(port->clk_gpio);
-		if (ret)
-			return ret;
-		ret = devm_add_action_or_reset(dev, vf610_gpio_disable_clk,
-					       port->clk_gpio);
-		if (ret)
-			return ret;
-	} else if (ret == -EPROBE_DEFER) {
-		return ret;
-	}
+	clk_gpio = devm_clk_get_optional_enabled(dev, "gpio");
+	if (IS_ERR(clk_gpio))
+		return PTR_ERR(clk_gpio);
 
 	gc = &port->gc;
 	gc->parent = dev;
-- 
2.35.1

