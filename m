Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA8235C038E
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Sep 2022 18:07:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232465AbiIUQHF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Sep 2022 12:07:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232241AbiIUQGQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Sep 2022 12:06:16 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3674A3D5C;
        Wed, 21 Sep 2022 08:55:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E61F2B830C1;
        Wed, 21 Sep 2022 15:54:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E8DFC43145;
        Wed, 21 Sep 2022 15:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663775646;
        bh=ltWOdhCi4WgafmHd2YL/5444t2bzTYe2PF/tCbDgrRY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uj6ouWhjMM79xQw/X53kttXs6kHQiif0w/BFN3Pyh72MLSQ64ma0qImilI9EcxVEa
         pfRbCGGYnT10lRH5bi45huLFzWcVci047a8gKF1EQ6O4JqBhXnPGinzQrlZMM9WxUF
         x1pyGSqDNLKv3OdnnowFzQLQGg5wiWsult/2GZFOoTPoGwiyKY3euCJfscGRcNUPgC
         MWts7ZoPvi1/MFUCHyEkNJmE/werNLBLGGzcnb5e953hoA6DDdqZECOGI11IkP34Qo
         x/3H+lfKtQIjAd0X9BSpAeDu8gRLQnnjxk9oDoVeSy3DQQ1/7v44UcEbidqqxUY3/8
         ITNyaXs2Nd4Wg==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Sasha Levin <sashal@kernel.org>, linus.walleij@linaro.org,
        matthias.bgg@gmail.com, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.19 16/16] gpio: mt7621: Make the irqchip immutable
Date:   Wed, 21 Sep 2022 11:53:32 -0400
Message-Id: <20220921155332.234913-16-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220921155332.234913-1-sashal@kernel.org>
References: <20220921155332.234913-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Sergio Paracuellos <sergio.paracuellos@gmail.com>

[ Upstream commit 09eed5a1ed3c752892663976837eb4244c2f1984 ]

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
Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
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
2.35.1

