Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE2E2284954
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Oct 2020 11:26:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725942AbgJFJ0b (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Oct 2020 05:26:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725891AbgJFJ0a (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Oct 2020 05:26:30 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF788C061755;
        Tue,  6 Oct 2020 02:26:30 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id j33so957135pgj.5;
        Tue, 06 Oct 2020 02:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Yik3flBh4CUXRUxM/w6MnjIa3nH9458F64/Bdk7xE9M=;
        b=EmVU56XkrZQa1di0QAd18ZWobaaAVt1vPKdDK070IVVp9HgWVePBbq7o+dViSRb6gS
         /ZOcWv3lJORClfUkAGRpWfNc6V0o0pGi463WO6ZvJ5n+FfgYEdr4HBRVUQlS4qQTYtvP
         /A968xOvL1C+B2Z5wv2YVlOgKd/MjHu/of5oq00SJ9K7U7qmbEgRiBksbE+4m3cLLs3P
         wnw2B0VOoTxadez3KIXH79paTYfw//UlBPAO6lhHnbW6BbQXn81IQCRihOAWWRzoox9n
         wCyKlBK1g/P45I35G4mPdVvGMS61ai+7oXFUuA9yN/HZy1NwjoKPnVi9NfPwmKGWy55J
         W44A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Yik3flBh4CUXRUxM/w6MnjIa3nH9458F64/Bdk7xE9M=;
        b=Ep2cGmudTv0MLGjLLVrxSmLsNRWEJ4jq8rGWLkgWuiWcuDOH8nz72Hvh0geHYMm4ey
         fkoLcwjfLzbxxkzTj9lxBeGM01/LjyoV/t4S0yS9c5JI+x0jbwvDJZskDr6ZY7uy6Mg4
         6PAzXdh5GhYVtyg8qczf6IjDIQMZa4uhcG149dcV+1SedGoaGIKGZY4YwVB9GH2EUPTC
         iXIVRyDPNNvmegjehOk6PM8W5f/qacALFhxWXMAoIsYMMo3g7z/TMKd9jEp1DvEwp8Ak
         tVwf3gN4d/KrzyQSZ/e7jrDTr4jdgiDwZHuIoJxm2534iAcnBJWfjH7iS+8xKT6gMk0o
         0t8A==
X-Gm-Message-State: AOAM532FdLNYUn8f2NGga1H99hE7s6mAEShtDB3KPj1weqzSJJuN4NDn
        sc9FFqkGtJH+7i6TLO1KltA=
X-Google-Smtp-Source: ABdhPJxU7MRAVgaDLNVIFuLJO9pqlMX14SkBBVNA6ytoA1Egok4IUwierQquJ6X9uTuCRuorc+ETiw==
X-Received: by 2002:a63:1604:: with SMTP id w4mr3224686pgl.148.1601976390490;
        Tue, 06 Oct 2020 02:26:30 -0700 (PDT)
Received: from syed ([117.97.226.113])
        by smtp.gmail.com with ESMTPSA id g129sm2875279pfb.9.2020.10.06.02.26.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Oct 2020 02:26:30 -0700 (PDT)
Date:   Tue, 6 Oct 2020 14:56:15 +0530
From:   Syed Nayyar Waris <syednwaris@gmail.com>
To:     linus.walleij@linaro.org, akpm@linux-foundation.org
Cc:     andriy.shevchenko@linux.intel.com, vilhelm.gray@gmail.com,
        bgolaszewski@baylibre.com, michal.simek@xilinx.com,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v11 4/4] gpio: xilinx: Utilize generic bitmap_get_value and
 _set_value
Message-ID: <3e27882cfa1eebc2905c0fa9aecfd2326d82c305.1601974764.git.syednwaris@gmail.com>
References: <cover.1601974764.git.syednwaris@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1601974764.git.syednwaris@gmail.com>
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

 drivers/gpio/gpio-xilinx.c | 64 +++++++++++++++++++-------------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index 67f9f82e0db0..f86bee271246 100644
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
@@ -314,7 +315,6 @@ static int xgpio_probe(struct platform_device *pdev)
 					 &chip->gpio_width[1]))
 			chip->gpio_width[1] = 32;
 
-		spin_lock_init(&chip->gpio_lock[1]);
 	}
 
 	chip->gc.base = -1;
-- 
2.26.2

