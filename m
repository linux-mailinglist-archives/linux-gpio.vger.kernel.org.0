Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 949097CC253
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 14:06:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343606AbjJQMG2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 08:06:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235049AbjJQMFz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 08:05:55 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7DCFD64
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:11 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-40776b1ff73so32489305e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697544307; x=1698149107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8H3QKxaZyWg3ZP7YHeatEgOsl69MRzJ/Cd/1HakMRZU=;
        b=LC9crqaBN8/Opclvtzk+b44mGVYLZ6eyPjzNAQUDefjVpbCXV3jRHJp8ziqo2ub0t4
         m6kF4jQEGkaRqh5cq1E68b0Ttnr6T7SN16qoFVaexlrx9ga1TU+m9H5JGvTBF5SwQERl
         uJsSVIAk4mDN5xT/x6KJSUi9q9ZT6zsoMjXGjj7Qy/BlF5I3hShDyvjKdR4oJlaPHIex
         Jco6ve03WiB6jZ2rjDIaWtASVr9DvRH7vTZ5Vthn25/avG4boKdyjhL+xXwGbNeJuTP8
         wtsSPIOCNfc3yhCS6wZQ8z5DYEb+bYk9cnil3Ki82RmZRhV34Kmd5dapB8MGhqq83zWI
         kuMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697544307; x=1698149107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8H3QKxaZyWg3ZP7YHeatEgOsl69MRzJ/Cd/1HakMRZU=;
        b=JtVaP7mjE8G3w/rLy2LxSf7/Qi4ZX4kfWZG1+MKbRTGNpubKfatQaMi6G9VDRX+jfK
         5UDZmTXDjrqFCEKIpdo49kqMFGLqEZwnLSQt0Ko73cAMBheJ8QyK/QgcucvmfN5/KD69
         bVvyzXrosF8bJzd9GV3/zPQ/TWrvQQrqdo8JwGINc1IqQkGEmdD8DikTZ2dYf3hXlgll
         rjJAlV4AUfEha6s8xUmF4CrtLzsxvd97dw+uVUCuxKu9OZtkHQftrgsLLakt4ZUZD1NG
         jOjb+JPjy5M5NZ2UeOrDbXfCJA0pksUHfw4uvZjerXE5FhDl42QM8AO0fK7o3wVnMEKn
         xM5Q==
X-Gm-Message-State: AOJu0YwYaYMmNxEDOgcVq3tQIC40Uyz6okb8hwUMxqX1Ew+/7dT4kRuo
        11/D18YDtgkg16Bou/vujyEEMQ==
X-Google-Smtp-Source: AGHT+IFkms7KmMc5I89ZrROxrFEKHacfqXoc3Yne1I/ZE7AGfAMn6xMFwVA9mrORkKXIzfO/xo0lrA==
X-Received: by 2002:a05:600c:a47:b0:402:95a0:b2ae with SMTP id c7-20020a05600c0a4700b0040295a0b2aemr1788066wmq.32.1697544307571;
        Tue, 17 Oct 2023 05:05:07 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f1ee:b000:ce90:ed14])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c224200b00405442edc69sm1353859wmm.14.2023.10.17.05.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 05:05:07 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 19/73] pinctrl: starfive: jh7100: use new pinctrl GPIO helpers
Date:   Tue, 17 Oct 2023 14:03:37 +0200
Message-Id: <20231017120431.68847-20-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231017120431.68847-1-brgl@bgdev.pl>
References: <20231017120431.68847-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
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
 drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
index 530fe340a9a1..22a2db8fa315 100644
--- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
@@ -918,12 +918,12 @@ static struct pinctrl_desc starfive_desc = {
 
 static int starfive_gpio_request(struct gpio_chip *gc, unsigned int gpio)
 {
-	return pinctrl_gpio_request(gc->base + gpio);
+	return pinctrl_gpio_request_new(gc, gpio);
 }
 
 static void starfive_gpio_free(struct gpio_chip *gc, unsigned int gpio)
 {
-	pinctrl_gpio_free(gc->base + gpio);
+	pinctrl_gpio_free_new(gc, gpio);
 }
 
 static int starfive_gpio_get_direction(struct gpio_chip *gc, unsigned int gpio)
-- 
2.39.2

