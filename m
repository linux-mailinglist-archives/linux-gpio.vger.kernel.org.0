Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81662D6103
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2019 13:12:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731817AbfJNLME (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Oct 2019 07:12:04 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:41834 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731261AbfJNLMD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Oct 2019 07:12:03 -0400
Received: by mail-lj1-f193.google.com with SMTP id f5so16205072ljg.8
        for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2019 04:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9jY9SO8cAVJjVc5s917aON7QONtf2+N68XWw8wtVhqI=;
        b=vTAsqsycVsHQn6i7Z+HAWZL4+9eHQh6KvsnLi7sH1GCaosgYrLD1v+3beQPkOgj8EO
         7WaUVhUzULIvVG7gSyNIve/N3wP10XbWzb1i2Oh5+AXD3le48d6wl+ekvCJVQROj00QH
         DSrYUoB+jyfW8+o9Q1iblqKF3dFSs9eMjwH6UmOwi4msUuS2yDi+sZskgtGHQSeY7hKW
         9RcX7yV9Prc/FcwRId4ppjef9es8eIPcq11JPZPNWMpNOF9abGqAZS5H06RLaCiZB+gT
         Oen3gK8y7qd0Ax0YfxKWCVgiu6BRpBPFxU5pmx0f24+CNg8AzA1ZZx60KQKpueOOY1PD
         /Gkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9jY9SO8cAVJjVc5s917aON7QONtf2+N68XWw8wtVhqI=;
        b=NlJmtpwyniJBASKJYWK+EakTQEjBMSkdTPJmp5E2BYQe5cLMhwzO7AsPf1vvU3V8uj
         QvLcG3OkzsDZaki0VgntytnDQU54K5DZfdLHRFCO5oWwMOaFprGBh4IWE5AjrlOhPe9i
         X6UHTf8K6j/7NHn3Zlr/3A9dCsLgG2ooDBHSMeDgNbyj8H7GqXAyVI1x1AWkVoJA9xV4
         BfUqOHvtC9K0dcmoDe6L1CZiGCFriCPFkEUGvIAHouDOplqASrt3yB+pK1oQijLtDyGA
         g669gIrGgCXN1kSkXzXQYs1DFmAeNQPuNfnAP1Y9zAqOqtsbJkrCZBTY84DhC9vEStKw
         GzxQ==
X-Gm-Message-State: APjAAAXPTrsNKvf3fQWHnMXWPqpooVNZehPxXL0yc3QBTYqC6UXymlCS
        YjeALo9DGN6ynEqrWoLiK1sYnEVg8tc=
X-Google-Smtp-Source: APXvYqzcUkftA/n22crGIacf7UGhvrl5dRb8XSv7cZmEo5eMujBN6Lf9tVhcE5hayusxY3Y/TdPcrQ==
X-Received: by 2002:a2e:2b91:: with SMTP id r17mr18564608ljr.1.1571051521113;
        Mon, 14 Oct 2019 04:12:01 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id v1sm4251873lfa.87.2019.10.14.04.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 04:11:59 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Lina Iyer <ilina@codeaurora.org>
Subject: [PATCH 1/3] pinctrl: nomadik: Drop support for latent IRQ
Date:   Mon, 14 Oct 2019 13:11:52 +0200
Message-Id: <20191014111154.9731-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The latent IRQs are IRQs that have occurred when the system
was down in deep sleep and the GPIO block was powered off.
The PRCMU (power reset and control unit) knows which GPIO
line offset fired an IRQ to wake the system up (if so
desired) and this second IRQ was used to replay the action
when the system came back online after suspend().

This is now known to be the wrong approach to solve this
problem: in a patch series Lina Iyer has suggested to
instead make it possible to model the IRQs as hierarchical
with double parents.

Also the current device trees do not contain the right
information to make this code work, the latent IRQ is not
specified nowadays giving noise like this in the console:

[    0.612168] gpio 8012e000.gpio: IRQ index 1 not found
[    0.622523] gpio 8012e080.gpio: IRQ index 1 not found

Let's delete the latent IRQ code and reimplement it properly
when we need it.

Cc: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Lina Iyer <ilina@codeaurora.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/nomadik/pinctrl-nomadik.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik.c b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
index 2a8190b11d10..dc81de15b85e 100644
--- a/drivers/pinctrl/nomadik/pinctrl-nomadik.c
+++ b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
@@ -249,8 +249,6 @@ struct nmk_gpio_chip {
 	struct clk *clk;
 	unsigned int bank;
 	unsigned int parent_irq;
-	int latent_parent_irq;
-	u32 (*get_latent_status)(unsigned int bank);
 	void (*set_ioforce)(bool enable);
 	spinlock_t lock;
 	bool sleepmode;
@@ -832,15 +830,6 @@ static void nmk_gpio_irq_handler(struct irq_desc *desc)
 	__nmk_gpio_irq_handler(desc, status);
 }
 
-static void nmk_gpio_latent_irq_handler(struct irq_desc *desc)
-{
-	struct gpio_chip *chip = irq_desc_get_handler_data(desc);
-	struct nmk_gpio_chip *nmk_chip = gpiochip_get_data(chip);
-	u32 status = nmk_chip->get_latent_status(nmk_chip->bank);
-
-	__nmk_gpio_irq_handler(desc, status);
-}
-
 /* I/O Functions */
 
 static int nmk_gpio_get_dir(struct gpio_chip *chip, unsigned offset)
@@ -1104,7 +1093,6 @@ static int nmk_gpio_probe(struct platform_device *dev)
 	struct nmk_gpio_chip *nmk_chip;
 	struct gpio_chip *chip;
 	struct irq_chip *irqchip;
-	int latent_irq;
 	bool supports_sleepmode;
 	int irq;
 	int ret;
@@ -1125,15 +1113,11 @@ static int nmk_gpio_probe(struct platform_device *dev)
 	if (irq < 0)
 		return irq;
 
-	/* It's OK for this IRQ not to be present */
-	latent_irq = platform_get_irq(dev, 1);
-
 	/*
 	 * The virt address in nmk_chip->addr is in the nomadik register space,
 	 * so we can simply convert the resource address, without remapping
 	 */
 	nmk_chip->parent_irq = irq;
-	nmk_chip->latent_parent_irq = latent_irq;
 	nmk_chip->sleepmode = supports_sleepmode;
 	spin_lock_init(&nmk_chip->lock);
 
@@ -1194,11 +1178,6 @@ static int nmk_gpio_probe(struct platform_device *dev)
 				     irqchip,
 				     nmk_chip->parent_irq,
 				     nmk_gpio_irq_handler);
-	if (nmk_chip->latent_parent_irq > 0)
-		gpiochip_set_chained_irqchip(chip,
-					     irqchip,
-					     nmk_chip->latent_parent_irq,
-					     nmk_gpio_latent_irq_handler);
 
 	dev_info(&dev->dev, "at address %p\n", nmk_chip->addr);
 
-- 
2.21.0

