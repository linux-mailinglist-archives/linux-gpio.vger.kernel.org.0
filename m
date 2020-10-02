Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67BF4281F65
	for <lists+linux-gpio@lfdr.de>; Sat,  3 Oct 2020 01:52:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725773AbgJBXwm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Oct 2020 19:52:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725613AbgJBXwm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Oct 2020 19:52:42 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4450EC0613D0;
        Fri,  2 Oct 2020 16:52:42 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id nl2so189272pjb.1;
        Fri, 02 Oct 2020 16:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Z974aP69w88WzL7DCoJ+EyBN0W0PHsyAzkHjxsPDFG8=;
        b=PY+iM3vLA4d8GNaQzztcYjO4ajRNeWRO/yj6YEPp3e43xJFWEc8KKmfvFTf6RwmZZX
         rIl4cFh9r/cIoRUFfqaSUhZc7c5C6E0lRKQgzaV/dwaigxPmrW/kKCcKWZ5sFo8EGQtM
         SO4RxVx7GzzzpuafA96PBC7jTjqDAjCqEQujsjwbBaENZeHjoLr6Om9ihfN0+iH2RrXa
         /0T0qxyasuR5/HtEyT2qn+7fYvSPCT6EmosSPiGde2n6tvKlLKfVC1HdcXa00SBQIlDD
         TYl7WEXEf+QEftq7fvtjaJONwGv2Vqvg29GQ9G7USw7bJPPhT+YDpH0NML2o6x8qpcDE
         S5FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Z974aP69w88WzL7DCoJ+EyBN0W0PHsyAzkHjxsPDFG8=;
        b=kglOGfYowEbqXgwWwwxlE0BMA6o3Tw6LFwXFUCevKc31fAWj02SSjBE4NN4EDX0HIX
         1Qsbv4YYwo1zA4unlMWMA7vh79Q4mIRgLJNF96U4cLM5cRzL7+VCNhrkHH2TUG8l0Aql
         GSJwhFC99KavnbhqnqEXEYj2DOuWaXqpdya4BPcMWvAYb2/3uPlwDhkZrvJ0p9M2/pdO
         6lwzdi9FyGN78ulKQdYMnxhN+DHWrX7bj3tKEDRcbUryb96x6oBpTynqtunN44XdHzfC
         kqXv7lt4KW3WGHChs9MSKKtST9aCATb2NV2iueFhd76WZmzEMqJa5bxijWkYlvFXCDIW
         fy+g==
X-Gm-Message-State: AOAM531jsElNjQhKd7+zM0c/AqTN8yZcO/OpkhEDKbl52A7+QqgmV5Tl
        OUuI0GhKrJ5Nwv0g+XYJ2Lo=
X-Google-Smtp-Source: ABdhPJwrsU/aOUD7khIFLt5wpglopaYK5gVYIod1y6XEkXPaB/pgTDE+bNMUnMhoCDl0nrOuSdurTw==
X-Received: by 2002:a17:90a:71c3:: with SMTP id m3mr5443612pjs.68.1601682761789;
        Fri, 02 Oct 2020 16:52:41 -0700 (PDT)
Received: from syed.domain.name ([103.201.127.75])
        by smtp.gmail.com with ESMTPSA id v1sm340211pjd.7.2020.10.02.16.52.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 02 Oct 2020 16:52:41 -0700 (PDT)
Date:   Sat, 3 Oct 2020 05:22:28 +0530
From:   Syed Nayyar Waris <syednwaris@gmail.com>
To:     linus.walleij@linaro.org, akpm@linux-foundation.org
Cc:     andriy.shevchenko@linux.intel.com, vilhelm.gray@gmail.com,
        bgolaszewski@baylibre.com, michal.simek@xilinx.com,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v10 4/4] gpio: xilinx: Utilize generic bitmap_get_value and
 _set_value
Message-ID: <e1753313c18ebb233bce1b1b48749858e5402235.1601679792.git.syednwaris@gmail.com>
References: <cover.1601679791.git.syednwaris@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1601679791.git.syednwaris@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch reimplements the xgpio_set_multiple function in
drivers/gpio/gpio-xilinx.c to use the new generic functions:
bitmap_get_value and bitmap_set_value. The code is now simpler
to read and understand. Moreover, instead of looping for each bit
in xgpio_set_multiple function, now we can check each channel at
a time and save cycles.

Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Michal Simek <michal.simek@xilinx.com>
Signed-off-by: Syed Nayyar Waris <syednwaris@gmail.com>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
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

