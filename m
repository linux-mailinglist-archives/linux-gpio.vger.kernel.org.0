Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3ADD15F2B73
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Oct 2022 10:12:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230472AbiJCIMN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Oct 2022 04:12:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230516AbiJCILu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Oct 2022 04:11:50 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44E3558DE2
        for <linux-gpio@vger.kernel.org>; Mon,  3 Oct 2022 00:47:21 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id s17so519188ljs.12
        for <linux-gpio@vger.kernel.org>; Mon, 03 Oct 2022 00:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=WsMDIgTqIoOZSUIMDyCEkcJfjoFUy9Uu1cpUdao7SPA=;
        b=mSMBZmJ0lQkhJe3xW4/oZZuplWwTUC9P553F69yODJoYP3lYm256fhZzdnKEu67rBV
         308/wL3bLS49BLsI88oD6sKFM62O8wLKqTaGBMFZ5+GrxHQ5waSk16mCPBQUTUNUh2tI
         FgHDJ1OnXSIOEOWsIxKINgd1vdjXduxEgpDaobHN0WHwRqUU0HPGU6glraPfBWxkOS4R
         7ms7OvLQprRqDDZGOM7/ZBEsY7TesHJHPJrF/PkTn9F/erVF3uAzOdm21zQJTQbRh4g0
         7G2syioJJoUh33AVT06c0wFtZY5NxtonT7QXMSqghc9DlVGfig7/BxGKYljnGUyv0//v
         8G0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=WsMDIgTqIoOZSUIMDyCEkcJfjoFUy9Uu1cpUdao7SPA=;
        b=IXDPfWza27SH+/Q3qj7naJVs+x+/zmNf4Da79FffDQWuSVzjwYfnOw5zkOoNU3y2Ty
         EWBH2p7pxx8S2q9vuVKT4919AL29hj7uJb01Nf1BOeXisri3umEmVopZBiGVsEl+rqSa
         AFzY9gWe2/EVS/Czc1QpqEziI0e2x4f2v+ygf+twyGS1g3fOynYAv3YD5hvmce6cUg7N
         /LxiQFDITF7aMaJDspfN/mpmfQ+VyFHxkdRJEyw/NVJ0DKPButp0CuykotmlV+BYSUyL
         YCGZJcQN7vDhnmybCNl89CYZtaRKVcNTF7NV9d9nlJILDylNyZXGJXQWwMxIDLNGj5mT
         WFdw==
X-Gm-Message-State: ACrzQf2TygV7N9CFbaJ6BagggM0LfQa38GC65eU1Ref+VZXV648Orofo
        vPJSJSDAe66BI335IvrqeVFIvXhLAl4sTA==
X-Google-Smtp-Source: AMsMyM5Yvgq5ceqahssxogk84F/hTcOHimEMShwOgtsFtBvNwT6HKwpv0IrQ1LuOBlh0BrZxAwtuRQ==
X-Received: by 2002:a2e:80d4:0:b0:26d:e557:a9ca with SMTP id r20-20020a2e80d4000000b0026de557a9camr77160ljg.311.1664783123771;
        Mon, 03 Oct 2022 00:45:23 -0700 (PDT)
Received: from fedora.. ([85.235.10.72])
        by smtp.gmail.com with ESMTPSA id be12-20020a056512250c00b00498ff4ae746sm1342371lfb.294.2022.10.03.00.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 00:45:22 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>
Subject: [PATCH v2] gpio: tc3589x: Make irqchip immutable
Date:   Mon,  3 Oct 2022 09:45:20 +0200
Message-Id: <20221003074520.2526581-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This turns the Toshiba tc3589x gpio irqchip immutable.

Cc: Marc Zyngier <maz@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Add the proper gpiochip_disable|enable_irq() calls in
  mask|unmask, oops.
---
 drivers/gpio/gpio-tc3589x.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-tc3589x.c b/drivers/gpio/gpio-tc3589x.c
index 443fe975bf13..e62ee7e56908 100644
--- a/drivers/gpio/gpio-tc3589x.c
+++ b/drivers/gpio/gpio-tc3589x.c
@@ -230,6 +230,7 @@ static void tc3589x_gpio_irq_mask(struct irq_data *d)
 
 	tc3589x_gpio->regs[REG_IE][regoffset] &= ~mask;
 	tc3589x_gpio->regs[REG_DIRECT][regoffset] |= mask;
+	gpiochip_disable_irq(gc, offset);
 }
 
 static void tc3589x_gpio_irq_unmask(struct irq_data *d)
@@ -240,17 +241,20 @@ static void tc3589x_gpio_irq_unmask(struct irq_data *d)
 	int regoffset = offset / 8;
 	int mask = BIT(offset % 8);
 
+	gpiochip_enable_irq(gc, offset);
 	tc3589x_gpio->regs[REG_IE][regoffset] |= mask;
 	tc3589x_gpio->regs[REG_DIRECT][regoffset] &= ~mask;
 }
 
-static struct irq_chip tc3589x_gpio_irq_chip = {
+static const struct irq_chip tc3589x_gpio_irq_chip = {
 	.name			= "tc3589x-gpio",
 	.irq_bus_lock		= tc3589x_gpio_irq_lock,
 	.irq_bus_sync_unlock	= tc3589x_gpio_irq_sync_unlock,
 	.irq_mask		= tc3589x_gpio_irq_mask,
 	.irq_unmask		= tc3589x_gpio_irq_unmask,
 	.irq_set_type		= tc3589x_gpio_irq_set_type,
+	.flags =		IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
 static irqreturn_t tc3589x_gpio_irq(int irq, void *dev)
@@ -321,7 +325,7 @@ static int tc3589x_gpio_probe(struct platform_device *pdev)
 	tc3589x_gpio->chip.base = -1;
 
 	girq = &tc3589x_gpio->chip.irq;
-	girq->chip = &tc3589x_gpio_irq_chip;
+	gpio_irq_chip_set_chip(girq, &tc3589x_gpio_irq_chip);
 	/* This will let us handle the parent IRQ in the driver */
 	girq->parent_handler = NULL;
 	girq->num_parents = 0;
-- 
2.37.3

