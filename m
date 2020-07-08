Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EB65217E18
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 06:20:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729418AbgGHET5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 00:19:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725446AbgGHET4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 00:19:56 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3D51C061755;
        Tue,  7 Jul 2020 21:19:56 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id gc9so615979pjb.2;
        Tue, 07 Jul 2020 21:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0FCq6Jagl5VFciT39ywBKkxFPJGQbt40FgsHop4dXwM=;
        b=h0m7TxVhBMRwJfUj1x0NGxsSreUshm90Hhmtciq8BbsVAEKQV8O8Q9DVK6wDjSGQHE
         9IMAELdWUMbfca602EjFbZkcgfBc1ItxTi9kiuGVVVYLumWzH8AmQJt9RyAx7Z1hOJq9
         vjufK5lQkZTM/Ie2cvG8RyYfdcN4849NaM5ZpArHRduHJYanbujNT2u7JwsArUKfZUw/
         uEZWX6fXttkIwjnnGe6rok2l/8cBwMJqZjR01XXK6Tn/Tmb63nKazIEm7qdabVHy6zaS
         yEc3OUI/QcI/kJGs4gwkir6tVGviwmitvXZ9YsOlv4aXJO2fmEMZY/tJm9GjllFXhNW7
         V3Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0FCq6Jagl5VFciT39ywBKkxFPJGQbt40FgsHop4dXwM=;
        b=Awcro8C67BbFodpCSiB47g2SkmfgchYnyXWHsPD1FIl2U2Iz1FCO1X+uI+MTShJgLO
         KQngCmYhkXYXWfIQUik0vOtHOp+dz3zcp39fgHQYwFCShleexgjO4RoQwtpzJ52hBIin
         c3CLJKwNOrpsSLSxqkQaq5U/SrBb7WkM8Sc3YcdTnAnhZpBbrDO5DTI36yTxVrjhemkh
         jkLi9pISlwh1BARJb/t71KXTIb7oSWn6r/iG6dXbFHMWhkBKXNrIPNMAYKdBIC8x0VHG
         VhHCoP3HSkEekPnrjjrGLZFnqjKNKnFtaDbuEi3VE1RCVW9qtFYUB9bitGXZb+5UIFSy
         yldw==
X-Gm-Message-State: AOAM530FAz53UpoHWDMSYw2sdJ8Uqq6QnCZQpnYI0eJPB9tqHeJp4KUN
        /tQyq3JHTR6L0XF3dbMC03VbmhjD
X-Google-Smtp-Source: ABdhPJyrPfSv3TjA5/FvNuZRRVv/bsk3xa5OkwC9Xhm54S+c4wi/oxGRQZ1/+3M5cUIQteuYIiTlzg==
X-Received: by 2002:a17:902:b414:: with SMTP id x20mr36732197plr.143.1594181995676;
        Tue, 07 Jul 2020 21:19:55 -0700 (PDT)
Received: from sol.lan (106-69-191-222.dyn.iinet.net.au. [106.69.191.222])
        by smtp.gmail.com with ESMTPSA id gx23sm3821951pjb.39.2020.07.07.21.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 21:19:54 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 10/17] gpiolib: cdev: fix minor race in GET_LINEINFO_WATCH
Date:   Wed,  8 Jul 2020 12:15:53 +0800
Message-Id: <20200708041600.768775-11-warthog618@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200708041600.768775-1-warthog618@gmail.com>
References: <20200708041600.768775-1-warthog618@gmail.com>
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
 drivers/gpio/gpiolib-cdev.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index fe1b385deecc..b2b26dc25051 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -887,15 +887,16 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 
 		hwgpio = gpio_chip_hwgpio(desc);
 
-		if (test_bit(hwgpio, cdev->watched_lines))
+		if (test_and_set_bit(hwgpio, cdev->watched_lines))
 			return -EBUSY;
 
 		gpio_desc_to_lineinfo(desc, &lineinfo);
 
-		if (copy_to_user(ip, &lineinfo, sizeof(lineinfo)))
+		if (copy_to_user(ip, &lineinfo, sizeof(lineinfo))) {
+			clear_bit(hwgpio, cdev->watched_lines);
 			return -EFAULT;
+		}
 
-		set_bit(hwgpio, cdev->watched_lines);
 		return 0;
 	} else if (cmd == GPIO_GET_LINEINFO_UNWATCH_IOCTL) {
 		if (copy_from_user(&offset, ip, sizeof(offset)))
@@ -907,10 +908,9 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 
 		hwgpio = gpio_chip_hwgpio(desc);
 
-		if (!test_bit(hwgpio, cdev->watched_lines))
+		if (!test_and_clear_bit(hwgpio, cdev->watched_lines))
 			return -EBUSY;
 
-		clear_bit(hwgpio, cdev->watched_lines);
 		return 0;
 	}
 	return -EINVAL;
-- 
2.27.0

