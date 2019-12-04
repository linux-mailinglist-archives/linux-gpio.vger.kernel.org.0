Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6127A112F5E
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2019 17:01:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728572AbfLDP71 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Dec 2019 10:59:27 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:54277 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728564AbfLDP70 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Dec 2019 10:59:26 -0500
Received: by mail-wm1-f67.google.com with SMTP id b11so240294wmj.4
        for <linux-gpio@vger.kernel.org>; Wed, 04 Dec 2019 07:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PwQtKdAUQY+SBl5OsHs80mv2U9tLV35lkOjHDH8uz/U=;
        b=T6VXt8MIgYcU7MsY3TdXMqG4/4HRWYESABPYgT0VZoaE8H5/6QTNNqzLD5Fongh5Tb
         b5c6LbaV+5bgyTMxcNS6MkTu6OfOzoVpNioIMUXWSWd90IWYsnDEpqZfY/23mJoRMli7
         JIk+qU5sKkCujWkOd5jh43Xg3azL//AlEYWP7TzpLe7pvRmELIiukwSk/bxGz4HuAdfe
         6dkSfCEPXYp5Z8FfDp+FUAu4y8/065sYSdQbVu2Q0+Rk8Xdxi6rvgiv9el7E0+qH+Y8I
         lkBW1FXom8XEsWCOoity9VRoOjQxd0/TZ4qcBcuS2TIzgZIzvCfP0o4iZ1ourYKA0Ux0
         IvMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PwQtKdAUQY+SBl5OsHs80mv2U9tLV35lkOjHDH8uz/U=;
        b=YAYkHyKLZObMyHUsI+zZ3PFLN9cTGuo8ckboaYxrmafxlxeCcHnYt6eCE0BN1OpCy1
         9Tu1nstgfKHQw//qsmcnt5tVAO/wswm3rTqZf5J17TMwdqAA9dp5z9+N/9GbZqxpAJo2
         NnE6jyU+Q2YhCe4FbLpmdpaoXkK/D0lrZfvQz0wDI2wZz49VvESaZVOoqR9Zl2/QujWA
         BY+6fjGQjXPLnrsFJFfEczTVjph9N+QlkzmS3gpogbsK0O5IMBquUH+y7xQBsl6uQtqs
         IW150QuGW/4JRxKMeIgaddh5Pont/dtFxWKfrL7YRnBod05gnLOu2F2tlJduojy97/DI
         x7QA==
X-Gm-Message-State: APjAAAWGCQ0SrJ4Aa4xcmWtBHIaEByEiQp8azKvbmOuBKzc9ZNva6/y/
        DG54SwQHNHZh7xTfT/PXplD2dw==
X-Google-Smtp-Source: APXvYqw3j9t+sv27rxv6BsQ+49qDiWvcgmeoGIG7o/TNn3GxBxvIPxAHFn+65IIuWJboL7cqmVfOJw==
X-Received: by 2002:a1c:8055:: with SMTP id b82mr159701wmd.127.1575475164550;
        Wed, 04 Dec 2019 07:59:24 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id u18sm8640508wrt.26.2019.12.04.07.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2019 07:59:23 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 05/11] gpiolib: use gpiochip_get_desc() in lineevent_create()
Date:   Wed,  4 Dec 2019 16:59:08 +0100
Message-Id: <20191204155912.17590-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191204155912.17590-1-brgl@bgdev.pl>
References: <20191204155912.17590-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Unduplicate the ngpio check by simply calling gpiochip_get_desc() and
checking its return value.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpiolib.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 6ef55cc1188b..17796437d7be 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1009,8 +1009,9 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 	lflags = eventreq.handleflags;
 	eflags = eventreq.eventflags;
 
-	if (offset >= gdev->ngpio)
-		return -EINVAL;
+	desc = gpiochip_get_desc(gdev->chip, offset);
+	if (IS_ERR(desc))
+		return PTR_ERR(desc);
 
 	/* Return an error if a unknown flag is set */
 	if ((lflags & ~GPIOHANDLE_REQUEST_VALID_FLAGS) ||
@@ -1048,7 +1049,6 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 		}
 	}
 
-	desc = &gdev->descs[offset];
 	ret = gpiod_request(desc, le->label);
 	if (ret)
 		goto out_free_label;
-- 
2.23.0

