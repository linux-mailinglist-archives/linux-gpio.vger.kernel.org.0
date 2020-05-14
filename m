Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 026AB1D419A
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2020 01:21:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726726AbgENXV3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 May 2020 19:21:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726050AbgENXV2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 May 2020 19:21:28 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B037C061A0C;
        Thu, 14 May 2020 16:21:28 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id u10so156453pls.8;
        Thu, 14 May 2020 16:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=yX3O7KPvQx7S3aIf9BMvwZK2M2uDxHqEk7CIJLVybdc=;
        b=m+vC8ms65164QGKT8M92uWgft0JVZy9Up8/dJoWkdm3C+ZaZaCLjicog1eKV+vfz3o
         OeGx8PZLPWFmgiuH/jCu3nHNzGNAkOt7ll4tKHv3WaroK+ZsahwcOU1sUHLlHvMWTqKX
         w6yEHx4IqZxLn1uVBDwp9axZBIWw79GsV0og4LZFjZZBJ/XWNBv5ANa7kpSkeak36dV6
         +tvZXvQ7J2YqyoOu45AKpYRL+jIq0m1olFQY4h3R7XRNro6EimRJrT15MKxFD79QBzXe
         kB+Pfx3BCyNQ6u2PEq+FrBvtYEbsv3eTwXZnWD8plYaP9kE4oq4CrxO882w7/DAtGfaW
         v+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=yX3O7KPvQx7S3aIf9BMvwZK2M2uDxHqEk7CIJLVybdc=;
        b=Bx72FQ7I9WDJ54bErROBqTKY8QcMboiSI4oka8fNE8k8IkL4Sf4sKJgpsH0hlXOF0+
         1vB3UHByYIcoChjirfVREtDJXfBNLymjcsSZ/GIWf9SLZwNbpnMU+WsDlwh8ajRB1/h5
         XLDLJfKn8u9eB0dZl4XqJFe232oiaJUK3bJ00OqpWoR69NqcTTeViG4rYR8h2LYHKgpW
         EfKLablAgFiY/9I4zcYLSJHaogizPAPORfjdQmpLMy6KOA/NBumQMAVH2DELOH50c3EV
         aw1wwX2n+irPm+C+X78tvdw0550CYLo7pQBMSpIS+hi11sK7WtU6UE5OfBw/J4RrXmSc
         JX/w==
X-Gm-Message-State: AOAM531npfIIHeIdLdgmBDvJRAJYYjmZ2nr3LbyiZfI2ioJveGfOXE0i
        wFP6rDa6Z+9o3oOt4eEIDE8=
X-Google-Smtp-Source: ABdhPJzvl0m0swNuW52nGaENetWkBeHwUi2whNeJnMhXwrbhscZ+XkUzh3qr6rPdWNUOtDa8aCDNLQ==
X-Received: by 2002:a17:90b:19d2:: with SMTP id nm18mr382289pjb.71.1589498487766;
        Thu, 14 May 2020 16:21:27 -0700 (PDT)
Received: from syed ([106.223.1.212])
        by smtp.gmail.com with ESMTPSA id m9sm239762pgd.1.2020.05.14.16.21.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 May 2020 16:21:27 -0700 (PDT)
Date:   Fri, 15 May 2020 04:51:12 +0530
From:   Syed Nayyar Waris <syednwaris@gmail.com>
To:     akpm@linux-foundation.org
Cc:     andriy.shevchenko@linux.intel.com, vilhelm.gray@gmail.com,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        michal.simek@xilinx.com, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 4/4] gpio: xilinx: Utilize for_each_set_clump macro
Message-ID: <dc60f9b4ac59eb5e48461d7c6c862c46a2445b8b.1589497312.git.syednwaris@gmail.com>
References: <cover.1589497311.git.syednwaris@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1589497311.git.syednwaris@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch reimplements the xgpio_set_multiple function in
drivers/gpio/gpio-xilinx.c to use the new for_each_set_clump macro.
Instead of looping for each bit in xgpio_set_multiple
function, now we can check each channel at a time and save cycles.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Michal Simek <michal.simek@xilinx.com>
Signed-off-by: Syed Nayyar Waris <syednwaris@gmail.com>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
Changes in v6:
 - No change.

Changes in v5:
 - Minor change: Inline values '32' and '64' in code for better 
   code readability.

Changes in v4:
 - Minor change: Inline values '32' and '64' in code for better 
   code readability.

Changes in v3:
 - No change.

Changes in v2:
 - No change.

 drivers/gpio/gpio-xilinx.c | 62 ++++++++++++++++++++------------------
 1 file changed, 32 insertions(+), 30 deletions(-)

diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index 67f9f82e0db0..e81092dea27e 100644
--- a/drivers/gpio/gpio-xilinx.c
+++ b/drivers/gpio/gpio-xilinx.c
@@ -136,39 +136,41 @@ static void xgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 static void xgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
 			       unsigned long *bits)
 {
-	unsigned long flags;
+	unsigned long flags[2];
 	struct xgpio_instance *chip = gpiochip_get_data(gc);
-	int index = xgpio_index(chip, 0);
-	int offset, i;
-
-	spin_lock_irqsave(&chip->gpio_lock[index], flags);
-
-	/* Write to GPIO signals */
-	for (i = 0; i < gc->ngpio; i++) {
-		if (*mask == 0)
-			break;
-		/* Once finished with an index write it out to the register */
-		if (index !=  xgpio_index(chip, i)) {
-			xgpio_writereg(chip->regs + XGPIO_DATA_OFFSET +
-				       index * XGPIO_CHANNEL_OFFSET,
-				       chip->gpio_state[index]);
-			spin_unlock_irqrestore(&chip->gpio_lock[index], flags);
-			index =  xgpio_index(chip, i);
-			spin_lock_irqsave(&chip->gpio_lock[index], flags);
-		}
-		if (__test_and_clear_bit(i, mask)) {
-			offset =  xgpio_offset(chip, i);
-			if (test_bit(i, bits))
-				chip->gpio_state[index] |= BIT(offset);
-			else
-				chip->gpio_state[index] &= ~BIT(offset);
-		}
+	u32 *const state = chip->gpio_state;
+	unsigned int *const width = chip->gpio_width;
+	unsigned long offset, clump;
+	size_t index;
+
+	DECLARE_BITMAP(old, 64);
+	DECLARE_BITMAP(new, 64);
+	DECLARE_BITMAP(changed, 64);
+
+	spin_lock_irqsave(&chip->gpio_lock[0], flags[0]);
+	spin_lock_irqsave(&chip->gpio_lock[1], flags[1]);
+
+	bitmap_set_value(old, state[0], 0, width[0]);
+	bitmap_set_value(old, state[1], width[0], width[1]);
+	bitmap_replace(new, old, bits, mask, gc->ngpio);
+
+	bitmap_set_value(old, state[0], 0, 32);
+	bitmap_set_value(old, state[1], 32, 32);
+	state[0] = bitmap_get_value(new, 0, width[0]);
+	state[1] = bitmap_get_value(new, width[0], width[1]);
+	bitmap_set_value(new, state[0], 0, 32);
+	bitmap_set_value(new, state[1], 32, 32);
+	bitmap_xor(changed, old, new, 64);
+
+	for_each_set_clump(offset, clump, changed, 64, 32) {
+		index = offset / 32;
+		xgpio_writereg(chip->regs + XGPIO_DATA_OFFSET +
+				index * XGPIO_CHANNEL_OFFSET,
+				state[index]);
 	}
 
-	xgpio_writereg(chip->regs + XGPIO_DATA_OFFSET +
-		       index * XGPIO_CHANNEL_OFFSET, chip->gpio_state[index]);
-
-	spin_unlock_irqrestore(&chip->gpio_lock[index], flags);
+	spin_unlock_irqrestore(&chip->gpio_lock[1], flags[1]);
+	spin_unlock_irqrestore(&chip->gpio_lock[0], flags[0]);
 }
 
 /**
-- 
2.26.2

