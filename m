Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03B873F2F9C
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Aug 2021 17:38:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241156AbhHTPiz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Aug 2021 11:38:55 -0400
Received: from smtp09.smtpout.orange.fr ([80.12.242.131]:60009 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241164AbhHTPix (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Aug 2021 11:38:53 -0400
Received: from pop-os.home ([90.126.253.178])
        by mwinf5d04 with ME
        id jreE2500L3riaq203reE2M; Fri, 20 Aug 2021 17:38:14 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 20 Aug 2021 17:38:14 +0200
X-ME-IP: 90.126.253.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        alexandru.marginean@nxp.com, Laurentiu.Tudor@nxp.com,
        hui.song_1@nxp.com, andy.shevchenko@gmail.com, ran.wang_1@nxp.com
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 3/3] gpio: mpc8xxx: Use 'devm_gpiochip_add_data()' to simplify the code and avoid a leak
Date:   Fri, 20 Aug 2021 17:38:13 +0200
Message-Id: <b8af1f01cc987d78a8677fcc3709595f8e5b0f38.1629472813.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1629472813.git.christophe.jaillet@wanadoo.fr>
References: <cover.1629472813.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

If an error occurs after a 'gpiochip_add_data()' call it must be undone by
a corresponding 'gpiochip_remove()' as already done in the remove function.

To simplify the code a fix a leak in the error handling path of the probe,
use the managed version instead (i.e. 'devm_gpiochip_add_data()')

Fixes: 698b8eeaed72 ("gpio/mpc8xxx: change irq handler from chained to normal")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpio/gpio-mpc8xxx.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index fa4aaeced3f1..70d6ae20b1da 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -380,7 +380,7 @@ static int mpc8xxx_probe(struct platform_device *pdev)
 	    is_acpi_node(fwnode))
 		gc->write_reg(mpc8xxx_gc->regs + GPIO_IBE, 0xffffffff);
 
-	ret = gpiochip_add_data(gc, mpc8xxx_gc);
+	ret = devm_gpiochip_add_data(&pdev->dev, gc, mpc8xxx_gc);
 	if (ret) {
 		dev_err(&pdev->dev,
 			"GPIO chip registration failed with status %d\n", ret);
@@ -429,8 +429,6 @@ static int mpc8xxx_remove(struct platform_device *pdev)
 		irq_domain_remove(mpc8xxx_gc->irq);
 	}
 
-	gpiochip_remove(&mpc8xxx_gc->gc);
-
 	return 0;
 }
 
-- 
2.30.2

