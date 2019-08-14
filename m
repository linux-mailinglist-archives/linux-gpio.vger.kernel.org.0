Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A67C8CEFF
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Aug 2019 11:05:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725863AbfHNJFq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Aug 2019 05:05:46 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:38607 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725800AbfHNJFq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Aug 2019 05:05:46 -0400
Received: by mail-pf1-f195.google.com with SMTP id o70so7865452pfg.5
        for <linux-gpio@vger.kernel.org>; Wed, 14 Aug 2019 02:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=endlessm-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ia3PUkiCwTBh+kn51xQ53F8oTfNlja33Y4zLqHow02A=;
        b=LDIFx5I3ZxoZcG4SC4JKYs/rRkZBKAyBxS9wwgKkJW/XDbWXff7Wckt8bLmHrIV3Wv
         ToeGozwsp/ni+IE/WBe7q+33Fy/WYLVfQi+J5v0exiqQyNWRf3yNTAvTvF0q1K++oSQy
         s3RtqIl/kK8dvS8sjuY6KsN/199M14ynVn69vPmiM/7MYg0wUBGYu698p3Q54pi8q5ve
         sND5Wz3y5ziFK4JdssY9vvMFw8H65B8IVGEGhHcSLy4wvqlC2aFt9pPCCcsKLDt3XVeA
         aFaVprW0QssbJ/jexV8EXbl+fiRbtdIu5HEHZIbZirOEUX9Rp0o25kCqBchOOZpUAVR0
         4bBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ia3PUkiCwTBh+kn51xQ53F8oTfNlja33Y4zLqHow02A=;
        b=RAq9s5tkXG8QzhtSFhDwnvvFkGjfuteqiTfsZJdF4Pka5H3iddMIoyw8TfVPXgO94F
         nnrNA/uwiOb2F5uCzY/IuAWstzoK9Y6qjxKGcPfPAhfDBM6IKw8BM/EN5tBRMrC4zFAc
         WmIxnT2q0rQu5t9bg1gkswlHJRN+0clmjPECKvRIHaN8Ak2PyTPV6edJ7TXpzBI4TASy
         48XTLz42b6xq+b0/zXje4kA+Rwjdu6jPV8bW2YUXAETZFqjabO/Cg1RTXyJ+A6+2WhTp
         4pZ1O+1fdpYddaKVcKmEzHkDkhF6l7hQGcYytpROXp1IboJMVTxHar1m9mfi4K3WGtTC
         QMxQ==
X-Gm-Message-State: APjAAAXo/NBJZs1etgSNBuBRf8WIRZI/NqqHo/OXx2uh2IDmEZy+xSPY
        ZvWyuOleZ3YtdLKD2cMlzU5qUg==
X-Google-Smtp-Source: APXvYqyATI6IX0BXpPSFyI/OWYYet97AxS7dVQr2wenTtvpyt0cIoz/R35RerVy8aUwO3Zqohb52Dg==
X-Received: by 2002:a62:80cb:: with SMTP id j194mr7560248pfd.183.1565773545096;
        Wed, 14 Aug 2019 02:05:45 -0700 (PDT)
Received: from limbo.local (123-204-46-122.static.seed.net.tw. [123.204.46.122])
        by smtp.gmail.com with ESMTPSA id t23sm2133885pfl.154.2019.08.14.02.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2019 02:05:44 -0700 (PDT)
From:   Daniel Drake <drake@endlessm.com>
To:     linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, linux@endlessm.com,
        sandeep.singh@amd.com, Shyam-sundar.S-k@amd.com,
        Nehal-Bakulchandra.shah@amd.com
Subject: [PATCH] pinctrl/amd: disable spurious-firing GPIO IRQs
Date:   Wed, 14 Aug 2019 17:05:40 +0800
Message-Id: <20190814090540.7152-1-drake@endlessm.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When cold-booting Asus X434DA, GPIO 7 is found to be already configured
as an interrupt, and the GPIO level is found to be in a state that
causes the interrupt to fire.

As soon as pinctrl-amd probes, this interrupt fires and invokes
amd_gpio_irq_handler(). The IRQ is acked, but no GPIO-IRQ handler was
invoked, so the GPIO level being unchanged just causes another interrupt
to fire again immediately after.

This results in an interrupt storm causing this platform to hang
during boot, right after pinctrl-amd is probed.

Detect this situation and disable the GPIO interrupt when this happens.
This enables the affected platform to boot as normal. GPIO 7 actually is
the I2C touchpad interrupt line, and later on, i2c-multitouch loads and
re-enables this interrupt when it is ready to handle it.

Instead of this approach, I considered disabling all GPIO interrupts at
probe time, however that seems a little risky, and I also confirmed that
Windows does not seem to have this behaviour: the same 41 GPIO IRQs are
enabled under both Linux and Windows, which is a far larger collection
than the GPIOs referenced by the DSDT on this platform.

Signed-off-by: Daniel Drake <drake@endlessm.com>
---
 drivers/pinctrl/pinctrl-amd.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 9b9c61e3f065..977792654e01 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -565,15 +565,25 @@ static irqreturn_t amd_gpio_irq_handler(int irq, void *dev_id)
 			    !(regval & BIT(INTERRUPT_MASK_OFF)))
 				continue;
 			irq = irq_find_mapping(gc->irq.domain, irqnr + i);
-			generic_handle_irq(irq);
+			if (irq != 0)
+				generic_handle_irq(irq);
 
 			/* Clear interrupt.
 			 * We must read the pin register again, in case the
 			 * value was changed while executing
 			 * generic_handle_irq() above.
+			 * If we didn't find a mapping for the interrupt,
+			 * disable it in order to avoid a system hang caused
+			 * by an interrupt storm.
 			 */
 			raw_spin_lock_irqsave(&gpio_dev->lock, flags);
 			regval = readl(regs + i);
+			if (irq == 0) {
+				regval &= ~BIT(INTERRUPT_ENABLE_OFF);
+				dev_dbg(&gpio_dev->pdev->dev,
+					"Disabling spurious GPIO IRQ %d\n",
+					irqnr + i);
+			}
 			writel(regval, regs + i);
 			raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
 			ret = IRQ_HANDLED;
-- 
2.20.1

