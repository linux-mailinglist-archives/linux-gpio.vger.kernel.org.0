Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 874251F972C
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2020 14:54:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730174AbgFOMyK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jun 2020 08:54:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730180AbgFOMyF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Jun 2020 08:54:05 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38D8BC05BD43;
        Mon, 15 Jun 2020 05:54:04 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id k1so6679156pls.2;
        Mon, 15 Jun 2020 05:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/BsN6sT0XoGQQsg1j2eXjDaxyV/WqhpHkxTTB2bsuOI=;
        b=kwx5ZwXbJmY+gdEhVsyY2TFkBMQv0VDqAWgY51tVViwSQteTvuK9j4EauYI2LJ69Tk
         tTZnN7A+1vamo3xCKDUGQqVkYRupY3fal1Whh/TaXQzXye1WBTEqnm0E+/uMWxbgn1ek
         0viBXX3y74hrLGthozCpzgM2Q69IYBGzdHt9tEDa8YGqukAw72U1blcxV1I4vN1haDXJ
         cO7fhfy/516lcLTA0esHJpwaQeeqTnHSrg+YEw5Tztyh87NzFajE5pH+n1EtEqgiiVHI
         W+JOEU9QIb6RikjFKkzYrkavjbnj1d7flB+ql+8NICeNa3PktFVBxICcRAfQKh3+JDMN
         116g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/BsN6sT0XoGQQsg1j2eXjDaxyV/WqhpHkxTTB2bsuOI=;
        b=ZOAYvYeNQPkotZN/LIJgz3BqEIQURmIYoH2K0k1yY7ovYVenXNpaqIzQ28bum3LXwR
         YxII1lk7DMJ4R90GjSOqWjt6Muf+tox8lPZCq7lSnW2w/3kx/yL5mvbplotZepZcHGRV
         RD+uB/wqIMJZ+1sBS/5GKvPb7oRWS7/w8VPepzUsoperXDqlsnIk+cKKBVLckeQKdPGs
         YZxAjM8GM03TTpoUDIrtg0JPvvxc+SOvKZoW7z7P+qzVV2F0zeEapB/DyE3luQrGtFd5
         8s3bFuY/+Aylh+8oLchXIrY5HSDct10zoJBok2siTFSgXdKT/+NxOGhHAPdkWlp8DUvP
         oSVA==
X-Gm-Message-State: AOAM532V3ZHMOLH8exLh0AiCQM3aEjl3en/tBg1B1teLSJ6XQOv/nIZH
        XniMBbre4GYpF7r1wLLiRaM=
X-Google-Smtp-Source: ABdhPJx/GVVjfxNT/ENYaoVHX+Y6zSM3++zUo6/QLeWdmerDI0Ox5ULcQxb19SXZUsh4FzbC9hfkDA==
X-Received: by 2002:a17:90a:a405:: with SMTP id y5mr11996352pjp.15.1592225643846;
        Mon, 15 Jun 2020 05:54:03 -0700 (PDT)
Received: from syed ([106.198.195.84])
        by smtp.gmail.com with ESMTPSA id g84sm13147530pfb.113.2020.06.15.05.53.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Jun 2020 05:54:03 -0700 (PDT)
Date:   Mon, 15 Jun 2020 18:23:47 +0530
From:   Syed Nayyar Waris <syednwaris@gmail.com>
To:     linus.walleij@linaro.org, akpm@linux-foundation.org
Cc:     andriy.shevchenko@linux.intel.com, vilhelm.gray@gmail.com,
        rrichter@marvell.com, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v8 3/4] gpio: thunderx: Utilize for_each_set_clump macro
Message-ID: <3dfa9a7e2215eee79006ee07b139c3e12dc01160.1592224129.git.syednwaris@gmail.com>
References: <cover.1592224128.git.syednwaris@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1592224128.git.syednwaris@gmail.com>
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

