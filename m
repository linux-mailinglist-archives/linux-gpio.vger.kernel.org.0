Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC7D71C27DB
	for <lists+linux-gpio@lfdr.de>; Sat,  2 May 2020 20:52:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728252AbgEBSwQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 2 May 2020 14:52:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726306AbgEBSwP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 2 May 2020 14:52:15 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4A1BC061A0C;
        Sat,  2 May 2020 11:52:15 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id t11so6355492pgg.2;
        Sat, 02 May 2020 11:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6y3f1iXR5yiiqAlOPqKiSQLFocKm9SaOEUukgjJZ5oE=;
        b=UA6XrV7kzwqdAm+iEfXiR968ldFj5IymkjpgdGv8QLEJn1FHjLKNkCFmfQpXFAa8WO
         QtNaz6tAiSiEczWEy/cVlPyFjq+hTRaCEwfh01JL+DsnP5zdIB2Fhz19Km/7lP0J0IOP
         0Ji+nLMBHjZtbyLjMLqi924mi/KFx39ZpJ8Hqn2sO8HJ2hAoCTLxY7h2DN+x6luchvh5
         eILsUKsj8ArkyhxC2rXQuyH03+Bk+XmR0DeX2X/yoeDWPhC6krd7Y/3DjM6Izu3WUvTt
         2jf0rjYMc06VRZorzbaMCzCUcn9h7elTSJfX0DpY6qipobUB6l42pnUbsyWFCvDcJ+os
         P5nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6y3f1iXR5yiiqAlOPqKiSQLFocKm9SaOEUukgjJZ5oE=;
        b=Qhs249cAPmkEviW26/4lLaMCdm7Z6nVftSdEgVeTKsF1gl2UTMWOnoKeodqb+77fs5
         usRvGLA24fUN29m/X8dNEZtxBzcCsFVjZ6FLsekpBrgDsYMlZBwN5BKLhMWdWWcSCV/+
         LmOdb6aMBTPL9sH724XydlBZQ1i8jv5IT5gosUac97A+wcFOA+v4oMtv1M0/XdCf+tAy
         t3F9at+dzw1Aa8JwQPIrqfElGN6BDb3zHQHA+usmKlTYdc0I5dA9+bIcnPlgFxhvvGbl
         6PGJ7zb/RZABEnZz0+ZD3LDU9tJ8sJLaPK8kKI81pY45AbR+XG90/V5zDEcDbDxGy/X4
         52mg==
X-Gm-Message-State: AGi0PuYiUoFIda2QUC1a7lbXAu54A7ovs6GWeGHfgt7PU7rkwvw4/A42
        aaasB7uAcXJj5ev8HH3R93c=
X-Google-Smtp-Source: APiQypJn55cCwUXOFCouPv9af0rzgTb6bSvh3csy57pzpvKdSoe007N9Dxu5tV18PJqf8EEFQSMgpw==
X-Received: by 2002:a63:8d4b:: with SMTP id z72mr9573375pgd.376.1588445535538;
        Sat, 02 May 2020 11:52:15 -0700 (PDT)
Received: from syed ([106.210.101.167])
        by smtp.gmail.com with ESMTPSA id d203sm4973636pfd.79.2020.05.02.11.52.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 02 May 2020 11:52:15 -0700 (PDT)
Date:   Sun, 3 May 2020 00:21:54 +0530
From:   Syed Nayyar Waris <syednwaris@gmail.com>
To:     akpm@linux-foundation.org
Cc:     andriy.shevchenko@linux.intel.com, vilhelm.gray@gmail.com,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        michal.simek@xilinx.com, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/4] gpio: xilinx: Utilize for_each_set_clump macro
Message-ID: <366a64f80ee9fe1c644ea038ac112ead9766d5c8.1588443578.git.syednwaris@gmail.com>
References: <cover.1588443578.git.syednwaris@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1588443578.git.syednwaris@gmail.com>
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
Changes in v4:
 - Minor change: Hardcode value for better code readability.

Changes in v3:
 - No change.

Changes in v2:
 - No change.

 drivers/gpio/gpio-xilinx.c | 64 ++++++++++++++++++++------------------
 1 file changed, 34 insertions(+), 30 deletions(-)

diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index 67f9f82e0db0..67c5eeaf1bb9 100644
--- a/drivers/gpio/gpio-xilinx.c
+++ b/drivers/gpio/gpio-xilinx.c
@@ -136,39 +136,43 @@ static void xgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
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
+	const unsigned long state_size = 32;
+	const unsigned long total_state_bits = state_size * 2;
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
+	bitmap_set_value(old, state[0], 0, state_size);
+	bitmap_set_value(old, state[1], state_size, state_size);
+	state[0] = bitmap_get_value(new, 0, width[0]);
+	state[1] = bitmap_get_value(new, width[0], width[1]);
+	bitmap_set_value(new, state[0], 0, state_size);
+	bitmap_set_value(new, state[1], state_size, state_size);
+	bitmap_xor(changed, old, new, total_state_bits);
+
+	for_each_set_clump(offset, clump, changed, total_state_bits, state_size) {
+		index = offset / state_size;
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

