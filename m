Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E395F2E250A
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Dec 2020 08:05:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726159AbgLXHFG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Dec 2020 02:05:06 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:17304 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727147AbgLXHE6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 24 Dec 2020 02:04:58 -0500
X-IronPort-AV: E=Sophos;i="5.78,444,1599490800"; 
   d="scan'208";a="67025551"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 24 Dec 2020 16:04:22 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 4AB70401227C;
        Thu, 24 Dec 2020 16:04:22 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     marek.vasut+renesas@gmail.com, lee.jones@linaro.org,
        matti.vaittinen@fi.rohmeurope.com, lgirdwood@gmail.com,
        broonie@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com
Cc:     khiem.nguyen.xt@renesas.com, linux-power@fi.rohmeurope.com,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v7 10/12] mfd: bd9571mwv: Use devm_regmap_add_irq_chip()
Date:   Thu, 24 Dec 2020 16:04:15 +0900
Message-Id: <1608793457-11997-11-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608793457-11997-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1608793457-11997-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use dev_regmap_add_irq_chip() to simplify the code.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
Reviewed-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/mfd/bd9571mwv.c | 27 ++++++---------------------
 1 file changed, 6 insertions(+), 21 deletions(-)

diff --git a/drivers/mfd/bd9571mwv.c b/drivers/mfd/bd9571mwv.c
index e68c3fa..49e968e 100644
--- a/drivers/mfd/bd9571mwv.c
+++ b/drivers/mfd/bd9571mwv.c
@@ -170,31 +170,17 @@ static int bd9571mwv_probe(struct i2c_client *client,
 	if (ret)
 		return ret;
 
-	ret = regmap_add_irq_chip(bd->regmap, bd->irq, IRQF_ONESHOT, 0,
-				  &bd9571mwv_irq_chip, &bd->irq_data);
+	ret = devm_regmap_add_irq_chip(bd->dev, bd->regmap, bd->irq,
+				       IRQF_ONESHOT, 0, &bd9571mwv_irq_chip,
+				       &bd->irq_data);
 	if (ret) {
 		dev_err(bd->dev, "Failed to register IRQ chip\n");
 		return ret;
 	}
 
-	ret = devm_mfd_add_devices(bd->dev, PLATFORM_DEVID_AUTO,
-				   bd9571mwv_cells, ARRAY_SIZE(bd9571mwv_cells),
-				   NULL, 0, regmap_irq_get_domain(bd->irq_data));
-	if (ret) {
-		regmap_del_irq_chip(bd->irq, bd->irq_data);
-		return ret;
-	}
-
-	return 0;
-}
-
-static int bd9571mwv_remove(struct i2c_client *client)
-{
-	struct bd9571mwv *bd = i2c_get_clientdata(client);
-
-	regmap_del_irq_chip(bd->irq, bd->irq_data);
-
-	return 0;
+	return devm_mfd_add_devices(bd->dev, PLATFORM_DEVID_AUTO,
+				    bd9571mwv_cells, ARRAY_SIZE(bd9571mwv_cells),
+				    NULL, 0, regmap_irq_get_domain(bd->irq_data));
 }
 
 static const struct of_device_id bd9571mwv_of_match_table[] = {
@@ -215,7 +201,6 @@ static struct i2c_driver bd9571mwv_driver = {
 		.of_match_table = bd9571mwv_of_match_table,
 	},
 	.probe		= bd9571mwv_probe,
-	.remove		= bd9571mwv_remove,
 	.id_table       = bd9571mwv_id_table,
 };
 module_i2c_driver(bd9571mwv_driver);
-- 
2.7.4

