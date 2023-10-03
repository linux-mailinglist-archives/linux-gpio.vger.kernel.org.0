Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 759467B6C3B
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Oct 2023 16:52:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240280AbjJCOwG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Oct 2023 10:52:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240266AbjJCOvu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Oct 2023 10:51:50 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F280FA
        for <linux-gpio@vger.kernel.org>; Tue,  3 Oct 2023 07:51:39 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-40652e5718cso10184735e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 03 Oct 2023 07:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696344698; x=1696949498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b0sgIJXyiWCMH9BTQoi/ajBzkcQtsuv8BX1pVGl7zGQ=;
        b=JQ1k9wAQO7mBqgEKT4QPSKJk1w7wJmc4zZavBuJbU+SOVc9hVrhCP4Gi1XPyEimxhg
         JVqrDIZ6TPU1Pvz9krzDno/LZTRrIBPj5WexLmR37SxdKi4DiRytg36dHWl2MBwzpn55
         VEq7vROwlAcyX8SudEFAhOq1Aapx6ZWlvkskIBRw4PqhM4nv1ZugFNUIbbwJJoBCxmUz
         UqusJWrWrCvpsEvSLwa4+L2Hyuvqtg3P1fpUJYNOmHWLyv+iHdMV77zj53WI4JzFcVb7
         I9MV+qzrKCRX1ZLMFLUGnPApHTLBi8vhMJCVD7OZ6wGX5Y6wrKenIEzB92+lE8oLmb3s
         R2/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696344698; x=1696949498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b0sgIJXyiWCMH9BTQoi/ajBzkcQtsuv8BX1pVGl7zGQ=;
        b=RNHijcjRLgfYtYGejmf3cLmRyIG83kYAinaeF9oeoAeJvz2wL0nCT5xe1avpNvE87c
         5HsL6qHKTac4ZRDEnBImpzGQEkOZ1uFzqpHQEOH2MUq4HeXzCYqd8RSNpcTbI04C82bj
         Q1+CIJ/UBGIlWsWuZLyYlyjste6h6UK7yKyT014yZPAZxXbjwDcdXdm50pzjmp5+/dco
         XcHowEDrJoWwfhB7buajCA8VU/oeH+g9d4TlmvwQIcMNbZ+8CYmOjEzNKpeonY6Bq4+v
         9SQXRZmW3TUXReKkI6iE48dhBTvG+vT79F+YORuh2m4tgsZcylGb5XKOZg7mMnBTJuau
         7XJw==
X-Gm-Message-State: AOJu0YzZQNtnHCFFrBR6/56oK46sdqNFtawD2dsFmer7BGu33K/7WXds
        eLVbFdDEEHOF7uuYNQPAvWcgcvihga55UQlbqxo=
X-Google-Smtp-Source: AGHT+IGq4LnMFNxMVkBTUqG/fjR2lxd4bb8ateFPXeWMJZ/QAhIpvk6ypbrP4Bh0smoFcA0p13WofA==
X-Received: by 2002:a05:600c:252:b0:403:b64:ad0a with SMTP id 18-20020a05600c025200b004030b64ad0amr12038698wmj.26.1696344698071;
        Tue, 03 Oct 2023 07:51:38 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:1f2d:3479:a5de:fa35])
        by smtp.gmail.com with ESMTPSA id c15-20020a05600c0acf00b003fe29f6b61bsm1462773wmr.46.2023.10.03.07.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 07:51:37 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 19/36] pinctrl: ocelot: use new pinctrl GPIO helpers
Date:   Tue,  3 Oct 2023 16:50:57 +0200
Message-Id: <20231003145114.21637-20-brgl@bgdev.pl>
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
 drivers/pinctrl/pinctrl-ocelot.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ocelot.c b/drivers/pinctrl/pinctrl-ocelot.c
index f8ae2e974221..a6022d44ad6c 100644
--- a/drivers/pinctrl/pinctrl-ocelot.c
+++ b/drivers/pinctrl/pinctrl-ocelot.c
@@ -1779,7 +1779,7 @@ static int ocelot_gpio_get_direction(struct gpio_chip *chip,
 static int ocelot_gpio_direction_input(struct gpio_chip *chip,
 				       unsigned int offset)
 {
-	return pinctrl_gpio_direction_input(chip->base + offset);
+	return pinctrl_gpio_direction_input_new(chip, offset);
 }
 
 static int ocelot_gpio_direction_output(struct gpio_chip *chip,
@@ -1795,7 +1795,7 @@ static int ocelot_gpio_direction_output(struct gpio_chip *chip,
 		regmap_write(info->map, REG(OCELOT_GPIO_OUT_CLR, info, offset),
 			     pin);
 
-	return pinctrl_gpio_direction_output(chip->base + offset);
+	return pinctrl_gpio_direction_output_new(chip, offset);
 }
 
 static const struct gpio_chip ocelot_gpiolib_chip = {
-- 
2.39.2

