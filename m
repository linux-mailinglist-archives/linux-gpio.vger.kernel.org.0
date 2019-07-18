Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BC716C96D
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2019 08:51:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726423AbfGRGvp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Jul 2019 02:51:45 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:36276 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726397AbfGRGvp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Jul 2019 02:51:45 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id x6I6p9ST017611;
        Thu, 18 Jul 2019 15:51:10 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com x6I6p9ST017611
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1563432670;
        bh=ZhDfduBxSN7i25VRGia8YNv8px3x7GeUSF1hPbqj3LU=;
        h=From:To:Cc:Subject:Date:From;
        b=BQUMM2PqBjQldXgRks4B2tHXeL+fCcUba6f9gjeYYXVgbhLUkboZ4cPmrsDhO8ziF
         +oMFxoX3052q3b4eS03q7yLzplHv8JHGBfzg81gUfb40uff4unZXHwApfakjniUph2
         uM5HrDTa4OGwkX5NaOxpUYd9e1dwBhh+QHr+V2/Q7fQ2osiYA2Ouj1H5Gr+w0ME9Fc
         5gQbyEMJNAiPjrfIOnRo1KSNmlBB7o1d3Af438PZZUt667PYZCde8HDZ2ORvy4ySGa
         ORNgsvgH6E6rrhgYvG6/k73fnAobar9HMbMxzlXnCkLs2YdUvNpqOyWhSt9WMgt/H4
         NRC6oGRR0FZVg==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] gpio: refactor gpiochip_allocate_mask() with bitmap_alloc()
Date:   Thu, 18 Jul 2019 15:51:01 +0900
Message-Id: <20190718065101.26994-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Refactor gpiochip_allocate_mask() slightly by using bitmap_alloc().

I used bitmap_free() for the corresponding free parts. Actually,
bitmap_free() is a wrapper of kfree(), but I did this for consistency.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/gpio/gpiolib.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 3ee99d070608..5ac2daa01a53 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -350,7 +350,7 @@ static unsigned long *gpiochip_allocate_mask(struct gpio_chip *chip)
 {
 	unsigned long *p;
 
-	p = kmalloc_array(BITS_TO_LONGS(chip->ngpio), sizeof(*p), GFP_KERNEL);
+	p = bitmap_alloc(chip->ngpio, GFP_KERNEL);
 	if (!p)
 		return NULL;
 
@@ -391,7 +391,7 @@ static int gpiochip_init_valid_mask(struct gpio_chip *gpiochip)
 
 static void gpiochip_free_valid_mask(struct gpio_chip *gpiochip)
 {
-	kfree(gpiochip->valid_mask);
+	bitmap_free(gpiochip->valid_mask);
 	gpiochip->valid_mask = NULL;
 }
 
@@ -1626,7 +1626,7 @@ static int gpiochip_irqchip_init_valid_mask(struct gpio_chip *gpiochip)
 
 static void gpiochip_irqchip_free_valid_mask(struct gpio_chip *gpiochip)
 {
-	kfree(gpiochip->irq.valid_mask);
+	bitmap_free(gpiochip->irq.valid_mask);
 	gpiochip->irq.valid_mask = NULL;
 }
 
-- 
2.17.1

