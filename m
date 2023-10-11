Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB7907C5327
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 14:10:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232075AbjJKMKs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 08:10:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234922AbjJKMKF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 08:10:05 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C3F11AE
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:09:40 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-405361bb9f7so63086405e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697026168; x=1697630968; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L71FhZFxQS/v+Kb2FZmLTi+Zct1vRjkWo7sxYZsb/pk=;
        b=X4gH66ncnDIZFLD59Zp1OIvwj59nH6kSsjV/ZLsXvg43mSYPBPeRdJkddtIP22Ljuy
         pTUiUEDacl51zOjIypMXRnZ7cbmsFZIGg6Ff/ScAqZgkCgMBtpr2MXbaocPG+up6DGp3
         mw2XOS6w7Fe5wzXKWqyLUAjH337RutZUO+bZ2pWz34po459n5RcePF7Q+pTj+av6XRL5
         FISaX5eunpQVnHHpyQI0uf+A71vE41lR3RYomRzQaHdo921+Gf7e/HoVZRcBsl2+oUnG
         PJlFPfWcGUEd2bpAQz8O+jTutwOyxcVmquKG22gBe/TeJD+Bcfgbs4A8bbZcwI4XvF0s
         /Dpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697026168; x=1697630968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L71FhZFxQS/v+Kb2FZmLTi+Zct1vRjkWo7sxYZsb/pk=;
        b=TqNYrk8kI/WHi8O97uwhXBgH+JJ3gmeVU4QXpNB3wqrGeI1rOxPSdAn/1xC2ju/nlv
         c14eP306bzdBidMZX/Y3mUO3vYaNm50daof+RB1GklEIwHlP9WI/0VcQvfpOY+RX6Iaf
         5wCYrZt2wVHyBmEGDwynZ4sb+mAyNVZl5qYJQu2cro1Sou+NgeGYjFaWdAtJnpmuuqRK
         L5sPtweUy2QDyA/GNs+ZhBGvLHzRpvS3CqruNeKNohIZHFIeM1eRNurn6Kbb/B/071eJ
         QbSsuzERLUaW0bfkcYfLL68qSR2erAi2441OBwUSBAGxiAfAhzymu6lJ8YY2XOaonucC
         sv5A==
X-Gm-Message-State: AOJu0YwEcwqEX8CT74V9gCNdN7fiAkH54I7LShMmzPsQydSllidxDqQr
        Q4yVTFVgdML17LP7H1dWCl85lg==
X-Google-Smtp-Source: AGHT+IHCbj8hl7N2eRf8+SKDlOmbOHEKrqZL63QNuTkqNmrfXRYWscswXP1skcRvH2+cI17s/6iBfg==
X-Received: by 2002:a05:600c:600a:b0:406:eef6:3540 with SMTP id az10-20020a05600c600a00b00406eef63540mr14079374wmb.0.1697026168175;
        Wed, 11 Oct 2023 05:09:28 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:e551:3946:26fc:f94])
        by smtp.gmail.com with ESMTPSA id w21-20020a05600c015500b0040652e8ca13sm19012253wmm.43.2023.10.11.05.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 05:09:27 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 23/62] pinctrl: axp209: use new pinctrl GPIO helpers
Date:   Wed, 11 Oct 2023 14:07:51 +0200
Message-Id: <20231011120830.49324-24-brgl@bgdev.pl>
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

Replace the pinctrl helpers taking the global GPIO number as argument
with the improved variants that instead take a pointer to the GPIO chip
and the controller-relative offset.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-axp209.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-axp209.c b/drivers/pinctrl/pinctrl-axp209.c
index 9f5b3ab8e184..d7f081f1d1f6 100644
--- a/drivers/pinctrl/pinctrl-axp209.c
+++ b/drivers/pinctrl/pinctrl-axp209.c
@@ -126,7 +126,7 @@ static int axp20x_gpio_get_reg(unsigned int offset)
 
 static int axp20x_gpio_input(struct gpio_chip *chip, unsigned int offset)
 {
-	return pinctrl_gpio_direction_input(chip->base + offset);
+	return pinctrl_gpio_direction_input_new(chip, offset);
 }
 
 static int axp20x_gpio_get(struct gpio_chip *chip, unsigned int offset)
-- 
2.39.2

