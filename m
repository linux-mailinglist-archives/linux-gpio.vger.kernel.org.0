Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB3FE281F61
	for <lists+linux-gpio@lfdr.de>; Sat,  3 Oct 2020 01:51:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725379AbgJBXvc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Oct 2020 19:51:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725283AbgJBXvc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Oct 2020 19:51:32 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C4C3C0613D0;
        Fri,  2 Oct 2020 16:51:32 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id u3so1862844pjr.3;
        Fri, 02 Oct 2020 16:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mEj/Snh9xo7eeSA1pUo3LqgpRgSxgfcItY6huejtGkA=;
        b=G/pkBZgDDYyonMcDNpJmvmCiGpfDuTfA6YacbZEwogdnKU4af9H4SVk9JN2ekfbnqG
         nrPYaRAMPtxCcogjqBPO6NZfzZlw9MhGtD94s2+NzpiGDjUvyTxmGIbVEItQ0zYoo91j
         wroR+L276rpEinKqVOaRn8craepoDCJ+wakQWkt93uMb+uRYASh67bkVwheC+cUClF+I
         mSp1S+vPyy5LXC/T7UopbYPvr2QSJ1mtlmkRsZMeVcvhqGfsA5qj5JxTGZd4uJpXkc+N
         DlgOPMvKGRhZDD3Qr3KscqhicZ/BSa8HtiDE6b0FjBc94rdnHAMHL9CUYq41Mu4IJ3Gh
         zVnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mEj/Snh9xo7eeSA1pUo3LqgpRgSxgfcItY6huejtGkA=;
        b=YhDc4Rp7ZT3xMv2OVgxgJLHVh8OnJ6jjDR6aA/Mkj+zoL42+OzKQnW6szFHbtsG96a
         p3ygdpHgI5Fb9mkOuN+WnJCE/b16uXzcby9M4enKY7jzy55KPfmA0HD3OUFI1EVHJseB
         YafCbdKvo168+57KWh95PIT8hXSwfjQ9f2EgS2D6U/R3WS6aPANnWEUFF+Gf/k3CaVs8
         6KnzLMVRSB1kZQCsUslRG9t7r5TvU6SDdGS3wy9Nzq5+Fen6+7T5ckA8SjRU0eflOlva
         81QAeOu8dRnn97EUaEJ0bL0zXzsUDa8sWnJzmqqAoB1ziL75hj1/vjqBeHjKC0d5WwKd
         lmng==
X-Gm-Message-State: AOAM532V3z+Jm2DlCCnQzyfNQXCKSC6MG5g3H4nRGVBycCNK81JTDE8k
        YgRYwxHhqD43Bj1FdfJgU4xxniNUWY2jMg==
X-Google-Smtp-Source: ABdhPJxgc2PQYqSvHorH5Vu4JQvD1WFCARVRLhAnxKrw73i41wb+Rq0DR2PH8tqlvKgtAhgNgi/7Ew==
X-Received: by 2002:a17:90b:104f:: with SMTP id gq15mr5094263pjb.215.1601682692186;
        Fri, 02 Oct 2020 16:51:32 -0700 (PDT)
Received: from syed.domain.name ([103.201.127.75])
        by smtp.gmail.com with ESMTPSA id g4sm2831302pgj.15.2020.10.02.16.51.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 02 Oct 2020 16:51:31 -0700 (PDT)
Date:   Sat, 3 Oct 2020 05:21:19 +0530
From:   Syed Nayyar Waris <syednwaris@gmail.com>
To:     linus.walleij@linaro.org, akpm@linux-foundation.org
Cc:     andriy.shevchenko@linux.intel.com, vilhelm.gray@gmail.com,
        rrichter@marvell.com, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v10 3/4] gpio: thunderx: Utilize for_each_set_clump macro
Message-ID: <d64541ec507faf28db12f2b340af9f8b9cbe7dbd.1601679792.git.syednwaris@gmail.com>
References: <cover.1601679791.git.syednwaris@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1601679791.git.syednwaris@gmail.com>
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

