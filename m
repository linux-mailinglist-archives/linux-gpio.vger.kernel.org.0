Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B34332B588
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2019 14:40:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726544AbfE0Mk4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 May 2019 08:40:56 -0400
Received: from laurent.telenet-ops.be ([195.130.137.89]:40418 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726071AbfE0Mk4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 May 2019 08:40:56 -0400
Received: from ramsan ([84.194.111.163])
        by laurent.telenet-ops.be with bizsmtp
        id HQgu200063XaVaC01Qguwp; Mon, 27 May 2019 14:40:54 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hVEvu-0001Ww-1E; Mon, 27 May 2019 14:40:54 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hVEvu-0001zh-0D; Mon, 27 May 2019 14:40:54 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] gpio: em: Return early on error in em_gio_probe()
Date:   Mon, 27 May 2019 14:40:51 +0200
Message-Id: <20190527124051.7615-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190527124051.7615-1-geert+renesas@glider.be>
References: <20190527124051.7615-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

em_gio_probe() uses managed initializations for everything but creating
the IRQ domain.  Hence in most failure cases, no cleanup needs to be
performed at all.

Make this clearer for the casual reviewer by returning early, instead of
jumping to an out-of-sight label.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpio/gpio-em.c | 28 +++++++++-------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/drivers/gpio/gpio-em.c b/drivers/gpio/gpio-em.c
index 18937a9b1a14a72c..40f8c38bec1c24af 100644
--- a/drivers/gpio/gpio-em.c
+++ b/drivers/gpio/gpio-em.c
@@ -282,10 +282,8 @@ static int em_gio_probe(struct platform_device *pdev)
 	int ret;
 
 	p = devm_kzalloc(&pdev->dev, sizeof(*p), GFP_KERNEL);
-	if (!p) {
-		ret = -ENOMEM;
-		goto err0;
-	}
+	if (!p)
+		return -ENOMEM;
 
 	p->pdev = pdev;
 	platform_set_drvdata(pdev, p);
@@ -298,28 +296,22 @@ static int em_gio_probe(struct platform_device *pdev)
 
 	if (!io[0] || !io[1] || !irq[0] || !irq[1]) {
 		dev_err(&pdev->dev, "missing IRQ or IOMEM\n");
-		ret = -EINVAL;
-		goto err0;
+		return -EINVAL;
 	}
 
 	p->base0 = devm_ioremap_nocache(&pdev->dev, io[0]->start,
 					resource_size(io[0]));
-	if (!p->base0) {
-		ret = -ENOMEM;
-		goto err0;
-	}
+	if (!p->base0)
+		return -ENOMEM;
 
 	p->base1 = devm_ioremap_nocache(&pdev->dev, io[1]->start,
 				   resource_size(io[1]));
-	if (!p->base1) {
-		ret = -ENOMEM;
-		goto err0;
-	}
+	if (!p->base1)
+		return -ENOMEM;
 
 	if (of_property_read_u32(pdev->dev.of_node, "ngpios", &ngpios)) {
 		dev_err(&pdev->dev, "Missing ngpios OF property\n");
-		ret = -EINVAL;
-		goto err0;
+		return -EINVAL;
 	}
 
 	gpio_chip = &p->gpio_chip;
@@ -349,9 +341,8 @@ static int em_gio_probe(struct platform_device *pdev)
 	p->irq_domain = irq_domain_add_simple(pdev->dev.of_node, ngpios, 0,
 					      &em_gio_irq_domain_ops, p);
 	if (!p->irq_domain) {
-		ret = -ENXIO;
 		dev_err(&pdev->dev, "cannot initialize irq domain\n");
-		goto err0;
+		return -ENXIO;
 	}
 
 	if (devm_request_irq(&pdev->dev, irq[0]->start,
@@ -378,7 +369,6 @@ static int em_gio_probe(struct platform_device *pdev)
 
 err1:
 	irq_domain_remove(p->irq_domain);
-err0:
 	return ret;
 }
 
-- 
2.17.1

