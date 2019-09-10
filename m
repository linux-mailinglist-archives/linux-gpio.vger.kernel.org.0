Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAFD6AECBB
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Sep 2019 16:15:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731905AbfIJOPg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Sep 2019 10:15:36 -0400
Received: from laurent.telenet-ops.be ([195.130.137.89]:52556 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727332AbfIJOPg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Sep 2019 10:15:36 -0400
Received: from ramsan ([84.194.98.4])
        by laurent.telenet-ops.be with bizsmtp
        id zqFW2000k05gfCL01qFWtr; Tue, 10 Sep 2019 16:15:34 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i7gva-0001al-HK; Tue, 10 Sep 2019 16:15:30 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i7gva-0005Tv-F5; Tue, 10 Sep 2019 16:15:30 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Philipp Zabel <philipp.zabel@gmail.com>,
        Paul Parsons <lost.distance@yahoo.com>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Russell King <linux@armlinux.org.uk>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] gpio: htc-egpio: Remove unused exported htc_egpio_get_wakeup_irq()
Date:   Tue, 10 Sep 2019 16:15:29 +0200
Message-Id: <20190910141529.21030-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This function was never used upstream, and is a relic of the original
handhelds.org code the htc-egpio driver was based on.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpio/gpio-htc-egpio.c                | 14 --------------
 include/linux/platform_data/gpio-htc-egpio.h |  3 ---
 2 files changed, 17 deletions(-)

diff --git a/drivers/gpio/gpio-htc-egpio.c b/drivers/gpio/gpio-htc-egpio.c
index 9d3ac51a765c1405..6eb56f7ab9c94e73 100644
--- a/drivers/gpio/gpio-htc-egpio.c
+++ b/drivers/gpio/gpio-htc-egpio.c
@@ -118,20 +118,6 @@ static void egpio_handler(struct irq_desc *desc)
 	}
 }
 
-int htc_egpio_get_wakeup_irq(struct device *dev)
-{
-	struct egpio_info *ei = dev_get_drvdata(dev);
-
-	/* Read current pins. */
-	u16 readval = egpio_readw(ei, ei->ack_register);
-	/* Ack/unmask interrupts. */
-	ack_irqs(ei);
-	/* Return first set pin. */
-	readval &= ei->irqs_enabled;
-	return ei->irq_start + ffs(readval) - 1;
-}
-EXPORT_SYMBOL(htc_egpio_get_wakeup_irq);
-
 static inline int egpio_pos(struct egpio_info *ei, int bit)
 {
 	return bit >> ei->reg_shift;
diff --git a/include/linux/platform_data/gpio-htc-egpio.h b/include/linux/platform_data/gpio-htc-egpio.h
index 9a3e78082883f366..eaefba0b6465b48c 100644
--- a/include/linux/platform_data/gpio-htc-egpio.h
+++ b/include/linux/platform_data/gpio-htc-egpio.h
@@ -50,7 +50,4 @@ struct htc_egpio_platform_data {
 	int                   num_chips;
 };
 
-/* Determine the wakeup irq, to be called during early resume */
-extern int htc_egpio_get_wakeup_irq(struct device *dev);
-
 #endif
-- 
2.17.1

