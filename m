Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89D4D7C53A7
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 14:22:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346769AbjJKMWV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 08:22:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346883AbjJKMV5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 08:21:57 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 787F31BD8
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:10:30 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5046bf37daeso8853223e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697026196; x=1697630996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hnHBRfmIODSTWCjwzxjk920VZIB9kQcoosTVsaf2qL0=;
        b=v24PuOjcTzGp0dh2Iu29GIIH7mSwc8A/2AgjDyUlJSPrOePMGqiWAA7AtRuOtt5T48
         ZhoqNtiPOIZ2tcmaSezB1FCEZ7VB6hIjRVx3SdyXiBtmTvh7brTWI4zKgNoXG5lR8fNo
         IDimzhlRIkd5xoxHcPH+oO+3RP4OyEFqQ+CR1W26V4LOZjfT4gvZBIwh1v1ajz7eUZR9
         x8Vy5sqWFI/wgs3KwVEJHxTtdN1RVlbiLr+Zp9lORqSUUGOvRPWbid8lzlQBcQnkYGnf
         +QBAX/dqns8j2NeFA52HDvbyhxWgRRhvnzAq16nEbg3te2ORlCO5gVt2Lefzi2y/F3oG
         BBAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697026196; x=1697630996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hnHBRfmIODSTWCjwzxjk920VZIB9kQcoosTVsaf2qL0=;
        b=IvXwJuYI34xKY4nV0a+NfCJt18NMr5Obef2fjXLtkrh1G+7/4fQnsOmBJ8nKQDwZm9
         jHXatLC2GMofcD7nc2LwrA/LofNoYHGqn2d8KJdPq/2WkDqp5wJMxELlkHWDoChw/2sV
         Sd//gLX1ymkcJmlMVGT7GOwWabTahCws2MpUsE2poe9die+sWZA70RV+C1jnEH1uGfTg
         Jch06mGnpWnVWnvXlrhi6PiGsHYR+0aMWXov1payiYxp9xBG1FrgwK9dkeuJh4Mgoen2
         dWV1/vpfxCBUgDaX/OIZoeaTY2+68CBIXv5YThHPYNp6quVcdRNWUW9enZRMU/NNXpmg
         ueXA==
X-Gm-Message-State: AOJu0YwdLoxaCD+4KCpoFNsSixCrUCRckaxWhjbPC12XUSAYt+z+j+sP
        W5uB/qMzZz8H1F3KFItebRnshLvJ4RSgnacgZos=
X-Google-Smtp-Source: AGHT+IHiLET8Kdxt+n+ntqcTD8EU7hvexgq5tOthMl0H0anAtL86DL6NDxtysNs/9SknJ9KKmwY/QQ==
X-Received: by 2002:a19:771e:0:b0:503:555:4000 with SMTP id s30-20020a19771e000000b0050305554000mr15204373lfc.25.1697026195947;
        Wed, 11 Oct 2023 05:09:55 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:e551:3946:26fc:f94])
        by smtp.gmail.com with ESMTPSA id w21-20020a05600c015500b0040652e8ca13sm19012253wmm.43.2023.10.11.05.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 05:09:55 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 53/62] pinctrl: axp209: drop the wrapper around pinctrl_gpio_direction_input()
Date:   Wed, 11 Oct 2023 14:08:21 +0200
Message-Id: <20231011120830.49324-54-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231011120830.49324-1-brgl@bgdev.pl>
References: <20231011120830.49324-1-brgl@bgdev.pl>
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

pinctrl_gpio_direction_input() now has the same signature as the
wrapper around it so we can drop them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-axp209.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-axp209.c b/drivers/pinctrl/pinctrl-axp209.c
index a6eb3b866a23..2b4805e74eed 100644
--- a/drivers/pinctrl/pinctrl-axp209.c
+++ b/drivers/pinctrl/pinctrl-axp209.c
@@ -124,11 +124,6 @@ static int axp20x_gpio_get_reg(unsigned int offset)
 	return -EINVAL;
 }
 
-static int axp20x_gpio_input(struct gpio_chip *chip, unsigned int offset)
-{
-	return pinctrl_gpio_direction_input(chip, offset);
-}
-
 static int axp20x_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct axp20x_pctl *pctl = gpiochip_get_data(chip);
@@ -474,7 +469,7 @@ static int axp20x_pctl_probe(struct platform_device *pdev)
 	pctl->chip.get			= axp20x_gpio_get;
 	pctl->chip.get_direction	= axp20x_gpio_get_direction;
 	pctl->chip.set			= axp20x_gpio_set;
-	pctl->chip.direction_input	= axp20x_gpio_input;
+	pctl->chip.direction_input	= pinctrl_gpio_direction_input;
 	pctl->chip.direction_output	= axp20x_gpio_output;
 
 	pctl->desc = of_device_get_match_data(dev);
-- 
2.39.2

