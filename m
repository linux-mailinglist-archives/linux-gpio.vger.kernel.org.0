Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3A707BD6BF
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Oct 2023 11:23:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345978AbjJIJXE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Oct 2023 05:23:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345858AbjJIJW5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Oct 2023 05:22:57 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B08810C
        for <linux-gpio@vger.kernel.org>; Mon,  9 Oct 2023 02:22:46 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qpmTE-0006ts-SJ; Mon, 09 Oct 2023 11:22:36 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qpmTE-000NWz-F4; Mon, 09 Oct 2023 11:22:36 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qpmTE-00C4pT-5l; Mon, 09 Oct 2023 11:22:36 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Heiko Stuebner <heiko@sntech.de>, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 11/20] pinctrl: rockchip: Convert to platform remove callback returning void
Date:   Mon,  9 Oct 2023 10:38:47 +0200
Message-Id: <20231009083856.222030-12-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231009083856.222030-1-u.kleine-koenig@pengutronix.de>
References: <20231009083856.222030-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1992; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=1r75hWhFIwS3Xxx1rg10xcxelpQqUr47pBcp8katCvo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlI7wLOmza0DUzIsCY9zfipvZ36aTSt6DU6kjvl EYs+uaL1TSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZSO8CwAKCRCPgPtYfRL+ TnXnB/9xI3Eby3413pFsFuP6EKG8aPL42C5OSRsytr3PhPLwgGp3LeX4/f2CzGzcQvQ1x/iXOLl mnhbwlPcElww+ahQoXDEsvpW4wLsNmZjTbrttMB+eHZ4TdXWn8dW6qsnosiATY3xSAgYsVn3UF8 t+K1fNRR9o5yOWL5uTaH06nXwmqZ2ZTFt3Kghc4NpMcJw5QeI0e89NdlHfR7lgUCFbLXgRUFkJa oCxEl53LUOeQSti/1W5K5dL7lAeLhX3H87pGo0fDnnXDfS9tEfty6ZoAXQTzp9sBf5oi8e13aYb qRGs+RIDCz2PyhmyH+dx8TTA+OCZH1VE4pVnXA+OpmzaD+1y
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,SUSPICIOUS_RECIPS autolearn=no
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
 drivers/pinctrl/pinctrl-rockchip.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 45e416f68e74..3bedf36a0019 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -3429,7 +3429,7 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int rockchip_pinctrl_remove(struct platform_device *pdev)
+static void rockchip_pinctrl_remove(struct platform_device *pdev)
 {
 	struct rockchip_pinctrl *info = platform_get_drvdata(pdev);
 	struct rockchip_pin_bank *bank;
@@ -3450,8 +3450,6 @@ static int rockchip_pinctrl_remove(struct platform_device *pdev)
 		}
 		mutex_unlock(&bank->deferred_lock);
 	}
-
-	return 0;
 }
 
 static struct rockchip_pin_bank px30_pin_banks[] = {
@@ -3982,7 +3980,7 @@ static const struct of_device_id rockchip_pinctrl_dt_match[] = {
 
 static struct platform_driver rockchip_pinctrl_driver = {
 	.probe		= rockchip_pinctrl_probe,
-	.remove		= rockchip_pinctrl_remove,
+	.remove_new	= rockchip_pinctrl_remove,
 	.driver = {
 		.name	= "rockchip-pinctrl",
 		.pm = &rockchip_pinctrl_dev_pm_ops,
-- 
2.40.1

