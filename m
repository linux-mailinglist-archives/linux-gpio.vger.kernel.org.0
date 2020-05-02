Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1C5D1C27D9
	for <lists+linux-gpio@lfdr.de>; Sat,  2 May 2020 20:51:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728419AbgEBSvB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 2 May 2020 14:51:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726306AbgEBSvB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 2 May 2020 14:51:01 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30348C061A0C;
        Sat,  2 May 2020 11:51:01 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id e6so1646408pjt.4;
        Sat, 02 May 2020 11:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0Bb7PtBYoHDbA/mpUbo2nXY/JQvmpzOFkDnjMfbrWXA=;
        b=qtbYHy9M2JJj41Q6gHOMrFwz53q6qmySLPbrFhZlK4cSWDA2UJrFPpudPGmWRC3V+o
         7HY6SNSWriVjT1G4tLna6aPPeL3NL2acZKiHWAoI/oQMblftgjwG/TPYZ2jab9Mlglk6
         8ah2CUCjzJUIp+aHyVCtN7XDLwdVx9JBGSUNqCYMcTv1OLJnHWRkwrb+OP1wCv6IdUjO
         HKuQuPL7Psn7vbbZw5YJbC0xogFsF4Ovvb/scFrTUeQECCkRF/R9n9IktR9JZZggtToj
         Sur/QMeqmNXmWRTw1KsKM7pBgZuABZOyDGi+k2Ud7azI/jVRN9fTsv/1bzPnAWvr8ogD
         LHXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0Bb7PtBYoHDbA/mpUbo2nXY/JQvmpzOFkDnjMfbrWXA=;
        b=OjUqEvckq5K9Pe4tlzQkA1CuGf/JkjJ/DOB6usU8FytjxPDLaMYvUfM1n9SXYHsADA
         FvBF2lsmt0jeOAxgmkoPjBsTY+uGIZqwS0bcWumISLybj2kKGyr5Au82FZ2EZmWshWIE
         pAikx4IJO4nr6V64dSk20b8dSmIXPuyHFwtzyXg7g3OMo7O2NXbkQCqWvV+ueuuQTq3Y
         DsOv9AaNFEqeAKRQi/5c778iHzEwEM+dYv3JVQDlsFwXF1l3oa7Cuo2lD65x1BxlWd+2
         No1wJPzqbR26tkRo8RsrJ+3Xf7Hun/tiAzOOexMM5Mw9XzbFmquRophBro7dkJCsKssz
         Ov/g==
X-Gm-Message-State: AGi0PuYtFtkylQ6NnDsgWqV8t9VC9PdiWxgHZRzcmFzUc1XxowKCwL/q
        ZmIEe0qAtGvx4BSGnllsrj4=
X-Google-Smtp-Source: APiQypIFp17uarCygL6paSR9nOrtF+l7q9tek8umEYX/cuWhlObTzsbXQaJkeTFuX2CKPb8M4YO+ow==
X-Received: by 2002:a17:90b:128d:: with SMTP id fw13mr7554273pjb.23.1588445460798;
        Sat, 02 May 2020 11:51:00 -0700 (PDT)
Received: from syed ([106.210.101.167])
        by smtp.gmail.com with ESMTPSA id d12sm2758907pjx.1.2020.05.02.11.50.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 02 May 2020 11:51:00 -0700 (PDT)
Date:   Sun, 3 May 2020 00:20:38 +0530
From:   Syed Nayyar Waris <syednwaris@gmail.com>
To:     akpm@linux-foundation.org
Cc:     andriy.shevchenko@linux.intel.com, vilhelm.gray@gmail.com,
        rrichter@marvell.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/4] gpio: thunderx: Utilize for_each_set_clump macro
Message-ID: <652dcbc32326bc0dce095863f51d8adaad960e09.1588443578.git.syednwaris@gmail.com>
References: <cover.1588443578.git.syednwaris@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1588443578.git.syednwaris@gmail.com>
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
Changes in v4:
 - Minor change: Hardcode value for better code readability.

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

