Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0875A7B6C34
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Oct 2023 16:51:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240223AbjJCOvr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Oct 2023 10:51:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240216AbjJCOvi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Oct 2023 10:51:38 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DEDBB4
        for <linux-gpio@vger.kernel.org>; Tue,  3 Oct 2023 07:51:31 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-40566f8a093so9828915e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 03 Oct 2023 07:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696344689; x=1696949489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OPe8AHR8wi1voZ8KVZNMBYnfWuXXWrqVYf9QOeCgRow=;
        b=Rxs9TAGJdbi2gKUKE0Ia70WFSl84rtSF5PPgjoUU46x6sPf+ErBKZ/VWWnG3ePBxJ8
         ATfREpXhj5hsKgAPiuK3usk1Ujp8xBvxqdRv1nKWSSG/ixFOUgHcZ67GvbOVAF9XZ2gx
         KZPNxTnnDQ+Xm1Etk9SE8bCH4hGeTOimyNMqVxJZEbL+sGu9CZym48+oTE+9eJEmuH60
         A2OOmpbaDQlLRHhdpb56Yrd+NZAeGP9v3Ppll4YoY9+WAdjyE9PZBT3N0vduCSZRpQLh
         ytudJKuxrZG3DxNfDgBvP/cLIDc1HINKyOHowV0XpQCAMSxdxQG/BwtJ1lc8vDzPY3l1
         czEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696344689; x=1696949489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OPe8AHR8wi1voZ8KVZNMBYnfWuXXWrqVYf9QOeCgRow=;
        b=LGs+ez0MiKyOYgQNr3VXo3RBWCxovpMSDFZ98lH0dw8GIaBrER4muLGHWSkR5tQSSC
         IW/SLxIfOxEgKMwSLOJJ8EZ2xlySXZu3zQwW9vPtNbvnMr5JhNh4KCSn/MMLwzyhqNm6
         6WYbAMJRDWi+3RtKrX+Sz6a/8zvZ+Cfz64OAt2QE1l8VC1O9VmxLLw24H/1fBCKYANw3
         /GFFgLXJhQgsmP4wWYbhzagYzUZZM1Ibp0zQrbLdLUQcCYmF6zlN0ZK/fjdIdnG8J9GH
         pXdXOt4Vz3+/eXc73N7d2h297XQNMKZMbO0SndQir+u5mk5JCU5NdCbImPHELcQojnDl
         GKrA==
X-Gm-Message-State: AOJu0Yz4LMS94Nuo4fUAdsfkdS/Vaq0KN1fIwAsJ5t15EGjpuJfNGQgS
        pn4khuuBMCwSw+Yrl+evisvUyQ==
X-Google-Smtp-Source: AGHT+IE7WkAhpO4uOd0mSjQYrlfWjfBqmbsmbHR1es665edFUjbmy7dIdzgSyEHgJJYKi7QK9qaTsQ==
X-Received: by 2002:a05:600c:2948:b0:405:3f06:c07e with SMTP id n8-20020a05600c294800b004053f06c07emr12250543wmd.15.1696344689690;
        Tue, 03 Oct 2023 07:51:29 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:1f2d:3479:a5de:fa35])
        by smtp.gmail.com with ESMTPSA id c15-20020a05600c0acf00b003fe29f6b61bsm1462773wmr.46.2023.10.03.07.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 07:51:29 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-pwm@vger.kernel.org
Subject: [PATCH 09/36] gpio: mvebu: use new pinctrl GPIO helpers
Date:   Tue,  3 Oct 2023 16:50:47 +0200
Message-Id: <20231003145114.21637-10-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231003145114.21637-1-brgl@bgdev.pl>
References: <20231003145114.21637-1-brgl@bgdev.pl>
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
 drivers/gpio/gpio-mvebu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index 67497116ce27..8fada9cd258a 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -345,7 +345,7 @@ static int mvebu_gpio_direction_input(struct gpio_chip *chip, unsigned int pin)
 	 * Check with the pinctrl driver whether this pin is usable as
 	 * an input GPIO
 	 */
-	ret = pinctrl_gpio_direction_input(chip->base + pin);
+	ret = pinctrl_gpio_direction_input_new(chip, pin);
 	if (ret)
 		return ret;
 
@@ -365,7 +365,7 @@ static int mvebu_gpio_direction_output(struct gpio_chip *chip, unsigned int pin,
 	 * Check with the pinctrl driver whether this pin is usable as
 	 * an output GPIO
 	 */
-	ret = pinctrl_gpio_direction_output(chip->base + pin);
+	ret = pinctrl_gpio_direction_output_new(chip, pin);
 	if (ret)
 		return ret;
 
-- 
2.39.2
