Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21F187C5359
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 14:14:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346902AbjJKMOF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 08:14:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346949AbjJKMN7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 08:13:59 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6BF9138
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:10:26 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-50435ad51bbso8297711e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697026193; x=1697630993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aEPSU1082I8bAKtyLPrVc7z4Kqv5UrO7T/vph5tByY8=;
        b=wgRzau7L5Z/TS70EjYSoceZJIC+uekmcCdQ7CUhbkT0HyM49EMzacfrmQ3y/jMAh0V
         ccR/BrTFDlUYoeZws5U5FAQXpgGbiuglM/JzehhvfFLqGxFyhbMO5jcQYfEPF0DjJ4KE
         15AwQwdK0lDz2KFWbq6J+bu8kZXPJ20qQsCeHvJq9mT5o8sUEp866t1D2zOWPnn+t9w3
         l4HaQcx8KeTh6qLGepf79DRAh0c+blQuZb6gG115ndo/CBCS3a+iaAedTSd2aRd0WTuL
         aFGlrcRsVQpNpzL7jrrwc7vt4Z9KzWMWPa6QOC78/CgeWPOCt19byycbIExfJAlLWenq
         iHgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697026193; x=1697630993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aEPSU1082I8bAKtyLPrVc7z4Kqv5UrO7T/vph5tByY8=;
        b=RvyLKkSHRxQSa/UsBf1c/FdbMC2br1QCdPG1A4n+/Rm4ql/Kk+urs7bGchjO5bOOCh
         QR0JAeqc8MHvie4wV4mtjMWxANGolhhx2nuXrrfqz29qbktIckoiXyrgUZ2Z4Va37f7z
         AIqQF6yw3Fvxoicv4cwZLNVUDxvRj1nnX9uZnk1tWbzX6ttvhVuKEZwb4qBn5Y0BPWiV
         MwBMxhlilsreF1wn/GvVHEcA0kkb64WrU5BI+g2JJ3nr6rBf3yLz62kqvfy2qY1uPD25
         D+PVaPXzuBNnHE+Y02v123ydduGiPScrvGIDB80UL618bdQEmDT/2aKOV4idtwRvLNmH
         OMGA==
X-Gm-Message-State: AOJu0YwDbE4ugiC7fbsVrPMi3ekxAfJ63Nv5DKVKlD7SBigNes6+xOhD
        mROf7BBaNsva1gowJH9efrn7bw==
X-Google-Smtp-Source: AGHT+IHAxig/Z2/CxGgyYEn8u7D6J4Z3mhzkbCMMS0AxePToIPU+9wKEc6XAHZWoiyvTWp2/9z01cg==
X-Received: by 2002:a19:6414:0:b0:500:9d6c:913e with SMTP id y20-20020a196414000000b005009d6c913emr15678060lfb.52.1697026193395;
        Wed, 11 Oct 2023 05:09:53 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:e551:3946:26fc:f94])
        by smtp.gmail.com with ESMTPSA id w21-20020a05600c015500b0040652e8ca13sm19012253wmm.43.2023.10.11.05.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 05:09:52 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 50/62] pinctrl: as3722: drop the wrapper around pinctrl_gpio_direction_input()
Date:   Wed, 11 Oct 2023 14:08:18 +0200
Message-Id: <20231011120830.49324-51-brgl@bgdev.pl>
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

pinctrl_gpio_direction_input() now has the same signature as the
wrapper around it so we can drop them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-as3722.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-as3722.c b/drivers/pinctrl/pinctrl-as3722.c
index 4151656f6245..e696bac83818 100644
--- a/drivers/pinctrl/pinctrl-as3722.c
+++ b/drivers/pinctrl/pinctrl-as3722.c
@@ -500,11 +500,6 @@ static void as3722_gpio_set(struct gpio_chip *chip, unsigned offset,
 			"GPIO_SIGNAL_OUT_REG update failed: %d\n", ret);
 }
 
-static int as3722_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
-{
-	return pinctrl_gpio_direction_input(chip, offset);
-}
-
 static int as3722_gpio_direction_output(struct gpio_chip *chip,
 		unsigned offset, int value)
 {
@@ -526,7 +521,7 @@ static const struct gpio_chip as3722_gpio_chip = {
 	.free			= gpiochip_generic_free,
 	.get			= as3722_gpio_get,
 	.set			= as3722_gpio_set,
-	.direction_input	= as3722_gpio_direction_input,
+	.direction_input	= pinctrl_gpio_direction_input,
 	.direction_output	= as3722_gpio_direction_output,
 	.to_irq			= as3722_gpio_to_irq,
 	.can_sleep		= true,
-- 
2.39.2

