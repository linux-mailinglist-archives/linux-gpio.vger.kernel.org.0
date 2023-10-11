Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DB447C5336
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 14:11:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346789AbjJKML1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 08:11:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346913AbjJKMK3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 08:10:29 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01208A4
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:09:47 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5044dd5b561so8236316e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697026173; x=1697630973; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yEGizAbOxMwHBeRhJGcb8ss//xXj+RtWLOdU8JMZ+S4=;
        b=O0SrwgqSiDvnthGGpBuFJLP99SV9+Gy2uZ9mMtPy5doY2UIbQ9SiWZkD9jpKviloeQ
         KTeTWNubXnLIjo8K19mLfyTa/gZ5CwIBRjkLP4HiNlxHO9uGfSd9mLQULS3xE9MxkqpT
         Eck3GMVEehXYp098aF25SFzvSR7jLDJuvd+u2ICJZriPeFrGteDnoxLn2kVjc/Dyqrtc
         +J3IZjEf76TJt+RJlpuOIOEJb8KYxD9bnwKIsKwU59kDim5SktiLg8xyYBnQ6KsTQfJu
         CYj21aVNpYe8PMJb//NQOMJZvr3e23wdsQZ6L3AiWwKVNNsZ+vP4p31Dth6zOGXlRMv9
         6ioQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697026173; x=1697630973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yEGizAbOxMwHBeRhJGcb8ss//xXj+RtWLOdU8JMZ+S4=;
        b=Gtqzh1IMFYjND91xvXFNKk03s0G/p5pdcDDtACHjJtLcZdzFdfj3iaWNq5rGahLkrU
         3pFofJYhmVCUpq+kdnzWPsiqfItcTECh56YHAuvl+hMV0xPJSvEkDrE/NzcwVpKzClMT
         uJZqXE+X08vyDg952PCEfPNcpAPeu4bp2QzX/K0moxnSVj7ZQgU95OrHzEgKOZ97r9ed
         mWKxUnTIVwmxe6qlqJdPXQJ31t00fKDPHs12VVuQNhL/E5mSylb5JpB7DQ+I5RmaCvQP
         o+I9uEiVov+JNgIPxN9YHoQkv/aza2qrDnz3U47/oW+8CKAmAhA8lIjuDXC9k6w9Vun9
         OZGw==
X-Gm-Message-State: AOJu0YwhDA6b7KwOrqkMY5bkq3OtcymhHT0isFlJk0aTsXFyfelqej6+
        WLs+OiL2YsA3iasd4LyFUnaZOA==
X-Google-Smtp-Source: AGHT+IErTIAuM3WDbfpZrc/qUJWfARo+L35aTewW+TQW3ZXgE3Msaix5FqUd2hQe1zeCbl1mh9M23A==
X-Received: by 2002:a05:6512:7c:b0:504:7bd5:a269 with SMTP id i28-20020a056512007c00b005047bd5a269mr16161446lfo.64.1697026173624;
        Wed, 11 Oct 2023 05:09:33 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:e551:3946:26fc:f94])
        by smtp.gmail.com with ESMTPSA id w21-20020a05600c015500b0040652e8ca13sm19012253wmm.43.2023.10.11.05.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 05:09:33 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Patrice Chotard <patrice.chotard@foss.st.com>
Subject: [PATCH v2 29/62] pinctrl: st: use new pinctrl GPIO helpers
Date:   Wed, 11 Oct 2023 14:07:57 +0200
Message-Id: <20231011120830.49324-30-brgl@bgdev.pl>
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
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 drivers/pinctrl/pinctrl-st.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-st.c b/drivers/pinctrl/pinctrl-st.c
index c1f36b164ea5..ec763572ab3e 100644
--- a/drivers/pinctrl/pinctrl-st.c
+++ b/drivers/pinctrl/pinctrl-st.c
@@ -719,7 +719,7 @@ static void st_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 
 static int st_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 {
-	pinctrl_gpio_direction_input(chip->base + offset);
+	pinctrl_gpio_direction_input_new(chip, offset);
 
 	return 0;
 }
@@ -730,7 +730,7 @@ static int st_gpio_direction_output(struct gpio_chip *chip,
 	struct st_gpio_bank *bank = gpiochip_get_data(chip);
 
 	__st_gpio_set(bank, offset, value);
-	pinctrl_gpio_direction_output(chip->base + offset);
+	pinctrl_gpio_direction_output_new(chip, offset);
 
 	return 0;
 }
-- 
2.39.2

