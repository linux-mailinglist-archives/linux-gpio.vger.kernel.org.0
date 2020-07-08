Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73777217E1A
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 06:20:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728294AbgGHEUH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 00:20:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725446AbgGHEUG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 00:20:06 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9459AC061755;
        Tue,  7 Jul 2020 21:20:06 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id k5so1775533plk.13;
        Tue, 07 Jul 2020 21:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EOpp4x8aa6lXjn0KFyGbW2hznqCbSYUjl5NJJNqoY6o=;
        b=pClKqL7CMA9TW8DWqsTOb4xcAL6VkZBTf/yXfOkrF4S7O+CHbD076qlloUo8Cz7rPB
         oQTweIvZLm+5qpeKOIlrrqAcszW3tiUYOkf/Fxh/MCEfgTqNq5Uf84Jr4cvxVZlMQaT5
         OUVy38f7V/bEtvtt7zvNHy/L3fYfNQx7HTmSnoOQpAN/SVugbFMma/GuuJLv6JmOplHw
         h0IisWfekDnZQvt0kehTexAZ3bM+9X5xOP5xfjV/Eb0bFBIZPVXv90P7GFWyjzcfFhv8
         6FPiGmvDcZflI2L63FJqp6oUAnQF1VQKC6mYZ06rQxbGoNDOiuAdkhK3m7cQBC1DZITy
         4PKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EOpp4x8aa6lXjn0KFyGbW2hznqCbSYUjl5NJJNqoY6o=;
        b=aCuI5q4tOmD8op/9aCy0F74/pHCnghqL6QDyGkmKK5HSoK7T/rMcULrtaXH0jivofR
         E3FqxG5/01l5KoTicDPLwjLENCneCTK/3xBkuUdhUrpGi2yWhyzgh/R7CP2AAbyllaYk
         /X9JlkZqgKC0ImHXAgPNojBsg51IwjDvbPayiHPfe75ELqok0CcnbPp/dYpvcmqhbLtS
         4pUdDb0WPA0SCGlxTu6sZ56y/gLxDZVpaU2sNVx6xNPAaNanX4IspK0MVdk1GHeFP9fQ
         tJzrpAiRD+jMt8rSB980oeb7DmHhbIPKsfikM4g70loIqeG1JmnDLiBYCNqbMmCPjQie
         9zPA==
X-Gm-Message-State: AOAM531rCREHHVBA+Tiy6sA5DSo709w8RlmzO+XPZWkXK81Yy3LFzZar
        YtNWwei3vA3080huj1LW0LJy6Opo
X-Google-Smtp-Source: ABdhPJyQVRM94UgYgw1ebkfrNrUc7uRVLg6QSne2IyE3ypQe4s5CKXFNcJnM6B1lhHN+FB1zJVqPjg==
X-Received: by 2002:a17:902:c211:: with SMTP id 17mr30934363pll.302.1594182005575;
        Tue, 07 Jul 2020 21:20:05 -0700 (PDT)
Received: from sol.lan (106-69-191-222.dyn.iinet.net.au. [106.69.191.222])
        by smtp.gmail.com with ESMTPSA id gx23sm3821951pjb.39.2020.07.07.21.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 21:20:04 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 11/17] gpiolib: cdev: remove recalculation of offset
Date:   Wed,  8 Jul 2020 12:15:54 +0800
Message-Id: <20200708041600.768775-12-warthog618@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200708041600.768775-1-warthog618@gmail.com>
References: <20200708041600.768775-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Remove recalculation of offset from desc, where desc itself was calculated
from offset.

There is no benefit from the desc -> hwgpio conversion in this context.
The only implicit benefit of the offset -> desc -> hwgpio is
the range check in the offset -> desc, but where desc is required you
still get that, and where desc isn't required it is simpler to perform
the range check directly.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib-cdev.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index b2b26dc25051..c86fb9305681 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -832,7 +832,6 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	void __user *ip = (void __user *)arg;
 	struct gpio_desc *desc;
 	__u32 offset;
-	int hwgpio;
 
 	/* We fail any subsequent ioctl():s when the chip is gone */
 	if (!gc)
@@ -860,12 +859,11 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		if (copy_from_user(&lineinfo, ip, sizeof(lineinfo)))
 			return -EFAULT;
 
+		/* this doubles as a range check on line_offset */
 		desc = gpiochip_get_desc(gc, lineinfo.line_offset);
 		if (IS_ERR(desc))
 			return PTR_ERR(desc);
 
-		hwgpio = gpio_chip_hwgpio(desc);
-
 		gpio_desc_to_lineinfo(desc, &lineinfo);
 
 		if (copy_to_user(ip, &lineinfo, sizeof(lineinfo)))
@@ -881,19 +879,18 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		if (copy_from_user(&lineinfo, ip, sizeof(lineinfo)))
 			return -EFAULT;
 
+		/* this doubles as a range check on line_offset */
 		desc = gpiochip_get_desc(gc, lineinfo.line_offset);
 		if (IS_ERR(desc))
 			return PTR_ERR(desc);
 
-		hwgpio = gpio_chip_hwgpio(desc);
-
-		if (test_and_set_bit(hwgpio, cdev->watched_lines))
+		if (test_and_set_bit(lineinfo.line_offset, cdev->watched_lines))
 			return -EBUSY;
 
 		gpio_desc_to_lineinfo(desc, &lineinfo);
 
 		if (copy_to_user(ip, &lineinfo, sizeof(lineinfo))) {
-			clear_bit(hwgpio, cdev->watched_lines);
+			clear_bit(lineinfo.line_offset, cdev->watched_lines);
 			return -EFAULT;
 		}
 
@@ -902,13 +899,10 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		if (copy_from_user(&offset, ip, sizeof(offset)))
 			return -EFAULT;
 
-		desc = gpiochip_get_desc(gc, offset);
-		if (IS_ERR(desc))
-			return PTR_ERR(desc);
-
-		hwgpio = gpio_chip_hwgpio(desc);
+		if (offset >= cdev->gdev->ngpio)
+			return -EINVAL;
 
-		if (!test_and_clear_bit(hwgpio, cdev->watched_lines))
+		if (!test_and_clear_bit(offset, cdev->watched_lines))
 			return -EBUSY;
 
 		return 0;
-- 
2.27.0

