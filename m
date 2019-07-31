Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C14CB7BDCC
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2019 11:57:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726923AbfGaJ5q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Jul 2019 05:57:46 -0400
Received: from cmccmta2.chinamobile.com ([221.176.66.80]:2144 "EHLO
        cmccmta2.chinamobile.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726672AbfGaJ5q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Jul 2019 05:57:46 -0400
X-Greylist: delayed 570 seconds by postgrey-1.27 at vger.kernel.org; Wed, 31 Jul 2019 05:57:46 EDT
Received: from spf.mail.chinamobile.com (unknown[172.16.121.11]) by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee85d4163cf051-9f86a; Wed, 31 Jul 2019 17:47:59 +0800 (CST)
X-RM-TRANSID: 2ee85d4163cf051-9f86a
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[223.105.0.243])
        by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee65d4163cdc33-15425;
        Wed, 31 Jul 2019 17:47:59 +0800 (CST)
X-RM-TRANSID: 2ee65d4163cdc33-15425
From:   Ding Xiang <dingxiang@cmss.chinamobile.com>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] gpio: ixp4xx: remove redundant dev_err message
Date:   Wed, 31 Jul 2019 17:47:54 +0800
Message-Id: <1564566474-18294-1-git-send-email-dingxiang@cmss.chinamobile.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

devm_ioremap_resource already contains error message, so remove
the redundant dev_err message

Signed-off-by: Ding Xiang <dingxiang@cmss.chinamobile.com>
---
 drivers/gpio/gpio-ixp4xx.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-ixp4xx.c b/drivers/gpio/gpio-ixp4xx.c
index 670c2a8..2b2b89b 100644
--- a/drivers/gpio/gpio-ixp4xx.c
+++ b/drivers/gpio/gpio-ixp4xx.c
@@ -321,10 +321,8 @@ static int ixp4xx_gpio_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	g->base = devm_ioremap_resource(dev, res);
-	if (IS_ERR(g->base)) {
-		dev_err(dev, "ioremap error\n");
+	if (IS_ERR(g->base))
 		return PTR_ERR(g->base);
-	}
 
 	/*
 	 * Make sure GPIO 14 and 15 are NOT used as clocks but GPIO on
-- 
1.9.1



