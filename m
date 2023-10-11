Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C157B7C53B0
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 14:22:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346898AbjJKMWs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 08:22:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346901AbjJKMWT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 08:22:19 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D1321BE4
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:10:31 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-406650da82bso62491555e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697026198; x=1697630998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nBWQ9fSQp0ZA4dnWkAWnLMnFs+FYMpI9chYs/e79dsQ=;
        b=xpHXUceaMR9V3bs14CPaeZRHcc1oDeNa/NPsff6yt78NhTfZPKZdPpqGFSDWdtt2IO
         xJqPNF6i1bJmys6z0Tz1oZTEBZ8Pz2vd3W7v4/j0Hxzuiyp6+N/0o3HyWwsjURHfl5Qn
         llQpa3VymxSX40V7ZoKYlZFsub/GW47+xGldH0V9SHPpVspkLhTJ5O4ksuIAJmhRbpuU
         JOu4N4/EmV0chugmVK6NpJfvfFNqtOBmaGlFS11wU6grteZKVopjT4fPLPlq2T6Mk7eK
         clVepseFJv/UJBkG/PufAK3mTw9ADo5LktLn6deI4X2pRMbokzzkxolPscjoxAz7G61L
         vi9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697026198; x=1697630998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nBWQ9fSQp0ZA4dnWkAWnLMnFs+FYMpI9chYs/e79dsQ=;
        b=S8bLhjGL3crs9zFVjjH5evDMVF7XyLWWcTyV3FtC02AOPU+3HXwH8DgFUJrpmIPGs5
         7T4up8XHAW/800rReCyinwY570yxHkFrpK5EmMYAzcXCWh1HeiuEtxsOL3uw8VwEhCqF
         NW7QnsVDa5UCiVMg52CDIq6du0rt48LVgRfs/wk+pLwaCerRZ/eMLasOrRuSK4Lb0l05
         TwbfMf/+oDM8poYKF5atTwBmdaqnYNgM/XmDBbnrp0oJyr3g2kGvq8sU4RiG0XNXHUuz
         Wl9PIdkGCZnSIey2tH0BztgonDUXMAXX/2InZOXSZbDLVfgwspBFQVBWzugP3sY+pg/K
         qPVQ==
X-Gm-Message-State: AOJu0Ywlyaxgq+Q29Yl9Vmh1m+IWwJsCVgX5n9iBjZBQgW698nzlszEU
        +mEEUwMfXcXvvV9inHt81T8qcA==
X-Google-Smtp-Source: AGHT+IHh7D7JdR9pIqvKYYhRQNptYpBq6OqzbRE26mTQKCl1hcF1aF3IUYfDRd5BaZH3PNhzdp5PrA==
X-Received: by 2002:a7b:cd8c:0:b0:401:bcd9:4871 with SMTP id y12-20020a7bcd8c000000b00401bcd94871mr19673885wmj.21.1697026197822;
        Wed, 11 Oct 2023 05:09:57 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:e551:3946:26fc:f94])
        by smtp.gmail.com with ESMTPSA id w21-20020a05600c015500b0040652e8ca13sm19012253wmm.43.2023.10.11.05.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 05:09:57 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 55/62] pinctrl: mediatek: drop the wrappers around pinctrl_gpio_direction_input()
Date:   Wed, 11 Oct 2023 14:08:23 +0200
Message-Id: <20231011120830.49324-56-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231011120830.49324-1-brgl@bgdev.pl>
References: <20231011120830.49324-1-brgl@bgdev.pl>
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

pinctrl_gpio_direction_input() now has the same signature as the
wrappers around it so we can drop them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/mediatek/pinctrl-moore.c      | 7 +------
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 8 +-------
 2 files changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/mediatek/pinctrl-moore.c
index c3f33f96f920..c3d59eddd994 100644
--- a/drivers/pinctrl/mediatek/pinctrl-moore.c
+++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
@@ -510,11 +510,6 @@ static void mtk_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
 	mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DO, !!value);
 }
 
-static int mtk_gpio_direction_input(struct gpio_chip *chip, unsigned int gpio)
-{
-	return pinctrl_gpio_direction_input(chip, gpio);
-}
-
 static int mtk_gpio_direction_output(struct gpio_chip *chip, unsigned int gpio,
 				     int value)
 {
@@ -569,7 +564,7 @@ static int mtk_build_gpiochip(struct mtk_pinctrl *hw)
 	chip->parent		= hw->dev;
 	chip->request		= gpiochip_generic_request;
 	chip->free		= gpiochip_generic_free;
-	chip->direction_input	= mtk_gpio_direction_input;
+	chip->direction_input	= pinctrl_gpio_direction_input;
 	chip->direction_output	= mtk_gpio_direction_output;
 	chip->get		= mtk_gpio_get;
 	chip->set		= mtk_gpio_set;
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index 41e9847e3085..e79d66a04194 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -808,12 +808,6 @@ static const struct pinmux_ops mtk_pmx_ops = {
 	.gpio_request_enable	= mtk_pmx_gpio_request_enable,
 };
 
-static int mtk_gpio_direction_input(struct gpio_chip *chip,
-					unsigned offset)
-{
-	return pinctrl_gpio_direction_input(chip, offset);
-}
-
 static int mtk_gpio_direction_output(struct gpio_chip *chip,
 					unsigned offset, int value)
 {
@@ -898,7 +892,7 @@ static const struct gpio_chip mtk_gpio_chip = {
 	.request		= gpiochip_generic_request,
 	.free			= gpiochip_generic_free,
 	.get_direction		= mtk_gpio_get_direction,
-	.direction_input	= mtk_gpio_direction_input,
+	.direction_input	= pinctrl_gpio_direction_input,
 	.direction_output	= mtk_gpio_direction_output,
 	.get			= mtk_gpio_get,
 	.set			= mtk_gpio_set,
-- 
2.39.2

