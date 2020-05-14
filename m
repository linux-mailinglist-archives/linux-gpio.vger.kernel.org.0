Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC5471D4198
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2020 01:20:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726216AbgENXUV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 May 2020 19:20:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726073AbgENXUU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 14 May 2020 19:20:20 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 385F0C061A0C;
        Thu, 14 May 2020 16:20:17 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id q9so137671pjm.2;
        Thu, 14 May 2020 16:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mHqAvIJeykh4mUcxwUvuwvcE4JQqYOohGk6QyCktS/A=;
        b=jez31xGf6gwJoo09+ZN1tyA9/f049IatjE5dsLtW4nmSBHhfuo06d+YZD6iKdZR7Cy
         RXwlFPDRLHyp5XH9KbyEcAuJdIgm/k1i3Xq5pvLCx+CrTW8bTH5WkZjAnDKuJnb7fdXs
         fdmUyAZNNQx2q4jGPti1MGRmckBDG7m42Hv9Oo+uXNMKcL6LX/TP52/OoHfbY82WJEfR
         RW7LXP0SM/hAemlexNmHgctK6HE8AdiDQHXnV+x1KzIUHXbmoRE/L4oAWE8/e/c76vob
         cPYLMDuL46wGiF6aBMECEH9NqulgTPZkMakB/W9gMl57nsxTsaBJwjtZR1THxzKh6/Wn
         nMdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mHqAvIJeykh4mUcxwUvuwvcE4JQqYOohGk6QyCktS/A=;
        b=nBC23z5EsjD78MHvUn/FtQlXamPgnrs4kEysvDBXjwC7cZh02ZlhWAPU7jhNT6RJLg
         h5CvzNUMyF9d/i/K1aRolYk1P0K+FBwZ6LZQZXt3qTVrGGbOd7IM9Hunmj8zy/VJY2Ej
         y21KXAJTtbvHJ8r0ca0J0P0SuvvZBNShUawCfGe/BTHyVnKegvHm6ratzgtTd73zAkEJ
         6zn4wmHEjxkx72HSYTXCuPUeDKlvDRSpO9SYXNrSjv0HnvZ9RsA2TrwgbY0PI/7P/UkL
         g7wGEPKV4x3zaqcEcamwkeKo2xhbJTyFycFC0O77BBwbQAstupwTjWHlz8zyc6nXTaNi
         KH/w==
X-Gm-Message-State: AOAM533Z/UWzY5M1GmMsACtwSfDYSvWtaKsSY9ZSK2pBxwOwJJX6qovs
        RX8g4W2ZgC7uLu95jS2ypQ4=
X-Google-Smtp-Source: ABdhPJxsJsXhAG8umjlPinbUWDjns/UhDRyBV4A4B9SUO7RJ6SacgiPZo+NpHRwwq4dzpuLbAI3oXA==
X-Received: by 2002:a17:90a:6a0f:: with SMTP id t15mr360798pjj.121.1589498416838;
        Thu, 14 May 2020 16:20:16 -0700 (PDT)
Received: from syed ([106.223.1.212])
        by smtp.gmail.com with ESMTPSA id m13sm262966pff.9.2020.05.14.16.20.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 May 2020 16:20:16 -0700 (PDT)
Date:   Fri, 15 May 2020 04:49:58 +0530
From:   Syed Nayyar Waris <syednwaris@gmail.com>
To:     akpm@linux-foundation.org
Cc:     andriy.shevchenko@linux.intel.com, vilhelm.gray@gmail.com,
        rrichter@marvell.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 3/4] gpio: thunderx: Utilize for_each_set_clump macro
Message-ID: <f580f1f448b05dc7aa796998d9eed5d163f7303c.1589497312.git.syednwaris@gmail.com>
References: <cover.1589497311.git.syednwaris@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1589497311.git.syednwaris@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch reimplements the thunderx_gpio_set_multiple function in
drivers/gpio/gpio-thunderx.c to use the new for_each_set_clump macro.
Instead of looping for each bank in thunderx_gpio_set_multiple
function, now we can skip bank which is not set and save cycles.

Cc: Robert Richter <rrichter@marvell.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Signed-off-by: Syed Nayyar Waris <syednwaris@gmail.com>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
Changes in v6:
 - No change.

Changes in v5:
 - No change.

Changes in v4:
 - Minor change: Inline value '64' in code for better code readability.

Changes in v3:
 - Change datatype of some variables from u64 to unsigned long
   in function thunderx_gpio_set_multiple.

Changes in v2:
 - No change.

 drivers/gpio/gpio-thunderx.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-thunderx.c b/drivers/gpio/gpio-thunderx.c
index 9f66deab46ea..58c9bb25a377 100644
--- a/drivers/gpio/gpio-thunderx.c
+++ b/drivers/gpio/gpio-thunderx.c
@@ -275,12 +275,15 @@ static void thunderx_gpio_set_multiple(struct gpio_chip *chip,
 				       unsigned long *bits)
 {
 	int bank;
-	u64 set_bits, clear_bits;
+	unsigned long set_bits, clear_bits, gpio_mask;
+	unsigned long offset;
+
 	struct thunderx_gpio *txgpio = gpiochip_get_data(chip);
 
-	for (bank = 0; bank <= chip->ngpio / 64; bank++) {
-		set_bits = bits[bank] & mask[bank];
-		clear_bits = ~bits[bank] & mask[bank];
+	for_each_set_clump(offset, gpio_mask, mask, chip->ngpio, 64) {
+		bank = offset / 64;
+		set_bits = bits[bank] & gpio_mask;
+		clear_bits = ~bits[bank] & gpio_mask;
 		writeq(set_bits, txgpio->register_base + (bank * GPIO_2ND_BANK) + GPIO_TX_SET);
 		writeq(clear_bits, txgpio->register_base + (bank * GPIO_2ND_BANK) + GPIO_TX_CLR);
 	}
-- 
2.26.2

