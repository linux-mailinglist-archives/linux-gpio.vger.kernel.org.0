Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B28C292042
	for <lists+linux-gpio@lfdr.de>; Sun, 18 Oct 2020 23:41:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727591AbgJRVlO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 18 Oct 2020 17:41:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726249AbgJRVlN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 18 Oct 2020 17:41:13 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88C63C061755;
        Sun, 18 Oct 2020 14:41:12 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id q21so4808812pgi.13;
        Sun, 18 Oct 2020 14:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=r+CqUbH/pMf/6TjojKzCkT9ZN5spOtGX6tIuObsC6wg=;
        b=MrqUSIDdlaDMT5JF1V0bfMdsdil/IrDWE0R94qC3DpJOtqzNwuZGb6wA4sTzbtfWIB
         Pg+4epHCacvHN/P7xJP2KziUbQCdxNaJRLrNR0dCU6g3hPL9jEsZypjH+CRfFMDjz5NX
         t9V1IAc2DF63TY2wTVBCeQ3CYfuZp1XBm0klSzY4zkwfomKdbDwpBPyPbNCdeEu1JPqU
         o0RCRUBBxyUZ6x41yA2wbgIqmeM83RqBVs9pfKJ9dbxxHTuUthNxsHkOOLPPDnFPGfNw
         +sOMZCigEQTlr/bgBQzukzOOW66ij/Gw+KpI5pkZxPODq2wC5QVAotwXDuUeA9XCJK7Y
         lebg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=r+CqUbH/pMf/6TjojKzCkT9ZN5spOtGX6tIuObsC6wg=;
        b=QOV+L+PNf2sj1UroHFhtONfu6DVYaIxu0rwwhgoX+4he3tN6qgkISF/rt4u2lhgucF
         NoRdCgG5E+GNZXFq6eZBU1JmsHGDsHenqL5G2PVCMQp+V2k4014d5P2KyLMRqtFy7mBl
         CvjX6vZxqZqK7N/yGMm3IZSU7Kiu6d5jJa7CxbHCJIrraOYmawkh1QOwhJw+1SAXFecK
         xY0iKUVHfklWFF+SzhL+GWx48rG4vUhLCwOToXPYHXFiT8ycadcEDl6SOeivuYct9CaH
         0s/855aZCgSDl+ZBWb5TxIamew9DgLIWqeqNDXJP5SgxBVWTTc0tmUlvHYyzvue8c7UQ
         Q6pw==
X-Gm-Message-State: AOAM532ilNMTly46j1UNE4j3FaWqcYZRYRXgA8bfanCGDkDBcRGPOLK6
        lvxtp7M7SMdkqNXNu19OvZ0=
X-Google-Smtp-Source: ABdhPJxMR8wRn8GfcGEZ69F7qz7QWIPUqXun3ocOMIugpnZV0UcioGXVWHE4o9Zt11G7DQGLyusw5A==
X-Received: by 2002:a63:3d8:: with SMTP id 207mr12159275pgd.238.1603057272184;
        Sun, 18 Oct 2020 14:41:12 -0700 (PDT)
Received: from syed ([2401:4900:47f3:e624:90f9:25c2:806b:19c8])
        by smtp.gmail.com with ESMTPSA id b15sm9757052pju.16.2020.10.18.14.41.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 18 Oct 2020 14:41:11 -0700 (PDT)
Date:   Mon, 19 Oct 2020 03:10:54 +0530
From:   Syed Nayyar Waris <syednwaris@gmail.com>
To:     linus.walleij@linaro.org, akpm@linux-foundation.org
Cc:     andriy.shevchenko@linux.intel.com, vilhelm.gray@gmail.com,
        rrichter@marvell.com, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v12 3/4] gpio: thunderx: Utilize for_each_set_clump macro
Message-ID: <5e94ad3c156b98d2ed28617b2ca25bacadc189d5.1603055402.git.syednwaris@gmail.com>
References: <cover.1603055402.git.syednwaris@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1603055402.git.syednwaris@gmail.com>
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
Changes in v12:
 - No change.

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

