Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F10247B6C24
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Oct 2023 16:51:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240190AbjJCOvc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Oct 2023 10:51:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240119AbjJCOva (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Oct 2023 10:51:30 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9CF9AB
        for <linux-gpio@vger.kernel.org>; Tue,  3 Oct 2023 07:51:27 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-405497850dbso10117325e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 03 Oct 2023 07:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696344686; x=1696949486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rnSyRFONQXZbzLQecSY8AhAVmo1bzeslrd4fJIiBj1I=;
        b=nkWeGlNPg9NhNQMbp/rbOyfILXGNkPONAHimAntMyErTQoFonUnwOz3UE9B34jiSqa
         jFS20SxF8B8lWS/wf+ZI79vZStYwXw9jQDTzRC6QN/pHdvlvwF8fylTAn9SD0TZg3NXF
         Ly6zmpt/u2/T37iNCTGgdtxfMCWwXTsOweDv1B1xJTU20EcHJHQTmwKUQnLjtfqWzG90
         srzU+/kbSZlCQpWnOD2Wfx0hIohFH+qr/8NGb4ZIuQNA+oVfTyVe5zW2EQ++NxPgkQ/u
         v3L85FFRUtnBuMAAaQgvzNGXLdTBUq7CLRizvmGCAhl3tfcCK41HBmlnk7Op/TWyJDJh
         InJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696344686; x=1696949486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rnSyRFONQXZbzLQecSY8AhAVmo1bzeslrd4fJIiBj1I=;
        b=QhiK8IXynRXXgxOnCPc0xvvV++A/Kq2lxl/cYL1eJDehWTESr9EvZ+WCMzdeJgxQsx
         ISvmiseMIVWsAO7U/57E+1j6PYVy9vWyoGNk+EBShbmV7EY564HYLO5NMW3dtcaOn4GR
         UkATpm+7BZlwlwLTj/M3hKfvOVAf8y5I4EMjYBEDtBbMAtFBP+947m56MVjZgqe79NW9
         pmtvxpbRhe2VKs7oPKDKrSQhzQxtFYdhKOBVhCRN0mvCjATEI/bUeumOt8i5pic044tl
         vGRwcmgffdwwAkZ121jZ3Hf6c6yL08AoWzRlH3ZgJvj5DW+Gj2uYJfJnvbJJz9sIAq/L
         h7FQ==
X-Gm-Message-State: AOJu0YxW2sjlcnmPV4FFUA9yJ90jh5XjxwQCPLXRFk9UHJuTlcjgheha
        tZmpH27XPpWRwakH9eIQaso6sQ==
X-Google-Smtp-Source: AGHT+IE/d/T5gIQJBv9cUVoinw/x+SzUdLVE3MBtRPUj3RG6vRWgwvHJK4xyBUcEXira5NegMHjjqw==
X-Received: by 2002:a05:600c:2113:b0:405:1ba2:4fd1 with SMTP id u19-20020a05600c211300b004051ba24fd1mr14474158wml.24.1696344686324;
        Tue, 03 Oct 2023 07:51:26 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:1f2d:3479:a5de:fa35])
        by smtp.gmail.com with ESMTPSA id c15-20020a05600c0acf00b003fe29f6b61bsm1462773wmr.46.2023.10.03.07.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 07:51:25 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 05/36] gpio: rcar: use new pinctrl GPIO helpers
Date:   Tue,  3 Oct 2023 16:50:43 +0200
Message-Id: <20231003145114.21637-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231003145114.21637-1-brgl@bgdev.pl>
References: <20231003145114.21637-1-brgl@bgdev.pl>
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

