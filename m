Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2C4320BB2D
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jun 2020 23:10:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725983AbgFZVKl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Jun 2020 17:10:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725838AbgFZVKk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Jun 2020 17:10:40 -0400
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com [IPv6:2607:f8b0:4864:20::84a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DF5EC03E979
        for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2020 14:10:40 -0700 (PDT)
Received: by mail-qt1-x84a.google.com with SMTP id s30so7364728qts.18
        for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2020 14:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=SqHQ9DZWlxsE7qIqsV85VvjMJJNMgqXueRXxvJ29fgI=;
        b=nM6YJHrx8LdaSjUWSkIKwhAbVqGDbNri4NlhGXkImmnI6EUEOZO82ZVoGm8q/XELDm
         bnNAzmNAhVPBIi0bVifIvUYvTS9zfYQfH2U/PU8U69Guzkxl10Tnjk06C3s4cW1NXqB4
         Hh1g0qte6QgyiiXCKmxejoA2zfSAr76RNnDRQ58CCe7rmhv8oiwtfOuU0rb/0gg8Iitj
         SNRupPbGmkO6jtdA/qNCs9wlmnQICBkZhbK2/+RZbA7EC3bAFwn3WrpjgKQ3Vc4K5W6c
         1WWDqAc8BGw8QPd8UxZixp75Fvc3/xaI1GHAvRz+FlqtCZ0+uXv/dMuv2ctKZmdYc858
         XnDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=SqHQ9DZWlxsE7qIqsV85VvjMJJNMgqXueRXxvJ29fgI=;
        b=HlEN7ybp+AdzfLmq+XIOGjcAjBj7LkYQydWkzc/ywz7lgVy0uEvlcXQIQDqQv/Od+1
         zQLJ5b8r18eP4ruruIH6TIuP3FpKp1Aw48Xncsq9wC3wTch744rM9nSNAd7rM+S10EOI
         44BmAlN6MnHuy+czEzGUeTCuFK5AhohEhZbLLX1G5vy9GqG/B+wxgskifP3XLXqO/8Q8
         2rB3NBklMC87OyYC7de/qu3+gnRzLKSVT6m3uzGKwXJXpFHYZ/Tt1dzPp9w3IfinmBxL
         a0Uyu3uWKN3urFP3s/o8clXHhrlmitQKunhT7ULU1AbbVh02hd7r1NGllv+trd+d/KCn
         DFuQ==
X-Gm-Message-State: AOAM531LUVYUN84YhokafUz4gr1MkDY/s80ujFoKjL2vBJx9kANQF5e7
        TTr0b/FmIS9wBiZAAyOKpHzro8eVU4U1
X-Google-Smtp-Source: ABdhPJyeof3yYlB1yKI2mHu0xqNJs5O2CtfyPkQJNcaGC0exq/y2fajFvLM4uo+3CPWRUrsqOFT5/mmqDJbS
X-Received: by 2002:a0c:bf47:: with SMTP id b7mr4962051qvj.167.1593205839758;
 Fri, 26 Jun 2020 14:10:39 -0700 (PDT)
Date:   Fri, 26 Jun 2020 14:10:26 -0700
Message-Id: <20200626211026.513520-1-furquan@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
Subject: [PATCH] pinctrl: amd: Honor IRQ trigger type requested by the caller
From:   Furquan Shaikh <furquan@google.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shyam-sundar.S-k@amd.com, akshu.agrawal@amd.com,
        adurbin@google.com, dtor@google.com,
        Furquan Shaikh <furquan@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This change drops the override in `amd_gpio_irq_set_type()` that
ignores the IRQ trigger type settings from the caller. The device
driver (caller) is in a better position to identify the right trigger
type for the device based on the usage as well as the information
exposed by the BIOS. There are instances where the device driver might
want to configure the trigger type differently in different modes. An
example of this is gpio-keys driver which configures IRQ type as
trigger on both edges (to identify assert and deassert events) when in
S0 and reconfigures the trigger type using the information provided by
the BIOS when going into suspend to ensure that the wake happens on
the required edge.

This override in `amd_gpio_irq_set_type()` prevents the caller from
being able to reconfigure trigger type once it is set either based on
ACPI information or the type used by the first caller for IRQ on a
given GPIO line.

Without this change, pen-insert gpio key (used by garaged stylus on a
Chromebook) works fine in S0 (i.e. insert and eject events are
correctly identified), however, BIOS configuration for wake on only
pen eject i.e. only-rising edge or only-falling edge is not honored.

With this change, it was verified that pen-insert gpio key behavior is
correct in both S0 and for wakeup from S3.

Signed-off-by: Furquan Shaikh <furquan@google.com>
---
 drivers/pinctrl/pinctrl-amd.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 1fe62a35bb12..c34e6a950b3f 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -417,22 +417,13 @@ static int amd_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 {
 	int ret = 0;
 	u32 pin_reg, pin_reg_irq_en, mask;
-	unsigned long flags, irq_flags;
+	unsigned long flags;
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct amd_gpio *gpio_dev = gpiochip_get_data(gc);
 
 	raw_spin_lock_irqsave(&gpio_dev->lock, flags);
 	pin_reg = readl(gpio_dev->base + (d->hwirq)*4);
 
-	/* Ignore the settings coming from the client and
-	 * read the values from the ACPI tables
-	 * while setting the trigger type
-	 */
-
-	irq_flags = irq_get_trigger_type(d->irq);
-	if (irq_flags != IRQ_TYPE_NONE)
-		type = irq_flags;
-
 	switch (type & IRQ_TYPE_SENSE_MASK) {
 	case IRQ_TYPE_EDGE_RISING:
 		pin_reg &= ~BIT(LEVEL_TRIG_OFF);
-- 
2.27.0.212.ge8ba1cc988-goog

