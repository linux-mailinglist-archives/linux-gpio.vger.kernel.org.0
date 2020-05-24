Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07CB61DFD46
	for <lists+linux-gpio@lfdr.de>; Sun, 24 May 2020 07:06:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726129AbgEXFGH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 24 May 2020 01:06:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725805AbgEXFGG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 24 May 2020 01:06:06 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4738C061A0E;
        Sat, 23 May 2020 22:06:05 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id l73so3104593pjb.1;
        Sat, 23 May 2020 22:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=N37O+pr53y/nXNB0kPDxzL7CBkwWMjKmCQt99s9fxR4=;
        b=IohXGaSgUmcuMILfqS0tqSOtNc8JXbAmNZhFX7NjPxP9mKU+RqpewoeEe5w3kMj0sp
         mzPzeyix1AN9FClMFrjEEnIT07qELaXfihqFbjjikcYK71Me59+MsoANbwb/mMAdFk28
         P9+ChpwSwMyi37TC9Ai+J8WCBoJgRpanZlAJzuULz+uRZ2fVChPYcA71pktommDCbh/E
         0KejFOcie3ulDzyPJAsE92KXqHEKVMI3rLN72rZci2EQdKBG6olBp0rLEG2esEYbdCCk
         3Rb6MJpJ5xVxkUrT7hIeJQ/W7GZ5p2+vZGTuJik7C4eXXAopJ5+s5ZZWu/X6VXAej2Yz
         kkgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=N37O+pr53y/nXNB0kPDxzL7CBkwWMjKmCQt99s9fxR4=;
        b=TlZg8r2GvyoCzLGhqhXNL5CZOKGOQF3lhPmiPE8iXxw93EJ0lpHpQJIdtJ0GZnD+aY
         u/2WUE3q2kXywmiWBLldYgeDHeN233VxWSJAs+/x+fLgYddLJFsKvqUjqAaiwSyh/3bj
         vNKFa35v355Yt+RPO0QwMWwQ+Q36sw2utACYIhQU9+E9n3WGPoxRKWQ2l3EfEi4agipL
         hciIYfqsDs41IKpwkoEc+KC7BA7l0oh/FDFHpTHMYAmme00aVpaO4cLcWWbUi7DFJmVz
         er4INICuapmF8XC3Fh89ZwQajpXd29vVbW/DnTHQKeuqmNfKRfKcVKvm5zKPx6atK0+B
         2+IA==
X-Gm-Message-State: AOAM5317Nykwn5bHup8apKscCrdkjZY5obySv0PRhPq0K7+3OIaq6Yfa
        lJLtgNr8TEwR1oKXrcen/ww=
X-Google-Smtp-Source: ABdhPJw6IKQUTeAS9sK90M6zkd49MXkYklNowk7FXCzXAeaj2CVUG++2r/tA1zCiOAUM5QrDiSq78w==
X-Received: by 2002:a17:90a:17e1:: with SMTP id q88mr466750pja.187.1590296765560;
        Sat, 23 May 2020 22:06:05 -0700 (PDT)
Received: from syed ([106.223.122.111])
        by smtp.gmail.com with ESMTPSA id gv4sm9953015pjb.6.2020.05.23.22.06.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 23 May 2020 22:06:05 -0700 (PDT)
Date:   Sun, 24 May 2020 10:35:49 +0530
From:   Syed Nayyar Waris <syednwaris@gmail.com>
To:     linus.walleij@linaro.org, akpm@linux-foundation.org
Cc:     andriy.shevchenko@linux.intel.com, vilhelm.gray@gmail.com,
        rrichter@marvell.com, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 3/4] gpio: thunderx: Utilize for_each_set_clump macro
Message-ID: <d5abec5c4d256db921d5fe103c7079580c8b7ef1.1590017578.git.syednwaris@gmail.com>
References: <cover.1590017578.git.syednwaris@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1590017578.git.syednwaris@gmail.com>
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

