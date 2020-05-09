Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19D131CC20E
	for <lists+linux-gpio@lfdr.de>; Sat,  9 May 2020 16:15:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727092AbgEIOPP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 9 May 2020 10:15:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726782AbgEIOPP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 9 May 2020 10:15:15 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D53DC061A0C
        for <linux-gpio@vger.kernel.org>; Sat,  9 May 2020 07:15:14 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id u127so13705542wmg.1
        for <linux-gpio@vger.kernel.org>; Sat, 09 May 2020 07:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=klJtd5PzI5Rt7cUpJ7e/G3oZQmMxv27qO8Ox/Of2dxI=;
        b=winqAkfGQ7LRxq3XxMw8IKOT9qWSeogO74Y00SJyhhfO0fb/K9esUndwFGg5FKP0Dj
         MHJfucIu07RwfgShD4GhV0IJddHqx33BZs6NDmJg5EsvdQA6hTtRrif+LBTTfNI0+7U+
         TElCUd4KAJMYY0EAGrDMPwigGAtWTYExnHg9KRrWFB4TJxYq1cXbpjnKICtaQp6GENlr
         oUzYPLWDj9yrBPOFNfvmHtOL7S1vgESkVhcbmNniqKoMtqKsnBWhNADTY0u+1JYSK8t4
         PGcMAfYK/m3dnqTAo23JqvRC5l4zTepNeysMYww56c3c9aE+v4raB4qwxpt2QF+K089Z
         srdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=klJtd5PzI5Rt7cUpJ7e/G3oZQmMxv27qO8Ox/Of2dxI=;
        b=J8OtOoFAerxPa4TIyv8dkJUfZCR5o/sPFXi0jO3WgIsc/6H2NGmLdEKi0qAKMuK8FT
         ZjrgiW+PrXEur72Ak0SD0ppb+cdIK1DWyP0y1pjdxfg9bZkJangxcyI1uVg2/8jsxcI/
         XujbzCA+jCutHovby+9kIIqaTqZZOzdiVnWcouwaGC/4c7n1nUNvcXpDs57KQjrfrrWO
         uirYiQWxix1pjYh1IU8uRvPYsNlP6lJDKz00h9uuUmYHdZVHdadnjSSCy8fbK3i/XjHV
         zWToQwDf7kFobTIm7OuWsm8E4aJYM1GDn2xLM6X1rtc0NwZXMBM+0hM+sjp/GuMf9FZX
         1GZQ==
X-Gm-Message-State: AGi0PuZNp/ROdYJFS45J7AozE6j9kuLHqCXHshYSk0YO5ih3Vb+CWWas
        zZmAZ3pWn9lTpGpeBXHsja6PK8nJgQQ=
X-Google-Smtp-Source: APiQypL/POtcf6/x5ltcZf0Zve8IjTv13UIsM2PXQyT16F2xj1FlE5+MVtkuTPR8ro7mqT7Yr/HQ6w==
X-Received: by 2002:a1c:1f83:: with SMTP id f125mr1954225wmf.5.1589033713120;
        Sat, 09 May 2020 07:15:13 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id t4sm8638963wri.54.2020.05.09.07.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2020 07:15:12 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH] gpiolib: notify user-space about line status changes after flags are set
Date:   Sat,  9 May 2020 16:15:07 +0200
Message-Id: <20200509141507.19531-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Currently we emit the REQUESTED line state event after the line is
requested but before the flags are configured. This is obviously wrong
as we want to pass the updated lineinfo to user-space together with the
event.

Since the flags can be configured in different ways depending on how the
line is being requested - we need to call the notifier chain in different
places separately.

Fixes: 51c1064e82e7 ("gpiolib: add new ioctl() for monitoring changes in line info")
Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
This comes late in the release cycle but I only recently got down to
writing libgpiod support for this new ioctl(). When writing test cases
I noticed this doesn't really work as expected. This patch fixes the
issue I identified this week. There may be more coming the following
week though...

 drivers/gpio/gpiolib.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 40f2d7f69be2..550751a6e51c 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -729,6 +729,10 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 			if (ret)
 				goto out_free_descs;
 		}
+
+		atomic_notifier_call_chain(&desc->gdev->notifier,
+					   GPIOLINE_CHANGED_REQUESTED, desc);
+
 		dev_dbg(&gdev->dev, "registered chardev handle for line %d\n",
 			offset);
 	}
@@ -1083,6 +1087,9 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 	if (ret)
 		goto out_free_desc;
 
+	atomic_notifier_call_chain(&desc->gdev->notifier,
+				   GPIOLINE_CHANGED_REQUESTED, desc);
+
 	le->irq = gpiod_to_irq(desc);
 	if (le->irq <= 0) {
 		ret = -ENODEV;
@@ -2975,8 +2982,6 @@ static int gpiod_request_commit(struct gpio_desc *desc, const char *label)
 	}
 done:
 	spin_unlock_irqrestore(&gpio_lock, flags);
-	atomic_notifier_call_chain(&desc->gdev->notifier,
-				   GPIOLINE_CHANGED_REQUESTED, desc);
 	return ret;
 }
 
@@ -4938,6 +4943,9 @@ struct gpio_desc *__must_check gpiod_get_index(struct device *dev,
 		return ERR_PTR(ret);
 	}
 
+	atomic_notifier_call_chain(&desc->gdev->notifier,
+				   GPIOLINE_CHANGED_REQUESTED, desc);
+
 	return desc;
 }
 EXPORT_SYMBOL_GPL(gpiod_get_index);
@@ -5003,6 +5011,9 @@ struct gpio_desc *fwnode_get_named_gpiod(struct fwnode_handle *fwnode,
 		return ERR_PTR(ret);
 	}
 
+	atomic_notifier_call_chain(&desc->gdev->notifier,
+				   GPIOLINE_CHANGED_REQUESTED, desc);
+
 	return desc;
 }
 EXPORT_SYMBOL_GPL(fwnode_get_named_gpiod);
-- 
2.25.0

