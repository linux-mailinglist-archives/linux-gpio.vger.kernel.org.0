Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D05E7C52FD
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 14:09:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346727AbjJKMJW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 08:09:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346709AbjJKMJU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 08:09:20 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D802FA7
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:09:17 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4054f790190so66592385e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697026156; x=1697630956; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n2xq1c7gkK7UBvFiiWYtPT4/dVB/RGOfCXDnH3L0uQ8=;
        b=Rn8Y2RgtcJbL2C2I9uXAMDRjbwn4rxH3cudydrpFBWpho07nFQ+P1pylpd4gc4so/f
         1e9SULpX+ttcw4qR1pv/9imewdtyRX5Es+cdsYotoCo/6GDXL3Kft0N0juMoVGpLOVmJ
         ZSF1qjpFhNB/UmRh40a4A4W1NdZzg3+6tm/sMcyWtYfIbzbEGyuUC+GLo5N2I6St9d63
         nH/o57BJ7EziL6hJCYyDiyXCwgggUO7QaucKpUDdc5E6602T6amQcrUNyTtW1OMFV7pI
         oiSO2oWkQ0U5OCICejnIu6IR8ND6jrM4vUpYWxNv90YcaGaPO3DmU0bdH6rF4r6w9qu+
         iX9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697026156; x=1697630956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n2xq1c7gkK7UBvFiiWYtPT4/dVB/RGOfCXDnH3L0uQ8=;
        b=GrT+C5Ne8czQv/Q3y1sb9hmZgc5izlOc/RtVv2z0a6oJUaHpeGfOmXmp+DusVr8dcD
         0jEHAle5IqZTI7OsxSCgaZSuQ/YxVb9P0a1yab5gG5nXEi+2CKA0EIrgw0093vE3U2cg
         9jlCCcjsLyPUpeQjdt8H/PgEtJU0uCNmlVT1Aq+S4cL4tJaxabb9j48dZNX1PWhFS/jx
         bboQr+sdqNDvlvMzO+DdE8MklQKqayyuuNbcQiKugB9UuDEANrpRakbKC7CM9AMEzG2U
         MeJezqNoXQn7wdTwdRH94dClUBayw0PiiV/4VKFpjFC5VomjrAUKXTBeEVt1NkqZ0/Rm
         GElg==
X-Gm-Message-State: AOJu0Yw9XW/fFzLTKxcpTe2HloJU5FN9TfwRfZLIf/VLeBScYO4Z3MNJ
        MWS5E7CnB+0f5GNyXt4OvgXMTg==
X-Google-Smtp-Source: AGHT+IEUv7780Bb/M1E5t39GEOcJn9PrfZyeunC1d2U0v9ISn/OQc0ss3KsB9U4S55tZwAPSeDXpLw==
X-Received: by 2002:a1c:7909:0:b0:405:36d7:4579 with SMTP id l9-20020a1c7909000000b0040536d74579mr17252432wme.28.1697026156295;
        Wed, 11 Oct 2023 05:09:16 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:e551:3946:26fc:f94])
        by smtp.gmail.com with ESMTPSA id w21-20020a05600c015500b0040652e8ca13sm19012253wmm.43.2023.10.11.05.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 05:09:15 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 10/62] gpio: pxa: use new pinctrl GPIO helpers
Date:   Wed, 11 Oct 2023 14:07:38 +0200
Message-Id: <20231011120830.49324-11-brgl@bgdev.pl>
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
 drivers/gpio/gpio-pxa.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index cae9661862fe..2fd797b91270 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -260,7 +260,7 @@ static int pxa_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 	int ret;
 
 	if (pxa_gpio_has_pinctrl()) {
-		ret = pinctrl_gpio_direction_input(chip->base + offset);
+		ret = pinctrl_gpio_direction_input_new(chip, offset);
 		if (ret)
 			return ret;
 	}
@@ -289,7 +289,7 @@ static int pxa_gpio_direction_output(struct gpio_chip *chip,
 	writel_relaxed(mask, base + (value ? GPSR_OFFSET : GPCR_OFFSET));
 
 	if (pxa_gpio_has_pinctrl()) {
-		ret = pinctrl_gpio_direction_output(chip->base + offset);
+		ret = pinctrl_gpio_direction_output_new(chip, offset);
 		if (ret)
 			return ret;
 	}
-- 
2.39.2

