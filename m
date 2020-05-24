Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19B5B1DFD49
	for <lists+linux-gpio@lfdr.de>; Sun, 24 May 2020 07:07:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728619AbgEXFHP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 24 May 2020 01:07:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725856AbgEXFHO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 24 May 2020 01:07:14 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87E0DC061A0E;
        Sat, 23 May 2020 22:07:14 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id ci21so6932288pjb.3;
        Sat, 23 May 2020 22:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mvYhtqV1U4qqhDVOWFjEaTG959+IGNH15YQtyFmwOMk=;
        b=NK9MXfpY/j07O5SEzOIz6vmM8uitKXAVhNCl78GoFuyoMSl3Ju3Y1LOp1r5n3k3Uti
         qAId0zGO/uQmZoPLTK2fv0F9VJR1JCG87zsD5AEGCEfaTUXH+F+9JQORk//ZvioDaf21
         I7cN4ryMBsN/FZ/Vdh0c0WnC58sJ8tvFzyYFjAXB9ADZC1b0z6eZ6L4KITmyNJ5OycL6
         VIAHI0Wl8TQ36rlBEuAg1n4nd+7Lly0BD/+0N3YIBYJLHrKIm330hRmVWPDYdhCBm2V9
         U/g8lqbwi0Z1/UpEj3tslj9qgTX0lGCrnbYsRh3DmqfjEKT9ZGC5OVymv6Mmt/N2HCsW
         z0Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mvYhtqV1U4qqhDVOWFjEaTG959+IGNH15YQtyFmwOMk=;
        b=sb/Bjn8DTIdFijfvtHkPlU5ldIX1DS6lgDx84jWTlA0imXO+1gr2A9wGbZFOkBHcdK
         7AMa7yn8JTwmeizUSjemtENWrSzQzs2nr8tSif5VacLFJYcEmyEPYkbtE5rUn0sDz9ib
         A+DUGru4pxK39ofWtjJDtOPvIX94hLL6QGdSC3Xz0s0pkn97EOgU2bwNfpFdbuz9VLAj
         v9rcM1HOcAarAgNyo8ks9g2Menbo+dTaYlS51jpKhVGVzewKRqkFi4/YMzn8TBfV4rE6
         0n2Gue7VwmeHmty6f7jD4bXKTFpG0V5gSbvcGY/JqWZW6VGq5bOIwG7cFsEM2iESNmZw
         sl9Q==
X-Gm-Message-State: AOAM533wcFZxQInm1qgDujL5zPNzTJUlEaElWZODXvnz0sPdRXIdwDf6
        LkkeJqa+NnoiDoTHtzU10II=
X-Google-Smtp-Source: ABdhPJwu4ENvd3yDcG8988brVGHraIQrJeOh4O49kmpFQr7sJeqeLJebPf41K5Zy9eSurQOaa2czwQ==
X-Received: by 2002:a17:902:6b09:: with SMTP id o9mr21058970plk.100.1590296834091;
        Sat, 23 May 2020 22:07:14 -0700 (PDT)
Received: from syed ([106.223.122.111])
        by smtp.gmail.com with ESMTPSA id h7sm8985165pgn.60.2020.05.23.22.07.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 23 May 2020 22:07:13 -0700 (PDT)
Date:   Sun, 24 May 2020 10:36:56 +0530
From:   Syed Nayyar Waris <syednwaris@gmail.com>
To:     linus.walleij@linaro.org, akpm@linux-foundation.org
Cc:     andriy.shevchenko@linux.intel.com, vilhelm.gray@gmail.com,
        bgolaszewski@baylibre.com, michal.simek@xilinx.com,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v7 4/4] gpio: xilinx: Utilize for_each_set_clump macro
Message-ID: <c0c47f777522aa16c31248e9b8c75d2b96c7b652.1590017578.git.syednwaris@gmail.com>
References: <cover.1590017578.git.syednwaris@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1590017578.git.syednwaris@gmail.com>
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

