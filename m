Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 241AD204846
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2020 06:03:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732195AbgFWECq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Jun 2020 00:02:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726429AbgFWECp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Jun 2020 00:02:45 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AAEAC061573;
        Mon, 22 Jun 2020 21:02:44 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id x207so9466820pfc.5;
        Mon, 22 Jun 2020 21:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Nzaq3qZVu2Gim6Ue9JBZzYGe5RkH/apAgxYfSIfcbgo=;
        b=Fstrr9mriVf+g2keRIPob2sQ05/tmZT3gNrFb4/ar5aOG9cMCDq3hReGwRA8YwIoTC
         EAynf0T+tdO8SZ7sb1zKqMwUKvizG9Rmb0ikr1bQ0xkG6mnoRCD2YS7RwvDupA5anbgi
         UKrIrblsLfFFDllhS0NLw1P59qDz4jC+Y3NaKpG9DBVQUZahlqHm9GvLqG3q6mpXuee5
         FRPCpCQnqhXkpEuDX8Z5k+6bsvhmUwjYulV2JNDwp0cmWgt+VKNLg8/ENeQLjvPFYN7L
         psasveyNfCjiuaJ5F07jH0a5rvpDTK74bYkc7Q2gayteX17gEGePiu1lwhFMIGNVVYhv
         l3ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Nzaq3qZVu2Gim6Ue9JBZzYGe5RkH/apAgxYfSIfcbgo=;
        b=HQdKntoEe9i92urLm2Aq2FC/ojQlQ/42vID5Zhp8L8/adEaZ5aX6XLAsJsxzZmqWPb
         PSopJRoCKMCKbXCUKZvO3D9Ej4vZqBnR1jN3qFvUMz8wyvQna/yQzVoKvU2hi5UkDHTI
         6trUSxpD5vuNZE6wzjmHV9ZpDUiF3NgM11sMUIrskczXQj+9Y5dl4oQYTnv6n8x+nY2n
         iz9EHM2/nW5CjqcJWmbeJ9G/2pd+OFC0MS6dAcWPxsFsOEsLYKpuzE1XzzDuU0zGKVLp
         xyaZ7jL36FO6maQXGCsyrWaBgN8Q8H1HNBR7lUGFUMuTZdCgEQj1KT+GCRLzDCwTVdBW
         QTXw==
X-Gm-Message-State: AOAM531F0kwpRj7txUJfAYqN50bm0Te8JuCpsmHXqmqjfEKPKUSD0r9Z
        NYK5HHvjZY20v8cbY4fVKjZwaDNGJyg=
X-Google-Smtp-Source: ABdhPJwhW68x8f2vgSxdGhNtv5Baqw5YoqFE8D92KDC2M6rlLYB0laLS+UeRBoZRiFSC1nzGaCZLVQ==
X-Received: by 2002:a63:4f1b:: with SMTP id d27mr15221665pgb.389.1592884963500;
        Mon, 22 Jun 2020 21:02:43 -0700 (PDT)
Received: from sol.lan (220-235-126-59.dyn.iinet.net.au. [220.235.126.59])
        by smtp.gmail.com with ESMTPSA id n64sm12442315pga.38.2020.06.22.21.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 21:02:42 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 11/22] gpiolib: cdev: remove recalculation of offset
Date:   Tue, 23 Jun 2020 12:00:56 +0800
Message-Id: <20200623040107.22270-12-warthog618@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200623040107.22270-1-warthog618@gmail.com>
References: <20200623040107.22270-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Remove recalculation of offset from desc, where desc itself was calculated
from offset.

There is no benefit from for the desc -> hwgpio conversion in this
context. The only implicit benefit of the offset -> desc -> hwgpio is
the range check in the offset -> desc, but where desc is required you
still get that, and where desc isn't required it is simpler to perform
the range check directly.

Signed-off-by: Kent Gibson <warthog618@gmail.com>

---

 drivers/gpio/gpiolib-cdev.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index a727709b24a9..b6878fc87dfc 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -834,7 +834,6 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	void __user *ip = (void __user *)arg;
 	struct gpio_desc *desc;
 	__u32 offset;
-	int hwgpio;
 
 	/* We fail any subsequent ioctl():s when the chip is gone */
 	if (!gc)
@@ -862,12 +861,11 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
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
@@ -883,13 +881,12 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		if (copy_from_user(&lineinfo, ip, sizeof(lineinfo)))
 			return -EFAULT;
 
+		/* this doubles as a range check on line_offset */
 		desc = gpiochip_get_desc(gc, lineinfo.line_offset);
 		if (IS_ERR(desc))
 			return PTR_ERR(desc);
 
-		hwgpio = gpio_chip_hwgpio(desc);
-
-		if (test_and_set_bit(hwgpio, gcdev->watched_lines))
+		if (test_and_set_bit(lineinfo.line_offset, gcdev->watched_lines))
 			return -EBUSY;
 
 		gpio_desc_to_lineinfo(desc, &lineinfo);
@@ -902,13 +899,10 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		if (copy_from_user(&offset, ip, sizeof(offset)))
 			return -EFAULT;
 
-		desc = gpiochip_get_desc(gc, offset);
-		if (IS_ERR(desc))
-			return PTR_ERR(desc);
-
-		hwgpio = gpio_chip_hwgpio(desc);
+		if (offset >= gcdev->gdev->ngpio)
+			return -EINVAL;
 
-		if (!test_and_clear_bit(hwgpio, gcdev->watched_lines))
+		if (!test_and_clear_bit(offset, gcdev->watched_lines))
 			return -EBUSY;
 
 		return 0;
-- 
2.27.0

