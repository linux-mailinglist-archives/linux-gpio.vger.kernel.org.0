Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B90BA7CC25F
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 14:06:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343697AbjJQMGs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 08:06:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234950AbjJQMGR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 08:06:17 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F4C510E7
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:14 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4083740f92dso1511115e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697544312; x=1698149112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HdnE9k6DVeHGrvZCSuP7SVSND1kB1XJeLK7GE1Az69U=;
        b=oXw1rqN4mcsSF8ydsyhFpLf1UecjcsglhSTaqP0kuglB7kZFYyvQburueo7QIAngz4
         qTpmaLApW5y0FAQh1K+7mgRnmE0KKUVtDND8rcZOjIM87WWR1uvfHLGaRBtC+8Hlx4EF
         JP09f5Ykee2tWCzfkZldzrM16p6XpevEE3HG9RCHcP9Ou36Vfzyugq9ZdNU3+KoZdYwF
         IGc49wNDtHD0LFNNn3LkZzdyZuymC9/4jTBWabNqhEHLrMXwrWyIl3Oci2ROXIuRna+4
         qQM305y2x8xi4FQugxPaRCHfWYeixth/RtVt5mdHSOZ3aa3XyfzeOdosGXCB0fF/OEc/
         Cpsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697544312; x=1698149112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HdnE9k6DVeHGrvZCSuP7SVSND1kB1XJeLK7GE1Az69U=;
        b=F1TBQ1//P4auW+esLeE/11RlfBvdAqPYr3kJu6fsnl4V4YQCV71aP/B1I7dVKH0SzL
         eswBJqeqnzikYt6SKedUzedMf8sxmmUkiyZmdZREypwCa7ebKB7aUVoVFA0pypCF8XIf
         fxRY/1KxYCMQswFjdZdp86lsTeAnsR80LcC/bErgp21p8QTIiOj00Gbj+e4vsQ9TOu/5
         SKPIA7pdTPPA+5xnrUIUDhvVW5MhY4hFbXi2TAuW8dGSVz2ajQ9j34I2E2XUqV9CkyHb
         tFtKUKsIZlyPD1My7jVLGGtBOtj4iAJiOoIBKbi9LaN6DXIfDYxWnqr9vdUHboCv/Kua
         WK5w==
X-Gm-Message-State: AOJu0YzLlr25m6l5e9LLZ5ma2D8YNLvWmUmXqkT/hb4c1CTmI1nnROPF
        EgrKoXUGH1VbbLpZ0jKQRhGQr/jznNsRLHlSum0=
X-Google-Smtp-Source: AGHT+IGwJeUCVVtl0VXCv31bIhc4qf3kZ1e4jEHKPmsBw29Uj066LVCiRTpsAVFEJ6zxhf22EXGv5g==
X-Received: by 2002:a05:600c:3590:b0:406:7074:301d with SMTP id p16-20020a05600c359000b004067074301dmr1622360wmq.11.1697544312505;
        Tue, 17 Oct 2023 05:05:12 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f1ee:b000:ce90:ed14])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c224200b00405442edc69sm1353859wmm.14.2023.10.17.05.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 05:05:12 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 25/73] pinctrl: mediatek: common: use new pinctrl GPIO helpers
Date:   Tue, 17 Oct 2023 14:03:43 +0200
Message-Id: <20231017120431.68847-26-brgl@bgdev.pl>
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
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index 74b15952b742..fc046415b567 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -811,14 +811,14 @@ static const struct pinmux_ops mtk_pmx_ops = {
 static int mtk_gpio_direction_input(struct gpio_chip *chip,
 					unsigned offset)
 {
-	return pinctrl_gpio_direction_input(chip->base + offset);
+	return pinctrl_gpio_direction_input_new(chip, offset);
 }
 
 static int mtk_gpio_direction_output(struct gpio_chip *chip,
 					unsigned offset, int value)
 {
 	mtk_gpio_set(chip, offset, value);
-	return pinctrl_gpio_direction_output(chip->base + offset);
+	return pinctrl_gpio_direction_output_new(chip, offset);
 }
 
 static int mtk_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
-- 
2.39.2

