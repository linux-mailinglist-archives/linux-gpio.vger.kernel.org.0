Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A169C1C28D5
	for <lists+linux-gpio@lfdr.de>; Sun,  3 May 2020 01:17:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726411AbgEBXRC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 2 May 2020 19:17:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726346AbgEBXRC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 2 May 2020 19:17:02 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63EBDC061A0C;
        Sat,  2 May 2020 16:17:02 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id a4so8131pgc.0;
        Sat, 02 May 2020 16:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tawsLNIiYgL/VjE/pEmXJAWCFkehGtCa65fEfcXUK9Y=;
        b=OJuDPOgeuEsFQhLI7Z7r8reiJTMm1W3DWBfWsZ6qUyWlGd8d5Se3Sjb8XIbp3J9Ma8
         Cj2Vb1JnuOzWIa9EMDXI/cUNOcZkX6Amjb67JizOcWzy0Cl4JlEWjKmiPT1bywMi3l0/
         HasshwDooL/iR9L9FWydPLqEp/x0dLlw7AA2VlMcsh0e7dWFjtg3i5J3I0KOeS3eCAPG
         3FJ03HLJIUB8PBYTfD1Rfz4qTNxqY9kIu9ZAPPmmcsl9R/xLbLqqcUG98WIIAGsH1fU7
         v3v8sd8SwHkx9lJte0lxxM0u3VuyIh2XXLLMOTlEwtfZ/Dbk588PtMqnLuSW7S978/Ml
         +tUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tawsLNIiYgL/VjE/pEmXJAWCFkehGtCa65fEfcXUK9Y=;
        b=sx7EuSI5hlHrDoo+Ds1u/JBH0LGu31CKlsjRILfAQ6eIlFYe6oGX0wLVOII+sCHtyN
         CkQwe4hP/PuQQJTX0Vcd4wmGRRmp9MhoFV3dKLNh0EG+c4/0mMOoFN6CvkX1AON4vxgr
         Dm7+e4EjH2lFNhPgSRYwwoj2f22Mh1jSdyE36sOR1rjvGNab0LMh8KhFgXuUHef3KtKX
         55xfhOnp0jdWtywPgxo8MBsI0urkNoqj7H8qnz8ga+FXwr36a951w2GWDCJwmarj9H6G
         OnMbn9R94OYIZ+zmRJjW3MLO/nl63KSG7Cyun9a8pXaY19ztatFdVO4i6wvt1bvz85P5
         +p5g==
X-Gm-Message-State: AGi0PuaGg2g0nYlpX2UrNb383nn7HK2szMjKo3RQFOA61Rq75lw/jBf1
        W0sAC5DgSeyeLs0C/zJ8qg4=
X-Google-Smtp-Source: APiQypKRMpwb6Pf00FsF3pDyFdeKR8F2n4+BsyNebNcqquuHfAfCN+ybpfApAVlptBpVzMamWNgCOA==
X-Received: by 2002:a63:6847:: with SMTP id d68mr10371336pgc.56.1588461421980;
        Sat, 02 May 2020 16:17:01 -0700 (PDT)
Received: from syed ([106.210.101.167])
        by smtp.gmail.com with ESMTPSA id a26sm4774238pgd.68.2020.05.02.16.16.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 02 May 2020 16:17:01 -0700 (PDT)
Date:   Sun, 3 May 2020 04:46:40 +0530
From:   Syed Nayyar Waris <syednwaris@gmail.com>
To:     akpm@linux-foundation.org
Cc:     andriy.shevchenko@linux.intel.com, vilhelm.gray@gmail.com,
        rrichter@marvell.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/4] gpio: thunderx: Utilize for_each_set_clump macro
Message-ID: <652dcbc32326bc0dce095863f51d8adaad960e09.1588460322.git.syednwaris@gmail.com>
References: <cover.1588460322.git.syednwaris@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1588460322.git.syednwaris@gmail.com>
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
Changes in v5:
 - No change.

Changes in v4:
 - Minor change: Inline value '64' in code for better code readability.

Changes in v3:
 - Change datatype of some variables from u64 to unsigned long
   in function thunderx_gpio_set_multiple.

CHanges in v2:
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

