Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE8777C532F
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 14:11:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346821AbjJKMLF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 08:11:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346707AbjJKMKP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 08:10:15 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C648D4E
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:09:42 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-40651a726acso62579545e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697026171; x=1697630971; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rt4PWI36LT1R2nI/NQBkxbO8D5dykJYeFhT6i3lm7MU=;
        b=yX+WZ5YkbR7Yd0Tmxx9CdpWcMFstVJX7wUYthIDjtJiFsFIVtql0qlx9hEdgFY9/WG
         r4IOLJzuT0BBNzw2MN7xRTRwFx1ji3B0Mh9UbKvm/M2Yv2/xjhGiIs3O/lAE0ceTROxt
         +DiXzePtRHupRUhF0UXy0AxGiQmPNjKeQyfNEjWc/3RT+lxpliWaU5ng/zu5RvYc/NiS
         Skuabf2sHiQBGxIz/EZ3cJeG1C3ECLNUQoVzGfo75Cc9eAAepvvS1s4Lfn39yzTI5uul
         NJvKdlipY/rMQfYpqySj3gOCM5SdShnC/EeJtyP8SVOAQe04qCCgqxnEc2s/VNo75DJA
         LaKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697026171; x=1697630971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rt4PWI36LT1R2nI/NQBkxbO8D5dykJYeFhT6i3lm7MU=;
        b=brLQnoaX73j0VLXd4irABNNBW3LGNiHoFITWAzPdreFPDg1Fb1+vgEuMqCzE5A3264
         K5jo/csOn51vlI0udIPb9PDfeocNs/sNDopWEpakWtcyXv6JPHjk518yPdvT53cabYNw
         DO9+tBDf2s8nSLM9ow6M6xXUqn+8pFA1iz1woP322KYqY4GXNHmFztwBAvnoD/yMSXGm
         WtlGU8s2bR3T8ikX1ISHG383eB3yKrBtWaF4ERAg+0+KPhYsZ+njJVdGt5DWDHfOfGFU
         YJNMgp44Z/kDwZh6udJCtRoqCWfiLmijqXD8vNcqfZKH47qSmlFaiFbWabhEe4h28m5V
         NvFQ==
X-Gm-Message-State: AOJu0YwGo7WUh4m7BMkD2Pe7jB6RwnltdsKlS51cBi5wkEivO6mslozQ
        Y+QuBtUJhubT4kj9MNNwGUdwiA==
X-Google-Smtp-Source: AGHT+IG/SliNQFfZuZAdmiaIlb8rpLYF/FTdjbJdx1ZGEDYJYzgU59AEdCdQLFHOYUbJXiWvEusZVg==
X-Received: by 2002:a05:600c:3790:b0:402:cc9a:31a7 with SMTP id o16-20020a05600c379000b00402cc9a31a7mr18273194wmr.19.1697026170842;
        Wed, 11 Oct 2023 05:09:30 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:e551:3946:26fc:f94])
        by smtp.gmail.com with ESMTPSA id w21-20020a05600c015500b0040652e8ca13sm19012253wmm.43.2023.10.11.05.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 05:09:30 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 26/62] pinctrl: as3722: use new pinctrl GPIO helpers
Date:   Wed, 11 Oct 2023 14:07:54 +0200
Message-Id: <20231011120830.49324-27-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231011120830.49324-1-brgl@bgdev.pl>
References: <20231011120830.49324-1-brgl@bgdev.pl>
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
 drivers/pinctrl/pinctrl-as3722.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-as3722.c b/drivers/pinctrl/pinctrl-as3722.c
index f0e5d87ac50b..3d3adf9793fb 100644
--- a/drivers/pinctrl/pinctrl-as3722.c
+++ b/drivers/pinctrl/pinctrl-as3722.c
@@ -502,14 +502,14 @@ static void as3722_gpio_set(struct gpio_chip *chip, unsigned offset,
 
 static int as3722_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 {
-	return pinctrl_gpio_direction_input(chip->base + offset);
+	return pinctrl_gpio_direction_input_new(chip, offset);
 }
 
 static int as3722_gpio_direction_output(struct gpio_chip *chip,
 		unsigned offset, int value)
 {
 	as3722_gpio_set(chip, offset, value);
-	return pinctrl_gpio_direction_output(chip->base + offset);
+	return pinctrl_gpio_direction_output_new(chip, offset);
 }
 
 static int as3722_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
-- 
2.39.2

