Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF5DD745F80
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jul 2023 17:10:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231316AbjGCPKF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Jul 2023 11:10:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230032AbjGCPKF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Jul 2023 11:10:05 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6D71EE
        for <linux-gpio@vger.kernel.org>; Mon,  3 Jul 2023 08:10:03 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:bc71:f024:6708:ff])
        by laurent.telenet-ops.be with bizsmtp
        id GfA02A00T0kCKfg01fA0nx; Mon, 03 Jul 2023 17:10:01 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qGLBe-000Rls-Rt;
        Mon, 03 Jul 2023 17:10:00 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qGLBg-0031s1-G3;
        Mon, 03 Jul 2023 17:10:00 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: renesas: rzv2m: Use devm_clk_get_enabled()
Date:   Mon,  3 Jul 2023 17:09:59 +0200
Message-Id: <cca0b1795fd0335401bdf2be393ab84445e04095.1688396836.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Simplify clock handling by using the devm_clk_get_enabled() helper,
instead of open-coding the same operations.  Move the clock pointer from
the driver-private data to a local variable, as it is not needed outside
the .probe() callback.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-pinctrl for v6.6.
---
 drivers/pinctrl/renesas/pinctrl-rzv2m.c | 32 ++++---------------------
 1 file changed, 5 insertions(+), 27 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzv2m.c b/drivers/pinctrl/renesas/pinctrl-rzv2m.c
index 35b23c1a5684d3e4..f0852296c1d3e9fb 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzv2m.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzv2m.c
@@ -118,7 +118,6 @@ struct rzv2m_pinctrl {
 	const struct rzv2m_pinctrl_data	*data;
 	void __iomem			*base;
 	struct device			*dev;
-	struct clk			*clk;
 
 	struct gpio_chip		gpio_chip;
 	struct pinctrl_gpio_range	gpio_range;
@@ -1039,14 +1038,10 @@ static int rzv2m_pinctrl_register(struct rzv2m_pinctrl *pctrl)
 	return 0;
 }
 
-static void rzv2m_pinctrl_clk_disable(void *data)
-{
-	clk_disable_unprepare(data);
-}
-
 static int rzv2m_pinctrl_probe(struct platform_device *pdev)
 {
 	struct rzv2m_pinctrl *pctrl;
+	struct clk *clk;
 	int ret;
 
 	pctrl = devm_kzalloc(&pdev->dev, sizeof(*pctrl), GFP_KERNEL);
@@ -1063,32 +1058,15 @@ static int rzv2m_pinctrl_probe(struct platform_device *pdev)
 	if (IS_ERR(pctrl->base))
 		return PTR_ERR(pctrl->base);
 
-	pctrl->clk = devm_clk_get(pctrl->dev, NULL);
-	if (IS_ERR(pctrl->clk)) {
-		ret = PTR_ERR(pctrl->clk);
-		dev_err(pctrl->dev, "failed to get GPIO clk : %i\n", ret);
-		return ret;
-	}
+	clk = devm_clk_get_enabled(pctrl->dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(pctrl->dev, PTR_ERR(clk),
+				     "failed to enable GPIO clk\n");
 
 	spin_lock_init(&pctrl->lock);
 
 	platform_set_drvdata(pdev, pctrl);
 
-	ret = clk_prepare_enable(pctrl->clk);
-	if (ret) {
-		dev_err(pctrl->dev, "failed to enable GPIO clk: %i\n", ret);
-		return ret;
-	}
-
-	ret = devm_add_action_or_reset(&pdev->dev, rzv2m_pinctrl_clk_disable,
-				       pctrl->clk);
-	if (ret) {
-		dev_err(pctrl->dev,
-			"failed to register GPIO clk disable action, %i\n",
-			ret);
-		return ret;
-	}
-
 	ret = rzv2m_pinctrl_register(pctrl);
 	if (ret)
 		return ret;
-- 
2.34.1

