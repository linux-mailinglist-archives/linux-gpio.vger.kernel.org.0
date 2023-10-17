Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 102167CC263
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 14:06:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343677AbjJQMGz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 08:06:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235024AbjJQMGY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 08:06:24 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B2981701
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:16 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40566f89f6eso62509785e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697544314; x=1698149114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L71FhZFxQS/v+Kb2FZmLTi+Zct1vRjkWo7sxYZsb/pk=;
        b=OzWcgGNq9Oxgo6yJZAWnlQ6vMj5oNCtBRrN96cSd/P5R3mc6Uy/m4+JnbAJTpU4bJS
         hOOraKK+gd2alG7JczrPlLMsYt1GwFVTXXxCbVzLk989utgfI7vf/2t4QwiehxRyIvHf
         MLkpZrz0rAFCHaJ1r1MkQFb6oOMSk0uerIlF7bfJJYpeyAPRKOEAJs7SVPM+m7wmzvTw
         vSYlO6sKjfCf+gAZyTajgnEt7ysSEzp84/EJVpwpo3Nx88e5dnLWu5LPkHXcVPLyoDqX
         /0lbRh2ceStmfHvkOdtccGwmP6WfuWqXTMTUaOA24WYTNgRmjoRNS3QuNgB2e/205O7I
         zTzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697544314; x=1698149114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L71FhZFxQS/v+Kb2FZmLTi+Zct1vRjkWo7sxYZsb/pk=;
        b=p11NfYaIsUBcxc144BVjqhh3DMwHU48A5A7NNkY0TuqO731BD13dZUUBxgWHcTvZr2
         ds1gk94I1Z1DGe7L6MQiOGDRlqheMeicfL2naD1kOGLpZlTJjwVebGT/CtcaopqT1qnm
         kujs80Z0T8NFFOIc3hqa7vovMQn6OpYNWQiDBiMSA3TgThcE2RDbBISB5l4IlSwNhmzr
         Xc/nhgWY5j0l0dN+SbfL2G6RkfMlAqOOOAJNnN4xhfS8fwizRm35qdPjPTwy5vTgmdae
         21vosD04YnUSj7RkHpvdhH1UvMsaXQcC7qd6LMkP4SycQjI34x2n9h8G/UwJ78pePDMy
         R7Rw==
X-Gm-Message-State: AOJu0YxuV0xTeEHIugpApUPdozbQKFowt19be81R0WTqReGsglvVYETU
        fPSC54Pj7ZZusrW4RRhhHjKqSw==
X-Google-Smtp-Source: AGHT+IGyY0BhYJoi9GBHM2koiMY1E4AKDEZvAJalE0lYHdYx8MM0298X43yGetUqZJGFXD0K/KKLrw==
X-Received: by 2002:a05:600c:450b:b0:405:359e:ee43 with SMTP id t11-20020a05600c450b00b00405359eee43mr1665215wmo.1.1697544313995;
        Tue, 17 Oct 2023 05:05:13 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f1ee:b000:ce90:ed14])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c224200b00405442edc69sm1353859wmm.14.2023.10.17.05.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 05:05:13 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 27/73] pinctrl: axp209: use new pinctrl GPIO helpers
Date:   Tue, 17 Oct 2023 14:03:45 +0200
Message-Id: <20231017120431.68847-28-brgl@bgdev.pl>
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
 drivers/pinctrl/pinctrl-axp209.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-axp209.c b/drivers/pinctrl/pinctrl-axp209.c
index 9f5b3ab8e184..d7f081f1d1f6 100644
--- a/drivers/pinctrl/pinctrl-axp209.c
+++ b/drivers/pinctrl/pinctrl-axp209.c
@@ -126,7 +126,7 @@ static int axp20x_gpio_get_reg(unsigned int offset)
 
 static int axp20x_gpio_input(struct gpio_chip *chip, unsigned int offset)
 {
-	return pinctrl_gpio_direction_input(chip->base + offset);
+	return pinctrl_gpio_direction_input_new(chip, offset);
 }
 
 static int axp20x_gpio_get(struct gpio_chip *chip, unsigned int offset)
-- 
2.39.2

