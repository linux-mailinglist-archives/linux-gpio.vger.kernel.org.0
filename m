Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2201364A9ED
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Dec 2022 23:05:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231752AbiLLWFI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Dec 2022 17:05:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233111AbiLLWFH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Dec 2022 17:05:07 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19E58F03F
        for <linux-gpio@vger.kernel.org>; Mon, 12 Dec 2022 14:05:07 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1p4qv2-0001wy-Dp; Mon, 12 Dec 2022 23:05:04 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1p4quz-0046ga-93; Mon, 12 Dec 2022 23:05:02 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1p4quy-004bNr-Te; Mon, 12 Dec 2022 23:05:00 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Daniel Palmer <daniel@thingy.jp>,
        Romain Perier <romain.perier@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH] gpio: msc313: Drop empty platform remove function
Date:   Mon, 12 Dec 2022 23:04:57 +0100
Message-Id: <20221212220457.3777685-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1059; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=iecFf5RFUYVm4/OJhbZGIbX9w5dmNggX6EcztGY0M8Y=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjl6WFnoQnz1e3arD6/MATbrvc1qaE1AArlrNjXV/K S0fMGbWJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY5elhQAKCRDB/BR4rcrsCakrB/ 9cCL2lODAiKKbZjnj9grw4IH6ra/bFR8HaPXZoIkePTULNM8AYZi/gie2p2fIxz8SjtPYQfyCBDTFO LX+siIM76F7/FYf/XEnV9utmUCrZMD4rxhxZzQmsyjo7moupCCxTWglTQ+N7x77flOC9F+y8olDAS8 X6QOvy6psndpk0wVWrJlMifC1C2SIti/IhrcKR7H+b5xZWAk4iG6Prq+7SSDCJSIpm1cklzb4edUnd 1Nys/CvSBZBalKsj8xTHau5TFi1X6dV20kap6eDCbH/EBj5uIdB0Ke6pjqMQ4uHy97mr1tTF3vhd1e knYSk/5v91jypttgIDtBQcHJI0vAhV
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

A remove callback just returning 0 is equivalent to no remove callback
at all. So drop the useless function.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpio/gpio-msc313.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpio/gpio-msc313.c b/drivers/gpio/gpio-msc313.c
index 52d7b8d99170..b0773e5652fa 100644
--- a/drivers/gpio/gpio-msc313.c
+++ b/drivers/gpio/gpio-msc313.c
@@ -655,11 +655,6 @@ static int msc313_gpio_probe(struct platform_device *pdev)
 	return devm_gpiochip_add_data(dev, gpiochip, gpio);
 }
 
-static int msc313_gpio_remove(struct platform_device *pdev)
-{
-	return 0;
-}
-
 static const struct of_device_id msc313_gpio_of_match[] = {
 #ifdef CONFIG_MACH_INFINITY
 	{
@@ -710,6 +705,5 @@ static struct platform_driver msc313_gpio_driver = {
 		.pm = &msc313_gpio_ops,
 	},
 	.probe = msc313_gpio_probe,
-	.remove = msc313_gpio_remove,
 };
 builtin_platform_driver(msc313_gpio_driver);

base-commit: 830b3c68c1fb1e9176028d02ef86f3cf76aa2476
-- 
2.38.1

