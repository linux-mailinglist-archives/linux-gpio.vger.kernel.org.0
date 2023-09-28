Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 459D77B1399
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Sep 2023 09:07:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230498AbjI1HHO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Sep 2023 03:07:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230450AbjI1HHN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Sep 2023 03:07:13 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D2521A3
        for <linux-gpio@vger.kernel.org>; Thu, 28 Sep 2023 00:07:11 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qll77-0002OW-L2; Thu, 28 Sep 2023 09:07:09 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qll77-009WBW-7v; Thu, 28 Sep 2023 09:07:09 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qll76-005ZX8-Ue; Thu, 28 Sep 2023 09:07:08 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 04/23] gpio: cadence: Convert to platform remove callback returning void
Date:   Thu, 28 Sep 2023 09:06:47 +0200
Message-Id: <20230928070706.2290137-5-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230928070706.2290137-1-u.kleine-koenig@pengutronix.de>
References: <20230928070706.2290137-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1778; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=oKB2MvZnK5i5YvDvXExUfueCuB3cMnfUrlLE9KkO6PE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlFSRjE6GHo6kiT+SPmfCopcirXBDOR5xosW2WD KoSz0Gby6SJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZRUkYwAKCRCPgPtYfRL+ TleQB/9U5RlRSkPYnDK+Vo6oCiJ690SIuygN0YVI2ElazMOwPo+aNMdwzGyb53qEJEXnKbwK5I6 ZhDa+emBITxnKTeLPeE+JwFqMfRRdKGVfgU/36ZRVAB+JcVKzqVnFcF3PJtDfHlicY1PAXD/+uC +N+Q3K+3vK2L7ED9usX3Zn+mGBoq5ckrCaO3rTVFPLCzKAVhOj76Jzz04/s26OsDMTv34mnga4v SmTsiVc7t09Xj4e1MXcjUtJkVM+2fJuxCBXZAutTyevjew3Jb8XSRjqPvijSTpvWtJOnkAQ0GDT DRB+4GVV5ve9kG77b6koWiUCQOtWShiAmQNlcF6IFHECEoBX
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.

To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new(), which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpio/gpio-cadence.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-cadence.c b/drivers/gpio/gpio-cadence.c
index 3720b90cad10..6a439cf78459 100644
--- a/drivers/gpio/gpio-cadence.c
+++ b/drivers/gpio/gpio-cadence.c
@@ -268,14 +268,12 @@ static int cdns_gpio_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int cdns_gpio_remove(struct platform_device *pdev)
+static void cdns_gpio_remove(struct platform_device *pdev)
 {
 	struct cdns_gpio_chip *cgpio = platform_get_drvdata(pdev);
 
 	iowrite32(cgpio->bypass_orig, cgpio->regs + CDNS_GPIO_BYPASS_MODE);
 	clk_disable_unprepare(cgpio->pclk);
-
-	return 0;
 }
 
 static const struct of_device_id cdns_of_ids[] = {
@@ -290,7 +288,7 @@ static struct platform_driver cdns_gpio_driver = {
 		.of_match_table = cdns_of_ids,
 	},
 	.probe = cdns_gpio_probe,
-	.remove = cdns_gpio_remove,
+	.remove_new = cdns_gpio_remove,
 };
 module_platform_driver(cdns_gpio_driver);
 
-- 
2.40.1

