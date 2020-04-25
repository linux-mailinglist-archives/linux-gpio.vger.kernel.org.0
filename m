Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 849F61B88BE
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Apr 2020 21:06:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726261AbgDYTGb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Apr 2020 15:06:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726192AbgDYTGb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 25 Apr 2020 15:06:31 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 330C5C09B04D;
        Sat, 25 Apr 2020 12:06:31 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id n16so6348868pgb.7;
        Sat, 25 Apr 2020 12:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mYq1a4v7y77AQ9tmnkT5t//UsJP+CbO9qCNT3hZp18k=;
        b=Aa/FIfSqjGH+gUHaFd/hbJ6DRqi6NYSRUbYh/SDyvKyP0lwa6JfjAIJc9xCmdw4KXe
         6q/MHL5cFhXg5j8Do7SoXVitpMpfWz+o4RkS6OAwakrxa2tUf/dZ8lrgo6eglPj8RzaY
         ohS4lx2/tJ+NmGHMOFaTsaSFbQfghLpwYa7Sma2KhRX3iq8tIxb3x5OmWewv48cdNkNt
         ZBLLN3S9flUeifjqjicpymmOOVqIjkjVaSU2MhzsllXi+LjtZCLJLOENSQ0cY9aXI9L5
         +9KEJZp5xV0jIipFm2mo4NdqdPxQrewg/KmuXsCXRnp0hiw4UonYoNbD5w8a4AM7g7WZ
         gukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mYq1a4v7y77AQ9tmnkT5t//UsJP+CbO9qCNT3hZp18k=;
        b=HSX0zCzu2D2ManIBXUIjU0rYMsjYw4y/MTiywpFx4ajfgw3cTJGfnSjT1X45MdWpnJ
         HUDv7XFnotWRmqI6jNGfOmV5N+apGT79X8lNTIVpMXxVBRlwyHYHARklpgadGUdspehe
         2Vhkn1SCIfWCtrzW5fCKqT2L5LW6Cwjgy51ecNnMUWgIFSq1ni+JYXTyDkuIeMY4Wt3v
         Nk3/KXBoXmkOS+/gPoNKN6EAxLpIY3EDUPG2Zi+8pgAamJJ93QAK6npllemGXp4HmJ5S
         bUM3P3gZGhYebaJhvk3A0ZOg3Hz54tjjbowjusCfLZoM3bp61B7UWSUToHiWNBzDdoJ5
         nx0w==
X-Gm-Message-State: AGi0PuYP3U2/KBI07aEYXONVX8jZztMPUbaBRJBdqOJoBC21xfV5CzqD
        WpsoeN12yP+LxPSUfXuCOys=
X-Google-Smtp-Source: APiQypJYs+tMtLVOJIZa7XsEIyb2d15/r4Ym0dULwU2s6uyhZ8VEBLc2B+8o0HnZTYMJ/SN6IKZBFQ==
X-Received: by 2002:a63:1806:: with SMTP id y6mr14753725pgl.407.1587841590766;
        Sat, 25 Apr 2020 12:06:30 -0700 (PDT)
Received: from syed ([106.223.101.50])
        by smtp.gmail.com with ESMTPSA id b1sm8491327pfa.202.2020.04.25.12.06.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 25 Apr 2020 12:06:30 -0700 (PDT)
Date:   Sun, 26 Apr 2020 00:36:24 +0530
From:   Syed Nayyar Waris <syednwaris@gmail.com>
To:     akpm@linux-foundation.org
Cc:     andriy.shevchenko@linux.intel.com, vilhelm.gray@gmail.com,
        rrichter@marvell.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/6] gpio: thunderx: Utilize for_each_set_clump macro
Message-ID: <9c5e25b982728467c5c681876d0e60e49dedb5fb.1587840670.git.syednwaris@gmail.com>
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
Changes in v2:
 - No change.

 drivers/gpio/gpio-thunderx.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-thunderx.c b/drivers/gpio/gpio-thunderx.c
index 9f66dea..74aea25 100644
--- a/drivers/gpio/gpio-thunderx.c
+++ b/drivers/gpio/gpio-thunderx.c
@@ -275,12 +275,16 @@ static void thunderx_gpio_set_multiple(struct gpio_chip *chip,
 				       unsigned long *bits)
 {
 	int bank;
-	u64 set_bits, clear_bits;
+	u64 set_bits, clear_bits, gpio_mask;
+	const unsigned long bank_size = 64;
+	unsigned long offset;
+
 	struct thunderx_gpio *txgpio = gpiochip_get_data(chip);
 
-	for (bank = 0; bank <= chip->ngpio / 64; bank++) {
-		set_bits = bits[bank] & mask[bank];
-		clear_bits = ~bits[bank] & mask[bank];
+	for_each_set_clump(offset, gpio_mask, mask, chip->ngpio, bank_size) {
+		bank = offset / bank_size;
+		set_bits = bits[bank] & gpio_mask;
+		clear_bits = ~bits[bank] & gpio_mask;
 		writeq(set_bits, txgpio->register_base + (bank * GPIO_2ND_BANK) + GPIO_TX_SET);
 		writeq(clear_bits, txgpio->register_base + (bank * GPIO_2ND_BANK) + GPIO_TX_CLR);
 	}
-- 
2.7.4

