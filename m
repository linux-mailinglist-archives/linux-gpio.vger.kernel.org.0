Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DA8E20C008
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Jun 2020 10:14:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726086AbgF0IOk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 27 Jun 2020 04:14:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725991AbgF0IOj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 27 Jun 2020 04:14:39 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D27E1C03E979;
        Sat, 27 Jun 2020 01:14:39 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id i4so5916794pjd.0;
        Sat, 27 Jun 2020 01:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dpM993DYx757L959Dyb6uvrVfTSpmyE+QSSbfrUcBkg=;
        b=fTYh6RdXSkRMtPVsVoCTi+cghdBug+y6T/Sv1djnKnS6+QYs2f0ANYxz7WUZWL4GFU
         30XWR+Q9ZlueRgvjp3kAApQM7cevL+S3SeJwqUcom8G/6i4lEC0Rk8eq4MYH91hukfHN
         Y3d4pFYZAC846CyRqMV26J0zt29EG8sRJ8sUw/TY0W/MzH9Fop8HGLEc6dxKJm9MPP8W
         dcfTmVRBDmUcYORA/2MrB+cvCYjdx0kFDA/Ez71dHrT5buCCxxDQdtydTuIRI/8DRd9K
         jFcq1Roi44BLAdOJL/SZfUxLcpjBVU9y+nEjotyAmW5biH72ZqW0ycSpWHSLpuGwjkaf
         i/Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dpM993DYx757L959Dyb6uvrVfTSpmyE+QSSbfrUcBkg=;
        b=GNi7dD2UVx9nY8wmEjtq0xp9UzDTXwZNLftNmHUzTfnnpBaqOuj7OloaHMs9M5qhBQ
         yzif1zf3udKUTLAh/L2V4JdfXzfOZpuiUPx6DebsGIa4BJxzKOBID0no1rQbAbjIu+cd
         K4WkCWa7YFZB+O4tOX+dsQuWoXTN5n/NaUUqKEH0i4iGNHn2lpVa3kJtVFijMX3d9VB3
         PJeG/5g/ZSikhGVKkULH6dlWol1rkPaDS80oA8g4AM/Ep14BWk5oqbKDYjhe2Ne8XGZU
         LmLLXzgovZQb5eSU8c5j9mxt/1f8xlqOrl7S02Q4g2BgAkMl3nZsnTNqSw6ZytQxovqn
         rMQQ==
X-Gm-Message-State: AOAM531QEvHCFAtSlnWQ3mDt+E09MWe0T1G8PK831gSnyAqhoxzr+n5j
        i3VsQgrFeTMwCzrK6Op/oWw=
X-Google-Smtp-Source: ABdhPJxlLPfHUJU3msNctbpW/nRfqu1Q5Wt3/FlbO0z+jENpMMgputAm+r7e4r8/qnaj7e1ONqgjNw==
X-Received: by 2002:a17:902:fe8f:: with SMTP id x15mr5557911plm.249.1593245679417;
        Sat, 27 Jun 2020 01:14:39 -0700 (PDT)
Received: from syed ([106.198.160.82])
        by smtp.gmail.com with ESMTPSA id h3sm4416100pjz.23.2020.06.27.01.14.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 27 Jun 2020 01:14:39 -0700 (PDT)
Date:   Sat, 27 Jun 2020 13:44:23 +0530
From:   Syed Nayyar Waris <syednwaris@gmail.com>
To:     linus.walleij@linaro.org
Cc:     andriy.shevchenko@linux.intel.com, vilhelm.gray@gmail.com,
        bgolaszewski@baylibre.com, michal.simek@xilinx.com,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v9 4/4] gpio: xilinx: Utilize generic bitmap_get_value and
 _set_value.
Message-ID: <0a35c10d1613aff43038bc7d4d6f95061d9d80d3.1593243081.git.syednwaris@gmail.com>
References: <cover.1593243079.git.syednwaris@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1593243079.git.syednwaris@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch reimplements the xgpio_set_multiple function in
drivers/gpio/gpio-xilinx.c to use the new generic functions:
bitmap_get_value and bitmap_set_value. The code is now simpler
to read and understand. Moreover, instead of looping for each bit
in xgpio_set_multiple function, now we can check each channel at
a time and save cycles.
---
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

 drivers/gpio/gpio-xilinx.c | 66 +++++++++++++++++++-------------------
 1 file changed, 33 insertions(+), 33 deletions(-)

diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index 67f9f82e0db0..48393d06fb55 100644
--- a/drivers/gpio/gpio-xilinx.c
+++ b/drivers/gpio/gpio-xilinx.c
@@ -136,39 +136,39 @@ static void xgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 static void xgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
 			       unsigned long *bits)
 {
-	unsigned long flags;
+	unsigned long flag;
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
+	spin_lock_irqsave(&chip->gpio_lock[0], flag);
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
+	spin_unlock_irqrestore(&chip->gpio_lock[0], flag);
 }
 
 /**
@@ -292,6 +292,7 @@ static int xgpio_probe(struct platform_device *pdev)
 		chip->gpio_width[0] = 32;
 
 	spin_lock_init(&chip->gpio_lock[0]);
+	spin_lock_init(&chip->gpio_lock[1]);
 
 	if (of_property_read_u32(np, "xlnx,is-dual", &is_dual))
 		is_dual = 0;
@@ -314,7 +315,6 @@ static int xgpio_probe(struct platform_device *pdev)
 					 &chip->gpio_width[1]))
 			chip->gpio_width[1] = 32;
 
-		spin_lock_init(&chip->gpio_lock[1]);
 	}
 
 	chip->gc.base = -1;
-- 
2.26.2

