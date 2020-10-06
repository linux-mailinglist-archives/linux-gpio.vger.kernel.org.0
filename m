Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0900E28494C
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Oct 2020 11:25:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725977AbgJFJZH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Oct 2020 05:25:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725891AbgJFJZH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Oct 2020 05:25:07 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88885C061755;
        Tue,  6 Oct 2020 02:25:05 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id h6so6985187pgk.4;
        Tue, 06 Oct 2020 02:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Arg2XGQgOUZy9kvkHUgOD04aDWRkuagTYx1qx/Ums2U=;
        b=jBnTQbzXl/6NjxH8p6vRMjVP6FIzPxQfTpEixwz7ocyu3cH/ZjSSvbwZt5P+RNuofm
         ze+dhNwSrJ1HV3ONCPcak/IEV1g567AkbHO15Kvj4lIz3s24xd7Bz6Thcwm5xcG2lb+U
         jwuwI5d4QE8jgbtRuWIQ62TG/BfGPW7680Qtkpd4oTkImbminskR+Ze7ehatAZSxqprt
         r7MRYA8r2JAP+RzBxlvqPORZFdTff821T7bxwkNDN0fXfbrOmjR3vVU0BGNrxZzPIQyg
         Ip6leXGbsIBtz9i7IOAshvKa/oo/ZtmTcx7UHPtDLSH8igHcregzbJVG4eFmbZRium72
         nV4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Arg2XGQgOUZy9kvkHUgOD04aDWRkuagTYx1qx/Ums2U=;
        b=LMl7Us5HseRe3hZwLiXu2FwmcmG6s19w8JfBpWfHqt+FSrxMBAypg/ghy/CNLZBcQZ
         8tthRghs/FIHbtEG0xUFeP4T0bleojGhGxrGTbozTtlvo1t93EXCQVJWQPziHvE++qCY
         iHAB8IsrxeDaHI+8bMW05gCly1bOaydaiAtq5LRg5PYUO9Ya1w13w0JGReuDewf6mzDj
         ej5JgX7F/W/bUfhx1D42C3W97bNSSK6PflhPDMEoK0wTlBbDh2kGwv688DopyGarsaLo
         S+fktqFTuPKaBZow2lpB7xjtd6g/ywsX3vxzJCVhdHozy92TS6mw07Vv2gpb3PsGigtm
         BKiQ==
X-Gm-Message-State: AOAM530meagup3HHPUAcyHhlqPu0OLiQguW4lzMwHc4mTZ+5Hf9/WVGj
        f/C5qWW/62x+V/mgruRVoBw=
X-Google-Smtp-Source: ABdhPJxl9MhfqOhhz+N2e4xau3nNbTYZT979niUAOcH4w5ghJ+7tFUxZ1Eud8RjycdHsYsF66HVGTQ==
X-Received: by 2002:a63:5d58:: with SMTP id o24mr3306789pgm.115.1601976305170;
        Tue, 06 Oct 2020 02:25:05 -0700 (PDT)
Received: from syed ([117.97.226.113])
        by smtp.gmail.com with ESMTPSA id d1sm2157635pjk.38.2020.10.06.02.25.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Oct 2020 02:25:04 -0700 (PDT)
Date:   Tue, 6 Oct 2020 14:54:49 +0530
From:   Syed Nayyar Waris <syednwaris@gmail.com>
To:     linus.walleij@linaro.org, akpm@linux-foundation.org
Cc:     andriy.shevchenko@linux.intel.com, vilhelm.gray@gmail.com,
        rrichter@marvell.com, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v11 3/4] gpio: thunderx: Utilize for_each_set_clump macro
Message-ID: <4e22ffca8d55f185a1b2f9c8e35ed39f31ce8dc1.1601974764.git.syednwaris@gmail.com>
References: <cover.1601974764.git.syednwaris@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1601974764.git.syednwaris@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Changes in v11:
 - No change.

Changes in v10:
 - No change.

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

