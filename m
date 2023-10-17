Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BE587CC27E
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 14:07:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235028AbjJQMHx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 08:07:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235034AbjJQMHV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 08:07:21 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31E3A2112
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:39 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4064867903cso62410775e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697544337; x=1698149137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+4CqFcvuUjz2M/MS1KWCWQlIQoK+ivVHKbPT1o2HxyI=;
        b=r2YnnYNAzXjV+8vENDlDrgbbw4SmN+FQLIcKfVfOMecYJJ+U9JNP2vr+DD2GYZhO7Y
         vTisADJZgwZp8dni6evcu1Lh7HyhTND8J9LcaOY45N6rch/lrd6FLAB1/fH2QZcY6wlD
         YI2GpyY9Nv7inL4pl3cqhh7kGWwz6tUpTNWoz+Z1h/9DuApjnExqlmfemDYx0m8DVvhT
         XumA3rz1Ax3OrQXaPh21o2gvT8Yv1kGLGqAW2LcUg40GXQAkp8CEqlK0yt9JGvRTUJPT
         AxVPhLv5ExvBP5RKksfpKs/tybdq7FnjV/8+x9EyIBSvxK6sI7/PoandWB3utXjXnHD1
         RiVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697544337; x=1698149137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+4CqFcvuUjz2M/MS1KWCWQlIQoK+ivVHKbPT1o2HxyI=;
        b=oN7yRUQarz+THqDs8r69j8N3Pu03U9OWzRKTc4T27ja0uevfvKracYmuOlE1OOwq53
         ehNo3LVsVmGCrwHVFTSWz5JM5T6ny35ejVBBuCCHvEYTlp5aJiygZdhwLCxi72hlzaWY
         tPF70iPmhtjhwV3IkVQOp0G+wKP79l0aiLOfuIuwCXzrgyuIsPpvq40dRo6r20SJlWPF
         9BrnJKSoUWxRMqyYWGtAaykIpCRpDoAV2ovEWyK0kYaxfvta1fRfq/4N/uoANKeqKSMq
         qLOoA9IU5/EEyThh+feEO4fIaCumozmdtLybuXxlzzCsr7HaBg9dNiz1DFMXFw6gsmvu
         RFpA==
X-Gm-Message-State: AOJu0Yzpr+kDayxm+ZqU6TJQgN9mYGPASOT7zXgANk5BE1j8XOcOoqNT
        YD5HJq96e/Cjw34D/7aBqWrWCQ==
X-Google-Smtp-Source: AGHT+IEcz+6S64y8VXs/vk2gA6SNC68GiE+ghH3lXVhsrchGyyw80vzthXCTmJ631MBWqtDvabC4/w==
X-Received: by 2002:a05:600c:a47:b0:403:8fb9:8d69 with SMTP id c7-20020a05600c0a4700b004038fb98d69mr1688040wmq.25.1697544337487;
        Tue, 17 Oct 2023 05:05:37 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f1ee:b000:ce90:ed14])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c224200b00405442edc69sm1353859wmm.14.2023.10.17.05.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 05:05:36 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 50/73] pinctrl: change the signature of pinctrl_match_gpio_range()
Date:   Tue, 17 Oct 2023 14:04:08 +0200
Message-Id: <20231017120431.68847-51-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231017120431.68847-1-brgl@bgdev.pl>
References: <20231017120431.68847-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Modify pinctrl_match_gpio_range() to be in line with public GPIO
helpers and take a pair of GPIO chip & offset as arguments.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/core.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 80f1db0ec074..ec78a75a5d7c 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -292,13 +292,15 @@ static inline int gpio_to_pin(struct pinctrl_gpio_range *range,
 /**
  * pinctrl_match_gpio_range() - check if a certain GPIO pin is in range
  * @pctldev: pin controller device to check
- * @gpio: gpio pin to check taken from the global GPIO pin space
+ * @gc: GPIO chip structure from the GPIO subsystem
+ * @offset: hardware offset of the GPIO relative to the controller
  *
  * Tries to match a GPIO pin number to the ranges handled by a certain pin
  * controller, return the range or NULL
  */
 static struct pinctrl_gpio_range *
-pinctrl_match_gpio_range(struct pinctrl_dev *pctldev, unsigned gpio)
+pinctrl_match_gpio_range(struct pinctrl_dev *pctldev, struct gpio_chip *gc,
+			 unsigned int offset)
 {
 	struct pinctrl_gpio_range *range;
 
@@ -306,8 +308,8 @@ pinctrl_match_gpio_range(struct pinctrl_dev *pctldev, unsigned gpio)
 	/* Loop over the ranges */
 	list_for_each_entry(range, &pctldev->gpio_ranges, node) {
 		/* Check if we're in the valid range */
-		if (gpio >= range->base &&
-		    gpio < range->base + range->npins) {
+		if ((gc->base + offset) >= range->base &&
+		    (gc->base + offset) < range->base + range->npins) {
 			mutex_unlock(&pctldev->mutex);
 			return range;
 		}
@@ -395,7 +397,7 @@ static int pinctrl_get_device_gpio_range(struct gpio_chip *gc,
 	list_for_each_entry(pctldev, &pinctrldev_list, node) {
 		struct pinctrl_gpio_range *range;
 
-		range = pinctrl_match_gpio_range(pctldev, gc->base + offset);
+		range = pinctrl_match_gpio_range(pctldev, gc, offset);
 		if (range) {
 			*outdev = pctldev;
 			*outrange = range;
-- 
2.39.2

