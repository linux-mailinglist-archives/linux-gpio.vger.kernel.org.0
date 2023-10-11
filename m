Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18D2D7C5321
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 14:10:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346780AbjJKMKa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 08:10:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346586AbjJKMJy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 08:09:54 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05281183
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:09:35 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3248ac76acbso5945719f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697026166; x=1697630966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B7mQAW/gcS7bWGdM82oN9G3UwAV92bdGrqJQuitFsrM=;
        b=UQ79YBteAxmimcxCPja9jhleZqR7Ibf98MeqMYf1vVkXRfDiBi9QDTbkTo8l8fzjV6
         gWx8uO/IovLEWzR2MJce1stB7Q0Oi0/0Op9fOzmvauMgKk3UC6yCYD0p5mBz07ocgyS6
         dC64C0BQ9l7vKeFcrWuORAQfVC7yGPcSnvBJJHltWeth9TZomcsTT7JVvDC76Iz6Mrdx
         J7pKhPdpqVzMfUkBZMtrY5exixXkFOmPQ1zGpUxACaAbg8RZXaJpEe1N8Jg8y7+eXXw7
         svIdh3J4E3lMES2fdGhYLcoj5yl4FZM+jD00FhW2MhXC+yTFVCTE9w/Q2lEU4+EQWyA9
         Mjcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697026166; x=1697630966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B7mQAW/gcS7bWGdM82oN9G3UwAV92bdGrqJQuitFsrM=;
        b=CSfQA+vHujvCgijoh+ol1U80cF64TB80WFzBICqzSA6logA4FR8BIRNthqYxXTzgBW
         b29Hg+Y/1pax2eXoLqYRu8DgachOsfja8Bzh4dBH9/5hzPo9a8IyKh6NpoS4s1+Zm9RH
         Wq+BfKt7a0ScMVR0C3HBGPdbNtx+hLMAMNzizZWkKvKsIR4vZ5TD73QI5xI/5nIk24vb
         tUHGxVw5+jSDsMJgslAx+J8nxCVFlfPcO4ktXt7YFLescQF7jCSV3ZsXwfi5Dqm3DZIV
         B/AQlPOJ6dasL5e2+9+7u26pjtditA3XnofpWbEH0znMjwWnQmastE/BmyVWDnhL5m4Q
         MWtw==
X-Gm-Message-State: AOJu0Yza9uY/uTxDbcafTq6RtlvDEggi71rki+2vC0lrDcMXkQtrv8F+
        5P81Y2yFZOdnrqUKJmUVuqo60w==
X-Google-Smtp-Source: AGHT+IFgKc46nUE0aKpQQ0TuMyLnkp05FAa6kvD0a50LHPMvjm6A08VFOB7DYiM1ltxi8FSgEIgJcA==
X-Received: by 2002:a05:6000:5c6:b0:32d:5870:8b8a with SMTP id bh6-20020a05600005c600b0032d58708b8amr4272879wrb.56.1697026166464;
        Wed, 11 Oct 2023 05:09:26 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:e551:3946:26fc:f94])
        by smtp.gmail.com with ESMTPSA id w21-20020a05600c015500b0040652e8ca13sm19012253wmm.43.2023.10.11.05.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 05:09:25 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH v2 21/62] pinctrl: cirrus: use new pinctrl GPIO helpers
Date:   Wed, 11 Oct 2023 14:07:49 +0200
Message-Id: <20231011120830.49324-22-brgl@bgdev.pl>
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
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/pinctrl/cirrus/pinctrl-cs42l43.c   | 4 ++--
 drivers/pinctrl/cirrus/pinctrl-lochnagar.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/cirrus/pinctrl-cs42l43.c b/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
index c09646318419..097e4dcdda36 100644
--- a/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
+++ b/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
@@ -508,7 +508,7 @@ static void cs42l43_gpio_set(struct gpio_chip *chip, unsigned int offset, int va
 
 static int cs42l43_gpio_direction_in(struct gpio_chip *chip, unsigned int offset)
 {
-	return pinctrl_gpio_direction_input(chip->base + offset);
+	return pinctrl_gpio_direction_input_new(chip, offset);
 }
 
 static int cs42l43_gpio_direction_out(struct gpio_chip *chip,
@@ -516,7 +516,7 @@ static int cs42l43_gpio_direction_out(struct gpio_chip *chip,
 {
 	cs42l43_gpio_set(chip, offset, value);
 
-	return pinctrl_gpio_direction_output(chip->base + offset);
+	return pinctrl_gpio_direction_output_new(chip, offset);
 }
 
 static int cs42l43_gpio_add_pin_ranges(struct gpio_chip *chip)
diff --git a/drivers/pinctrl/cirrus/pinctrl-lochnagar.c b/drivers/pinctrl/cirrus/pinctrl-lochnagar.c
index 0b78cf611afe..f3c8a8c14e14 100644
--- a/drivers/pinctrl/cirrus/pinctrl-lochnagar.c
+++ b/drivers/pinctrl/cirrus/pinctrl-lochnagar.c
@@ -1098,7 +1098,7 @@ static int lochnagar_gpio_direction_out(struct gpio_chip *chip,
 {
 	lochnagar_gpio_set(chip, offset, value);
 
-	return pinctrl_gpio_direction_output(chip->base + offset);
+	return pinctrl_gpio_direction_output_new(chip, offset);
 }
 
 static int lochnagar_fill_func_groups(struct lochnagar_pin_priv *priv)
-- 
2.39.2

