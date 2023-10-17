Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3F3B7CC234
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 14:05:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234893AbjJQMFG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 08:05:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234836AbjJQME7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 08:04:59 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13AEAB0
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:04:57 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2bfed7c4e6dso69720661fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697544295; x=1698149095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H58FBovONkBFAtGhn37zN4A9drmVE/E2kcDVb0X5d1o=;
        b=fX6d6qEdmAsmceVcSpA7mQ7qD+xAzTnz9mQ8KUMGvXzR/Ipmzboud/6TS+ddyZqoos
         t2iiclvUWhgasFMv/tkzsI5GqSU0l4IfXTL+JNDFKj2lcPOAJT1HeNW4oAwrogYM/4c+
         yT8zw08FMi83BAflBF+SrmDwKYR+l9VmUyz2ikInkdJ2rWUR9STPMCYQfnm1WpUHJxIW
         qN/1V1n3XYg24fWI9ieVSbs8yErODyfnKeTwer1EK/IDvbr8ELXWST733fIrgijHZtNR
         ObcyEkiWljy8aqEj34ue3x3WP0u1e4HXXlutwATG+h3s2XGoUAZ1v2hKaqPfJwrfEhzH
         yRoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697544295; x=1698149095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H58FBovONkBFAtGhn37zN4A9drmVE/E2kcDVb0X5d1o=;
        b=FdDxWUPsb1cA3gs+elwgM2D6J7GUiYhrGmoT/GxPnibxcUYL4vtrKc1zSeyyWlKKW0
         0MVcmaPgASCHNZSl/tnAi9661YDeUrdaJYo5e5NxGNTprjYBxqGdJKz2sHkcbHhfxnig
         BrSIH07bSDOhyjQIPDgeKxZo0vyzTxrng0F4YlVkyVNnD+eSJCeknE0b40mm4ftw4QhD
         Nd+ahBh6Fpp0Ea50DvSEe3bbUlHhCj/4fD5Y/Jq0k1C2qfP9uvjC0D26fRt1ooyhX/2/
         3zuyUmsE34QyA4+RPifWVah0Pu0s5j3y/3y3rn4fZITME8qn2lwCKuCz+zQe/weoksVc
         sAhg==
X-Gm-Message-State: AOJu0YyV018Ix1qhHemcCrlpIGY5Z9g0kYvEXfXrVxVFnvs4KqmPuJEB
        yDMAd7g3lL2pBfbgi8Gj/OqlBiUCxzvf9lzjvUw=
X-Google-Smtp-Source: AGHT+IG2o2TVreK+sIzBOu5Lvk/VaxgdmDKdcIm9WFJlnrjvvhxD0ilbK3saJQYIFzZIHRUVNO22rQ==
X-Received: by 2002:a2e:9396:0:b0:2c5:275b:c5fc with SMTP id g22-20020a2e9396000000b002c5275bc5fcmr1585322ljh.0.1697544295299;
        Tue, 17 Oct 2023 05:04:55 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f1ee:b000:ce90:ed14])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c224200b00405442edc69sm1353859wmm.14.2023.10.17.05.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 05:04:54 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 07/73] gpio: em: use new pinctrl GPIO helpers
Date:   Tue, 17 Oct 2023 14:03:25 +0200
Message-Id: <20231017120431.68847-8-brgl@bgdev.pl>
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

