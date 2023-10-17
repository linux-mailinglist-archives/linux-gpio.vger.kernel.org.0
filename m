Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4462C7CC25C
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 14:06:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343667AbjJQMGk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 08:06:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234997AbjJQMGG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 08:06:06 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C157310DD
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:14 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b9338e4695so73181281fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697544311; x=1698149111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2gwFIIe2dfNDoGPAPdODaCL9BQnYwvvv05SCfNCv7tA=;
        b=lT367uBlb6sO5KXgrzhqkqk2lngX6LCcNuxCBeTvBRj7E1IT3xMYdlRNObF6YWUYlE
         LPiKXwOguC4oc9ASr4thH40jZwbRjqA7eoYqd44CsUHNu3rKzbhU+G8HuNA6M87khGq9
         ab0e/QHHWcClc/qeVM9DZsHSKGFbQ/CvRLwFTsunnf6HspqlKfvRTvGIBFHcABj12oHS
         4zc/7NhwO5wMAzjU4XM40UHTMzI3v4g4pEcXw0LlmTHkpImDGYxhwyynualDpkCHJXU8
         pdEWHUsVrrkf8tQ3iMjijGLAeNl3aoAqnfhtQm77vV2+8E1/j1CHdSHrJWxTc8b4+5d2
         AF5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697544311; x=1698149111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2gwFIIe2dfNDoGPAPdODaCL9BQnYwvvv05SCfNCv7tA=;
        b=WuqmsutN7Jt2RcGb/FC6ImtvDv9HV3hZ2kMRTx601Z8Ll2qPvMEdvn1v997umKv1dC
         pN/Kg7TIPgjbXkfC7Hvt3JynolDT2Tz/84CgUauoAwFnl9zMfmguZz12HolxAENV7uXe
         kAA6pVv/gYKfNxS/++n1BbPDeslS01UUC1qLbWCDkZo71Wo1A7NP/tbMFIHz4oF9WCzw
         PAzx+gpyiAgDN23dIW5CX0CP4CvZZMocYWRNzrJanXXE0JDBTad6FUoiaZfcKoFA8mtj
         j71dXGiwNXyKSjObWVHqciXlRyqQUulVDqQcK+3yGM8P6q8mIzl9Q1kUpUT/yFWyGPAy
         KeYw==
X-Gm-Message-State: AOJu0Yxlfav0FzT1QGpstSmo/f5nw/PMRP5TXDSV+ySY6XiV28FtBRMB
        oqwsw7iaqT9qWC/QL8uaQ4g/NNolrm/JAOvsML8=
X-Google-Smtp-Source: AGHT+IFPnfwTXwP5Ba7yZVLbUSatrBfgtyIfQlbxAbURCyrKo6+vT2Y+zU/Iq19GqXfNqUWmmmmHBg==
X-Received: by 2002:a2e:9c55:0:b0:2c5:d10:248f with SMTP id t21-20020a2e9c55000000b002c50d10248fmr1362032ljj.49.1697544311725;
        Tue, 17 Oct 2023 05:05:11 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f1ee:b000:ce90:ed14])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c224200b00405442edc69sm1353859wmm.14.2023.10.17.05.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 05:05:11 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 24/73] pinctrl: mediatek: moore: use new pinctrl GPIO helpers
Date:   Tue, 17 Oct 2023 14:03:42 +0200
Message-Id: <20231017120431.68847-25-brgl@bgdev.pl>
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
 drivers/pinctrl/mediatek/pinctrl-moore.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/mediatek/pinctrl-moore.c
index 889469c7ac26..dc41ffa31357 100644
--- a/drivers/pinctrl/mediatek/pinctrl-moore.c
+++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
@@ -512,7 +512,7 @@ static void mtk_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
 
 static int mtk_gpio_direction_input(struct gpio_chip *chip, unsigned int gpio)
 {
-	return pinctrl_gpio_direction_input(chip->base + gpio);
+	return pinctrl_gpio_direction_input_new(chip, gpio);
 }
 
 static int mtk_gpio_direction_output(struct gpio_chip *chip, unsigned int gpio,
@@ -520,7 +520,7 @@ static int mtk_gpio_direction_output(struct gpio_chip *chip, unsigned int gpio,
 {
 	mtk_gpio_set(chip, gpio, value);
 
-	return pinctrl_gpio_direction_output(chip->base + gpio);
+	return pinctrl_gpio_direction_output_new(chip, gpio);
 }
 
 static int mtk_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
-- 
2.39.2

