Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A4322295E1
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jul 2020 12:21:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726821AbgGVKVo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Jul 2020 06:21:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726153AbgGVKVn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Jul 2020 06:21:43 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E9DBC0619DC
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2020 03:21:43 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id q4so1921701lji.2
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2020 03:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=42sTIOT/i2NNf6M+l+UtomZ05ouSlPUG8hkgerlvyk4=;
        b=KI2kR4jVlf08PKFDTHeSzGLfvjknPnPNCgzhcELzxpnX91FrUZXZGt2ubmPacxP69+
         MKxW4CgHD4EVPhYpkRwZVpJEH4kEg2teCT0BPzqSCrS+t3xFn9A5u3elI/QVnhrx4m2b
         2R9UliNL0dRrjIT0SZ5YdzokR0q6jMS18iGeWCONok+2MvfjAlEoNf3YA05SPQON1+gy
         r1QhVXJsUKFrUNnN+sqcNEHf9uuCwvKGS0sWgU/lO6wI0RbalWG5adQdQW2RyiuZDsf9
         yjzp13/Th6iZEygWBnK+BzVZczQQpzafOGQAI7NUTeFiDVZ+aDw1tPylvuaDotzykc8F
         +DNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=42sTIOT/i2NNf6M+l+UtomZ05ouSlPUG8hkgerlvyk4=;
        b=RKZae7Yj+mc9BcQHjZrJeoXbJfBlgOWRc5Z8ILvRn8XyVKQnd1MLpTeC5vLWzmJ1XO
         50FTgPry7Q46ve9eMcVG7o8HiMF9/FaolJP4VJfY/4+YMK3r3oDdBLc74uKCd5mzwddj
         jG2XM2Q+i4fTY1MeRQa2QjyAwAKD7+zXviyrlfd0G+RgC8A5gYdXDkcmVuBXBY1pPpe/
         L47ABtKosbf3RSjDjPrlEcRs9/bfpeZ8Xg372+lDb7AGRt9JZjro/b1QacKm7uVIvQKQ
         ku/iCliqi1EOyWYvoFrFAUnQTJYAUaZ0nRIhngzpXg+Ommjdet+xmf3TKwjncQt/jUlZ
         N3TQ==
X-Gm-Message-State: AOAM533p+QYuino/evgg3KYZb+1RsHIKZcW/JW7JnidBVqSz8wTW+uzS
        tiEYG/a6xmyMkN9H0wfUFHxuB/wxcZUmaA==
X-Google-Smtp-Source: ABdhPJy5sgxCFNYWJMekr5d0VaZHnfwsoV3R/NE/OkSknyuFUKFMGM8yHSOS+u7aM5+ZgfYLRS1/fA==
X-Received: by 2002:a2e:914a:: with SMTP id q10mr14186465ljg.7.1595413301474;
        Wed, 22 Jul 2020 03:21:41 -0700 (PDT)
Received: from localhost.localdomain (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id m25sm6431791ljj.128.2020.07.22.03.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 03:21:40 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: [PATCH] gpio: ws16c48: Use irqchip template
Date:   Wed, 22 Jul 2020 12:19:38 +0200
Message-Id: <20200722101938.151265-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This makes the driver use the irqchip template to assign
properties to the gpio_irq_chip instead of using the
explicit call to gpiochip_irqchip_add().

The irqchip is instead added while adding the gpiochip.
Also move the IRQ initialization to the special .init_hw()
callback.

Cc: William Breathitt Gray <vilhelm.gray@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-ws16c48.c | 39 ++++++++++++++++++++++++-------------
 1 file changed, 25 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-ws16c48.c b/drivers/gpio/gpio-ws16c48.c
index cb510df2b014..2d89d0529135 100644
--- a/drivers/gpio/gpio-ws16c48.c
+++ b/drivers/gpio/gpio-ws16c48.c
@@ -365,10 +365,25 @@ static const char *ws16c48_names[WS16C48_NGPIO] = {
 	"Port 5 Bit 4", "Port 5 Bit 5", "Port 5 Bit 6", "Port 5 Bit 7"
 };
 
+static int ws16c48_irq_init_hw(struct gpio_chip *gc)
+{
+	struct ws16c48_gpio *const ws16c48gpio = gpiochip_get_data(gc);
+
+	/* Disable IRQ by default */
+	outb(0x80, ws16c48gpio->base + 7);
+	outb(0, ws16c48gpio->base + 8);
+	outb(0, ws16c48gpio->base + 9);
+	outb(0, ws16c48gpio->base + 10);
+	outb(0xC0, ws16c48gpio->base + 7);
+
+	return 0;
+}
+
 static int ws16c48_probe(struct device *dev, unsigned int id)
 {
 	struct ws16c48_gpio *ws16c48gpio;
 	const char *const name = dev_name(dev);
+	struct gpio_irq_chip *girq;
 	int err;
 
 	ws16c48gpio = devm_kzalloc(dev, sizeof(*ws16c48gpio), GFP_KERNEL);
@@ -396,6 +411,16 @@ static int ws16c48_probe(struct device *dev, unsigned int id)
 	ws16c48gpio->chip.set_multiple = ws16c48_gpio_set_multiple;
 	ws16c48gpio->base = base[id];
 
+	girq = &ws16c48gpio->chip.irq;
+	girq->chip = &ws16c48_irqchip;
+	/* This will let us handle the parent IRQ in the driver */
+	girq->parent_handler = NULL;
+	girq->num_parents = 0;
+	girq->parents = NULL;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_edge_irq;
+	girq->init_hw = ws16c48_irq_init_hw;
+
 	raw_spin_lock_init(&ws16c48gpio->lock);
 
 	err = devm_gpiochip_add_data(dev, &ws16c48gpio->chip, ws16c48gpio);
@@ -404,20 +429,6 @@ static int ws16c48_probe(struct device *dev, unsigned int id)
 		return err;
 	}
 
-	/* Disable IRQ by default */
-	outb(0x80, base[id] + 7);
-	outb(0, base[id] + 8);
-	outb(0, base[id] + 9);
-	outb(0, base[id] + 10);
-	outb(0xC0, base[id] + 7);
-
-	err = gpiochip_irqchip_add(&ws16c48gpio->chip, &ws16c48_irqchip, 0,
-		handle_edge_irq, IRQ_TYPE_NONE);
-	if (err) {
-		dev_err(dev, "Could not add irqchip (%d)\n", err);
-		return err;
-	}
-
 	err = devm_request_irq(dev, irq[id], ws16c48_irq_handler, IRQF_SHARED,
 		name, ws16c48gpio);
 	if (err) {
-- 
2.26.2

