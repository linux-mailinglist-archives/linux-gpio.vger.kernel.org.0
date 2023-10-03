Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8377F7B6C57
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Oct 2023 16:53:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240338AbjJCOwT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Oct 2023 10:52:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240334AbjJCOwI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Oct 2023 10:52:08 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 865F1CCF
        for <linux-gpio@vger.kernel.org>; Tue,  3 Oct 2023 07:51:45 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-40651a72807so9987445e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 03 Oct 2023 07:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696344702; x=1696949502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gdciYkeI9ojIVFf6NUkn/u7//A2Bey8sZm2LXyWrQBM=;
        b=0tWUdjuEf5ruRk9Q6Bu879uwluuZBDOLvuRlV+zEuj1EZF2wtdOaxlsG6bNFzjf4x4
         v6vEhs4jJ1bleBX3/QxiChIsocP9rUf65qkBSHCoMNMieFyltrqwvTaxZ9m8E0licv9m
         +BeekMnMTdak7RdZHWovf44s7euzNyvLghgrRp1lavN51A4rvShaMgRmNsFMNeguOp9V
         1smDfovN2arrOtbCQhqMRaXb6yvIgtQHcIjwkgZJLqKOf0z6cY86/wFUWuDEQc8kmou/
         Lt++BJ6L/mC/zXo2xD0DNKZV5CKTiiY4vGvdvQ4II3ZbPnc3R6/u1zpZ8nIsUmvWb7tX
         itdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696344702; x=1696949502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gdciYkeI9ojIVFf6NUkn/u7//A2Bey8sZm2LXyWrQBM=;
        b=SsB38GKoOdzdB1OnT9bEKWbqeCp2JLFCI4V7c4OW/JwTA/m3Fq3/pYnfsSz5n4uyp1
         IXFNxBqh/0V+mqolhcblDWDDpczEkopbcbMp7LJzWOmFz40wnURiL/TpRcwZHH+MpV1g
         WHeOQo4yDwSdC0fN7IIPijPBnAXyFC7RrFPVxUxsTO6X7nQOLSdp+h9RVF1TEs+n8LsV
         OYTu9Ky4Ew2AfbK1iwjLUKyX279pgw4MHzAerAy+NGLYuXubKiVnHsoS7zHKy7yVOe1p
         8pHVs5PBj//Hxpi96nE5/C8Yy3NPq7YlMXwwzaQzTbwFn3zA6TBiSc7cS4nuA/BecME0
         V7xQ==
X-Gm-Message-State: AOJu0YwODeR3pZk4YKqeyhMfHotO76+MZ0YprF51BU5W7fXngD925Q7Z
        6L+W6sJPAZ/Fi+BFSid1MgfPDg==
X-Google-Smtp-Source: AGHT+IG9hhtNfWbkyDKzft2AYbGoSG/VnHVVWu8pxokheI1jWZ0SJyvJSHYnmgW6em0/64Zx+RVbzw==
X-Received: by 2002:a05:600c:a3a0:b0:406:4d8f:9fee with SMTP id hn32-20020a05600ca3a000b004064d8f9feemr14497527wmb.24.1696344702396;
        Tue, 03 Oct 2023 07:51:42 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:1f2d:3479:a5de:fa35])
        by smtp.gmail.com with ESMTPSA id c15-20020a05600c0acf00b003fe29f6b61bsm1462773wmr.46.2023.10.03.07.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 07:51:41 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 24/36] pinctrl: vt8500: use new pinctrl GPIO helpers
Date:   Tue,  3 Oct 2023 16:51:02 +0200
Message-Id: <20231003145114.21637-25-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231003145114.21637-1-brgl@bgdev.pl>
References: <20231003145114.21637-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
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
 drivers/pinctrl/vt8500/pinctrl-wmt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/vt8500/pinctrl-wmt.c b/drivers/pinctrl/vt8500/pinctrl-wmt.c
index 6fac30de1c6a..1a313295611e 100644
--- a/drivers/pinctrl/vt8500/pinctrl-wmt.c
+++ b/drivers/pinctrl/vt8500/pinctrl-wmt.c
@@ -528,14 +528,14 @@ static void wmt_gpio_set_value(struct gpio_chip *chip, unsigned offset,
 
 static int wmt_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 {
-	return pinctrl_gpio_direction_input(chip->base + offset);
+	return pinctrl_gpio_direction_input_new(chip, offset);
 }
 
 static int wmt_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
 				     int value)
 {
 	wmt_gpio_set_value(chip, offset, value);
-	return pinctrl_gpio_direction_output(chip->base + offset);
+	return pinctrl_gpio_direction_output_new(chip, offset);
 }
 
 static const struct gpio_chip wmt_gpio_chip = {
-- 
2.39.2

