Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89F30466496
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Dec 2021 14:40:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358274AbhLBNoB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Dec 2021 08:44:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358266AbhLBNoA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Dec 2021 08:44:00 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 257D2C06174A
        for <linux-gpio@vger.kernel.org>; Thu,  2 Dec 2021 05:40:38 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id o13so59607365wrs.12
        for <linux-gpio@vger.kernel.org>; Thu, 02 Dec 2021 05:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b8M7HnErTzGwfPKIGM3WgeLbmJVNvtClVXvn5c0S3W8=;
        b=DnV3vaBl+7005Uacj02nRKFbUAuRZKltmjfINz5Cn+wUzEQpqwjYO+0IEFqS0Qa5Gt
         jho7KqV+TPahR/FyCDy0RKIFJkKUdkchZBxv5rPg6dLQTtNKZEI8h/p5Pl2VIAPpQTt/
         p/36Y96Lmkk7LZE3472yUs1/l+5uJYqgaLf6k+iUvVyofoyzSyU1o6WDKxG/KjnPQ11V
         THkRb1/azRXVfm3BRXqxhW+LIrjfW4RkJrZQHthPNZXfkWyXYQSB1nAH1TiDja2ztM7T
         JD/vlTAJTFCb5WJaipl1aIlRYQSRPuwJdWPpG9ewd1Cw6ZOm8ru7u1s3wmWG7o4S0i93
         go7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b8M7HnErTzGwfPKIGM3WgeLbmJVNvtClVXvn5c0S3W8=;
        b=vHm5DAuFH5fjmr+q5f8uPAzsKb81Pn609lcAJH5QaneEU1wUmGnC3xDWR7DaDT5qGT
         dpCcQk4GJAh0hi+5JT6hzNAqBq4V/4I0FwZdm3odhMFdgboY95TYtTUllvxug65TtQLn
         830+gktgQI4m80JkIfcslPdZqtVisyg5gXxM5cqYRiNHxwi+i7WRsmOME6lqtGGTM3VK
         c0CS437APw3kpLtDEippOZrLqhLghGsXElhfyFxtX8193rjTP0EsnBvKoKSaxznq1d+y
         Rw0lRmWJklTX0Kdkdri4rtraiB998KYD6BYRwelW/dqCzWwgIS+zvW1MEvQ3i9mkVsk0
         5HYQ==
X-Gm-Message-State: AOAM531EwgV5UuchQ0IwxUEfM/W2nXrxwuPMpr0Dr9lFwup/vDGBnZyl
        zo45ydbqfyWL2kDIUl9KQEwhzw==
X-Google-Smtp-Source: ABdhPJyv5uINR4hQfKWREIrTPJNfPf9WecEFFnwk8K0WPxIQsfqo3pKnDUnp4oXymCES7dAlA9jPvg==
X-Received: by 2002:a05:6000:15c6:: with SMTP id y6mr14711300wry.422.1638452436588;
        Thu, 02 Dec 2021 05:40:36 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id x13sm2660590wrr.47.2021.12.02.05.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 05:40:35 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Johan Hovold <johan@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v4 1/2] gpiolib: improve coding style for local variables
Date:   Thu,  2 Dec 2021 14:40:33 +0100
Message-Id: <20211202134034.14048-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Drop unneeded whitespaces and put the variables of the same type
together for consistency with the rest of the code.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v1 -> v2:
- no changes

v2 -> v3:
- keep initializations on separate lines

v3 -> v4:
- no changes

 drivers/gpio/gpiolib.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index abfbf546d159..ede8b8a7aa18 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -594,11 +594,11 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 			       struct lock_class_key *request_key)
 {
 	struct fwnode_handle *fwnode = gc->parent ? dev_fwnode(gc->parent) : NULL;
-	unsigned long	flags;
-	int		ret = 0;
-	unsigned	i;
-	int		base = gc->base;
 	struct gpio_device *gdev;
+	unsigned long flags;
+	int base = gc->base;
+	unsigned int i;
+	int ret = 0;
 
 	/*
 	 * First: allocate and populate the internal stat container, and
-- 
2.25.1

