Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32C737CC2A3
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 14:09:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234942AbjJQMJm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 08:09:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235016AbjJQMI4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 08:08:56 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31AF92D64
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:59 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-507bd19eac8so926867e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697544358; x=1698149158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EYaubAEjb8jIz/ZTOGnBQzJ0oe0Kyc/ixkibc3BZPzU=;
        b=TxCPmBsDFrIYBZbD1BD6MTPMmcvonyonBh7l+lkpxOGn71qvhw8lZPIqd2UAuohLQI
         JWu/9LZ7CBWRNAtZ2GD4Licp58/3ixH4tmm8+62c+5mWfU2O1DBuuzHaUSIlDlY5iD8v
         pr3tbqDxk/S/0lxPLv5J4WjoL4a4uGOmhvN8C+e94uMJ9BTZG0LRLCXDbsVZ1TtRXwof
         cHQs3mUuDf90758mI2eyYQXI2o6iaqQ60fSZ3rRA0dMczefrOF62H0WK4V/pLpMKD1e/
         +AHCSTahL5lUZ9fsSH28HP6AjcVaFpnkaIUhBe6OQHx/ftvNGDKXhJ5wLNta7/aGTVc/
         +M3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697544358; x=1698149158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EYaubAEjb8jIz/ZTOGnBQzJ0oe0Kyc/ixkibc3BZPzU=;
        b=nukf6eyQ84lXB+d3unyusyEQJmYgJUSpzqi1cZ1sJBwjYQsS8nxt0v2H6wnjeXLJ3P
         MoudWJw5+fY44awJNAWoZdjnrNfEmvZeFpPwHWSS4spewXPffaN3Xt9/5l8juuEs6NQY
         GpCkXDq20tFh+GsX573jMZxe+fxXkRNAsyb1E13wh3s78pps8f0n2bWf+rrrUSqbMyL3
         /yQgNkl0Oia9UekKCbNmQPjMydB74dgCHaW7XCP+PbmU/H74MHH2Q7aIoWF+BPoIKWyJ
         VqhQOmSg2Kwzvx2jr8HHZbKowrbkGv2pSVynGJGBaq4kW6tdmHZLYbZFhr1dsapLOoON
         lg1A==
X-Gm-Message-State: AOJu0YwhvQzt/6EBG5DYooSroU1lNH5iPjeyKmsZIndidouwamyBDqy6
        8JTBxC33KU8dBvSEbd4tJtJxUg==
X-Google-Smtp-Source: AGHT+IHFfggU/iVMT2uhVuiqDu89DYpCOVc9nnY6TSYTY6Q7+HEkOQ938g+e5PqbgFZsXfapdExNfQ==
X-Received: by 2002:ac2:4304:0:b0:503:1c07:f7f9 with SMTP id l4-20020ac24304000000b005031c07f7f9mr1743793lfh.29.1697544357879;
        Tue, 17 Oct 2023 05:05:57 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f1ee:b000:ce90:ed14])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c224200b00405442edc69sm1353859wmm.14.2023.10.17.05.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 05:05:57 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 73/73] pinctrl: tegra: drop the wrapper around pinctrl_gpio_request()
Date:   Tue, 17 Oct 2023 14:04:31 +0200
Message-Id: <20231017120431.68847-74-brgl@bgdev.pl>
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
 drivers/gpio/gpio-tegra.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index adfbed62eff1..ea5f9cc14bc4 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -137,11 +137,6 @@ static void tegra_gpio_disable(struct tegra_gpio_info *tgi, unsigned int gpio)
 	tegra_gpio_mask_write(tgi, GPIO_MSK_CNF(tgi, gpio), gpio, 0);
 }
 
-static int tegra_gpio_request(struct gpio_chip *chip, unsigned int offset)
-{
-	return pinctrl_gpio_request(chip, offset);
-}
-
 static void tegra_gpio_free(struct gpio_chip *chip, unsigned int offset)
 {
 	struct tegra_gpio_info *tgi = gpiochip_get_data(chip);
@@ -717,7 +712,7 @@ static int tegra_gpio_probe(struct platform_device *pdev)
 	}
 
 	tgi->gc.label			= "tegra-gpio";
-	tgi->gc.request			= tegra_gpio_request;
+	tgi->gc.request			= pinctrl_gpio_request;
 	tgi->gc.free			= tegra_gpio_free;
 	tgi->gc.direction_input		= tegra_gpio_direction_input;
 	tgi->gc.get			= tegra_gpio_get;
-- 
2.39.2

