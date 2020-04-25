Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 110121B88C0
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Apr 2020 21:07:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726232AbgDYTHH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Apr 2020 15:07:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726192AbgDYTHG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 25 Apr 2020 15:07:06 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D30BCC09B04D;
        Sat, 25 Apr 2020 12:07:06 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id t40so5344877pjb.3;
        Sat, 25 Apr 2020 12:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Y/NNmr9bRfvPdNCbd+uL+8dkgb0D73+tD/kL7PyleYU=;
        b=PQK8eKVZ8EJ4dDmmnATuwDz2A8Eai7EHC03u2DFEq0rNUdIYSn+P/lH7e1OMDEUsob
         eOW25mTNthZbCB9AWDVbCf+4w1yyHJu3NGejhhqO1BgFMsIqZjZmBQKNvRmVmDoqbENm
         jX/GVzHEGstGqNH2rEXLNNU5kmpklBeDvcbsNVkgviUG3iuQWnCA9Vv4AV2G5S/5zRUV
         BmK4GBnrxT33O5kkm/YS8tq5dO2iwJkdOxS6JuLuiHPUzhaqd6wq1BmrNvZxulsfkj/8
         YjT+qyL0HW4YUdRgaMHjkkXSlfEDogImNfd+Dfn6VVMbdfjiqHkbWy65b3Atpi0RL+lX
         QXcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Y/NNmr9bRfvPdNCbd+uL+8dkgb0D73+tD/kL7PyleYU=;
        b=nC00vT3jWYPc8jB/5cBN+r9ushhNaTUJLqFwGiIxmI3rrkoRTfEWVrxPS1KjD30S3P
         LDxjM+TcYSy9iOkQnoH5ShqZoh5HwMemRYSspuLPO93mhbsliVQkhOao95iwRMhNINak
         D+qHMo8A8VnGDz1WbhGkzuYZIvZ6be+ueGuh7737wXTsspuBocSt5SmDJ38R10ZRy43h
         sfYE0YlNjSICDM5QwsuDuDk+tU1heom2TduiQUhTwaF26KN7B3EEIzzxQWktmbGGeiuZ
         qHiYUwXaw/HQ48CknQRns1vPOu+C5B3jh0P1UROI/QBkcjSTDLRnmVz/TV15sVPN6B6M
         L8fw==
X-Gm-Message-State: AGi0PuauMT1ZZxUYztNmXe/VvPCsm7PG8SbpH+e6270x28oMdGiYFG90
        m1ietqX6G8b2vKHaTjkaKyY=
X-Google-Smtp-Source: APiQypIWyIaIIrEI3kjYuXUwp7teET7laXO2B1al+v5QXj5cr9mxoFyweoEuOleJaRu6bnIGqW5ZAw==
X-Received: by 2002:a17:902:8d91:: with SMTP id v17mr14786128plo.53.1587841626457;
        Sat, 25 Apr 2020 12:07:06 -0700 (PDT)
Received: from syed ([106.223.101.50])
        by smtp.gmail.com with ESMTPSA id q63sm8501398pfb.178.2020.04.25.12.07.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 25 Apr 2020 12:07:06 -0700 (PDT)
Date:   Sun, 26 Apr 2020 00:36:59 +0530
From:   Syed Nayyar Waris <syednwaris@gmail.com>
To:     akpm@linux-foundation.org
Cc:     andriy.shevchenko@linux.intel.com, vilhelm.gray@gmail.com,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        michal.simek@xilinx.com, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/6] gpio: xilinx: Utilize for_each_set_clump macro
Message-ID: <afda24dacfdd33c03acd3371ea02692d8581396c.1587840670.git.syednwaris@gmail.com>
References: <cover.1587840667.git.syednwaris@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1587840667.git.syednwaris@gmail.com>
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
Changes in v2:
 - No change.

 drivers/gpio/gpio-xilinx.c | 64 ++++++++++++++++++++++++----------------------
 1 file changed, 34 insertions(+), 30 deletions(-)

diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index 67f9f82..428207f 100644
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
2.7.4

