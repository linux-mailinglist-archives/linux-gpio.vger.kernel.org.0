Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4DED7CC23A
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 14:05:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234939AbjJQMFS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 08:05:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234899AbjJQMFD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 08:05:03 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FFBEFE
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:01 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4054f790190so59095965e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697544299; x=1698149099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n2xq1c7gkK7UBvFiiWYtPT4/dVB/RGOfCXDnH3L0uQ8=;
        b=0YcswjkxOD7Y+pHjiFMzaeyEv8ofWJMRCeHfhsSwCR4XiMTA+FeFJrmsj/iTTTy5nI
         zI7ObaRZJn2fWLW2qOtt7+8dVvcIK6xTL11ga2QnGfBEdtko1CbJlMf7dLTNq5gue4iH
         ReSxBvdqaATQxsjiTYtTouYFzTg/BrE5fld/KY/TryAPrhvnEOaRNrrsBaDgAvG4o1uA
         Zu7JW/TrEbihLUkiFegQp8biXdUlo4+YRTM4/8jpJBsDWeluf6+1uj6AvY+gq7jUWLiA
         fnQ8XEBEPJ4yDsN4L7XG1nF461ub1jLobrY/1TEl6DynQdM1aencFDT2u87wiOmpCpWm
         A6fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697544299; x=1698149099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n2xq1c7gkK7UBvFiiWYtPT4/dVB/RGOfCXDnH3L0uQ8=;
        b=sYPAA2RAfLLKiIZFV1Gj+GuSM/xhZj+9BV6Pvkk8bblDbMTzzJfYOLkFTP2xEEtzUG
         +mtApmVBjbE+RC54CAAc1KcEBAuytv8Cn5iXSEognM9HOYBHfFbFlUm/jrxSWZP4sJ/h
         LLAfZ3+bwnKhQd5YmJ7LQwoOrMc1xhYxPb14pH9YBPqdk2t3ZvsRwgSE8G2YT8KZC+ip
         sYmFI84tKZr/znby9s6GoCU+mLVRTxyrdRwjtVBXppyWPZg/Uer6Wy5El5htIBHMO1X/
         wF3LPsv1e3YsJ/04aenZf4LaWpPgB18Zmj/B4zTbv74+b5m43AAnssdn16XeIXyp19wX
         CbQw==
X-Gm-Message-State: AOJu0YzX1CgjAV6n3qh3pXiXEDHtqn3K3jz+2N9RfO5IPZhCKObeWtlI
        hbZnWxJ0+8QqtGFgJXe611ecziGW4Z9130cgHxQ=
X-Google-Smtp-Source: AGHT+IGnWU+mJuU4E2+/B9aQfR5VmwG2gli9VycMLIZY5jBGMeCe3BVwCbX5rvXMoQA0bR6REeCPWA==
X-Received: by 2002:a05:600c:3148:b0:405:514d:eb13 with SMTP id h8-20020a05600c314800b00405514deb13mr1541271wmo.24.1697544299528;
        Tue, 17 Oct 2023 05:04:59 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f1ee:b000:ce90:ed14])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c224200b00405442edc69sm1353859wmm.14.2023.10.17.05.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 05:04:58 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 10/73] gpio: pxa: use new pinctrl GPIO helpers
Date:   Tue, 17 Oct 2023 14:03:28 +0200
Message-Id: <20231017120431.68847-11-brgl@bgdev.pl>
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

Replace the pinctrl helpers taking the global GPIO number as argument
with the improved variants that instead take a pointer to the GPIO chip
and the controller-relative offset.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-pxa.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index cae9661862fe..2fd797b91270 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -260,7 +260,7 @@ static int pxa_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 	int ret;
 
 	if (pxa_gpio_has_pinctrl()) {
-		ret = pinctrl_gpio_direction_input(chip->base + offset);
+		ret = pinctrl_gpio_direction_input_new(chip, offset);
 		if (ret)
 			return ret;
 	}
@@ -289,7 +289,7 @@ static int pxa_gpio_direction_output(struct gpio_chip *chip,
 	writel_relaxed(mask, base + (value ? GPSR_OFFSET : GPCR_OFFSET));
 
 	if (pxa_gpio_has_pinctrl()) {
-		ret = pinctrl_gpio_direction_output(chip->base + offset);
+		ret = pinctrl_gpio_direction_output_new(chip, offset);
 		if (ret)
 			return ret;
 	}
-- 
2.39.2

