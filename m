Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A71796DD570
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Apr 2023 10:28:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230056AbjDKI2x (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Apr 2023 04:28:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230241AbjDKI2l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Apr 2023 04:28:41 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B53554ECE
        for <linux-gpio@vger.kernel.org>; Tue, 11 Apr 2023 01:28:12 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id r27so9410988lfe.0
        for <linux-gpio@vger.kernel.org>; Tue, 11 Apr 2023 01:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681201690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=btviQq9ygUEFqpALem4Z2cwJbW3Kg3t1tEitJ1PzaP4=;
        b=ZwNnUUdQAdGNtg3ekN/L8FAdohiQb1x+xdD9pYvOce2N3yK8rOUGyJrD6wWvayaABe
         us0rePFaXKIXUI8XXje3y2/6SQRtivPnsZI4g3uKfNkVuA3qPEdWn0ug6uOIUa/IaTIC
         TzlffGNndjDtBjKevo7v+titOZIFOSTkK1oZSxvoA0xClhkXfwssuPszlVMhziswbYFS
         Rsg2u5CmGWvHYVCa+ROuTvZ05QZjXRkZpuwYcuPtmF+3wQlT24hzzqhHrg93wzJ62l3S
         D26LAgxEmenIAuGg7FnpY43YDVzCTsa9M8BL/GNL8rttb9Gfmw2BJHTVnK1KGZ+5UKbf
         tY7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681201690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=btviQq9ygUEFqpALem4Z2cwJbW3Kg3t1tEitJ1PzaP4=;
        b=cESam/zrQDVq1ZD/WAuMcsBixMvbhWX6gHNBpTlX0h6tsot7kAN7UCyyWruRqLsos6
         h2LWmGJ3lSGcoGMPmGAIJhTcmkTwikUAlOEPNnLqsQ0tMBU4lNjUqOKJFGIEBuENYvb7
         5wDLoQsrgFcoAz6+BG4Ygc9SPB/Km4UGZhufqUzjSRc+2l8ILUU0AvHIMcWc/03d5VXs
         BDw6XY7LLQx+ydDQVAKCUB4ohm4ZySBlAcTGN5pr985ywPWCGht5hlhsnJ2HaNBg1LxG
         vHm6RMjfygfCFO7RoydriTvBYutXVxEa/w0Q5qs0sVPNmHt8pqsYIYHT8f/xL2NJLJKe
         MO8Q==
X-Gm-Message-State: AAQBX9dvstgxS8zcnkLfVnmdm6x30h4EVjW58JwZhb2XaPeKvKZM4Z6m
        67XkT/SCDWu0z8SksIWG/C6YZMl1k/+OvmVlxms=
X-Google-Smtp-Source: AKy350Z6QP9bbORL6E7Ve9MDIH1guFI1/h95yTwuF0gB1BhIq7pOVM8MHo/q4lq3Jkc81vPImpAhVA==
X-Received: by 2002:a19:761a:0:b0:4dd:a019:d845 with SMTP id c26-20020a19761a000000b004dda019d845mr4884211lff.18.1681201689991;
        Tue, 11 Apr 2023 01:28:09 -0700 (PDT)
Received: from Linus-Dell.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id c10-20020ac2530a000000b004e84a924a14sm2456585lfh.18.2023.04.11.01.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 01:28:09 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Anders Roxell <anders.roxell@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH] gpio: gpiolib: Simplify gpiochip_add_data_with_key() fwnode
Date:   Tue, 11 Apr 2023 10:28:06 +0200
Message-Id: <20230411082806.41361-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The code defaulting to the parents fwnode if no fwnode was assigned
is unnecessarily convoluted, probably due to refactoring. Simplify
it and make it more human-readable.

Cc: Anders Roxell <anders.roxell@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Anders: you can test this but I don't think it fixes the
regression you have pointing to commit
24c94060fc9b4e0f19e6e018869db46db21d6bc7
---
 drivers/gpio/gpiolib.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 19bd23044b01..5801d682c12b 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -667,7 +667,6 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 			       struct lock_class_key *lock_key,
 			       struct lock_class_key *request_key)
 {
-	struct fwnode_handle *fwnode = NULL;
 	struct gpio_device *gdev;
 	unsigned long flags;
 	unsigned int i;
@@ -675,12 +674,12 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	int base = 0;
 	int ret = 0;
 
-	/* If the calling driver did not initialize firmware node, do it here */
-	if (gc->fwnode)
-		fwnode = gc->fwnode;
-	else if (gc->parent)
-		fwnode = dev_fwnode(gc->parent);
-	gc->fwnode = fwnode;
+	/*
+	 * If the calling driver did not initialize firmware node, do it here
+	 * using the parent device, if any.
+	 */
+	if (!gc->fwnode && gc->parent)
+		gc->fwnode = dev_fwnode(gc->parent);
 
 	/*
 	 * First: allocate and populate the internal stat container, and
-- 
2.39.2

