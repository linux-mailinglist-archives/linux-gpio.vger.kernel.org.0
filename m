Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 376E81DF894
	for <lists+linux-gpio@lfdr.de>; Sat, 23 May 2020 19:13:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387993AbgEWRLp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 23 May 2020 13:11:45 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:27799 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728720AbgEWRLo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 23 May 2020 13:11:44 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590253903; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=+vFegC6wNmlmQqHhUllnloJeHLGIs/lIdn4cPfveQbY=; b=AiqHPY1UxEUEYOeN8B1Xdc7SKYlh004mzwTmY1hpGAs+VkKEEi3jSofI9L/HTmyKStoCk/MW
 dW350UjyFhzGiSsmeVkr973c2ZsWW/Tb0vqbwA8NlnCiqwIaERI6px6W8mLb1kQSwZE2L6Jo
 J/sktqJ3WF+4hq6kuQFyPGtoQLs=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ec95942.7f19b9266030-smtp-out-n04;
 Sat, 23 May 2020 17:11:30 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6B87AC433A0; Sat, 23 May 2020 17:11:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 68BF2C433AD;
        Sat, 23 May 2020 17:11:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 68BF2C433AD
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     bjorn.andersson@linaro.org, maz@kernel.org,
        linus.walleij@linaro.org, swboyd@chromium.org,
        evgreen@chromium.org, mka@chromium.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, agross@kernel.org, tglx@linutronix.de,
        jason@lakedaemon.net, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
Subject: [PATCH v2 1/4] gpio: gpiolib: Allow GPIO IRQs to lazy disable
Date:   Sat, 23 May 2020 22:41:10 +0530
Message-Id: <1590253873-11556-2-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590253873-11556-1-git-send-email-mkshah@codeaurora.org>
References: <1590253873-11556-1-git-send-email-mkshah@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

With 'commit 461c1a7d4733 ("gpiolib: override irq_enable/disable")' gpiolib
overrides irqchip's irq_enable and irq_disable callbacks. If irq_disable
callback is implemented then genirq takes unlazy path to disable irq.

Underlying irqchip may not want to implement irq_disable callback to lazy
disable irq when client drivers invokes disable_irq(). By overriding
irq_disable callback, gpiolib ends up always unlazy disabling IRQ.

Allow gpiolib to lazy disable IRQs by overriding irq_disable callback only
if irqchip implemented irq_disable. In cases where irq_disable is not
implemented irq_mask is overridden. Similarly override irq_enable callback
only if irqchip implemented irq_enable otherwise irq_unmask is overridden.

Fixes: 461c1a7d47 (gpiolib: override irq_enable/disable)
Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
---
 drivers/gpio/gpiolib.c      | 55 +++++++++++++++++++++++++++++----------------
 include/linux/gpio/driver.h | 13 +++++++++++
 2 files changed, 49 insertions(+), 19 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index eaa0e20..3810cd0 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2465,32 +2465,37 @@ static void gpiochip_irq_relres(struct irq_data *d)
 	gpiochip_relres_irq(gc, d->hwirq);
 }
 
+static void gpiochip_irq_mask(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+
+	if (gc->irq.irq_mask)
+		gc->irq.irq_mask(d);
+	gpiochip_disable_irq(gc, d->hwirq);
+}
+
+static void gpiochip_irq_unmask(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+
+	gpiochip_enable_irq(gc, d->hwirq);
+	if (gc->irq.irq_unmask)
+		gc->irq.irq_unmask(d);
+}
+
 static void gpiochip_irq_enable(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 
 	gpiochip_enable_irq(gc, d->hwirq);
-	if (gc->irq.irq_enable)
-		gc->irq.irq_enable(d);
-	else
-		gc->irq.chip->irq_unmask(d);
+	gc->irq.irq_enable(d);
 }
 
 static void gpiochip_irq_disable(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 
-	/*
-	 * Since we override .irq_disable() we need to mimic the
-	 * behaviour of __irq_disable() in irq/chip.c.
-	 * First call .irq_disable() if it exists, else mimic the
-	 * behaviour of mask_irq() which calls .irq_mask() if
-	 * it exists.
-	 */
-	if (gc->irq.irq_disable)
-		gc->irq.irq_disable(d);
-	else if (gc->irq.chip->irq_mask)
-		gc->irq.chip->irq_mask(d);
+	gc->irq.irq_disable(d);
 	gpiochip_disable_irq(gc, d->hwirq);
 }
 
@@ -2515,10 +2520,22 @@ static void gpiochip_set_irq_hooks(struct gpio_chip *gc)
 			  "detected irqchip that is shared with multiple gpiochips: please fix the driver.\n");
 		return;
 	}
-	gc->irq.irq_enable = irqchip->irq_enable;
-	gc->irq.irq_disable = irqchip->irq_disable;
-	irqchip->irq_enable = gpiochip_irq_enable;
-	irqchip->irq_disable = gpiochip_irq_disable;
+
+	if (irqchip->irq_disable) {
+		gc->irq.irq_disable = irqchip->irq_disable;
+		irqchip->irq_disable = gpiochip_irq_disable;
+	} else {
+		gc->irq.irq_mask = irqchip->irq_mask;
+		irqchip->irq_mask = gpiochip_irq_mask;
+	}
+
+	if (irqchip->irq_enable) {
+		gc->irq.irq_enable = irqchip->irq_enable;
+		irqchip->irq_enable = gpiochip_irq_enable;
+	} else {
+		gc->irq.irq_unmask = irqchip->irq_unmask;
+		irqchip->irq_unmask = gpiochip_irq_unmask;
+	}
 }
 
 /**
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 8c41ae4..c8bcaf3 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -253,6 +253,19 @@ struct gpio_irq_chip {
 	 * Store old irq_chip irq_disable callback
 	 */
 	void		(*irq_disable)(struct irq_data *data);
+	/**
+	 * @irq_unmask:
+	 *
+	 * Store old irq_chip irq_unmask callback
+	 */
+	void		(*irq_unmask)(struct irq_data *data);
+
+	/**
+	 * @irq_mask:
+	 *
+	 * Store old irq_chip irq_mask callback
+	 */
+	void		(*irq_mask)(struct irq_data *data);
 };
 
 /**
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
