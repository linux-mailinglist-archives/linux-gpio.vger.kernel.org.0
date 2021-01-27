Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 797C23058C3
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jan 2021 11:49:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236199AbhA0KsP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jan 2021 05:48:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236021AbhA0KrR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jan 2021 05:47:17 -0500
Received: from forward106j.mail.yandex.net (forward106j.mail.yandex.net [IPv6:2a02:6b8:0:801:2::109])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83E4FC061756;
        Wed, 27 Jan 2021 02:46:36 -0800 (PST)
Received: from iva3-d53c26eb10e1.qloud-c.yandex.net (iva3-d53c26eb10e1.qloud-c.yandex.net [IPv6:2a02:6b8:c0c:4987:0:640:d53c:26eb])
        by forward106j.mail.yandex.net (Yandex) with ESMTP id 22ADB11A051F;
        Wed, 27 Jan 2021 13:46:35 +0300 (MSK)
Received: from iva6-2d18925256a6.qloud-c.yandex.net (iva6-2d18925256a6.qloud-c.yandex.net [2a02:6b8:c0c:7594:0:640:2d18:9252])
        by iva3-d53c26eb10e1.qloud-c.yandex.net (mxback/Yandex) with ESMTP id DdaifY9g5w-kYIecDBJ;
        Wed, 27 Jan 2021 13:46:35 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1611744395;
        bh=NksoZNcKKUE3260NNAYDG2vnGMSmlMXoncP8yw6Q+4k=;
        h=In-Reply-To:References:Date:Subject:To:From:Message-Id:Cc;
        b=f03dM9INCzyTBRyAs70VmhKbiyhFnGXWOefQM85LQWFjt1nZmDlVUuG2wrMgvlozT
         pvbBSXku/+g6kdY6Ph+qlcUkVasAvfyBAyHsTO+FxqvtFoeCSVXJeqsqfEkMl1sJy0
         Fa9h/8pRlsW07rGgX/BT5bJVc8HJM0VGeHQSqsWw=
Authentication-Results: iva3-d53c26eb10e1.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by iva6-2d18925256a6.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id AUuDuROonk-kYm8IP5v;
        Wed, 27 Jan 2021 13:46:34 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Nikita Shubin <nikita.shubin@maquefel.me>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 8/9] gpio: ep93xx: refactor base IRQ number
Date:   Wed, 27 Jan 2021 13:46:16 +0300
Message-Id: <20210127104617.1173-9-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210127104617.1173-1-nikita.shubin@maquefel.me>
References: <20201228150052.2633-1-nikita.shubin@maquefel.me>
 <20210127104617.1173-1-nikita.shubin@maquefel.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

- use predefined constants instead of plain numbers
- use provided bank IRQ number instead of defined constant
  for port F

Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
---
 drivers/gpio/gpio-ep93xx.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
index b212c007240e..2aee13b5067d 100644
--- a/drivers/gpio/gpio-ep93xx.c
+++ b/drivers/gpio/gpio-ep93xx.c
@@ -28,6 +28,8 @@
 /* Maximum value for irq capable line identifiers */
 #define EP93XX_GPIO_LINE_MAX_IRQ 23
 
+#define EP93XX_GPIO_A_IRQ_BASE 64
+#define EP93XX_GPIO_B_IRQ_BASE 72
 /*
  * Static mapping of GPIO bank F IRQS:
  * F0..F7 (16..24) to irq 80..87.
@@ -311,14 +313,14 @@ struct ep93xx_gpio_bank {
 
 static struct ep93xx_gpio_bank ep93xx_gpio_banks[] = {
 	/* Bank A has 8 IRQs */
-	EP93XX_GPIO_BANK("A", 0x00, 0x10, 0, true, false, 64),
+	EP93XX_GPIO_BANK("A", 0x00, 0x10, 0, true, false, EP93XX_GPIO_A_IRQ_BASE),
 	/* Bank B has 8 IRQs */
-	EP93XX_GPIO_BANK("B", 0x04, 0x14, 8, true, false, 72),
+	EP93XX_GPIO_BANK("B", 0x04, 0x14, 8, true, false, EP93XX_GPIO_B_IRQ_BASE),
 	EP93XX_GPIO_BANK("C", 0x08, 0x18, 40, false, false, 0),
 	EP93XX_GPIO_BANK("D", 0x0c, 0x1c, 24, false, false, 0),
 	EP93XX_GPIO_BANK("E", 0x20, 0x24, 32, false, false, 0),
 	/* Bank F has 8 IRQs */
-	EP93XX_GPIO_BANK("F", 0x30, 0x34, 16, false, true, 0),
+	EP93XX_GPIO_BANK("F", 0x30, 0x34, 16, false, true, EP93XX_GPIO_F_IRQ_BASE),
 	EP93XX_GPIO_BANK("G", 0x38, 0x3c, 48, false, false, 0),
 	EP93XX_GPIO_BANK("H", 0x40, 0x44, 56, false, false, 0),
 };
@@ -445,7 +447,7 @@ static int ep93xx_gpio_add_bank(struct gpio_chip *gc,
 
 	/* Only bank F has especially funky IRQ handling */
 	if (bank->has_hierarchical_irq) {
-		err = ep93xx_gpio_add_f_irq_chip(pdev, girq, EP93XX_GPIO_F_IRQ_BASE);
+		err = ep93xx_gpio_add_f_irq_chip(pdev, girq, bank->irq_base);
 		if (err)
 			return err;
 	}
-- 
2.29.2

