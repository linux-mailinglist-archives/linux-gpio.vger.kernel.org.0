Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A7EEC35CB
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2019 15:34:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387564AbfJANeR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Oct 2019 09:34:17 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:43105 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726852AbfJANeR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Oct 2019 09:34:17 -0400
Received: by mail-lj1-f193.google.com with SMTP id n14so13362239ljj.10
        for <linux-gpio@vger.kernel.org>; Tue, 01 Oct 2019 06:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FUj6K4dDkFvpw0wi3+DLE5g+vXOcMyC8YgD4hMZZctU=;
        b=BYUpUBOS6plQRYjYXZCz1Gxdmc4LZb0CoEH5KvMWaw9eFOrYZI51ucgnGCifB6wtQ/
         KAAKOiSYLUztSaOf6q/Nux6V0W+phpMNIWB+qoXbgBtIjHhpnrBu+CT9/OeT/db5s9jw
         QN/gdTm0E1GTZqMyalrdVFj/+G7QIGyIrl0FVzRe8TPaYvnvV1bGHjKhqakHSQZEfYdb
         bNz0U4W/k33XaMF3Jmc/p0YIVZqdnD8KpaVGXZauryjWHNKlt677UxoMYfdIkeqH1bnW
         G464C6QdqJI1pZTjspYURE/Ofn/xNNvUAXyiWPHlJFCWiQw5yOEk9sT4SQher2A+/16M
         o++A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FUj6K4dDkFvpw0wi3+DLE5g+vXOcMyC8YgD4hMZZctU=;
        b=J/RpctlbpdHC5aupC3YCiOrTvXsqKwvthJKBD6IktPc8yb9pTcXvgV6JMNTuvMq2ss
         I0sgomUgtRS0VIDRTDeKknT0KSB8lQ0AKzb0Md3LkHZ1vaSYdJKTAClg8FCWr8DVVWM9
         jveSyCH+6ldq4csH8yu6+3aKSYsE/nifqyahdSFZ1kywy9L8LwnpoAPDcauAsfL/z8rT
         srxozJIMnaloVnqWt1JdrVpvL+QDA0Tm7BfpMcLf6WVqb4fCDZqD+fUwaxSVIKA4CVAO
         bn+bbWrDU5kW1bpyzIz7J9UrVFZeia4PUT9qWyhuzDyMpUszIv/L4iL6jU6JNMZZHpoS
         P43Q==
X-Gm-Message-State: APjAAAUww4B0tjc1W0GnqyZv30r0sj5eR/m+DiD1uyZD1lQPk4+y3Tq9
        9I2lVXpL/dNwSEuMRJJlvbm3+zPq2T4QUQ==
X-Google-Smtp-Source: APXvYqzfiHpwtlCn3+AV1Y7qC2aIX2Li8w58PGFJmupb5LlPGSFOJBdgN6j0yUrDOx5vDv62/s/JVg==
X-Received: by 2002:a2e:90d9:: with SMTP id o25mr12103512ljg.94.1569936854019;
        Tue, 01 Oct 2019 06:34:14 -0700 (PDT)
Received: from localhost.localdomain (c-79c8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.200.121])
        by smtp.gmail.com with ESMTPSA id k23sm4025590ljc.13.2019.10.01.06.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2019 06:34:12 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Zhou Yanjie <zhouyanjie@zoho.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] pinctrl: ingenic: Pass irqchip when adding gpiochip
Date:   Tue,  1 Oct 2019 15:32:09 +0200
Message-Id: <20191001133209.17164-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We need to convert all old gpio irqchips to pass the irqchip
setup along when adding the gpio_chip. For more info see
drivers/gpio/TODO.

For chained irqchips this is a pretty straight-forward
conversion.

Cc: Zhou Yanjie <zhouyanjie@zoho.com>
Cc: Paul Cercueil <paul@crapouillou.net>
Cc: Thierry Reding <thierry.reding@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/pinctrl-ingenic.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 6e2683016c1f..06cae38f6daf 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -1940,6 +1940,7 @@ static int __init ingenic_gpio_probe(struct ingenic_pinctrl *jzpc,
 {
 	struct ingenic_gpio_chip *jzgc;
 	struct device *dev = jzpc->dev;
+	struct gpio_irq_chip *girq;
 	unsigned int bank;
 	int err;
 
@@ -1982,10 +1983,6 @@ static int __init ingenic_gpio_probe(struct ingenic_pinctrl *jzpc,
 		jzgc->gc.free = gpiochip_generic_free;
 	}
 
-	err = devm_gpiochip_add_data(dev, &jzgc->gc, jzgc);
-	if (err)
-		return err;
-
 	jzgc->irq = irq_of_parse_and_map(node, 0);
 	if (!jzgc->irq)
 		return -EINVAL;
@@ -2000,13 +1997,22 @@ static int __init ingenic_gpio_probe(struct ingenic_pinctrl *jzpc,
 	jzgc->irq_chip.irq_set_wake = ingenic_gpio_irq_set_wake;
 	jzgc->irq_chip.flags = IRQCHIP_MASK_ON_SUSPEND;
 
-	err = gpiochip_irqchip_add(&jzgc->gc, &jzgc->irq_chip, 0,
-			handle_level_irq, IRQ_TYPE_NONE);
+	girq = &jzgc->gc.irq;
+	girq->chip = &jzgc->irq_chip;
+	girq->parent_handler = ingenic_gpio_irq_handler;
+	girq->num_parents = 1;
+	girq->parents = devm_kcalloc(dev, 1, sizeof(*girq->parents),
+				     GFP_KERNEL);
+	if (!girq->parents)
+		return -ENOMEM;
+	girq->parents[0] = jzgc->irq;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_level_irq;
+
+	err = devm_gpiochip_add_data(dev, &jzgc->gc, jzgc);
 	if (err)
 		return err;
 
-	gpiochip_set_chained_irqchip(&jzgc->gc, &jzgc->irq_chip,
-			jzgc->irq, ingenic_gpio_irq_handler);
 	return 0;
 }
 
-- 
2.21.0

