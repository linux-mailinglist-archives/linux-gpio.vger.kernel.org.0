Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EA92552B21
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jun 2022 08:41:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345850AbiFUGkp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jun 2022 02:40:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345869AbiFUGkm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jun 2022 02:40:42 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 647A419014
        for <linux-gpio@vger.kernel.org>; Mon, 20 Jun 2022 23:40:41 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1o3XZ1-00032I-CS; Tue, 21 Jun 2022 08:40:39 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1o3XYy-001mga-Nt; Tue, 21 Jun 2022 08:40:38 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1o3XYz-0009OB-Iz; Tue, 21 Jun 2022 08:40:37 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org, kernel@pengutronix.de,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v2] gpio: grgpio: Fix device removing
Date:   Tue, 21 Jun 2022 08:40:36 +0200
Message-Id: <20220621064036.147797-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1934; h=from:subject; bh=6gpujFUMpkp8rZtiiAWdFKx3964H1h5t7v6VqTImWfc=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBisWfhsqYRspEmN6V3ECeyrmwbdAfoNrMpW+kRs1Qp Je/QgdWJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYrFn4QAKCRDB/BR4rcrsCaRIB/ 9EsHhxGf5IL3FHyk3mzaPiY1b2jDBikpsPO3Sg3jtcMcJ0AB1ujeboAboNwa8EulK8sqam5/7kZpvx YCiTY+BQOUMK58ZQ2OFRbkKmnlhOrhYwEpAaN0oNKlQP9foSq6uu4gT7oKylxzjTiAHFGjBJvYxYkg YSw+8BW1vWqII1WTo4hUFOOajaf30KsxovfA9k4uKXV75qO6iN/VJpUfvdpLzSgj822ANoRQRtJtNN LO0PdMZ/3pfiK154ZU6dHb58z8B1yoAAoIf+wqDjccp+uuytstFhD9DafPqoz0cnartaSPoaegCeal JQapwYslhj6NmkPaVQcHQRZxbaCKdD
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
to a GPIO the driver accesses kfree()'d memory. Also if an IRQ triggers,
the freed memory is accessed.

Instead rely on the GPIO framework to ensure that after gpiochip_remove()
all GPIOs are freed and so the corresponding IRQs are unmapped.

This is a preparation for making platform remove callbacks return void.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Changes since (implicit) v1
(Message-Id: 20220620122933.106035-1-u.kleine-koenig@pengutronix.de):

 - Fix capitalisation of GPIO and IRQ in commit log
 - Add another "are" in the third paragraph.
 - Drop note about a potential bug in GPIO framework
   I'm not sure there is actually a bug.

Thanks to Andy Shevchenko for his feedback.

Best regards
Uwe

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

