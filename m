Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD0E7552B02
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jun 2022 08:35:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345333AbiFUGfi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jun 2022 02:35:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235008AbiFUGfi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jun 2022 02:35:38 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2DF115A07
        for <linux-gpio@vger.kernel.org>; Mon, 20 Jun 2022 23:35:36 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1o3XU6-0002Vh-12; Tue, 21 Jun 2022 08:35:34 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1o3XU2-001mg1-7e; Tue, 21 Jun 2022 08:35:31 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1o3XU2-0009Nd-Uv; Tue, 21 Jun 2022 08:35:30 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Doug Berger <opendmb@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@pengutronix.de
Subject: [PATCH] gpio: brcmstb: Make .remove() obviously always return 0
Date:   Tue, 21 Jun 2022 08:35:24 +0200
Message-Id: <20220621063524.146604-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1453; h=from:subject; bh=elYeY8lZw+FFM0NfPKFwTcZT0AbtnW5R5kafvn9u/Gg=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBisWappUPz26kDSXoAw/xCZQkwS1kAntSBW6+lwYCr 5kYMdiaJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYrFmqQAKCRDB/BR4rcrsCYewB/ sHSlcpcpRUbzQf+85ZwsBxRSV72r4AXaNQNiFoXBh6m5J83EAjaicVmKBh1puYFVjslKMVUq7UzeBC PW8FheSHOdB3IK7UvkTvoLb7YZxhAm9yPny0lm3WQaYpyemGuB1KV1e1m/msB4npHhj+CTmQTbleEy nfNOOY835Wp/kMn6CwVrvoafKmmWmywXZRO8WgLdLSbfCmCPQ+9Ody4mc7UEgNgOnH/yT8a/Yynkof QP55righgK3On42agR50gk1QVuMdjmEZDe5hF/R5evdsjav7m3B5yjXFWgJeJy+Kplzzkd1Z3YkWo/ SmuJkMirEePs3zjCQkX7KInlb5ANra
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

priv cannot be NULL because brcmstb_gpio_probe() calls
platform_set_drvdata() with a non-NULL argument, so the check for !priv can
be dropped.

Also remove the variable ret that is only used to hide a bit that in the
end zero is returned.

This is a preparation for making platform remove callbacks return void.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpio/gpio-brcmstb.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
index 6b7439b44690..f620f0712134 100644
--- a/drivers/gpio/gpio-brcmstb.c
+++ b/drivers/gpio/gpio-brcmstb.c
@@ -385,12 +385,7 @@ static int brcmstb_gpio_remove(struct platform_device *pdev)
 {
 	struct brcmstb_gpio_priv *priv = platform_get_drvdata(pdev);
 	struct brcmstb_gpio_bank *bank;
-	int offset, ret = 0, virq;
-
-	if (!priv) {
-		dev_err(&pdev->dev, "called %s without drvdata!\n", __func__);
-		return -EFAULT;
-	}
+	int offset, virq;
 
 	if (priv->parent_irq > 0)
 		irq_set_chained_handler_and_data(priv->parent_irq, NULL, NULL);
@@ -411,7 +406,7 @@ static int brcmstb_gpio_remove(struct platform_device *pdev)
 	list_for_each_entry(bank, &priv->bank_list, node)
 		gpiochip_remove(&bank->gc);
 
-	return ret;
+	return 0;
 }
 
 static int brcmstb_gpio_of_xlate(struct gpio_chip *gc,

base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56
-- 
2.36.1

