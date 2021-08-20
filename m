Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BF4C3F2F94
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Aug 2021 17:38:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241131AbhHTPio (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Aug 2021 11:38:44 -0400
Received: from smtp09.smtpout.orange.fr ([80.12.242.131]:56556 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241128AbhHTPin (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Aug 2021 11:38:43 -0400
Received: from pop-os.home ([90.126.253.178])
        by mwinf5d04 with ME
        id jre42500U3riaq203re415; Fri, 20 Aug 2021 17:38:05 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 20 Aug 2021 17:38:05 +0200
X-ME-IP: 90.126.253.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        alexandru.marginean@nxp.com, Laurentiu.Tudor@nxp.com,
        hui.song_1@nxp.com, andy.shevchenko@gmail.com, ran.wang_1@nxp.com
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 2/3] gpio: mpc8xxx: Fix a potential double iounmap call in 'mpc8xxx_probe()'
Date:   Fri, 20 Aug 2021 17:38:03 +0200
Message-Id: <5341e631dc93902ef13840807163a2883764b8ed.1629472813.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1629472813.git.christophe.jaillet@wanadoo.fr>
References: <cover.1629472813.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Commit 76c47d1449fc ("gpio: mpc8xxx: Add ACPI support") has switched to a
managed version when dealing with 'mpc8xxx_gc->regs'. So the corresponding
'iounmap()' call in the error handling path and in the remove should be
removed to avoid a double unmap.

This also allows some simplification in the probe. All the error handling
paths related to managed resources can be direct returns and a NULL check
in what remains in the error handling path can be removed.

Fixes: 76c47d1449fc ("gpio: mpc8xxx: Add ACPI support")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpio/gpio-mpc8xxx.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index 241bcc80612e..fa4aaeced3f1 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -332,7 +332,7 @@ static int mpc8xxx_probe(struct platform_device *pdev)
 				 mpc8xxx_gc->regs + GPIO_DIR, NULL,
 				 BGPIOF_BIG_ENDIAN);
 		if (ret)
-			goto err;
+			return ret;
 		dev_dbg(&pdev->dev, "GPIO registers are LITTLE endian\n");
 	} else {
 		ret = bgpio_init(gc, &pdev->dev, 4,
@@ -342,7 +342,7 @@ static int mpc8xxx_probe(struct platform_device *pdev)
 				 BGPIOF_BIG_ENDIAN
 				 | BGPIOF_BIG_ENDIAN_BYTE_ORDER);
 		if (ret)
-			goto err;
+			return ret;
 		dev_dbg(&pdev->dev, "GPIO registers are BIG endian\n");
 	}
 
@@ -384,7 +384,7 @@ static int mpc8xxx_probe(struct platform_device *pdev)
 	if (ret) {
 		dev_err(&pdev->dev,
 			"GPIO chip registration failed with status %d\n", ret);
-		goto err;
+		return ret;
 	}
 
 	mpc8xxx_gc->irqn = platform_get_irq(pdev, 0);
@@ -416,9 +416,7 @@ static int mpc8xxx_probe(struct platform_device *pdev)
 
 	return 0;
 err:
-	if (mpc8xxx_gc->irq)
-		irq_domain_remove(mpc8xxx_gc->irq);
-	iounmap(mpc8xxx_gc->regs);
+	irq_domain_remove(mpc8xxx_gc->irq);
 	return ret;
 }
 
@@ -432,7 +430,6 @@ static int mpc8xxx_remove(struct platform_device *pdev)
 	}
 
 	gpiochip_remove(&mpc8xxx_gc->gc);
-	iounmap(mpc8xxx_gc->regs);
 
 	return 0;
 }
-- 
2.30.2

