Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E5EF2E0987
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Dec 2020 12:24:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726860AbgLVLXC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Dec 2020 06:23:02 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:59808 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726807AbgLVLXB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 22 Dec 2020 06:23:01 -0500
X-IronPort-AV: E=Sophos;i="5.78,438,1599490800"; 
   d="scan'208";a="66595841"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 22 Dec 2020 20:22:26 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 9BE564008553;
        Tue, 22 Dec 2020 20:22:26 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     marek.vasut+renesas@gmail.com, lee.jones@linaro.org,
        matti.vaittinen@fi.rohmeurope.com, lgirdwood@gmail.com,
        broonie@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com
Cc:     khiem.nguyen.xt@renesas.com, linux-power@fi.rohmeurope.com,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v5 08/12] gpio: bd9571mwv: Add BD9574MWF support
Date:   Tue, 22 Dec 2020 20:22:15 +0900
Message-Id: <1608636139-564-9-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608636139-564-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1608636139-564-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for BD9574MWF which is silimar chip with BD9571MWV.
Note that BD9574MWF has additional features "RECOV_GPOUT",
"FREQSEL" and "RTC_IN", but supports GPIO function only.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 drivers/gpio/gpio-bd9571mwv.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-bd9571mwv.c b/drivers/gpio/gpio-bd9571mwv.c
index 0e5395f..df6102b 100644
--- a/drivers/gpio/gpio-bd9571mwv.c
+++ b/drivers/gpio/gpio-bd9571mwv.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * ROHM BD9571MWV-M GPIO driver
+ * ROHM BD9571MWV-M and BD9574MWF-M GPIO driver
  *
  * Copyright (C) 2017 Marek Vasut <marek.vasut+renesas@gmail.com>
  *
@@ -10,6 +10,7 @@
  */
 
 #include <linux/gpio/driver.h>
+#include <linux/mfd/rohm-generic.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 
@@ -118,7 +119,8 @@ static int bd9571mwv_gpio_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id bd9571mwv_gpio_id_table[] = {
-	{ "bd9571mwv-gpio", },
+	{ "bd9571mwv-gpio", ROHM_CHIP_TYPE_BD9571 },
+	{ "bd9574mwf-gpio", ROHM_CHIP_TYPE_BD9574 },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, bd9571mwv_gpio_id_table);
-- 
2.7.4

