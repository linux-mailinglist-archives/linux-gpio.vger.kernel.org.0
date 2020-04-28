Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D4441BD06A
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2020 01:07:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726256AbgD1XH5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Apr 2020 19:07:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726044AbgD1XH4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 28 Apr 2020 19:07:56 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C77CC03C1AC;
        Tue, 28 Apr 2020 16:07:56 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id 18so116867pfv.8;
        Tue, 28 Apr 2020 16:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zQ1AN2qLuGSeriYOxLxpDZYr+EholNiT0zZxYuiIwcw=;
        b=b4oEVM9CyNeYtoxafbq+JAL+h5ey/mUcxOqqHN+XAc5LZf1lgHDA+Rj7zRz1Oj9JLp
         15C3fHQt6Mi0TvmQxsqnq3+qcaGXM0id9myxH52BYD0o9DOVD0/zuGNvXkW8z6yFbOz+
         zOuqxDamL1N5d1MZDZJuG2cTr0OnewmuPcVH4UIdUomSk7xRaxCG7LBTeO52b4vKqdeY
         IFbGD6/H09Au+EPchC9Di8ZygjvkpmPxr49/I0spBEtfikaTZNBiw7seew2L1Z9jgvfu
         oISjH0q5N3yrm1++FLs/HXLHaXLWjlscHBk57XbPQS0ohSFjJjuW3b+VJzNmCCddSN8A
         iSEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zQ1AN2qLuGSeriYOxLxpDZYr+EholNiT0zZxYuiIwcw=;
        b=TDGB2lWgstzLeR03EfZr83oGgiyMdEhjETLGmr+yyP5A9Ly2/cEt0QXVT30z90l2Dw
         rJmikZGrDoXSiOLYn6ntPNNy5O4VAEcaq7Obs0CWwW9akZXi5PM/0vf5+k/egi6aMl7k
         w1U49f0fXWDvCYdR3g+gkTjKHY4IMe8hu1sP9EBlceFt8cF7svokzFDLcbId3iEF2Xsk
         OL6vt7cbJAQjZJq98AksR+S6SnO56ekinTdF4YOYOrNnfigsbalWK0t0jPCvHLacqG+T
         jqacWd79fXvX6wm+O7WcjiHO9oAOxI2+ZW83CPjtOTv2nZfXngAjU84HqUZRuHY9Ih4D
         3FHg==
X-Gm-Message-State: AGi0PuZvryPg7XDZJAVrk8NLfeTfhoxjycgQRtCdcyADmuMMobhNIqrL
        FJ5k+dYB2p7bJY9oDAVFe1E=
X-Google-Smtp-Source: APiQypLjJoieB0Lu8Y7K+KgvHsR98OFs5tWWuZhvEaVCWrhgeb6GzvIdO0fy+bkn5Nao58qOe6HuPw==
X-Received: by 2002:a63:ef12:: with SMTP id u18mr25903105pgh.347.1588115276125;
        Tue, 28 Apr 2020 16:07:56 -0700 (PDT)
Received: from syed ([106.202.21.137])
        by smtp.gmail.com with ESMTPSA id g6sm5459558pja.2.2020.04.28.16.07.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Apr 2020 16:07:55 -0700 (PDT)
Date:   Wed, 29 Apr 2020 04:37:41 +0530
From:   Syed Nayyar Waris <syednwaris@gmail.com>
To:     akpm@linux-foundation.org
Cc:     andriy.shevchenko@linux.intel.com, vilhelm.gray@gmail.com,
        rrichter@marvell.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] gpio: thunderx: Utilize for_each_set_clump macro
Message-ID: <ea25f5cbe03a3bb4bf5d976b004d87c4bab178e3.1588112716.git.syednwaris@gmail.com>
References: <cover.1588112714.git.syednwaris@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1588112714.git.syednwaris@gmail.com>
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
Changes in v3:
 - Change datatype of some variables from u64 to unsigned long
   in function thunderx_gpio_set_multiple to resolve build errors.

CHanges in v2:
 - No change.

 drivers/gpio/gpio-thunderx.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-thunderx.c b/drivers/gpio/gpio-thunderx.c
index 9f66deab46ea..e577ab7e9e3c 100644
--- a/drivers/gpio/gpio-thunderx.c
+++ b/drivers/gpio/gpio-thunderx.c
@@ -275,12 +275,16 @@ static void thunderx_gpio_set_multiple(struct gpio_chip *chip,
 				       unsigned long *bits)
 {
 	int bank;
-	u64 set_bits, clear_bits;
+	unsigned long set_bits, clear_bits, gpio_mask;
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
2.26.2

