Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 369D864BBDE
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Dec 2022 19:23:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236508AbiLMSXd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Dec 2022 13:23:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236503AbiLMSXc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Dec 2022 13:23:32 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A28DCEE2C
        for <linux-gpio@vger.kernel.org>; Tue, 13 Dec 2022 10:23:31 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1p59w9-0006IP-ES; Tue, 13 Dec 2022 19:23:29 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1p59w6-004Iv2-Qh; Tue, 13 Dec 2022 19:23:27 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1p59w6-004q3e-RF; Tue, 13 Dec 2022 19:23:26 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] pinctrl: thunderbay: Drop empty platform remove function
Date:   Tue, 13 Dec 2022 19:23:22 +0100
Message-Id: <20221213182322.962345-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1142; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=Z7NtAGUPRLnR8BMm+xu1IHpCprR7tqyJZPS+YtVLgKY=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjmMMXsqzxr7NTHW9GVsYJ7I4aZARGdk+xJztCHppw d4VuwduJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY5jDFwAKCRDB/BR4rcrsCYqdCA CAydzVPLyDLzSXJGF/XbpPdWDXu0ESi2AU7XyOlCfFQehTASFnpc6otGySvipEO+UyYJ6YP22N+gVm sA1B+2KvulhSLZGwBz5dkfonmdcXuUtelvyOd+cymQL2pO8ElGS6fTpJzc9sVqVBSbu16M7zdprT/8 /DB8s4wr9rxxk43k5A/B1i9awqtQalcCHoSwB7DghHDqU1j8NqsPef7aUMf4MLpVqTKCt0XK/49/sP YGdMv989Xv3m/BPOK4MPN6JKXIVvdRjmczLQ9RfAXDijBLSw89v9ipKlKeXeoDEleQ/Bw/5Pjnw1Ra U+Eu09eibc3AZJtLN3nElCjnnu5UwI
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
 drivers/pinctrl/pinctrl-thunderbay.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-thunderbay.c b/drivers/pinctrl/pinctrl-thunderbay.c
index 9328b17485cf..1acf2ab1a3db 100644
--- a/drivers/pinctrl/pinctrl-thunderbay.c
+++ b/drivers/pinctrl/pinctrl-thunderbay.c
@@ -1274,19 +1274,12 @@ static int thunderbay_pinctrl_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int thunderbay_pinctrl_remove(struct platform_device *pdev)
-{
-	/* thunderbay_pinctrl_remove function to clear the assigned memory */
-	return 0;
-}
-
 static struct platform_driver thunderbay_pinctrl_driver = {
 	.driver = {
 		.name = "thunderbay-pinctrl",
 		.of_match_table = thunderbay_pinctrl_match,
 	},
 	.probe = thunderbay_pinctrl_probe,
-	.remove = thunderbay_pinctrl_remove,
 };
 
 builtin_platform_driver(thunderbay_pinctrl_driver);

base-commit: 830b3c68c1fb1e9176028d02ef86f3cf76aa2476
-- 
2.38.1

