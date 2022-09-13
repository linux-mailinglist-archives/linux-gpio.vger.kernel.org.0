Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA1735B78B8
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Sep 2022 19:51:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232120AbiIMRtO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Sep 2022 13:49:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233643AbiIMRsc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Sep 2022 13:48:32 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 614B36F266
        for <linux-gpio@vger.kernel.org>; Tue, 13 Sep 2022 09:46:43 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id e16so21767221wrx.7
        for <linux-gpio@vger.kernel.org>; Tue, 13 Sep 2022 09:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=pnx7RKTA75kKWWem6A28iKcvxHYgEPxxGKt+MiSxLn0=;
        b=V23QQcPJ8KZtX+jzalsNeS37bHeBBDsP1mZ/WsPmkffxd2F88KPc3x6Dsu2tn4O8jl
         q1tbwmmv/CJpQLM7kRfrqu8y3YQqzow4vex4upxrWxe9q40wL6PW+0mVMyncgF/V813M
         LFezSevaaTb0GL+CFE21BDJCzbnltLwFkihvIgClKew18DHNGeaCaa5rShqctiUUVK8x
         ivwOZyJXix2KSEGRQeONT2RgNyDF5hXaFw/1E7OH1unbRY072FV60q8yLImQviOIAFOF
         BgDwXtDI7g26jZT0wUgKe51OTTl6zR4us4a4AJiyFgS5xx4cPwNpjG1DZYVtWsE6xeJ2
         iFPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=pnx7RKTA75kKWWem6A28iKcvxHYgEPxxGKt+MiSxLn0=;
        b=E4MlU2RqwOpkrIfyGhllFWVLBJJpFlLxAO8Fa/K7hIkYBUUAeb7AAavhWY6CXSSxgW
         SjP12YoVx+Ka0OaDE/gKnbPEdB0cXQTGvUqg56aPYTOLkOuQZncbOrrmkhBDoDGY0QGB
         TV4DmWn4HbYR35eaao+qUFfKgzX43XUg/hG+uOJkKCD5QUh3hkbY6SCO5z3BfEh0BL3o
         BEz09ily3odU79on4QfILxg7vEruwJMuSz19SCJ+2qGLpjH5Hv5C3kcFN6RffvuuFscU
         9ENGjsWl+ka/3LoOcnqDk4GoUypw4BwX92lrteKIrNUz9esAnHApWrQ2I+TTU2o3YPIL
         prIw==
X-Gm-Message-State: ACgBeo0DmFbKLMP2kLPNH9j8+mmfp35uDodIBot7MIzlz/CNNv/yVpHu
        VqHB5mJlmfa6w9ul1k7DXU7Uq318e4WcWA==
X-Google-Smtp-Source: AA6agR7hEqOSILcZG4XAiCt5A/ghLCmYdBLQH63M2kyAy92+EuOOH7LPE/TioJPosW21I2CbzcSv6g==
X-Received: by 2002:a05:6000:11d0:b0:228:8d5d:f2e9 with SMTP id i16-20020a05600011d000b002288d5df2e9mr19040614wrx.207.1663087601551;
        Tue, 13 Sep 2022 09:46:41 -0700 (PDT)
Received: from localhost.localdomain (188.red-88-10-59.dynamicip.rima-tde.net. [88.10.59.188])
        by smtp.gmail.com with ESMTPSA id o17-20020a05600c511100b003b49bd61b19sm461356wms.15.2022.09.13.09.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 09:46:41 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     linus.walleij@linaro.org, brgl@bgdev.pl, arinc.unal@arinc9.com,
        matthias.bgg@gmail.com, neil@brown.name
Subject: [PATCH v2] gpio: mt7621: Make the irqchip immutable
Date:   Tue, 13 Sep 2022 18:46:38 +0200
Message-Id: <20220913164639.403025-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Commit 6c846d026d49 ("gpio: Don't fiddle with irqchips marked as
immutable") added a warning to indicate if the gpiolib is altering the
internals of irqchips.  Following this change the following warnings
are now observed for the mt7621 driver:

gpio gpiochip0: (1e000600.gpio-bank0): not an immutable chip, please consider fixing it!
gpio gpiochip1: (1e000600.gpio-bank1): not an immutable chip, please consider fixing it!
gpio gpiochip2: (1e000600.gpio-bank2): not an immutable chip, please consider fixing it!

Fix this by making the irqchip in the mt7621 driver immutable.

Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
Changes in v2:
- Make independent PATCH since this must go to fixes branch.

 drivers/gpio/gpio-mt7621.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-mt7621.c b/drivers/gpio/gpio-mt7621.c
index d8a26e503ca5..f163f5ca857b 100644
--- a/drivers/gpio/gpio-mt7621.c
+++ b/drivers/gpio/gpio-mt7621.c
@@ -112,6 +112,8 @@ mediatek_gpio_irq_unmask(struct irq_data *d)
 	unsigned long flags;
 	u32 rise, fall, high, low;
 
+	gpiochip_enable_irq(gc, d->hwirq);
+
 	spin_lock_irqsave(&rg->lock, flags);
 	rise = mtk_gpio_r32(rg, GPIO_REG_REDGE);
 	fall = mtk_gpio_r32(rg, GPIO_REG_FEDGE);
@@ -143,6 +145,8 @@ mediatek_gpio_irq_mask(struct irq_data *d)
 	mtk_gpio_w32(rg, GPIO_REG_HLVL, high & ~BIT(pin));
 	mtk_gpio_w32(rg, GPIO_REG_LLVL, low & ~BIT(pin));
 	spin_unlock_irqrestore(&rg->lock, flags);
+
+	gpiochip_disable_irq(gc, d->hwirq);
 }
 
 static int
@@ -204,6 +208,16 @@ mediatek_gpio_xlate(struct gpio_chip *chip,
 	return gpio % MTK_BANK_WIDTH;
 }
 
+static const struct irq_chip mt7621_irq_chip = {
+	.name		= "mt7621-gpio",
+	.irq_mask_ack	= mediatek_gpio_irq_mask,
+	.irq_mask	= mediatek_gpio_irq_mask,
+	.irq_unmask	= mediatek_gpio_irq_unmask,
+	.irq_set_type	= mediatek_gpio_irq_type,
+	.flags		= IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
 static int
 mediatek_gpio_bank_probe(struct device *dev, int bank)
 {
@@ -238,11 +252,6 @@ mediatek_gpio_bank_probe(struct device *dev, int bank)
 		return -ENOMEM;
 
 	rg->chip.offset = bank * MTK_BANK_WIDTH;
-	rg->irq_chip.name = dev_name(dev);
-	rg->irq_chip.irq_unmask = mediatek_gpio_irq_unmask;
-	rg->irq_chip.irq_mask = mediatek_gpio_irq_mask;
-	rg->irq_chip.irq_mask_ack = mediatek_gpio_irq_mask;
-	rg->irq_chip.irq_set_type = mediatek_gpio_irq_type;
 
 	if (mtk->gpio_irq) {
 		struct gpio_irq_chip *girq;
@@ -262,7 +271,7 @@ mediatek_gpio_bank_probe(struct device *dev, int bank)
 		}
 
 		girq = &rg->chip.irq;
-		girq->chip = &rg->irq_chip;
+		gpio_irq_chip_set_chip(girq, &mt7621_irq_chip);
 		/* This will let us handle the parent IRQ in the driver */
 		girq->parent_handler = NULL;
 		girq->num_parents = 0;
-- 
2.25.1

