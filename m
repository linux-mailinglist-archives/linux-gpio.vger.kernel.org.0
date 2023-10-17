Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 610197CC2FB
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 14:21:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235048AbjJQMV3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 08:21:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343756AbjJQMVN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 08:21:13 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CF7A2109
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:38 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4060b623e64so35185085e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697544336; x=1698149136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OzbUjPGvfQ55lrc91Ueu/fWATZc6Tre3CC80/9IHyOA=;
        b=cY8A2TCY7h8Hkp9+PSQ5ed1PXmxWrnGr1fGcBcRVgriL9c/IdK+/wKjAfYXJy8rBw9
         p7DvdnG/f1aWObUIw6B9ccI7i8h1rLHx53eduMHASqmSNmumoPp1gneFID3WAoSWkWjQ
         KHvmJzozcaZeJAlNa3jvO3QO2vzpa/eu2gxd86sKZUFi6X671tv1cnv8TeC0jRE/6ih6
         rGmO/VFKUOMWGYtR/W84hcBlLWYd8xNVdh9eLPUbgDCnWNZtQu9B3UoFrOmq6BX9T8xa
         y3hUZphAxVv2aavwBF95Ai0BpDgWHWQIayh9c0St1dBFPaAEdaKHHPgOGIdrreOajcV6
         RwbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697544336; x=1698149136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OzbUjPGvfQ55lrc91Ueu/fWATZc6Tre3CC80/9IHyOA=;
        b=V6LPapuFfzcfQWzIWBmfdRfEOVjfL755h4GHL7mvP/iP5in5NxqBXTmj9Bv8qWnr1f
         BZJQSeM8fcMzOkoDMKHH514SmeJJ9tKv3kW3aCYUUGg9Je11l4eQG1r/C+WV4hJ28AQ5
         ZFEWEb5pYLAMEcWHBoYJE1h1/p9GkLKGWnX6ZPlhcnQTbRa6nl7GumGq7lzuEucJhshz
         bbfe0CikPGG/SPCgrhKyTPgXNrlq7932VPdfL0OkG7qK6dXb6SE9QN0+jOtCWNoKf8o2
         hlX2kw8KNsyKMamE2eTrWfouC8RR0420qih7dQNQ3LhCNEFNbMdY6OgmQjTxmhKGt0Tk
         YG8A==
X-Gm-Message-State: AOJu0Yx30YPAT38NKDRmbhWM296YVFNEKtGwh/sPggVHHIJmuL7xIR14
        n9BUbl24YqOfa4SUBlk1atFhW0pSttllTJNs9qU=
X-Google-Smtp-Source: AGHT+IETciMioDwEXZ757QvLkU/Q+PJQuwEycMdpZ6EA1ZpK6cTX7paCGX3w99LIF9axZWAMyYILig==
X-Received: by 2002:a05:600c:458c:b0:406:44fc:65c9 with SMTP id r12-20020a05600c458c00b0040644fc65c9mr1658658wmo.8.1697544336560;
        Tue, 17 Oct 2023 05:05:36 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f1ee:b000:ce90:ed14])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c224200b00405442edc69sm1353859wmm.14.2023.10.17.05.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 05:05:36 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 49/73] pinctrl: change the signature of pinctrl_get_device_gpio_range()
Date:   Tue, 17 Oct 2023 14:04:07 +0200
Message-Id: <20231017120431.68847-50-brgl@bgdev.pl>
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

Modify pinctrl_get_device_gpio_range() to be in line with public GPIO
helpers and take a pair of GPIO chip & offset as arguments.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/core.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index b92047af7b9f..80f1db0ec074 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -372,7 +372,8 @@ static bool pinctrl_ready_for_gpio_range(unsigned gpio) { return true; }
 
 /**
  * pinctrl_get_device_gpio_range() - find device for GPIO range
- * @gpio: the pin to locate the pin controller for
+ * @gc: GPIO chip structure from the GPIO subsystem
+ * @offset: hardware offset of the GPIO relative to the controller
  * @outdev: the pin control device if found
  * @outrange: the GPIO range if found
  *
@@ -381,7 +382,8 @@ static bool pinctrl_ready_for_gpio_range(unsigned gpio) { return true; }
  * -EPROBE_DEFER if the GPIO range could not be found in any device since it
  * may still have not been registered.
  */
-static int pinctrl_get_device_gpio_range(unsigned gpio,
+static int pinctrl_get_device_gpio_range(struct gpio_chip *gc,
+					 unsigned int offset,
 					 struct pinctrl_dev **outdev,
 					 struct pinctrl_gpio_range **outrange)
 {
@@ -393,7 +395,7 @@ static int pinctrl_get_device_gpio_range(unsigned gpio,
 	list_for_each_entry(pctldev, &pinctrldev_list, node) {
 		struct pinctrl_gpio_range *range;
 
-		range = pinctrl_match_gpio_range(pctldev, gpio);
+		range = pinctrl_match_gpio_range(pctldev, gc->base + offset);
 		if (range) {
 			*outdev = pctldev;
 			*outrange = range;
@@ -767,7 +769,7 @@ bool pinctrl_gpio_can_use_line(struct gpio_chip *gc, unsigned int offset)
 	 * we're probably dealing with GPIO driver
 	 * without a backing pin controller - bail out.
 	 */
-	if (pinctrl_get_device_gpio_range(gc->base + offset, &pctldev, &range))
+	if (pinctrl_get_device_gpio_range(gc, offset, &pctldev, &range))
 		return true;
 
 	mutex_lock(&pctldev->mutex);
@@ -798,8 +800,7 @@ int pinctrl_gpio_request(struct gpio_chip *gc, unsigned int offset)
 	struct pinctrl_dev *pctldev;
 	int ret, pin;
 
-	ret = pinctrl_get_device_gpio_range(gc->base + offset, &pctldev,
-					    &range);
+	ret = pinctrl_get_device_gpio_range(gc, offset, &pctldev, &range);
 	if (ret) {
 		if (pinctrl_ready_for_gpio_range(gc->base + offset))
 			ret = 0;
@@ -834,8 +835,7 @@ void pinctrl_gpio_free(struct gpio_chip *gc, unsigned int offset)
 	struct pinctrl_dev *pctldev;
 	int ret, pin;
 
-	ret = pinctrl_get_device_gpio_range(gc->base + offset, &pctldev,
-					    &range);
+	ret = pinctrl_get_device_gpio_range(gc, offset, &pctldev, &range);
 	if (ret)
 		return;
 
@@ -858,8 +858,7 @@ static int pinctrl_gpio_direction(struct gpio_chip *gc, unsigned int offset,
 	int ret;
 	int pin;
 
-	ret = pinctrl_get_device_gpio_range(gc->base + offset, &pctldev,
-					    &range);
+	ret = pinctrl_get_device_gpio_range(gc, offset, &pctldev, &range);
 	if (ret) {
 		return ret;
 	}
@@ -923,8 +922,7 @@ int pinctrl_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
 	struct pinctrl_dev *pctldev;
 	int ret, pin;
 
-	ret = pinctrl_get_device_gpio_range(gc->base + offset, &pctldev,
-					    &range);
+	ret = pinctrl_get_device_gpio_range(gc, offset, &pctldev, &range);
 	if (ret)
 		return ret;
 
-- 
2.39.2

