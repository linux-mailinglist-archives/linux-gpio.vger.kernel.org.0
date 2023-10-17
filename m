Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDF807CC22D
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 14:05:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234637AbjJQMFA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 08:05:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjJQME5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 08:04:57 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43B55FC
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:04:55 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-40776b1ff73so32488045e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697544293; x=1698149093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vai4SzqfuocTRSn5ctHCW9VKMc1EsxJBBmmicKiWbek=;
        b=u4qfHNLqnys7uHtSLjuIw2hM1O0yo5BQuVJUAFnLyIxGZEsIUwbvzgd8YX4ir2dab2
         SkZ9GUxW8nGlW4ALVEHQTRpc+VEGDLRWNLKxI2xS8gtYtu0X3h3za5Kyx33huyQRzmdf
         PXwFg7Vd7dORjdGSNm6f0bVxnniaj4PBkx7GNWKo7g2+OAZ29qY7uWlrWk7qvn7hh5js
         qgvd1rJmCXOFabl6ToJINWl/GyTK0mNRVqu6NbRY6aISTMDbYjw+bs9nUo39ATz7pefY
         hX27EUadYldk2ulIJZXVpj+0cOevq/hAlA/6LLuLGLjYTjAiAR+HtT0YnX2FiQdN3Rrn
         8YLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697544293; x=1698149093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vai4SzqfuocTRSn5ctHCW9VKMc1EsxJBBmmicKiWbek=;
        b=hbuuzwfF4aR5v7tY2yw0xSCCFyOezuNT6MKYplXEo/JkOigA6Yu0WgpA04Df89rA29
         a9Vaiqdmv6O4z9KWlF+hqomBZEpmRb04y3e6iouWQBEWWUto/o24pS0d69ycqoPrq1tw
         GoayM8icN9p6nFYsDfMHxpGFyPz7DzRCQIjE+OhJ15VWzvcRenAN/JtsG8ih4FtKx2uX
         OUAKH3jxTCd8n7ZGLc+FMmKBioOU/B9jpfNIbZy27Iw49tUERYSl7n1A0gs0R/MOCo4b
         nYkihF+whsNqWn0TyCxGblrTlq8BJn9jrtluY5VSF5zroKP8e/Gq9Yb8kaNEcx/N7b/8
         FoKw==
X-Gm-Message-State: AOJu0YxWvtwCLd9yKCDchZ97XJvLfEJxgikmS+6sdi1ovrJ8BcyhrXEE
        hTMRzgSW3lEpqMAPphLYFhO5dA==
X-Google-Smtp-Source: AGHT+IHU7NuREtU+mqWpMnxYMyb4RRiRqkHq8pgJY1a4J3z3rIp2pbmFjoy6xY63ywlgfvgfuWxy/w==
X-Received: by 2002:a05:600c:3ca3:b0:406:6964:7e96 with SMTP id bg35-20020a05600c3ca300b0040669647e96mr1657118wmb.13.1697544293118;
        Tue, 17 Oct 2023 05:04:53 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f1ee:b000:ce90:ed14])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c224200b00405442edc69sm1353859wmm.14.2023.10.17.05.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 05:04:52 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 05/73] gpio: rcar: use new pinctrl GPIO helpers
Date:   Tue, 17 Oct 2023 14:03:23 +0200
Message-Id: <20231017120431.68847-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231017120431.68847-1-brgl@bgdev.pl>
References: <20231017120431.68847-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
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
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpio/gpio-rcar.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index d8b1baae6357..47121e1a6d4e 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -275,7 +275,7 @@ static int gpio_rcar_request(struct gpio_chip *chip, unsigned offset)
 		return error;
 	}
 
-	error = pinctrl_gpio_request(chip->base + offset);
+	error = pinctrl_gpio_request_new(chip, offset);
 	if (error)
 		pm_runtime_put(p->dev);
 
@@ -286,7 +286,7 @@ static void gpio_rcar_free(struct gpio_chip *chip, unsigned offset)
 {
 	struct gpio_rcar_priv *p = gpiochip_get_data(chip);
 
-	pinctrl_gpio_free(chip->base + offset);
+	pinctrl_gpio_free_new(chip, offset);
 
 	/*
 	 * Set the GPIO as an input to ensure that the next GPIO request won't
-- 
2.39.2

