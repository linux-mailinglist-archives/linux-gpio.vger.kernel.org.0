Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C1C87C531B
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 14:10:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346820AbjJKMKP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 08:10:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346766AbjJKMJu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 08:09:50 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 711EE130
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:09:31 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-40535597f01so63261365e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697026164; x=1697630964; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b0sgIJXyiWCMH9BTQoi/ajBzkcQtsuv8BX1pVGl7zGQ=;
        b=cwTXz9L86Tjxsk73k/nrwBBba9NCjzbrAndkMBd66/8m+xHA7XToAtXdl+vhsLhcs9
         v5pTKp3RO3NBhnLDZsKZUQ2oiUPUl/l2qHiO+ZV4tg2phKpfjVpJa72j1azwsauYpDMD
         FwFaktZvUlMc3JnNssD7qebArN5FomReO7L+XixwbLj3EM1U67X62x2UiNbuf1tO5LRV
         OjpUwrlgu62+/9pdX+vM8qN7Gm+dHVd2lLl9SGSoHt0FrmpG9eyiO9Qp+flBJQOY1Pox
         bBa2r8WCIjQs7O7/n35zOPuL6M4cGEd7dzAx4sDK3pZ+h/22av459o34sbMIgSUSTD5h
         KrlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697026164; x=1697630964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b0sgIJXyiWCMH9BTQoi/ajBzkcQtsuv8BX1pVGl7zGQ=;
        b=Bu2KhfAPvUDEZvEY/shnC6hfudGbgkaJm/rNn/IK3vRUWStdkMJjbT0puiMzhkp3eZ
         dxDgFi4XjTinbqGJIMGSXZ3auhpyeWNhpve4kMv/QbrvGbttTQeWSWnfbFaeJx2aw8gA
         eQ3ee+7Mp2J777iqyuXC2X9y9K/I1RCMsnyTVTSZBZfmYZV/Hn1SCRTSrTHGbRYTIBXv
         ZbTWae8KfIkgVopqIm94gQQtqIV+ipOiII3AnlF3tIA0Ea3i+EbSEH69OjGTLxhaaIsv
         7ts2OKPW8vt7BMATnP7NwQ1VGFlshwsIj0sVAnxQOhiJaz9BeGGgjjCEyNs+p/7+JjpB
         NYtg==
X-Gm-Message-State: AOJu0Yz0xfm6TOYm5O+VNDpDpWhewJKNHCl579e2wIHblPG89iAFe8d3
        kMtpDeJ9dK6F37IcMC93SuQT5g==
X-Google-Smtp-Source: AGHT+IEHffnyYrHHG6G2dYUks0sLtBElGJkM+4rW9hsszZDTUzO+8Qzc/7eXPCeccRw+fTkKMRTcdg==
X-Received: by 2002:a05:600c:ad0:b0:406:7029:7cc3 with SMTP id c16-20020a05600c0ad000b0040670297cc3mr17586904wmr.28.1697026164559;
        Wed, 11 Oct 2023 05:09:24 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:e551:3946:26fc:f94])
        by smtp.gmail.com with ESMTPSA id w21-20020a05600c015500b0040652e8ca13sm19012253wmm.43.2023.10.11.05.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 05:09:24 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 19/62] pinctrl: ocelot: use new pinctrl GPIO helpers
Date:   Wed, 11 Oct 2023 14:07:47 +0200
Message-Id: <20231011120830.49324-20-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231011120830.49324-1-brgl@bgdev.pl>
References: <20231011120830.49324-1-brgl@bgdev.pl>
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

