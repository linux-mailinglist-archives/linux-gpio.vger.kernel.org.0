Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A17D17CC2FA
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 14:21:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235157AbjJQMV0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 08:21:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235216AbjJQMVM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 08:21:12 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DCFC1BC2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:26 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2b9d07a8d84so66979051fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697544323; x=1698149123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lpqrGhJK+18/r5lO164Y1VLFbc+qN04GBTg0zj9N4Wc=;
        b=eaCeUgsiAVd0h+9h/QR0D3qmJDOm5OzjdE3X/10qZdUJrrmmY6FU0z9TP/ItgK0fN1
         2ooDuq/KyN95l+tkWvqBJ9CvwQBj7nJRvrvZ6EIXRWzGap49SQmCyrOJaSvZRRqVE3a9
         gnG8KDL5E4++6Y81c6lYiEDE6Cg8xBUi6i+NMBS0yGF3u9hr6SOAtBqF8IrIsPBU8phd
         r0qEZQBN9yI5lIOb98q5Zdh67we44p+Vt+U4CG6F+8y71CE6zXdE0gfE8AR67HdUjiBT
         iG25JL1RKGYIkuY4EP+MKXr1bTOyGhzN/o2X7oTbeMPacrhUULlMTQ5ZmvMcPoiaUtYL
         JVUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697544323; x=1698149123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lpqrGhJK+18/r5lO164Y1VLFbc+qN04GBTg0zj9N4Wc=;
        b=VT3aWMNf8ySA4BmdM62S3eoUMH2BPJUNvdII16jBMjJcugVRgq4GOwsqB+3TPWPm8S
         f2ljLp3dXIhJlWoWD7CZBRdX/id1qkO7MZaNpsAINqzGom/fTnSbK9So78yjI0IFrQAq
         75WyhGiGOqoa0uE7uHM2cyeQOUg9NKdVNDRO8WleC4eTpY3K6zmwOrYABD6E3euv8H1Y
         WazJTGUemVbG2+MwlbK2CEzl0vLS4OYZJGqcyUcIeVa+zMmMxS4476QJfnpsEyADI1pW
         1rkpvXJPN5V5LPArMxArB1O/Vgw0OiIK/LKwD4oom3nWN1sm4ye9AOzOaxpWzt8WfN0U
         Dz2g==
X-Gm-Message-State: AOJu0YwZ4l2pYICkyc8rgoH1rwPQ66DVONMPY4axGcN0F50iZSHdPaoc
        bRlxviO7hufbL3FhtcWlGv04dg==
X-Google-Smtp-Source: AGHT+IHK/wQpTD0H/VP6BTqN/ldOaoLF6WzOwgxxEbF7kAD97EF1ozrzuWDiyy4yxzvW6Qv+6YC44Q==
X-Received: by 2002:a2e:9bce:0:b0:2c0:20c4:925a with SMTP id w14-20020a2e9bce000000b002c020c4925amr1595683ljj.26.1697544322442;
        Tue, 17 Oct 2023 05:05:22 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f1ee:b000:ce90:ed14])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c224200b00405442edc69sm1353859wmm.14.2023.10.17.05.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 05:05:22 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 36/73] pinctrl: remove pinctrl_gpio_can_use_line()
Date:   Tue, 17 Oct 2023 14:03:54 +0200
Message-Id: <20231017120431.68847-37-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231017120431.68847-1-brgl@bgdev.pl>
References: <20231017120431.68847-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

There are no more users of pinctrl_gpio_can_use_line() so remove it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/core.c           | 12 +++---------
 include/linux/pinctrl/consumer.h |  6 ------
 2 files changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 6cd22829544c..4a03fc1c6ba0 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -755,7 +755,7 @@ int pinctrl_get_group_selector(struct pinctrl_dev *pctldev,
 	return -EINVAL;
 }
 
-bool pinctrl_gpio_can_use_line(unsigned gpio)
+bool pinctrl_gpio_can_use_line_new(struct gpio_chip *gc, unsigned int offset)
 {
 	struct pinctrl_dev *pctldev;
 	struct pinctrl_gpio_range *range;
@@ -767,13 +767,13 @@ bool pinctrl_gpio_can_use_line(unsigned gpio)
 	 * we're probably dealing with GPIO driver
 	 * without a backing pin controller - bail out.
 	 */
-	if (pinctrl_get_device_gpio_range(gpio, &pctldev, &range))
+	if (pinctrl_get_device_gpio_range(gc->base + offset, &pctldev, &range))
 		return true;
 
 	mutex_lock(&pctldev->mutex);
 
 	/* Convert to the pin controllers number space */
-	pin = gpio_to_pin(range, gpio);
+	pin = gpio_to_pin(range, gc->base + offset);
 
 	result = pinmux_can_be_used_for_gpio(pctldev, pin);
 
@@ -781,12 +781,6 @@ bool pinctrl_gpio_can_use_line(unsigned gpio)
 
 	return result;
 }
-EXPORT_SYMBOL_GPL(pinctrl_gpio_can_use_line);
-
-bool pinctrl_gpio_can_use_line_new(struct gpio_chip *gc, unsigned int offset)
-{
-	return pinctrl_gpio_can_use_line(gc->base + offset);
-}
 EXPORT_SYMBOL_GPL(pinctrl_gpio_can_use_line_new);
 
 /* This function is deprecated and will be removed. Don't use. */
diff --git a/include/linux/pinctrl/consumer.h b/include/linux/pinctrl/consumer.h
index c95c13983376..3991271cc39f 100644
--- a/include/linux/pinctrl/consumer.h
+++ b/include/linux/pinctrl/consumer.h
@@ -26,7 +26,6 @@ struct pinctrl_state;
 #ifdef CONFIG_PINCTRL
 
 /* External interface to pin control */
-bool pinctrl_gpio_can_use_line(unsigned gpio);
 bool pinctrl_gpio_can_use_line_new(struct gpio_chip *gc, unsigned int offset);
 int pinctrl_gpio_request(unsigned gpio);
 int pinctrl_gpio_request_new(struct gpio_chip *gc, unsigned int offset);
@@ -73,11 +72,6 @@ static inline int pinctrl_pm_select_idle_state(struct device *dev)
 
 #else /* !CONFIG_PINCTRL */
 
-static inline bool pinctrl_gpio_can_use_line(unsigned gpio)
-{
-	return true;
-}
-
 static inline bool
 pinctrl_gpio_can_use_line_new(struct gpio_chip *gc, unsigned int offset)
 {
-- 
2.39.2

