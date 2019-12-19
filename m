Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7DAA126335
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2019 14:16:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726967AbfLSNP6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Dec 2019 08:15:58 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:54589 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726961AbfLSNP6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Dec 2019 08:15:58 -0500
Received: by mail-pj1-f65.google.com with SMTP id ep17so2506308pjb.4;
        Thu, 19 Dec 2019 05:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=EVebG2mxl2pFbRKmtKvplGDYfctGq6ipwixunLpsjMo=;
        b=i1fphoqZCkW4TfNecoJIQUs7pOzb64NjVceblA4niuUzc3lN9qr7fCDirz8Qtly2pU
         7mats1aY7LeNSFoqLpabz+qUtMSf5S4LBHNu2d0EAdu/Pxy/7ufPxtANYZbYsF/SdZ5V
         iq7rO/HUELq6aJ82b3X35Pov1K1hzLY0ATZbM8fSMFF4dkn1/2k6AA+EjFwBT1BpkBlS
         I6nDHwepj2UKBWwMNO33djHVHeNHUf7fXOKf3RZtyhcZHHjaVBaXDS50+g0845Km4l50
         VFcVZRytMHgnq1qyS7JfeySpMOjUewwcXZJNmoS4ORL2Uk+A6oq3sho7e8ODrMqrCrLj
         ew2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=EVebG2mxl2pFbRKmtKvplGDYfctGq6ipwixunLpsjMo=;
        b=IrzQoKjFOiXxfPs64PyFMqAVGZtj/4IoNLMoe3O2faLxaEaVJPTdEqhKhRySCn4wiQ
         DL7QL7Sro8Viu/BQZa6jQSTLo06r5fkgiD1pmiFHsXpRVyfPny38liyT8bKM+SY4R1FT
         600Usz+1kHDbcHQmLufENtvNlLXlEFC42mfRH/5Zmv8LYqMHHKRzwm6s4XvcG1kTTgUL
         MPscaG+Xpmxh+/cbEOXgeXmkYvgHO1KT2liaDkilKjlbBGabt7XT+qDfWl2d5RQXoibH
         h0Q5SSguVbmH3k2k7c0X2rrjDnAPpLXkYXmG+OVseThTbQI7gs5VBq/W6cMI8BZ1LW9c
         RT0w==
X-Gm-Message-State: APjAAAVbi+6KXbMwUW2R5IPjJr9xhP7CkTDdBqxXH5hQcpqwCSf4wZQG
        WnqStRGa6f3/qX4wnGmKwgM=
X-Google-Smtp-Source: APXvYqx0fVJulRJtPx/+jJSN0Soric4f4PecZWngEHjcQePZUFaRW9bCzm5WXlZtsWup7o1/aBb8QQ==
X-Received: by 2002:a17:90a:d145:: with SMTP id t5mr9755894pjw.57.1576761357616;
        Thu, 19 Dec 2019 05:15:57 -0800 (PST)
Received: from oslab.tsinghua.edu.cn ([166.111.139.172])
        by smtp.gmail.com with ESMTPSA id d22sm8079229pfo.187.2019.12.19.05.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 05:15:56 -0800 (PST)
From:   Jia-Ju Bai <baijiaju1990@gmail.com>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: [PATCH 1/2 v2] gpio: gpio-grgpio: fix possible sleep-in-atomic-context bugs in grgpio_remove()
Date:   Thu, 19 Dec 2019 21:14:59 +0800
Message-Id: <20191219131459.18640-1-baijiaju1990@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

drivers/gpio/gpiolib-sysfs.c, 796:
	mutex_lock in gpiochip_sysfs_unregister
drivers/gpio/gpiolib.c, 1455:
	gpiochip_sysfs_unregister in gpiochip_remove
drivers/gpio/gpio-grgpio.c, 460:
	gpiochip_remove in grgpio_remove
drivers/gpio/gpio-grgpio.c, 449:
	_raw_spin_lock_irqsave in grgpio_remove

kernel/irq/irqdomain.c, 243:
	mutex_lock in irq_domain_remove
drivers/gpio/gpio-grgpio.c, 463:
	irq_domain_remove in grgpio_remove
drivers/gpio/gpio-grgpio.c, 449:
	_raw_spin_lock_irqsave in grgpio_remove

mutex_lock() can sleep at runtime.

To fix these bugs, the lock is dropped in grgpio_remove(), because there
is no need for locking in remove() callbacks.

These bugs are found by a static analysis tool STCheck written by
myself.

Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
---
v2:
* Drop the lock instead of moving the calls to lock functions.
  Thank Bartosz for good advice.

---
 drivers/gpio/gpio-grgpio.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpio/gpio-grgpio.c b/drivers/gpio/gpio-grgpio.c
index 08234e64993a..a49f0711ca94 100644
--- a/drivers/gpio/gpio-grgpio.c
+++ b/drivers/gpio/gpio-grgpio.c
@@ -437,8 +437,6 @@ static int grgpio_remove(struct platform_device *ofdev)
 	int i;
 	int ret = 0;
 
-	spin_lock_irqsave(&priv->gc.bgpio_lock, flags);
-
 	if (priv->domain) {
 		for (i = 0; i < GRGPIO_MAX_NGPIO; i++) {
 			if (priv->uirqs[i].refcnt != 0) {
@@ -454,8 +452,6 @@ static int grgpio_remove(struct platform_device *ofdev)
 		irq_domain_remove(priv->domain);
 
 out:
-	spin_unlock_irqrestore(&priv->gc.bgpio_lock, flags);
-
 	return ret;
 }
 
-- 
2.17.1

