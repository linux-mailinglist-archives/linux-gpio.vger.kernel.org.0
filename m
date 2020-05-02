Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85A941C28DD
	for <lists+linux-gpio@lfdr.de>; Sun,  3 May 2020 01:19:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726410AbgEBXTf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 2 May 2020 19:19:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726375AbgEBXTf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 2 May 2020 19:19:35 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BF45C061A0C;
        Sat,  2 May 2020 16:19:35 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id t9so1934101pjw.0;
        Sat, 02 May 2020 16:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=LkAUCqfc1AV7hZWhs6felQHhU8fMekbk83Bpx1s0KEU=;
        b=f+WZNtGa3YeYtBRjhQ77UH7ZGElu/KmspIqrc5nJwDqyuA+9q7R0Dxx6HkLwtKcyaR
         gS2VT4m+KfkCmc9tbJdyVovOmbbVWRxCU9PXKic9hU0llJsJ/XtO54BYGh/5C0Ms3M0K
         1mJeaLT48FljzQ/G52/LNUS4qC9yFWl2VxMsq4hkuzyG9zZRwqCoVMVi9tXOs2HLCWqX
         aalf8N2VrWdaCJm9VJAZQE0CevJH4jy8OFT/sf1NcR1tCY6RgyQNcHw8OOqIANQKj0ts
         64loHZwvE70U40ouW256IJsUpjq+IAlJWs7Ou5SyXH2P1Zk9XKeR2nrHbcGC6tjXi0F3
         89jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LkAUCqfc1AV7hZWhs6felQHhU8fMekbk83Bpx1s0KEU=;
        b=KGBxu4k9sUj/tzO86dv7jUAWaceCnPosnI7JuCZLuogoz3DrboQ1NCX1Q272k0eFEU
         /+khEUgQPgoT6nvg8AVTtt8jiFaEWZbKBMrZ+svv8IhL2FOTkkIH9TiQ8eXF5Ri0aYa4
         ADla25KTwPvIguhhYgGcLz+bFdlgFxJ4v82gBs/K/oDL/9lnenHR2ZRSMdqSu66+LgNy
         97V5/rfDMLylkIzzlBudtGQUbPZbLLo4XAf9my0CtJV4OhBOdjX5wYetTdGliJE3B+Jj
         3JsV/AvaUHNP6xpgTZzclukroNlgy6gHLc2DyOT9luy04wjUPyG4IER9dhF75qpwV0L2
         h8og==
X-Gm-Message-State: AGi0PubwDLX95RZwM7eBcZ3sFx0ubNEwlndjhvzZP3z1iO5mhvC7Fn50
        Ok8xDZl2Bd0qm1Ltft40mP4=
X-Google-Smtp-Source: APiQypLbAdZkvvAER5wkKxIbPAjube5ny05BxvAvGWofwDrkzsNksazMKG5sRuovdKEwZgNigqwxdA==
X-Received: by 2002:a17:90a:7349:: with SMTP id j9mr8218530pjs.196.1588461574397;
        Sat, 02 May 2020 16:19:34 -0700 (PDT)
Received: from syed ([106.210.101.167])
        by smtp.gmail.com with ESMTPSA id w75sm5237106pfc.156.2020.05.02.16.19.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 02 May 2020 16:19:34 -0700 (PDT)
Date:   Sun, 3 May 2020 04:49:15 +0530
From:   Syed Nayyar Waris <syednwaris@gmail.com>
To:     akpm@linux-foundation.org
Cc:     andriy.shevchenko@linux.intel.com, vilhelm.gray@gmail.com,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        michal.simek@xilinx.com, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 4/4] gpio: xilinx: Utilize for_each_set_clump macro
Message-ID: <c523c2b865434cde4f11e6c6611431ad4485892e.1588460322.git.syednwaris@gmail.com>
References: <cover.1588460322.git.syednwaris@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1588460322.git.syednwaris@gmail.com>
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

