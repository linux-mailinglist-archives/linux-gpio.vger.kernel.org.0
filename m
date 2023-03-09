Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 811CA6B1A96
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Mar 2023 06:09:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229580AbjCIFJL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Mar 2023 00:09:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbjCIFJK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Mar 2023 00:09:10 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8760D64B05
        for <linux-gpio@vger.kernel.org>; Wed,  8 Mar 2023 21:09:08 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id x34so1083782pjj.0
        for <linux-gpio@vger.kernel.org>; Wed, 08 Mar 2023 21:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678338548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=jrgCo1aotaF55CjvexYHXM5Pnsd671YP1OYXwhtpBXU=;
        b=pvwqHuzjwvWCmXG/ZzrVSrH8kNoSnk97vNwOSarkua2ARkuS0Woh6AnQWoDZ3ib1h0
         23787MjzUgNDA1egLDQI71p9sW8z4gfgs1gh0vM/TYJz0pE7Sko+ekkG9qPEOEvj0gsw
         eGFMI2fU7wPFVcIUbErsI8ijidakjOHpwSg1bbjDcZJA4wpe7V5+nZ8qRz4Wjx790h7K
         GfmkUq0MYPylXHQOYZWKmT9H2o7Yo2R9YLj2dgY8iGmS5h8PqUvFIkrYd5VW3zMqma96
         KV1Pv/9K0FMVr/xLuKLNUFpGltYBe2tzvBLOXACSsrBo9cisbRn2yaaavU2539FLe8Hm
         OzSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678338548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jrgCo1aotaF55CjvexYHXM5Pnsd671YP1OYXwhtpBXU=;
        b=u7zvy7GzLrQesAFk9RmWbpHPeMqaza+KuKW857076KJwspGq1FLajcOgUbcPEUAt4Z
         G+bP6w6k69COur12fNW2Ti1m5VdYYx1YuwWl+5dWrUGdgCiLgU7nrd6U0hKmNQ7E0c24
         S9ElqsDReRI+kVVQeMnjLv6M/8aYUcho6E8K0485SJxjXTevT9r4JYhl1GdWHq1616mc
         zRa/gAvp6DHgW/U63jcnW8dq+iS1oldYh9gIY7kjbUhirMdy6vDs2gEcbnXTpHbD6ZlE
         cR2DtPPLkmcUFNVavuXV/xcJzmFG+nI7ancuCSpylVI97sT+FNaag6SM0OAPNbVGOko3
         1tpg==
X-Gm-Message-State: AO0yUKVvy/nDifo7nq/IckCfHLoTQ/N/wv3T4Iv5LMoRrA5xQ+8jHZ+l
        t/L0q6GZv45MBsB+KYWFurE=
X-Google-Smtp-Source: AK7set81hD3ZINjS7zQHvR05JYhLu0DwTe73WJYpteW/srQCXACiPrzuc0mXQSOM11r6dQI+VQARTQ==
X-Received: by 2002:a17:90b:4b41:b0:234:f4a:8985 with SMTP id mi1-20020a17090b4b4100b002340f4a8985mr21836406pjb.15.1678338547744;
        Wed, 08 Mar 2023 21:09:07 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id gq12-20020a17090b104c00b002372106a5c2sm611491pjb.37.2023.03.08.21.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 21:09:07 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From:   Joel Stanley <joel@jms.id.au>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andrew Jeffery <andrew@aj.id.au>
Cc:     Jeremy Kerr <jk@codeconstruct.com.au>, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Subject: [PATCH] gpio: aspeed: Always register the irqchip
Date:   Thu,  9 Mar 2023 15:38:55 +1030
Message-Id: <20230309050855.3311834-1-joel@jms.id.au>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The driver was implemented in a way that made the irqchip optional, if a
irq was not present in the device tree. However, all of the device trees
have always had an irq, so the optional-ness has never been used.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
Linus, feel free to put this in your immutable gpiochip series

 drivers/gpio/gpio-aspeed.c | 49 ++++++++++++++++++--------------------
 1 file changed, 23 insertions(+), 26 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index a94da80d3a95..129f6a6b4d1d 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -1137,8 +1137,9 @@ MODULE_DEVICE_TABLE(of, aspeed_gpio_of_table);
 static int __init aspeed_gpio_probe(struct platform_device *pdev)
 {
 	const struct of_device_id *gpio_id;
+	struct gpio_irq_chip *girq;
 	struct aspeed_gpio *gpio;
-	int rc, i, banks, err;
+	int rc, irq, i, banks, err;
 	u32 ngpio;
 
 	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
@@ -1201,31 +1202,27 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
 		aspeed_gpio_change_cmd_source(gpio, bank, 3, GPIO_CMDSRC_ARM);
 	}
 
-	/* Optionally set up an irqchip if there is an IRQ */
-	rc = platform_get_irq(pdev, 0);
-	if (rc > 0) {
-		struct gpio_irq_chip *girq;
-
-		gpio->irq = rc;
-		girq = &gpio->chip.irq;
-		girq->chip = &gpio->irqc;
-		girq->chip->name = dev_name(&pdev->dev);
-		girq->chip->irq_ack = aspeed_gpio_irq_ack;
-		girq->chip->irq_mask = aspeed_gpio_irq_mask;
-		girq->chip->irq_unmask = aspeed_gpio_irq_unmask;
-		girq->chip->irq_set_type = aspeed_gpio_set_type;
-		girq->parent_handler = aspeed_gpio_irq_handler;
-		girq->num_parents = 1;
-		girq->parents = devm_kcalloc(&pdev->dev, 1,
-					     sizeof(*girq->parents),
-					     GFP_KERNEL);
-		if (!girq->parents)
-			return -ENOMEM;
-		girq->parents[0] = gpio->irq;
-		girq->default_type = IRQ_TYPE_NONE;
-		girq->handler = handle_bad_irq;
-		girq->init_valid_mask = aspeed_init_irq_valid_mask;
-	}
+	/* Set up an irqchip */
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+	gpio->irq = irq;
+	girq = &gpio->chip.irq;
+	girq->chip = &gpio->irqc;
+	girq->chip->name = dev_name(&pdev->dev);
+	girq->chip->irq_ack = aspeed_gpio_irq_ack;
+	girq->chip->irq_mask = aspeed_gpio_irq_mask;
+	girq->chip->irq_unmask = aspeed_gpio_irq_unmask;
+	girq->chip->irq_set_type = aspeed_gpio_set_type;
+	girq->parent_handler = aspeed_gpio_irq_handler;
+	girq->num_parents = 1;
+	girq->parents = devm_kcalloc(&pdev->dev, 1, sizeof(*girq->parents), GFP_KERNEL);
+	if (!girq->parents)
+		return -ENOMEM;
+	girq->parents[0] = gpio->irq;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_bad_irq;
+	girq->init_valid_mask = aspeed_init_irq_valid_mask;
 
 	gpio->offset_timer =
 		devm_kzalloc(&pdev->dev, gpio->chip.ngpio, GFP_KERNEL);
-- 
2.39.2

