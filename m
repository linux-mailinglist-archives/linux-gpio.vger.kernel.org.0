Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 586397C52FA
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 14:09:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346355AbjJKMJU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 08:09:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346360AbjJKMJS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 08:09:18 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D98B0CF
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:09:15 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-405361bb9f7so63084235e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697026154; x=1697630954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H58FBovONkBFAtGhn37zN4A9drmVE/E2kcDVb0X5d1o=;
        b=0U3hJGxiWhuLvCZY3jznpY1Nwgyz6y4Tpefj/Ktb6OJHAfkQvsLIz+rr2+IW6MljkM
         d0qaUqXstYoozHHjGo7CAf+jFPvDw2ezPcWqSdj8YYjz1TzRy/JmxBUza2BW9rafC1v7
         R75qM9FttYdrea9BbQiR2QILksqinhf0ROLEd5L2/UYcUU5e1Rsn3tP04ux4d8bsPYW1
         OQfrNdbkZ+bMdvP9Vee00o4Fqc36K0EMOQN6NLStgTcSAX2j6PH/8Is9HEnZmUFhmstK
         MtwAo3v4Ebhz+QTH5Xezd5eiRibi+I9RkK1JqAGmMxswth9L8cGNKgyCFTB3Iq+k6H25
         eo3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697026154; x=1697630954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H58FBovONkBFAtGhn37zN4A9drmVE/E2kcDVb0X5d1o=;
        b=rlu2ANbdjgYoannHcOxhDxzQwsYyGntN7Bbu4iFHgWfIf4UuBvLQTYg0FEYswKJ4ow
         dmiF3UW/n0WXq9WmTNIrEQS1ZGKCc4nQPRNBGF4m5c5P+oZQwbUSs+QTPKMxV8c1z5w0
         gx+xze/VCs+G7ME/Imn37O730YScqH8Xz62uqDNS5v6kDtpMk/3dztI84wF9D2fovFj3
         T8SqUB2Yemw8pS6c+mru7Fy0yaOCU+AdC3oV72ixumgWcy9Mch4tZgAVeKHJV2EQe9Lh
         Z00WM3cPhACaPqwWxtNg1gZCa6bth4iCGIxlghm8AzDqfQsFaYKp9y2oG2EOnHtYiJ85
         EQbQ==
X-Gm-Message-State: AOJu0YxC37HBJ9KIqc+h/VGPsSuweGrJH2EqIovvCDL9d8tWKTf6MYsv
        dZQXKHVkHqviMRv/+Iky2nkm/LfTkNN5ItVDeLg=
X-Google-Smtp-Source: AGHT+IGdU+vkiUUKNqQCdOc2K8eQn7rHIkiGKf5eZXPc2b7Nj7v9h8wdWNI/uJnMxS3QrR6ZI6xjpQ==
X-Received: by 2002:a7b:cb8b:0:b0:3fb:e189:3532 with SMTP id m11-20020a7bcb8b000000b003fbe1893532mr18369038wmi.20.1697026153724;
        Wed, 11 Oct 2023 05:09:13 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:e551:3946:26fc:f94])
        by smtp.gmail.com with ESMTPSA id w21-20020a05600c015500b0040652e8ca13sm19012253wmm.43.2023.10.11.05.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 05:09:13 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 07/62] gpio: em: use new pinctrl GPIO helpers
Date:   Wed, 11 Oct 2023 14:07:35 +0200
Message-Id: <20231011120830.49324-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231011120830.49324-1-brgl@bgdev.pl>
References: <20231011120830.49324-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Replace the pinctrl helpers taking the global GPIO number as argument
with the improved variants that instead take a pointer to the GPIO chip
and the controller-relative offset.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-em.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-em.c b/drivers/gpio/gpio-em.c
index 858e6ebbb584..35c65ff43f71 100644
--- a/drivers/gpio/gpio-em.c
+++ b/drivers/gpio/gpio-em.c
@@ -229,12 +229,12 @@ static int em_gio_to_irq(struct gpio_chip *chip, unsigned offset)
 
 static int em_gio_request(struct gpio_chip *chip, unsigned offset)
 {
-	return pinctrl_gpio_request(chip->base + offset);
+	return pinctrl_gpio_request_new(chip, offset);
 }
 
 static void em_gio_free(struct gpio_chip *chip, unsigned offset)
 {
-	pinctrl_gpio_free(chip->base + offset);
+	pinctrl_gpio_free_new(chip, offset);
 
 	/* Set the GPIO as an input to ensure that the next GPIO request won't
 	* drive the GPIO pin as an output.
-- 
2.39.2

