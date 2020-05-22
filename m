Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF55B1DE7DE
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2020 15:20:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729399AbgEVNUW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 May 2020 09:20:22 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:62399 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729334AbgEVNUW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 22 May 2020 09:20:22 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590153621; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=+vyp7WpdkrssI5ipocgemiSJlzn1t73u4Zv4js0qqcs=; b=CxRrHpVyjhGIsjITS5Qa3cVV2j52CjEUcvzJZ/5sGndO2Kz7pW1c3WNUoxWdErnF4WIIDDZm
 0mJDk9ZqDSWOsvXKtFLdQmM8MGsA5ffBtKSKE75eDhc5AcdNp8qNm4ael4UgrNVhcjZaGA0m
 GItbvm1c5Cww42MPhYS8/1md6ks=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5ec7d19082c96b5d3bd71d8e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 22 May 2020 13:20:16
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B2091C433CA; Fri, 22 May 2020 13:20:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C9C17C433C6;
        Fri, 22 May 2020 13:20:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C9C17C433C6
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
Subject: [PATCH 1/4] gpio: gpiolib: Allow GPIO IRQs to lazy disable
Date:   Fri, 22 May 2020 18:49:26 +0530
Message-Id: <1590153569-21706-2-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590153569-21706-1-git-send-email-mkshah@codeaurora.org>
References: <1590153569-21706-1-git-send-email-mkshah@codeaurora.org>
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
 drivers/gpio/gpiolib.c      | 59 +++++++++++++++++++++++++++++----------------
 include/linux/gpio/driver.h | 13 ++++++++++
 2 files changed, 51 insertions(+), 21 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index eaa0e20..a8fdc74 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2465,33 +2465,38 @@ static void gpiochip_irq_relres(struct irq_data *d)
 	gpiochip_relres_irq(gc, d->hwirq);
 }
 
+static void gpiochip_irq_mask(struct irq_data *d)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
+
+	if (chip->irq.irq_mask)
+		chip->irq.irq_mask(d);
+	gpiochip_disable_irq(chip, d->hwirq);
+}
+
+static void gpiochip_irq_unmask(struct irq_data *d)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
+
+	gpiochip_enable_irq(chip, d->hwirq);
+	if (chip->irq.irq_unmask)
+		chip->irq.irq_unmask(d);
+}
+
 static void gpiochip_irq_enable(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 
-	gpiochip_enable_irq(gc, d->hwirq);
-	if (gc->irq.irq_enable)
-		gc->irq.irq_enable(d);
-	else
-		gc->irq.chip->irq_unmask(d);
+	gpiochip_enable_irq(chip, d->hwirq);
+	chip->irq.irq_enable(d);
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
-	gpiochip_disable_irq(gc, d->hwirq);
+	chip->irq.irq_disable(d);
+	gpiochip_disable_irq(chip, d->hwirq);
 }
 
 static void gpiochip_set_irq_hooks(struct gpio_chip *gc)
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
+		gpiochip->irq.irq_disable = irqchip->irq_disable;
+		irqchip->irq_disable = gpiochip_irq_disable;
+	} else {
+		gpiochip->irq.irq_mask = irqchip->irq_mask;
+		irqchip->irq_mask = gpiochip_irq_mask;
+	}
+
+	if (irqchip->irq_enable) {
+		gpiochip->irq.irq_enable = irqchip->irq_enable;
+		irqchip->irq_enable = gpiochip_irq_enable;
+	} else {
+		gpiochip->irq.irq_unmask = irqchip->irq_unmask;
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

