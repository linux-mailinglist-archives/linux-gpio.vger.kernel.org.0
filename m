Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A880292048
	for <lists+linux-gpio@lfdr.de>; Sun, 18 Oct 2020 23:42:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728513AbgJRVmN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 18 Oct 2020 17:42:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726249AbgJRVmN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 18 Oct 2020 17:42:13 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05E19C061755;
        Sun, 18 Oct 2020 14:42:13 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id o9so3974695plx.10;
        Sun, 18 Oct 2020 14:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5GwnKa3t0cilaiZZH34/HtJehNj189L7Ol8ojb+g4Wc=;
        b=qwEVLjRfhc59TkhtkFMY0M/RR2pAyuxacdmfsfG9U3ZoBbxmAUH++QKOubJhOGE+Vw
         EDfgOWcvGJGR8qnPF2n3Fz2Cvhiw32gyPu9E3HnzKPClt23cLkrdMSiDVTXx/Cv+vBRf
         XONZrzNjrHfs+BgUXpthA8T+BEyoupId3hDACQ7y94sGSBvn7Ug+GJM3GHvy78AQj2jO
         /vlM1xfLJqkMhqjg5FehAR9q2oI71bCYnwn94wyQXLUmP6B28aqJ6u32DEWTX0oSCl1d
         g4ahlNbKb6DErJtNFu63OlIss/cYOA6W5YU5nmqvZC8pAwRw9MdSNybp9mjLf8qdiOS8
         0I8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5GwnKa3t0cilaiZZH34/HtJehNj189L7Ol8ojb+g4Wc=;
        b=E1GClCwbd2ZmGT93aUMe7aJ1gFWHw2dylTZWqgG7xuqC+qyJgSgnWkBVl4EKCeWTam
         u1i6UL8SoWR9fQdouO6MRDZ7Hpwnj66ZOECRYoB5oomalCRKgVoFqGv1kYxr+l+KiWK3
         fiMxm5AU8teRDYwHd8UiTViXrq+UIvGRt3j7KSAyK04cbiANWYI+WZBJdzj6Ob3PXAmG
         YZXwc4p9xkr06oYQVkgfoOSIaKJYFt+7L3+OnNK8x+8gEXNXo8zLXHFLVgpCYPnPYrRq
         H2T6fTrwzLruIypwWMyQpWAUPVgV/p1wu+NXW1dpllcQkLIirdQsLr2xdZTZWVPZmOkm
         qDkg==
X-Gm-Message-State: AOAM530UDIZVQ/N3j6YNPXtmWcq/ChVp21doRjYQgcXqdRJOVidtDvl1
        6vWc0IRZq6QThhaQycFvRV0=
X-Google-Smtp-Source: ABdhPJzdpCqnLzuQ2vSx6TjD2G3wSfK/dvSnie7XjY72PoC4uZOe7h1W1Bo8U6tGdo0DCvvw2Kppsw==
X-Received: by 2002:a17:902:d706:b029:d5:dde6:f56 with SMTP id w6-20020a170902d706b02900d5dde60f56mr4607249ply.26.1603057332595;
        Sun, 18 Oct 2020 14:42:12 -0700 (PDT)
Received: from syed ([2401:4900:47f3:e624:90f9:25c2:806b:19c8])
        by smtp.gmail.com with ESMTPSA id u7sm9501375pfn.37.2020.10.18.14.42.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 18 Oct 2020 14:42:12 -0700 (PDT)
Date:   Mon, 19 Oct 2020 03:11:52 +0530
From:   Syed Nayyar Waris <syednwaris@gmail.com>
To:     linus.walleij@linaro.org, akpm@linux-foundation.org
Cc:     andriy.shevchenko@linux.intel.com, vilhelm.gray@gmail.com,
        bgolaszewski@baylibre.com, michal.simek@xilinx.com,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v12 4/4] gpio: xilinx: Utilize generic bitmap_get_value and
 _set_value
Message-ID: <15a044d3ba23f00c31fd09437bdd3e5924bb91cd.1603055402.git.syednwaris@gmail.com>
References: <cover.1603055402.git.syednwaris@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1603055402.git.syednwaris@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch reimplements the xgpio_set_multiple() function in
drivers/gpio/gpio-xilinx.c to use the new generic functions:
bitmap_get_value() and bitmap_set_value(). The code is now simpler
to read and understand. Moreover, instead of looping for each bit
in xgpio_set_multiple() function, now we can check each channel at
a time and save cycles.

Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Michal Simek <michal.simek@xilinx.com>
Signed-off-by: Syed Nayyar Waris <syednwaris@gmail.com>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
Changes in v12:
 - Remove extra empty newline.

Changes in v11:
 - Change variable name 'flag' to 'flags'.

Changes in v10:
 - No change.

Changes in v9:
 - Remove looping of 'for_each_set_clump' and instead process two
   halves of a 64-bit bitmap separately or individually. Use normal spin_lock 
   call for second inner lock. And take the spin_lock_init call outside the 'if'
   condition in the 'probe' function of driver.

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
 - No change

 drivers/gpio/gpio-xilinx.c | 65 +++++++++++++++++++-------------------
 1 file changed, 32 insertions(+), 33 deletions(-)

diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index 67f9f82e0db0..3ba1a993c85e 100644
--- a/drivers/gpio/gpio-xilinx.c
+++ b/drivers/gpio/gpio-xilinx.c
@@ -138,37 +138,37 @@ static void xgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
 {
 	unsigned long flags;
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
-	}
-
-	xgpio_writereg(chip->regs + XGPIO_DATA_OFFSET +
-		       index * XGPIO_CHANNEL_OFFSET, chip->gpio_state[index]);
-
-	spin_unlock_irqrestore(&chip->gpio_lock[index], flags);
+	u32 *const state = chip->gpio_state;
+	unsigned int *const width = chip->gpio_width;
+
+	DECLARE_BITMAP(old, 64);
+	DECLARE_BITMAP(new, 64);
+	DECLARE_BITMAP(changed, 64);
+
+	spin_lock_irqsave(&chip->gpio_lock[0], flags);
+	spin_lock(&chip->gpio_lock[1]);
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
+	if (((u32 *)changed)[0])
+		xgpio_writereg(chip->regs + XGPIO_DATA_OFFSET,
+				state[0]);
+	if (((u32 *)changed)[1])
+		xgpio_writereg(chip->regs + XGPIO_DATA_OFFSET +
+				XGPIO_CHANNEL_OFFSET, state[1]);
+
+	spin_unlock(&chip->gpio_lock[1]);
+	spin_unlock_irqrestore(&chip->gpio_lock[0], flags);
 }
 
 /**
@@ -292,6 +292,7 @@ static int xgpio_probe(struct platform_device *pdev)
 		chip->gpio_width[0] = 32;
 
 	spin_lock_init(&chip->gpio_lock[0]);
+	spin_lock_init(&chip->gpio_lock[1]);
 
 	if (of_property_read_u32(np, "xlnx,is-dual", &is_dual))
 		is_dual = 0;
@@ -313,8 +314,6 @@ static int xgpio_probe(struct platform_device *pdev)
 		if (of_property_read_u32(np, "xlnx,gpio2-width",
 					 &chip->gpio_width[1]))
 			chip->gpio_width[1] = 32;
-
-		spin_lock_init(&chip->gpio_lock[1]);
 	}
 
 	chip->gc.base = -1;
-- 
2.26.2

