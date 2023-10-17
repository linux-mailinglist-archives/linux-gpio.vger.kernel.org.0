Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E0B07CC261
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 14:06:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343710AbjJQMGu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 08:06:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234953AbjJQMGS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 08:06:18 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 442C010F5
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:15 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-406402933edso55833115e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697544313; x=1698149113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BYro6G3w7HrOUdE8TTDPmtksHa63Nm7WFMk5y+Hqbus=;
        b=HO3cgG5HtWVNL/eHwjKF9OxvlSI3gRHsXFysHisKTvAg1Hl21pjrperPF6HxhojRUj
         tXZ0LIH/wA+uieRIeu7An13uU8WpbocMbhBHYDgzbMBZpn1nVRMM1dxvQALfihBpk0sy
         XZKz2vSftvDT1KkQbFqEm2+2ZhpBX7Oz4qEZKLUFAC6j4PeX15f4yIF0vIiLn5jMKLcp
         OiLrBjjZr9CCvTdQL5OiUnpV7UxQrq9ySBTzI93x3ooxPbOcNyODzf4LoA1Csgsd4w53
         AsnBD6PtTD3m+zs/GwKznbCLQmF9QRDDN3qxG9CN9JCnsAuA6KG+kyMjOhuQFXAA1+mU
         lPSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697544313; x=1698149113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BYro6G3w7HrOUdE8TTDPmtksHa63Nm7WFMk5y+Hqbus=;
        b=GCxcH2hLy1jRYi7qBWRW1AohHTMiQ+IZVRtuEyqErgiaWjbQcADaGhhfqC59pR6RAc
         EQKu6OAQCh5Kabhd8ssZ7+PZ7Yl3tj15Eh0A58SOJS2fxrZ/2jVFdgHeXgHYSU5Ifypq
         SgFmu0byojVBGH4LxGvZ2J3761crel6vcMpwhLRQADcScNwAWuo40zqKJfPfDN7oq2Uw
         tszR+yUOv+6x1hMEX8vfFquL/Ptgqzrd2sK7f1AoJAcruKAl8PvD2BFeD4lFb1ID7QKS
         tKL0hqeHQuYb5P00FkcRo2JIgL+uYUckYgzNtNZ9dB4n9beW+g3sfBNfolwBPD7b2qHs
         gjfg==
X-Gm-Message-State: AOJu0YxqTRZ0zWxupEUbs9oQetAnU+l4QXEEK93slEymADmQpT8NEEuN
        SydRtzm6b3tDjYDAvnA3mY5s8Q==
X-Google-Smtp-Source: AGHT+IGqgrFNJnX4083DaEGlzOWm4AX6euSW8yG2lHeltS1Z8qyJDpdDLodz8VIumOZY4JmbU+S6tQ==
X-Received: by 2002:a05:600c:1c96:b0:407:7ea1:e99f with SMTP id k22-20020a05600c1c9600b004077ea1e99fmr1416956wms.17.1697544313282;
        Tue, 17 Oct 2023 05:05:13 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f1ee:b000:ce90:ed14])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c224200b00405442edc69sm1353859wmm.14.2023.10.17.05.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 05:05:12 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 26/73] pinctrl: mediatek: paris: use new pinctrl GPIO helpers
Date:   Tue, 17 Oct 2023 14:03:44 +0200
Message-Id: <20231017120431.68847-27-brgl@bgdev.pl>
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

Replace the pinctrl helpers taking the global GPIO number as argument
with the improved variants that instead take a pointer to the GPIO chip
and the controller-relative offset.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/mediatek/pinctrl-paris.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index b7cb5a1f1060..14b151aec2f9 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -916,7 +916,7 @@ static int mtk_gpio_direction_input(struct gpio_chip *chip, unsigned int gpio)
 	if (gpio >= hw->soc->npins)
 		return -EINVAL;
 
-	return pinctrl_gpio_direction_input(chip->base + gpio);
+	return pinctrl_gpio_direction_input_new(chip, gpio);
 }
 
 static int mtk_gpio_direction_output(struct gpio_chip *chip, unsigned int gpio,
@@ -929,7 +929,7 @@ static int mtk_gpio_direction_output(struct gpio_chip *chip, unsigned int gpio,
 
 	mtk_gpio_set(chip, gpio, value);
 
-	return pinctrl_gpio_direction_output(chip->base + gpio);
+	return pinctrl_gpio_direction_output_new(chip, gpio);
 }
 
 static int mtk_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
-- 
2.39.2

