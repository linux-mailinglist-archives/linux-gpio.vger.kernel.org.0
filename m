Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A23001BD071
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2020 01:10:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726490AbgD1XKG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Apr 2020 19:10:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726044AbgD1XKF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 28 Apr 2020 19:10:05 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F054C03C1AC;
        Tue, 28 Apr 2020 16:10:04 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id l20so58932pgb.11;
        Tue, 28 Apr 2020 16:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6zdBCh/xlVK5PCSYWZXUcjZ7d6eaIl4/naLqN4XoTsQ=;
        b=XjQhU/J/vVFmZufkukdky9ZAfYjHNtQJMoxIRTvq2m2kpaihr5sAGI2VcBL6m4x0iG
         qeRJnHnZFxBzu3PUnUhzp5W0UiJ749XBnZ01JktFSXLSGDMkZ4ISZqJPZ0TTVnYNsXZs
         MySDnyco1HlwbIkkiQB0IykeOKEYW5h/XDgmMYJcCNe5hMKMv9AFMqgQz8tJS8y/D+cy
         CJ2I4vm6PGZLLWgcTfCZHTd1LQIDm0DmnehRRPx7Hben1TjNZ8twflFrSso4BDW/NK9u
         X6quEAzsd1qfesQM8WoP+qmaR/hUkwC9r1fIzztBFbp3Yik2oQDVpymy/SsS8ZnqcyMY
         SvmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6zdBCh/xlVK5PCSYWZXUcjZ7d6eaIl4/naLqN4XoTsQ=;
        b=f0UDYGDCv2i64SXTH9cIOGwlGbyQe4YoGjd2P4/s243dY+/FYKAYof+WIFxV4/wMzc
         qomThnA+3aY9skYcDcgUntP7J4Sqvp8iR0NznCOqsjQernzN17oi1Xakdr6s/yUv/LKK
         vsX/WV0Bc5/YVeXB1pUG7BQCIGIat7w7dOZGV5Nih24ucKLVTC81Dj5KMrPqR1CJJX3p
         RU4SgJ/pa7mDuhe4e34J1s204ksmKFsSg4Ht06DH7ZTiWSAbRebatj6mHIopJU8Qm7YN
         XD8pgR2qkw6FjHoP6UC8WWDTvPu4oDP0y+ElAc8zbp/BBgA1O5twC/gXibJauzTFZ+B4
         x3rA==
X-Gm-Message-State: AGi0PuZqX19XmSVIk1M2SY5KJ/HpHF3LAijBp2GIr5weG05hoxxUpupT
        wf4H4IMOMKgZlCr7XT+5zrM=
X-Google-Smtp-Source: APiQypJzE2hJ/H1IOJtoj3OJHBazjKl15p0BAdZCOJ4C/E1CEkWGc8AvSD7FuWooJHXEdCYLZuVonA==
X-Received: by 2002:a63:4047:: with SMTP id n68mr29781771pga.321.1588115404136;
        Tue, 28 Apr 2020 16:10:04 -0700 (PDT)
Received: from syed ([106.202.21.137])
        by smtp.gmail.com with ESMTPSA id u188sm16140298pfu.33.2020.04.28.16.10.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Apr 2020 16:10:03 -0700 (PDT)
Date:   Wed, 29 Apr 2020 04:39:47 +0530
From:   Syed Nayyar Waris <syednwaris@gmail.com>
To:     akpm@linux-foundation.org
Cc:     andriy.shevchenko@linux.intel.com, vilhelm.gray@gmail.com,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        michal.simek@xilinx.com, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] gpio: xilinx: Utilize for_each_set_clump macro
Message-ID: <80745504d15c87aa1da0d4be3c16d1279f48615b.1588112716.git.syednwaris@gmail.com>
References: <cover.1588112714.git.syednwaris@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1588112714.git.syednwaris@gmail.com>
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
Changes in v3:
 - No change.

Changes in v2:
 - No change.

 drivers/gpio/gpio-xilinx.c | 64 ++++++++++++++++++++------------------
 1 file changed, 34 insertions(+), 30 deletions(-)

diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index 67f9f82e0db0..428207f9ab91 100644
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
+	const unsigned long state_size = BITS_PER_TYPE(*state);
+	unsigned long offset, clump;
+	size_t index;
+
+#define TOTAL_BITS BITS_PER_TYPE(chip->gpio_state)
+	DECLARE_BITMAP(old, TOTAL_BITS);
+	DECLARE_BITMAP(new, TOTAL_BITS);
+	DECLARE_BITMAP(changed, TOTAL_BITS);
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
+	bitmap_xor(changed, old, new, TOTAL_BITS);
+
+	for_each_set_clump(offset, clump, changed, TOTAL_BITS, state_size) {
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

