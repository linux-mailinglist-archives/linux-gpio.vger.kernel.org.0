Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 146857CC26C
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 14:07:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234837AbjJQMHP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 08:07:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343627AbjJQMGb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 08:06:31 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B016C199F
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:23 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-405361bb94eso62868685e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697544320; x=1698149120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/mhvT3LGVBR3ArbIn65CBOCRrTrRmKVKXHcP7Km8akM=;
        b=FAxRI6s4n6cJU5UiEJKgX7H14xb5ird95C6Jl0iFf1+rI0yUv6c68bKvW6+AG8UCFY
         z1l09HcYjUNXjJjwiGBj4/steMwp4lKIPAiuvqMs4KkmYFCc2aoDhsfVB7liSm5hX1rD
         LjxrQWXa2jGndYNpjRjXjXItpBCRH8Ilw9LTCJyrTXpESIhGRqtzIBoPv473wLBdAjAr
         EJkXhT31E3p7+VNCv6/Qs/QeuafSZf6JhzhmH7V7JHwSYJ3bquuAyd5pnO4w4Y0hdScQ
         RGrkCnunKWM3e8pOVz66HhoTtstTrQxFXj/PoJdK6wI+sYwwGaxyCU7IstcgPArGihSp
         ufjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697544320; x=1698149120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/mhvT3LGVBR3ArbIn65CBOCRrTrRmKVKXHcP7Km8akM=;
        b=bWtH8vnuuXy9jdchokV4ToIW/YkDti1GsaH3rI7Qp14K+Rq74xv8Y6Tz2T5pC4qMTl
         J/lq0slhMnDs3xVbY7hduivNHMKpkCllKGdpbFYVNATxmVfEYsDI1Y6S53E1E8yemCf9
         BJJr476VUzUxDMnAnvcCOXV5W9sfXc1e4iicfLI1becK32pmbk5oJw0+KQsQvWVGndae
         js5thwHLg5Bd493f3MXfhP8IEbgUNiMA4H1XOYvvUds6kE0DrGyL3hu2cAJAdtzqWkn4
         HfzQGLrrPmCZuDZnFzKXkwUxxpY9sPjerpOoI83Cul2EwlwrsZwrpfpAVWc7JUQsFi2y
         O0Vg==
X-Gm-Message-State: AOJu0YwbZfXSgbg5A2prIBKXCtsIeqN6nkKsZv+U5sfwsY/qcXBLGwmU
        OTB7KEaPVad7NUDoPpPESySUVo14PEDY1jHYiqw=
X-Google-Smtp-Source: AGHT+IErM7HnvqvaqMkWd8NEyyIV6oAV292EvRRFdV8DIMa3hBhS+ET4hre3xImM2+EUmufX/Y58fg==
X-Received: by 2002:a05:600c:5490:b0:3f9:b244:c294 with SMTP id iv16-20020a05600c549000b003f9b244c294mr1727964wmb.35.1697544320063;
        Tue, 17 Oct 2023 05:05:20 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f1ee:b000:ce90:ed14])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c224200b00405442edc69sm1353859wmm.14.2023.10.17.05.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 05:05:19 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v3 33/73] pinctrl: intel: use new pinctrl GPIO helpers
Date:   Tue, 17 Oct 2023 14:03:51 +0200
Message-Id: <20231017120431.68847-34-brgl@bgdev.pl>
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
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 9731a3acb23c..f403eb78f355 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -992,14 +992,14 @@ static int intel_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 
 static int intel_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
 {
-	return pinctrl_gpio_direction_input(chip->base + offset);
+	return pinctrl_gpio_direction_input_new(chip, offset);
 }
 
 static int intel_gpio_direction_output(struct gpio_chip *chip, unsigned int offset,
 				       int value)
 {
 	intel_gpio_set(chip, offset, value);
-	return pinctrl_gpio_direction_output(chip->base + offset);
+	return pinctrl_gpio_direction_output_new(chip, offset);
 }
 
 static const struct gpio_chip intel_gpio_chip = {
-- 
2.39.2

