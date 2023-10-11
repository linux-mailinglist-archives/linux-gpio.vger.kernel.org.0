Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCD977C5304
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 14:09:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346765AbjJKMJb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 08:09:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346728AbjJKMJW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 08:09:22 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3476FE6
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:09:18 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4064867903cso68963615e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697026157; x=1697630957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rjj2L8rLah6r0INEUdpiOGWMpBQyEZBDFUolDbEZ0p0=;
        b=IfFJ4QcCycmvpK6hYeK4jU5y/G4/whwCWX0MOMywer2z+WOd6L1VBIuDhqgQjx5yDd
         5mflkF8cs1ql1ovCAbOwTs4cb/SWEB2+hFM2ceS4c6pi+8MWdi14WRAl8F1i39SNXrHe
         xDBYQ8Qu8EjWg4FOfjNp5oVGAwyZRm6u2JDgUqQ6Ku9WVob7DHyBIhVVeev1/pHaKY+7
         BF4RLQGv3wvE4dVYue2qqpN62mxmGMYP06L4Z1RBmoPkixTj839Ny+QKmCICnnaLxz81
         HKVU9iS6O1RO1o/ePvkPWwctS1aF951VRmAjs6+cEYPiRbw7V49lUp09Pb4u8Ha7ij4k
         UUIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697026157; x=1697630957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rjj2L8rLah6r0INEUdpiOGWMpBQyEZBDFUolDbEZ0p0=;
        b=YpqQ9wnkVppy5sy+2BYjQvkRhu8XNbPYeWZnGtobYuluBeIgOunjhv6RJaDSDoB5mx
         wIZuBJkvZbPPfAuqpOIELDZayMVf2+qjj5tiywrsHSFMYdYnxBO0RjIpQTzmnVm+oroe
         p3dVupR+9Tsx1PORZlqAtol5KIkTq/b/L7K3LWQuO13pb0FXOiiEVSNPNifLiCnsko7V
         3Rg07wOjjKoAFJIX+GxJRLFOfdKJ0VZ3odg7s1DNJO5pegUAEVEQBPsNy7MbSpV38cG4
         ag2dTIo1CkdbHJ0uuxkNhTAQ+mnCL9UQoQMLxX/tXgnwm5ocEcTat1kDOkfe3FqgQCWj
         AWQw==
X-Gm-Message-State: AOJu0Yya7X0YLRcwlC5+yRZRCZolvkCrEu0NaJo2GVVKBGit6xJesYPk
        n9eYNN6aK0uuBc8fP6VHnahvCNk75m3czGQNwCo=
X-Google-Smtp-Source: AGHT+IFtN5q9/Ut2tEc5WlhMBZUZWAnpAhcXhtOqB4VVSE/NA7KEd93NNfT9rKiDuCKdtmgesKepiQ==
X-Received: by 2002:a1c:6a18:0:b0:405:4a78:a892 with SMTP id f24-20020a1c6a18000000b004054a78a892mr17742588wmc.9.1697026157253;
        Wed, 11 Oct 2023 05:09:17 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:e551:3946:26fc:f94])
        by smtp.gmail.com with ESMTPSA id w21-20020a05600c015500b0040652e8ca13sm19012253wmm.43.2023.10.11.05.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 05:09:16 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v2 11/62] gpio: rockchip: use new pinctrl GPIO helpers
Date:   Wed, 11 Oct 2023 14:07:39 +0200
Message-Id: <20231011120830.49324-12-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231011120830.49324-1-brgl@bgdev.pl>
References: <20231011120830.49324-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
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
Acked-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/gpio/gpio-rockchip.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index 23040a8cea34..3576793f0bd9 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -159,9 +159,9 @@ static int rockchip_gpio_set_direction(struct gpio_chip *chip,
 
 
 	if (input)
-		pinctrl_gpio_direction_input(bank->pin_base + offset);
+		pinctrl_gpio_direction_input_new(chip, offset);
 	else
-		pinctrl_gpio_direction_output(bank->pin_base + offset);
+		pinctrl_gpio_direction_output_new(chip, offset);
 
 	raw_spin_lock_irqsave(&bank->slock, flags);
 	rockchip_gpio_writel_bit(bank, offset, data, bank->gpio_regs->port_ddr);
-- 
2.39.2

