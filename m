Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1611D2E1AE1
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Dec 2020 11:26:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728214AbgLWKXU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Dec 2020 05:23:20 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:5941 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728147AbgLWKXU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 23 Dec 2020 05:23:20 -0500
X-IronPort-AV: E=Sophos;i="5.78,441,1599490800"; 
   d="scan'208";a="66928576"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 23 Dec 2020 19:22:49 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 18B134255D30;
        Wed, 23 Dec 2020 19:22:49 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     marek.vasut+renesas@gmail.com, lee.jones@linaro.org,
        matti.vaittinen@fi.rohmeurope.com, lgirdwood@gmail.com,
        broonie@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com
Cc:     khiem.nguyen.xt@renesas.com, linux-power@fi.rohmeurope.com,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v6 01/12] mfd: bd9571mwv: Use devm_mfd_add_devices()
Date:   Wed, 23 Dec 2020 19:22:32 +0900
Message-Id: <1608718963-21818-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608718963-21818-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1608718963-21818-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

To remove mfd devices when unload this driver, should use
devm_mfd_add_devices() instead.

Fixes: d3ea21272094 ("mfd: Add ROHM BD9571MWV-M MFD PMIC driver")
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 drivers/mfd/bd9571mwv.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/bd9571mwv.c b/drivers/mfd/bd9571mwv.c
index fab3cdc..19d57a4 100644
--- a/drivers/mfd/bd9571mwv.c
+++ b/drivers/mfd/bd9571mwv.c
@@ -185,9 +185,9 @@ static int bd9571mwv_probe(struct i2c_client *client,
 		return ret;
 	}
 
-	ret = mfd_add_devices(bd->dev, PLATFORM_DEVID_AUTO, bd9571mwv_cells,
-			      ARRAY_SIZE(bd9571mwv_cells), NULL, 0,
-			      regmap_irq_get_domain(bd->irq_data));
+	ret = devm_mfd_add_devices(bd->dev, PLATFORM_DEVID_AUTO,
+				   bd9571mwv_cells, ARRAY_SIZE(bd9571mwv_cells),
+				   NULL, 0, regmap_irq_get_domain(bd->irq_data));
 	if (ret) {
 		regmap_del_irq_chip(bd->irq, bd->irq_data);
 		return ret;
-- 
2.7.4

