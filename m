Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A56D45518E5
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jun 2022 14:29:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240227AbiFTM3o (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Jun 2022 08:29:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240064AbiFTM3n (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Jun 2022 08:29:43 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 816111E4
        for <linux-gpio@vger.kernel.org>; Mon, 20 Jun 2022 05:29:42 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1o3GXE-0006zq-FP; Mon, 20 Jun 2022 14:29:40 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1o3GXC-001dd8-4C; Mon, 20 Jun 2022 14:29:39 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1o3GXC-00HaSi-Rz; Mon, 20 Jun 2022 14:29:38 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] gpio: grgpio: Fix device removing
Date:   Mon, 20 Jun 2022 14:29:33 +0200
Message-Id: <20220620122933.106035-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1694; h=from:subject; bh=YkQmf+LecKEaaLfapNFDMKh7Yb2jAhw7abjjjZFnFnQ=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBisGgpYK3paFDRxNQc9CApwgWjmUPyxqeu3cfCFpKV 37ttIUKJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYrBoKQAKCRDB/BR4rcrsCey2B/ 9J4bOoSEbZCOf6aVfSljOYW3pHT3E6yMdy8k1E2NQ3ETIcajzGoMf4edDjvZDh7uw+lgpJTy3f5HBH gu4A/UTn0klUsPBCywd87u6QPxwqQurDui1IMd3M767kMwWMNUtiVPU7iet9xMLo/ONcMctIKTAED7 TcoSeQ2foSDha+cuOoMLhv4/jzTm0iSndLPlFvYNtHIoEQN0GZ6iyjrn9OqX50NdqlYhBv/CAs2aus LIL8zCL7iiKKMWUdUPFZKXlXGWKX0O0EuucXVZAjzyXPG2Tsg18XyS8hLh/Azi2zIx72q4Jh0n5nHA GPdipgtTYOceR6+sHNriSrv69P1rLP
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

If a platform device's remove callback returns non-zero, the device core
emits a warning and still removes the device and calls the devm cleanup
callbacks.

So it's not save to not unregister the gpiochip because on the next request
to a gpio the driver accesses kfree()'d memory. Also if an irq triggers,
the freed memory is accessed.

Instead rely on the gpio framework to ensure that after gpiochip_remove()
all gpios are freed and so the corresponding irqs unmapped. (I'm think the
gpio framework doesn't guarantee that, but that's a bug there and out of
scope for this gpio driver to fix that.)

This is a preparation for making platform remove callbacks return void.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpio/gpio-grgpio.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-grgpio.c b/drivers/gpio/gpio-grgpio.c
index df563616f943..bea0e32c195d 100644
--- a/drivers/gpio/gpio-grgpio.c
+++ b/drivers/gpio/gpio-grgpio.c
@@ -434,25 +434,13 @@ static int grgpio_probe(struct platform_device *ofdev)
 static int grgpio_remove(struct platform_device *ofdev)
 {
 	struct grgpio_priv *priv = platform_get_drvdata(ofdev);
-	int i;
-	int ret = 0;
-
-	if (priv->domain) {
-		for (i = 0; i < GRGPIO_MAX_NGPIO; i++) {
-			if (priv->uirqs[i].refcnt != 0) {
-				ret = -EBUSY;
-				goto out;
-			}
-		}
-	}
 
 	gpiochip_remove(&priv->gc);
 
 	if (priv->domain)
 		irq_domain_remove(priv->domain);
 
-out:
-	return ret;
+	return 0;
 }
 
 static const struct of_device_id grgpio_match[] = {

base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56
-- 
2.36.1

