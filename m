Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37D5B204844
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2020 06:03:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732177AbgFWECk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Jun 2020 00:02:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726429AbgFWECj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Jun 2020 00:02:39 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A66DC061573;
        Mon, 22 Jun 2020 21:02:39 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id p11so772580pff.11;
        Mon, 22 Jun 2020 21:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p/RnkCoSxOcrfeG8nv0kDDgwKEpcPzECNRUCVLsijo0=;
        b=C//u3P1Spc6/1L9SIh/TwRbaXpyUzUVxDesN+Vt6guGDCCogN2Q9Q2zXKcQRGA48vt
         7XYhTmLWFLK4A2VNL/nZG39K1Ri8I6h6PbHyt1fWPuA6CC3Ycd38sAWDukkFUMN8sE1t
         F+AsPf0FeqRXgNT9UaYCQNdEG5ODmlJVwp5/uNk91970wKEn1UM5iGwSobhdqzf2+AMM
         pDF+TryePR8YLS+Xi4HiBSniEuSynIDrbuG1Vcs42+v9cwGFBhHVqS+SpKHDTXJVePaQ
         4fKDL3okt9hXe2Gk3YIR4Z9AhkNvuQPnYa/qjDeEMJpXyVg3us6adOglhaulRi15c6vt
         t8Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p/RnkCoSxOcrfeG8nv0kDDgwKEpcPzECNRUCVLsijo0=;
        b=SJzk0DZGKaPv3efD1tJg+6gpBObRiq5DtREgwfZc2Fg+WOHxSnWRmX2JPKmOPC61g/
         gevQUJ6QJDLcWrxEQXNJsbGQDP8yBlGrFFPCMRdCfz5x38f2nyuntGyoQjQhKuAEwsFj
         zOwsscmDRLw9oGQXlamx1+NwrqfkXa18X6gQhHxo+lQF/ao7n8jN7dOeaJ2QTdOO+ADy
         VklOrmlGF2vJN7KGQ9feq2XIa2Z3OlceHD6cZahbqvY7xG/AquCXD+g3PQmhVdC+JCMt
         x0Imt7Ga66frFXolofnrg7YDaETCRETvJO3/GuEkFHUd9aBrRj5UgtumVVTlkdhqiQZk
         Q7Dg==
X-Gm-Message-State: AOAM531zyjGFSNrQ57/mwMZQQNiUEqjmF5fSf+cXi7l3UVUDf013GSYw
        R0fZN04ngeCRmp2ribDTpS6/xYkA8p0=
X-Google-Smtp-Source: ABdhPJwNLz9ozAzFObdDvcjaaKcKQloq31ig4CmOe7igtxVI0Ljeu+wSuolKfRMyJBR7JrtYlqqokQ==
X-Received: by 2002:a05:6a00:7c8:: with SMTP id n8mr22516906pfu.116.1592884958383;
        Mon, 22 Jun 2020 21:02:38 -0700 (PDT)
Received: from sol.lan (220-235-126-59.dyn.iinet.net.au. [220.235.126.59])
        by smtp.gmail.com with ESMTPSA id n64sm12442315pga.38.2020.06.22.21.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 21:02:37 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 10/22] gpiolib: cdev: fix minor race in GET_LINEINFO_WATCH
Date:   Tue, 23 Jun 2020 12:00:55 +0800
Message-Id: <20200623040107.22270-11-warthog618@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200623040107.22270-1-warthog618@gmail.com>
References: <20200623040107.22270-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Merge separate usage of test_bit/set_bit into test_and_set_bit to remove
the possibility of a race between the test and set.

Similarly test_bit and clear_bit.

In the existing code it is possible for two threads to race past the
test_bit and then set or clear the watch bit, and neither return EBUSY.

Signed-off-by: Kent Gibson <warthog618@gmail.com>

---
 drivers/gpio/gpiolib-cdev.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 5f5b715ed7f7..a727709b24a9 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -889,7 +889,7 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 
 		hwgpio = gpio_chip_hwgpio(desc);
 
-		if (test_bit(hwgpio, gcdev->watched_lines))
+		if (test_and_set_bit(hwgpio, gcdev->watched_lines))
 			return -EBUSY;
 
 		gpio_desc_to_lineinfo(desc, &lineinfo);
@@ -897,7 +897,6 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		if (copy_to_user(ip, &lineinfo, sizeof(lineinfo)))
 			return -EFAULT;
 
-		set_bit(hwgpio, gcdev->watched_lines);
 		return 0;
 	} else if (cmd == GPIO_GET_LINEINFO_UNWATCH_IOCTL) {
 		if (copy_from_user(&offset, ip, sizeof(offset)))
@@ -909,10 +908,9 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 
 		hwgpio = gpio_chip_hwgpio(desc);
 
-		if (!test_bit(hwgpio, gcdev->watched_lines))
+		if (!test_and_clear_bit(hwgpio, gcdev->watched_lines))
 			return -EBUSY;
 
-		clear_bit(hwgpio, gcdev->watched_lines);
 		return 0;
 	}
 	return -EINVAL;
-- 
2.27.0

