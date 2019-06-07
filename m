Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7EBF38789
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jun 2019 11:59:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728187AbfFGJ7N (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Jun 2019 05:59:13 -0400
Received: from albert.telenet-ops.be ([195.130.137.90]:54342 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727993AbfFGJ7C (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Jun 2019 05:59:02 -0400
Received: from ramsan ([84.194.111.163])
        by albert.telenet-ops.be with bizsmtp
        id Mlz02000Q3XaVaC06lz0P6; Fri, 07 Jun 2019 11:59:01 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hZBeG-000416-Ik; Fri, 07 Jun 2019 11:59:00 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hZBeG-0002ci-Hi; Fri, 07 Jun 2019 11:59:00 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 4/4] gpio: rcar: Use proper irq_chip name
Date:   Fri,  7 Jun 2019 11:58:58 +0200
Message-Id: <20190607095858.10028-5-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190607095858.10028-1-geert+renesas@glider.be>
References: <20190607095858.10028-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The irq_chip .name field should contain the device's class name, not the
instance's name.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpio/gpio-rcar.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index 70e95fc4779fe262..3ae58f182a08718a 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -483,7 +483,7 @@ static int gpio_rcar_probe(struct platform_device *pdev)
 	gpio_chip->ngpio = npins;
 
 	irq_chip = &p->irq_chip;
-	irq_chip->name = name;
+	irq_chip->name = "gpio-rcar";
 	irq_chip->parent_device = dev;
 	irq_chip->irq_mask = gpio_rcar_irq_disable;
 	irq_chip->irq_unmask = gpio_rcar_irq_enable;
-- 
2.17.1

