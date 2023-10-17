Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9AF77CC297
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 14:09:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343717AbjJQMJD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 08:09:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343814AbjJQMIN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 08:08:13 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32A512D5B
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:59 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-507973f3b65so6497847e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697544357; x=1698149157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4LZIUlewtVfNK9nVoiXqaExbYoS0xfZdDyCSvk2gByo=;
        b=jL07/cVxYCCC+CtplPPUszGZBGuwotsCU2JC63QagvjZj1sM/S0vpeVc1c1fHGO+1p
         X9NHIJcd5TjW4cQ7otTbk/ZYH263ZnunAjShlvYOUJht57WEGNYoif1BdQnUbYt3PZmd
         zQ/9rZTiNwCda9iKARCx69SNniPIlo9QgJGkyUVrSnLREpNYM9piAZN6HgWYt0uHGiBV
         kCuErqVW2T/UFbhpKW49X6eJ7yDXK4hdIYEnxDkLz+VnEUniK1eh2Q9yOiP8qZDFMcpC
         Asy0o7MaNm2SOm4ydAcmvWLMlhRMaCw+zGV9ou9QICxChJcKiZI+HaVSs7jJMrp7iW/o
         GQHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697544357; x=1698149157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4LZIUlewtVfNK9nVoiXqaExbYoS0xfZdDyCSvk2gByo=;
        b=FhvSUre/KtqaHcfJlEI+2jew0S+sDJwM0NpFXL40IdKf/hB1B5gQi11povT16gociC
         Jl5I5Ln//j6WKirn+KmcqGrRx8W/XXcXr3kQXfl6xeYYWU3ttpduq+D1+NmjfTW+AX7v
         TW+0qsy5BjMSbTJITDWuH0lNoGOsVkzoUHFi8MwrCJOPkY5XMu+Z3ixIFU3ABRIqPMae
         iaJzTPqO+6XTNpikOyHeAv2E2HwDz9Z7gFgVNoLGQJKzFBI1hNaDDOwHYs0xfKzunlp7
         j/J03Cz53J2+cM1sXSRlu73nAyAAn/1YnW/hv1MhIuCD5kLRSr3brtgLwdYkknK0E4/u
         k00w==
X-Gm-Message-State: AOJu0YzwnQwbctBSpMhADfrlUsVfSegMPpLlpJWEu7ZonJP+CCXWJWD3
        lZJEjoJNcYEiLsbo1qfItsyxLw==
X-Google-Smtp-Source: AGHT+IEsouD0yLpmwXgotL/syrsZOgAR3eI6h2ScNnUAVSqPFxbO998HY/2CIcq7NlzryOczWqHO9g==
X-Received: by 2002:ac2:43ab:0:b0:504:33da:b659 with SMTP id t11-20020ac243ab000000b0050433dab659mr1620734lfl.57.1697544357085;
        Tue, 17 Oct 2023 05:05:57 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f1ee:b000:ce90:ed14])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c224200b00405442edc69sm1353859wmm.14.2023.10.17.05.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 05:05:56 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 72/73] pinctrl: em: drop the wrapper around pinctrl_gpio_request()
Date:   Tue, 17 Oct 2023 14:04:30 +0200
Message-Id: <20231017120431.68847-73-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231017120431.68847-1-brgl@bgdev.pl>
References: <20231017120431.68847-1-brgl@bgdev.pl>
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

pinctrl_gpio_request() now has the same signature as the wrapper around
it so we can drop them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-em.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-em.c b/drivers/gpio/gpio-em.c
index aa31c189d0ef..6c862c572322 100644
--- a/drivers/gpio/gpio-em.c
+++ b/drivers/gpio/gpio-em.c
@@ -227,11 +227,6 @@ static int em_gio_to_irq(struct gpio_chip *chip, unsigned offset)
 	return irq_create_mapping(gpio_to_priv(chip)->irq_domain, offset);
 }
 
-static int em_gio_request(struct gpio_chip *chip, unsigned offset)
-{
-	return pinctrl_gpio_request(chip, offset);
-}
-
 static void em_gio_free(struct gpio_chip *chip, unsigned offset)
 {
 	pinctrl_gpio_free(chip, offset);
@@ -311,7 +306,7 @@ static int em_gio_probe(struct platform_device *pdev)
 	gpio_chip->direction_output = em_gio_direction_output;
 	gpio_chip->set = em_gio_set;
 	gpio_chip->to_irq = em_gio_to_irq;
-	gpio_chip->request = em_gio_request;
+	gpio_chip->request = pinctrl_gpio_request;
 	gpio_chip->free = em_gio_free;
 	gpio_chip->label = name;
 	gpio_chip->parent = dev;
-- 
2.39.2

