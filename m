Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1C265ABA40
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Sep 2022 23:40:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231265AbiIBVkf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Sep 2022 17:40:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231223AbiIBVka (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Sep 2022 17:40:30 -0400
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE5D332B83
        for <linux-gpio@vger.kernel.org>; Fri,  2 Sep 2022 14:40:19 -0700 (PDT)
Received: by mail-qv1-xf2d.google.com with SMTP id f9so2390444qvw.11
        for <linux-gpio@vger.kernel.org>; Fri, 02 Sep 2022 14:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=xMrbWUY6zwIx3C/ybxag/rE7UT2Nj7W56VkoAh9Wle8=;
        b=NfdZGBLUYxOfd0iRQmmgqdPNUIOCNG10zN/1mBMpSNBIJfxVF84r8HKTk6fRQPssLo
         AqIXg+mhMMNU3RkgetY55baklrCOfNuZYxssO1m9jV7gv0Fc433K0YJ438t6kyW4NYAc
         24HOTICGTo5tNhpVkerh0TaDoiXvNeQ5U/fzchE9ZabKnOwsHB9GOs4wq2S/mzVmMO3B
         laKfXhIrMdGMlKpEs9In+Xn2bTVGHioa03dofEAXecJMz5K60gA0km4VgfNv6L1C16Fp
         2R8S9BD6Z97OrbUm47f7jc2iUZuwCb7FR4t6/8ZGgY8ufslkOLEGE9CgGjhr27mQUKuG
         Adrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=xMrbWUY6zwIx3C/ybxag/rE7UT2Nj7W56VkoAh9Wle8=;
        b=Tcnmo8szn9rN8CUY8jWODAAQroRWfNNiOUKSUhCn7s0axhO6kJ9yg9VRSnFNR9Y/zU
         1GrWQRItKBfPI3n6aUvQsG8sskVC6AwxPQM+qA16ipe6GO9MOrFwcm6rdT3mLAc/mIYX
         rDC0hE4PL2sDAVni4d7JVKVl/wD2YKC69C3Hom94RFCzoIPHLvKDUWmV1+iqmAk++DmU
         XHSxkrMHlZd6ZeVePsHmNQ22FVy9J1huqSa4HPPBj5FyKSFdqXED4BA4jkFmfuvx1Nlb
         L92Yi3K18tzUkhBATwWTj4e6opshIoKchiaQJC6vQ+yRZW7UAdIfJFc4O9FWdHBc40ME
         B6SQ==
X-Gm-Message-State: ACgBeo0rtAIzHOGlUcpq/LUUbn5MpfKPJk9GPAiowShZQ5Zrw45fEdhb
        +uZrMEaSfai3glBInVZALPng9g==
X-Google-Smtp-Source: AA6agR6jDjhaLewM868f5dZUQDWZdeXFGETjL2RBbYT5x8nl805M4ouJtIAIOoAKWRton7fMIlMnfQ==
X-Received: by 2002:a0c:ab07:0:b0:474:9c36:413e with SMTP id h7-20020a0cab07000000b004749c36413emr30915739qvb.56.1662154818756;
        Fri, 02 Sep 2022 14:40:18 -0700 (PDT)
Received: from fedora.attlocal.net (69-109-179-158.lightspeed.dybhfl.sbcglobal.net. [69.109.179.158])
        by smtp.gmail.com with ESMTPSA id 15-20020ac84e8f000000b0031f0b43629dsm1819533qtp.23.2022.09.02.14.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 14:40:18 -0700 (PDT)
From:   William Breathitt Gray <william.gray@linaro.org>
To:     brgl@bgdev.pl, linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        William Breathitt Gray <william.gray@linaro.org>
Subject: [PATCH 1/4] gpio: 104-dio-48e: Make irq_chip immutable
Date:   Fri,  2 Sep 2022 13:45:23 -0400
Message-Id: <d6c56b557b77b265815b649c2c67c98bf99ad968.1662140119.git.william.gray@linaro.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <cover.1662140119.git.william.gray@linaro.org>
References: <cover.1662140119.git.william.gray@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,DATE_IN_PAST_03_06,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Kernel warns about mutable irq_chips:

    "not an immutable chip, please consider fixing!"

Make the struct irq_chip const, flag it as IRQCHIP_IMMUTABLE, add the
new helper functions, and call the appropriate gpiolib functions.

Signed-off-by: William Breathitt Gray <william.gray@linaro.org>
---
 drivers/gpio/gpio-104-dio-48e.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-104-dio-48e.c b/drivers/gpio/gpio-104-dio-48e.c
index a41551870759..74cc71bb3984 100644
--- a/drivers/gpio/gpio-104-dio-48e.c
+++ b/drivers/gpio/gpio-104-dio-48e.c
@@ -164,6 +164,7 @@ static void dio48e_irq_mask(struct irq_data *data)
 		dio48egpio->irq_mask &= ~BIT(0);
 	else
 		dio48egpio->irq_mask &= ~BIT(1);
+	gpiochip_disable_irq(chip, offset);
 
 	if (!dio48egpio->irq_mask)
 		/* disable interrupts */
@@ -191,6 +192,7 @@ static void dio48e_irq_unmask(struct irq_data *data)
 		iowrite8(0x00, &dio48egpio->reg->enable_interrupt);
 	}
 
+	gpiochip_enable_irq(chip, offset);
 	if (offset == 19)
 		dio48egpio->irq_mask |= BIT(0);
 	else
@@ -213,12 +215,14 @@ static int dio48e_irq_set_type(struct irq_data *data, unsigned int flow_type)
 	return 0;
 }
 
-static struct irq_chip dio48e_irqchip = {
+static const struct irq_chip dio48e_irqchip = {
 	.name = "104-dio-48e",
 	.irq_ack = dio48e_irq_ack,
 	.irq_mask = dio48e_irq_mask,
 	.irq_unmask = dio48e_irq_unmask,
-	.irq_set_type = dio48e_irq_set_type
+	.irq_set_type = dio48e_irq_set_type,
+	.flags = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
 static irqreturn_t dio48e_irq_handler(int irq, void *dev_id)
@@ -322,7 +326,7 @@ static int dio48e_probe(struct device *dev, unsigned int id)
 	dio48egpio->chip.set_multiple = dio48e_gpio_set_multiple;
 
 	girq = &dio48egpio->chip.irq;
-	girq->chip = &dio48e_irqchip;
+	gpio_irq_chip_set_chip(girq, &dio48e_irqchip);
 	/* This will let us handle the parent IRQ in the driver */
 	girq->parent_handler = NULL;
 	girq->num_parents = 0;
-- 
2.37.2

