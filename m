Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EA1E7C5385
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 14:20:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234961AbjJKMUl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 08:20:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234658AbjJKMUc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 08:20:32 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21F351BE2
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:10:31 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-405417465aaso64894415e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697026197; x=1697630997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4mWMEsrepSOyp3f33hvoi4PwifoeQU9K1dcaB1U/fvQ=;
        b=FKWovqnOwjZuwTs7Aa/tCt/9cS7mrqIGlmBTvjvS07A+MIUSEvjYSFdr4aYew5CYD7
         G8HT1jI6OfVrLQB7VDebI42VsgJVrZI1je5W6p0+txUZM81v83fDPlaIMADpmtd5+TPc
         MfPco/nATr3R3ws5O1fOjqBggG3jfduSUwG5gggmsTxSi9/Eya6k0qA62Y5N6jLn8eVC
         2A9xRjGJPso7PyW0q1gbRzsp9a2foTssOWodFhF46jKjCIDgBCIPXG6nVXZGMAe9oh9/
         9ow+TyBG3xGMGp4GeQl2FJynAOHyKwTtJPfViUeRS+w9s6KBgfzauaLBAPSS2NELKq/x
         QnaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697026197; x=1697630997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4mWMEsrepSOyp3f33hvoi4PwifoeQU9K1dcaB1U/fvQ=;
        b=jTucYXnD9XpkyogAavdj3eH30zTxwtjp4/GNgaC+HRyWP6A2HPpGDd91rvqEsioL01
         F0Cid0ov2oOXuus1qlyZARCYu9i7NYFhAQDzdfVn0lTWDuyVqva+psXpa0lRxRobU5GO
         F0sP1sRiErQYORk39Ia2gm6+QVpFIoY5ZArYgVdePqWpvqVax6p+aCzCUyMK5nYYRpmS
         gkxJ7CvsQZ+4m82xydiuNKPibccVL1uAhyXPLT83rqXOhHl2+uTyJDmzWGN/pG1jkwkY
         EMnDhXTkMZAIdwXQ5Hm8Vdo/WOl9zOU9Pq4qiTVXseNWKpd/QlpHWJ9qeRPPYuJ7HGEZ
         +BYg==
X-Gm-Message-State: AOJu0Yx3jugNvRT2dQ1Smzhrdck4t/tER5sM1oQNIrUriXZSKpeEoAkN
        reEqCRGTJuMXyxnqRigl0ovLZQ==
X-Google-Smtp-Source: AGHT+IHbsk17MHC1ZOrnCe3XmmMvQ8tujl3C2ZLsp7RvRp2klsO03kngkwXgqbGXLmpYUjjwn9OlCw==
X-Received: by 2002:a1c:721a:0:b0:405:1baf:cedf with SMTP id n26-20020a1c721a000000b004051bafcedfmr18766386wmc.24.1697026197027;
        Wed, 11 Oct 2023 05:09:57 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:e551:3946:26fc:f94])
        by smtp.gmail.com with ESMTPSA id w21-20020a05600c015500b0040652e8ca13sm19012253wmm.43.2023.10.11.05.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 05:09:56 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 54/62] pinctrl: rk805: drop the wrapper around pinctrl_gpio_direction_input()
Date:   Wed, 11 Oct 2023 14:08:22 +0200
Message-Id: <20231011120830.49324-55-brgl@bgdev.pl>
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
 drivers/pinctrl/pinctrl-rk805.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rk805.c b/drivers/pinctrl/pinctrl-rk805.c
index 968f066eb9da..56d916f2cee6 100644
--- a/drivers/pinctrl/pinctrl-rk805.c
+++ b/drivers/pinctrl/pinctrl-rk805.c
@@ -286,12 +286,6 @@ static void rk805_gpio_set(struct gpio_chip *chip,
 			offset, value);
 }
 
-static int rk805_gpio_direction_input(struct gpio_chip *chip,
-				      unsigned int offset)
-{
-	return pinctrl_gpio_direction_input(chip, offset);
-}
-
 static int rk805_gpio_direction_output(struct gpio_chip *chip,
 				       unsigned int offset, int value)
 {
@@ -330,7 +324,7 @@ static const struct gpio_chip rk805_gpio_chip = {
 	.get_direction		= rk805_gpio_get_direction,
 	.get			= rk805_gpio_get,
 	.set			= rk805_gpio_set,
-	.direction_input	= rk805_gpio_direction_input,
+	.direction_input	= pinctrl_gpio_direction_input,
 	.direction_output	= rk805_gpio_direction_output,
 	.can_sleep		= true,
 	.base			= -1,
-- 
2.39.2

