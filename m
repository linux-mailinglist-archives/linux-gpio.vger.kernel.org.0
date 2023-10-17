Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC56C7CC307
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 14:23:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235266AbjJQMXB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 08:23:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235282AbjJQMWq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 08:22:46 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C07222718
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:52 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-408002b5b9fso3322385e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697544350; x=1698149150; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+7umkbBqVb4ekwk4qPLSYyQOmuMCZz6eMQtDEbYpxk8=;
        b=DTbSWCKpDG/jUEeSfmrLvMU4MEY1pibSgoetUeyDSc+/x0/6lvrx1lUTQUwLlMPyFZ
         VSNeSdC/2VI8jagtMok7JI1bi94Nl/Tnq5EOYnK0bE21KdudYVkcXnqXqMfErbtzj7Z9
         M1WfIMhRYbUYl8U9PfX/+Oy2IrkdGqNmnZ63LFCw9zJATt4/Jirw8c1+PuILFjIgke6q
         gqHKxL3s2WehVnFzCQyRA36cSeCWljMVTxrAu+y/vQn2MjINnuCd47u1Kmdl9SC8BOLe
         hE22VdKyJ2IDvyiRBK8eW0AxnLBJTGbuAMOA3M1fxrvrMjPEDHfK+8yySMlsaBk8cd0L
         Mhzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697544350; x=1698149150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+7umkbBqVb4ekwk4qPLSYyQOmuMCZz6eMQtDEbYpxk8=;
        b=CCr7Pi6JqSBhRO3kIaZVnb2QkFgZ3mdxNtz0zhOImknSoFveRCB/YNVpdmkYAdPLs4
         R59IYplHosAaqvA9oxmyzUD6IPJvZsEmYcns+uRqT71xdB1SYgjbAyH9xVif1bI5xHTu
         5RJrtZ048fVHDp8+LBJta91KTw3W5HZVtrx/dZmiDQXJmMkUAb+TrTMZn0WC8nPT+5hD
         kgjEx8voFPwLQPiIgNvZdWS/it7jgM+D8Q+9G6pAz/ud5raqqXYVHGPc4iKCAafmBT+L
         0nOzGEWGHmJX3zRRsrmwZvTrks4+NqGab6OXoIZCJOC/1Qy6MlIn0Zl2Jmu+8ASoMK3T
         nPPg==
X-Gm-Message-State: AOJu0YwAz+MekvXfuIQJflva+EYXHC+yIOF8e+Ga/xfZGVj6oQt+28sG
        QClakC20EciDXMydpFbtO4BWKA==
X-Google-Smtp-Source: AGHT+IE0eRbJCAPW2WyjT/DeIQ3VS3VGyTRM4QXko4rn1KqlJyr8bR674mvIx143owLp7uPcfTMmJg==
X-Received: by 2002:a05:600c:1f8f:b0:406:849f:f3cd with SMTP id je15-20020a05600c1f8f00b00406849ff3cdmr1512482wmb.29.1697544350581;
        Tue, 17 Oct 2023 05:05:50 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f1ee:b000:ce90:ed14])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c224200b00405442edc69sm1353859wmm.14.2023.10.17.05.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 05:05:49 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 65/73] pinctrl: cirrus: drop the wrapper around pinctrl_gpio_direction_input()
Date:   Tue, 17 Oct 2023 14:04:23 +0200
Message-Id: <20231017120431.68847-66-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231017120431.68847-1-brgl@bgdev.pl>
References: <20231017120431.68847-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

pinctrl_gpio_direction_input() now has the same signature as the
wrapper around it so we can drop them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/cirrus/pinctrl-cs42l43.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/pinctrl/cirrus/pinctrl-cs42l43.c b/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
index 1ba89cf279fb..012b0a3bad5a 100644
--- a/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
+++ b/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
@@ -506,11 +506,6 @@ static void cs42l43_gpio_set(struct gpio_chip *chip, unsigned int offset, int va
 	pm_runtime_put(priv->dev);
 }
 
-static int cs42l43_gpio_direction_in(struct gpio_chip *chip, unsigned int offset)
-{
-	return pinctrl_gpio_direction_input(chip, offset);
-}
-
 static int cs42l43_gpio_direction_out(struct gpio_chip *chip,
 				      unsigned int offset, int value)
 {
@@ -551,7 +546,7 @@ static int cs42l43_pin_probe(struct platform_device *pdev)
 
 	priv->gpio_chip.request = gpiochip_generic_request;
 	priv->gpio_chip.free = gpiochip_generic_free;
-	priv->gpio_chip.direction_input = cs42l43_gpio_direction_in;
+	priv->gpio_chip.direction_input = pinctrl_gpio_direction_input;
 	priv->gpio_chip.direction_output = cs42l43_gpio_direction_out;
 	priv->gpio_chip.add_pin_ranges = cs42l43_gpio_add_pin_ranges;
 	priv->gpio_chip.get = cs42l43_gpio_get;
-- 
2.39.2

