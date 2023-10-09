Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 976BB7BD6B5
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Oct 2023 11:22:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345891AbjJIJW6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Oct 2023 05:22:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345798AbjJIJWs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Oct 2023 05:22:48 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41D5697
        for <linux-gpio@vger.kernel.org>; Mon,  9 Oct 2023 02:22:42 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qpmTD-0006sf-Fw; Mon, 09 Oct 2023 11:22:35 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qpmTD-000NWa-1L; Mon, 09 Oct 2023 11:22:35 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qpmTC-00C4p5-Oh; Mon, 09 Oct 2023 11:22:34 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 05/20] pinctrl: intel: cherryview: Convert to platform remove callback returning void
Date:   Mon,  9 Oct 2023 10:38:41 +0200
Message-Id: <20231009083856.222030-6-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231009083856.222030-1-u.kleine-koenig@pengutronix.de>
References: <20231009083856.222030-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2108; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=S4F/Ao6mCu0ElcleKD+S+Fk5DRAS/72HcfKe390NuvY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlI7wE53vDr7UBK47ldXgIYZev2MHpu1X7uKNaB LRlAJOCz5qJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZSO8BAAKCRCPgPtYfRL+ TrrlB/0cybM0pgGOwafLmSvV1Kuw38n2Xm2s8vDDjzm6cesAP4fVfeiXo7xwu1xOdRy45Xwr+G5 abP4ExhcNV8VZ1jdoZmBLZ5CIDHWJsRY2bJ6h3qKCEsZlp7ykzhAuxjqkyHR7INf++qDqNup8T+ h/pBWAIGXSlW+KZV1kxBC8Y0sLNrqc1omys7HzYK8a9KXu2TliWtA0oQ83JTOTVMemXygIke9B6 ZWFPGYI/CNF2Xis/9Z1xD1D4urmYWN/vvFapXov3kVisLWVrvOfbMm5qkOK4uJgaJ96Mqfiecbg zg2HkJf3RLXXXNK+DMLN5dvoHOtZ55iyU6wIy17EN5Iwy/n9
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
 drivers/pinctrl/intel/pinctrl-cherryview.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index 81ee949b946d..1f923a895987 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -1728,7 +1728,7 @@ static int chv_pinctrl_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int chv_pinctrl_remove(struct platform_device *pdev)
+static void chv_pinctrl_remove(struct platform_device *pdev)
 {
 	struct intel_pinctrl *pctrl = platform_get_drvdata(pdev);
 	const struct intel_community *community = &pctrl->communities[0];
@@ -1736,8 +1736,6 @@ static int chv_pinctrl_remove(struct platform_device *pdev)
 	acpi_remove_address_space_handler(ACPI_HANDLE(&pdev->dev),
 					  community->acpi_space_id,
 					  chv_pinctrl_mmio_access_handler);
-
-	return 0;
 }
 
 static int chv_pinctrl_suspend_noirq(struct device *dev)
@@ -1835,7 +1833,7 @@ MODULE_DEVICE_TABLE(acpi, chv_pinctrl_acpi_match);
 
 static struct platform_driver chv_pinctrl_driver = {
 	.probe = chv_pinctrl_probe,
-	.remove = chv_pinctrl_remove,
+	.remove_new = chv_pinctrl_remove,
 	.driver = {
 		.name = "cherryview-pinctrl",
 		.pm = pm_sleep_ptr(&chv_pinctrl_pm_ops),
-- 
2.40.1

