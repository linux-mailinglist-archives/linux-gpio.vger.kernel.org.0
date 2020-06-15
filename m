Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A6F11F9754
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2020 14:55:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730288AbgFOMzJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jun 2020 08:55:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730121AbgFOMzI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Jun 2020 08:55:08 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 013F1C061A0E;
        Mon, 15 Jun 2020 05:55:08 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id i12so6791611pju.3;
        Mon, 15 Jun 2020 05:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kXNO5dq1powGbD9BrNfpHM4305IDPaieel0HOsoeAtA=;
        b=qwa3nyNmSq9Ut8ztVt6ZPFhkHUxCbdELvQ2Z0eVmmrOiyB0hvPDbyRgexefM7oClhL
         bUyvSuw4e2zL4FEEY/zzukgwEbKLo6tOK1zp/5w0EGx7M214DXjRBa0jLoctmIdgQ0oD
         Zg2FOrS2zvwUSba1y36iUyT/alCShBdF8M70itq3fPTBwXkRs8oDsUCRWibWJXHiqZ4b
         b/tOXW0YniV4Ll7CLYFFsgKrSHbjicZbQraKhv6CQjxpDnURKIJZFI9Cr3HpI1rN3M79
         8FPAyZb82mc0yeuj0tPHobUyU2XJCEG/hknT2gmo3aS/Msdbb06kxVgqsj0aedaYKU/3
         uDyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kXNO5dq1powGbD9BrNfpHM4305IDPaieel0HOsoeAtA=;
        b=tPCP+BD9MP/eVyC7+WbBcZyPBhb/w1rxnd8L47/j6KTSRrNoRUYYk4lN0jFufmfCTO
         LAiqmEyQ1VDYdKfWWDPjEolkH38Qa3E6c2Wbf8VJFizbiz44iKKXqbDDlLM1V7yLMbts
         DHAArn1W5sfGsaHAAUQi8iv3qGndnbIbiTbLuQT4hyYOJzsCYFYNQEmT4dIeFOz7VdDs
         2r0jyqrbJ3WSNSK8fQvGinNzdGs46Tt5u5lfjMO0Z/2x6I/2gicMaQj1E4qZPlii+nqy
         7l4NI9lB+VEaBJD7vFSnVe72bUcFikx8dFOD2PN1itqrt0HjgXdWO4hF2H2FMAzCi+Rk
         8dDQ==
X-Gm-Message-State: AOAM531P+WbaVVoRTrWrSN6K5yTNtn2/vLUuE5ZYMA0Dp4ds18R91CAN
        qF4w7whP1TlMeVQzPqLtJXk=
X-Google-Smtp-Source: ABdhPJwVaSiNiKt8E7F7y7ozgSGtM/hiMV1bukQeQmHKrRKj8fe7YPK5ptt/y+23UJL0YKdjn19jBw==
X-Received: by 2002:a17:90a:db91:: with SMTP id h17mr11898770pjv.6.1592225707605;
        Mon, 15 Jun 2020 05:55:07 -0700 (PDT)
Received: from syed ([106.198.128.180])
        by smtp.gmail.com with ESMTPSA id g21sm13805054pfh.134.2020.06.15.05.55.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Jun 2020 05:55:07 -0700 (PDT)
Date:   Mon, 15 Jun 2020 18:24:50 +0530
From:   Syed Nayyar Waris <syednwaris@gmail.com>
To:     linus.walleij@linaro.org, akpm@linux-foundation.org
Cc:     andriy.shevchenko@linux.intel.com, vilhelm.gray@gmail.com,
        bgolaszewski@baylibre.com, michal.simek@xilinx.com,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v8 4/4] gpio: xilinx: Utilize for_each_set_clump macro
Message-ID: <46c05c5deeada60a13ee0de83c68583d578f42fd.1592224129.git.syednwaris@gmail.com>
References: <cover.1592224128.git.syednwaris@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1592224128.git.syednwaris@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch reimplements the xgpio_set_multiple function in
drivers/gpio/gpio-xilinx.c to use the new for_each_set_clump macro.
Instead of looping for each bit in xgpio_set_multiple
function, now we can check each channel at a time and save cycles.

Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Michal Simek <michal.simek@xilinx.com>
Signed-off-by: Syed Nayyar Waris <syednwaris@gmail.com>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
Changes in v8:
 - No change.

Changes in v7:
 - No change.

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

