Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0271E20C005
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Jun 2020 10:13:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726086AbgF0INW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 27 Jun 2020 04:13:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725991AbgF0INW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 27 Jun 2020 04:13:22 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FB02C03E979;
        Sat, 27 Jun 2020 01:13:22 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id l6so2861777pjq.1;
        Sat, 27 Jun 2020 01:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=PB7a66GEoGRfncWWrnjWJpz8d+zTdRvBjLv3u4bGuzg=;
        b=odsup12sVPFgV+UFVwvPYtj2YibwZyeiqKkpXRzKXuVphnZX4Dw3MPyQEWvx8v9b5H
         ulPYaRUr8pror09HzsV2wulRZgRaAgquu/6BBAbDfw+ESdFsSvuw636oH0+V3XERAEv4
         uaOlLpBT3BxX848RDRCrw2mtBKLZZg3jQSJq604Vj173pufTbqJmuK6G62+ZWsB1MNVf
         xEIslM0HZ1h24/HMVlTWPneGEuPcIaf6fj6TIWjgkFWD4rLSk29rRnGIM1zKeeDTEB+S
         gaCskX+k82XtCvNud839ouEPPfzHiTMO6jrERdglvJ+jsk6keC948ZKZdV5cgf42pGZs
         9Iyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PB7a66GEoGRfncWWrnjWJpz8d+zTdRvBjLv3u4bGuzg=;
        b=AoR5kq6atpvN6zmiRgmgY1BVNykQNzic0lbBBwfBlBnRZqkfh0vk2pMzLJJx2Yjdoe
         z0uAn9vlYZZSv2SZ+5xeHA40nao8Yn+6VieGK3EJzfYrefnjl+SYgWNRG15bJ4SwdEdI
         fN0KeVaKhhiml5ZTj907tZK99SM2P0mb6lgLtlWFTJyBhaBQE5bnsu3wr2YEMGr9KSPm
         Kl5lYgNZj0Af44V+7RyYSlmdynWlHy/cQydwhd3QTkwoq+7iJCpg/cZDje0aCxyDWTQ4
         1VoUCkGYEaqro8xjl5ekDTP8gCYuGYVG+q0xktmfTkSb5DuaBZIFR0bJZNfBiRdP5aqq
         BqAA==
X-Gm-Message-State: AOAM532v3seRDXl0c671BHeesVUG5XFJp/KpycZYfoz2ZFiJnci4vzXB
        44tu+mrTLXMRFSYHBaxqw7I=
X-Google-Smtp-Source: ABdhPJzYSbr4M06xkjucuyWDrFfQyboa/Fd5TcAGwss1bwsedqS5gBtl1WTIX5RSTSwX9qFvyOvrqQ==
X-Received: by 2002:a17:902:bd49:: with SMTP id b9mr5580970plx.22.1593245602137;
        Sat, 27 Jun 2020 01:13:22 -0700 (PDT)
Received: from syed ([106.198.224.34])
        by smtp.gmail.com with ESMTPSA id ds11sm13315839pjb.0.2020.06.27.01.13.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 27 Jun 2020 01:13:21 -0700 (PDT)
Date:   Sat, 27 Jun 2020 13:43:08 +0530
From:   Syed Nayyar Waris <syednwaris@gmail.com>
To:     linus.walleij@linaro.org
Cc:     andriy.shevchenko@linux.intel.com, vilhelm.gray@gmail.com,
        rrichter@marvell.com, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v9 3/4] gpio: thunderx: Utilize for_each_set_clump macro
Message-ID: <585554e7f141ddf36c885cebaa98028854b2ebec.1593243081.git.syednwaris@gmail.com>
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

This patch reimplements the thunderx_gpio_set_multiple function in
drivers/gpio/gpio-thunderx.c to use the new for_each_set_clump macro.
Instead of looping for each bank in thunderx_gpio_set_multiple
function, now we can skip bank which is not set and save cycles.

Cc: Robert Richter <rrichter@marvell.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Signed-off-by: Syed Nayyar Waris <syednwaris@gmail.com>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
Changes in v9:
 - No change.

Changes in v8:
 - No change.

Changes in v7:
 - No change.

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

