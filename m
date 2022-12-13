Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCF8F64BBD5
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Dec 2022 19:21:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235744AbiLMSVl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Dec 2022 13:21:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236393AbiLMSVk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Dec 2022 13:21:40 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42019F01B
        for <linux-gpio@vger.kernel.org>; Tue, 13 Dec 2022 10:21:39 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1p59uL-0006DU-FB; Tue, 13 Dec 2022 19:21:37 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1p59uJ-004Iub-GR; Tue, 13 Dec 2022 19:21:36 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1p59uJ-004q3A-GG; Tue, 13 Dec 2022 19:21:35 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] pinctrl: da850-pupd: Drop empty platform remove function
Date:   Tue, 13 Dec 2022 19:21:25 +0100
Message-Id: <20221213182125.929303-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1087; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=7ZbcOHSDtAaePxcO4XihErn6wq+BEiFanZ383QJB9YU=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjmMKhMfW0U5ysR+trE3A/9GEDDSqu4jnnOhsV6uu4 m2zd/wGJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY5jCoQAKCRDB/BR4rcrsCdWDCA CKz6HSTlGwVM03EEASmykwMWxTrdkMiiy/j+q1/WlI0I69rqiGGXmHmhbYCh6vUN2E6eVbBsPphLBx zN9JBa/t3Q1xWz4501A7Hbk7DGrT/AjSSMOrqUL4SgM62B7S142ElrVx/SmaPwpktnuhVOenZKUizd AbA6Ke6V0qv+9/993H8At7ZQbCUG0jS51/LdIQ9dLpPqWbtWQf8HrHPa/ztR3CT0nV3OjkiXdhBvJN FxQd8Mtt0vYibVp4FFxOzHqlgcytmk+stTAdz/Wrl/i4HoSB3AnU0b5SdGEcQpwH+zFmpE/oMsafqt 6V0TssTqldTO+uHGgU9sOAtXXP4JPy
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
 drivers/pinctrl/pinctrl-da850-pupd.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-da850-pupd.c b/drivers/pinctrl/pinctrl-da850-pupd.c
index 5a0a1f20c843..5eb248663e17 100644
--- a/drivers/pinctrl/pinctrl-da850-pupd.c
+++ b/drivers/pinctrl/pinctrl-da850-pupd.c
@@ -173,11 +173,6 @@ static int da850_pupd_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int da850_pupd_remove(struct platform_device *pdev)
-{
-	return 0;
-}
-
 static const struct of_device_id da850_pupd_of_match[] = {
 	{ .compatible = "ti,da850-pupd" },
 	{ }
@@ -190,7 +185,6 @@ static struct platform_driver da850_pupd_driver = {
 		.of_match_table	= da850_pupd_of_match,
 	},
 	.probe	= da850_pupd_probe,
-	.remove	= da850_pupd_remove,
 };
 module_platform_driver(da850_pupd_driver);
 

base-commit: 830b3c68c1fb1e9176028d02ef86f3cf76aa2476
-- 
2.38.1

