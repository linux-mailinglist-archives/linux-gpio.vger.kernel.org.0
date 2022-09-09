Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B77E95B34AD
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Sep 2022 11:57:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229673AbiIIJ4y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Sep 2022 05:56:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229770AbiIIJ4j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Sep 2022 05:56:39 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 070F012D1AE
        for <linux-gpio@vger.kernel.org>; Fri,  9 Sep 2022 02:56:36 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id m3-20020a05600c3b0300b003a5e0557150so3296199wms.0
        for <linux-gpio@vger.kernel.org>; Fri, 09 Sep 2022 02:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=1v2IxXedap9dB4eUkPSzc+fAfFsNqLFJ+CLlt5Tb9QQ=;
        b=d9a5pB+7vFPZ+y+hS4A1lH+QeRJpg2pfKsSMvEuF4yXd7ZE7QSfYAT1YUMCPTsMo97
         BRZorLLIanuk/wJcoKrPKjPDyQeUMC0vF64zvDQCRY/FHj2+i49VntMUJAdBa1p1y3mP
         kxtAyidzsGY8xgy285+H6iRLdsX/s6y4FRgcnYFbmtozuN7CsmytT4JKv1OPYwnrp9qq
         zJWJ5hc2xkQN9DQCNF/yFh5Cim8fTDC9EVJ/0vllqngxWcT2WcYLgmXqX5z1+JK/Wput
         1KZlM0UP0wQMNKQRDZHDphY64JYOLtFNRZ8sfNyKL329nmhP71oDtAo8O6UmFLwZQcSQ
         4qsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=1v2IxXedap9dB4eUkPSzc+fAfFsNqLFJ+CLlt5Tb9QQ=;
        b=HC3UAaVCrLg0YYyP6IkD8PWN3DuJmPLjKSwxodqA+Fr9tC8VhTCU3daOAcul530+Tl
         7UIpBv4pTCwHghJ+y+d3XOps8yGqVZMu+VCEjzHDglMWqsdO8tRxK8dg20JkRtGRE0zT
         y/KMMoGr3UwRiKrERYuM7M2yC6NYEOmfC0KhvnybSBI5VK9tmiJTfFWxKFpygN5tPFfr
         AT1KpTVunCL2Pphig+6FCMq2xIQ62FwEkqjYKzna0MzktedhSgPd+vpugvW64Hp3U9Kz
         enQq94HQR2uObcj3S45InQuITjFYt44fg964cAovuF1d32ZEoy7byhM24KVw2YAvk+V0
         /Ceg==
X-Gm-Message-State: ACgBeo3KTwF1qBM89GMYEErAnNrRriUnMMgjMO+6NB3n2d0otcT+OuGA
        1qOs2OF8ahF4RFmlvESeRjW1QZdS/v6IBQ==
X-Google-Smtp-Source: AA6agR4dlzPDFhwqvPVwwIxc4FYMQxw5DV5BSMDeXSzgWmH/gIOdEiSP50WKgC5m0ubijux00lq/ww==
X-Received: by 2002:a05:600c:ace:b0:3b4:621f:93f4 with SMTP id c14-20020a05600c0ace00b003b4621f93f4mr94796wmr.8.1662717394316;
        Fri, 09 Sep 2022 02:56:34 -0700 (PDT)
Received: from localhost.localdomain (188.red-88-10-59.dynamicip.rima-tde.net. [88.10.59.188])
        by smtp.gmail.com with ESMTPSA id bt4-20020a056000080400b002238ea5750csm117597wrb.72.2022.09.09.02.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 02:56:34 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     linus.walleij@linaro.org, brgl@bgdev.pl, arinc.unal@arinc9.com,
        matthias.bgg@gmail.com
Subject: [PATCH 2/2] gpio: mt7621: Make the irqchip immutable
Date:   Fri,  9 Sep 2022 11:56:32 +0200
Message-Id: <20220909095632.2056143-2-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220909095632.2056143-1-sergio.paracuellos@gmail.com>
References: <20220909095632.2056143-1-sergio.paracuellos@gmail.com>
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
 drivers/gpio/gpio-mt7621.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-mt7621.c b/drivers/gpio/gpio-mt7621.c
index 05891dd3f96e..729cc8f72343 100644
--- a/drivers/gpio/gpio-mt7621.c
+++ b/drivers/gpio/gpio-mt7621.c
@@ -111,6 +111,8 @@ mediatek_gpio_irq_unmask(struct irq_data *d)
 	unsigned long flags;
 	u32 rise, fall, high, low;
 
+	gpiochip_enable_irq(gc, d->hwirq);
+
 	spin_lock_irqsave(&rg->lock, flags);
 	rise = mtk_gpio_r32(rg, GPIO_REG_REDGE);
 	fall = mtk_gpio_r32(rg, GPIO_REG_FEDGE);
@@ -142,6 +144,8 @@ mediatek_gpio_irq_mask(struct irq_data *d)
 	mtk_gpio_w32(rg, GPIO_REG_HLVL, high & ~BIT(pin));
 	mtk_gpio_w32(rg, GPIO_REG_LLVL, low & ~BIT(pin));
 	spin_unlock_irqrestore(&rg->lock, flags);
+
+	gpiochip_disable_irq(gc, d->hwirq);
 }
 
 static int
@@ -203,6 +207,16 @@ mediatek_gpio_xlate(struct gpio_chip *chip,
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
 mediatek_gpio_bank_probe(struct device *dev,
 			 struct fwnode_handle *fwnode, int bank)
@@ -239,11 +253,6 @@ mediatek_gpio_bank_probe(struct device *dev,
 		return -ENOMEM;
 
 	rg->chip.offset = bank * MTK_BANK_WIDTH;
-	rg->irq_chip.name = dev_name(dev);
-	rg->irq_chip.irq_unmask = mediatek_gpio_irq_unmask;
-	rg->irq_chip.irq_mask = mediatek_gpio_irq_mask;
-	rg->irq_chip.irq_mask_ack = mediatek_gpio_irq_mask;
-	rg->irq_chip.irq_set_type = mediatek_gpio_irq_type;
 
 	if (mtk->gpio_irq) {
 		struct gpio_irq_chip *girq;
@@ -263,7 +272,7 @@ mediatek_gpio_bank_probe(struct device *dev,
 		}
 
 		girq = &rg->chip.irq;
-		girq->chip = &rg->irq_chip;
+		gpio_irq_chip_set_chip(girq, &mt7621_irq_chip);
 		/* This will let us handle the parent IRQ in the driver */
 		girq->parent_handler = NULL;
 		girq->num_parents = 0;
-- 
2.25.1

