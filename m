Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB3D99A15E
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Aug 2019 22:45:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393303AbfHVUpq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Aug 2019 16:45:46 -0400
Received: from smtp04.smtpout.orange.fr ([80.12.242.126]:44098 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730839AbfHVUpq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 22 Aug 2019 16:45:46 -0400
Received: from localhost.localdomain ([90.126.162.2])
        by mwinf5d27 with ME
        id sLlh2000303Qemq03LlhAA; Thu, 22 Aug 2019 22:45:42 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 22 Aug 2019 22:45:42 +0200
X-ME-IP: 90.126.162.2
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] gpio: ftgpio: Fix an error handling path in 'ftgpio_gpio_probe()'
Date:   Thu, 22 Aug 2019 22:45:38 +0200
Message-Id: <20190822204538.4791-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

If 'devm_kcalloc()' fails, we should go through the error handling path,
should some clean-up be needed.

Fixes: 42d9fc7176eb ("gpio: ftgpio: Pass irqchip when adding gpiochip")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpio/gpio-ftgpio010.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-ftgpio010.c b/drivers/gpio/gpio-ftgpio010.c
index 250e71f3e688..1478259102be 100644
--- a/drivers/gpio/gpio-ftgpio010.c
+++ b/drivers/gpio/gpio-ftgpio010.c
@@ -290,8 +290,10 @@ static int ftgpio_gpio_probe(struct platform_device *pdev)
 	girq->num_parents = 1;
 	girq->parents = devm_kcalloc(dev, 1, sizeof(*girq->parents),
 				     GFP_KERNEL);
-	if (!girq->parents)
-		return -ENOMEM;
+	if (!girq->parents) {
+		ret = -ENOMEM;
+		goto dis_clk;
+	}
 	girq->default_type = IRQ_TYPE_NONE;
 	girq->handler = handle_bad_irq;
 	girq->parents[0] = irq;
-- 
2.20.1

