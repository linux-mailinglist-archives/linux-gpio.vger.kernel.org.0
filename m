Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D9F17C534D
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 14:12:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234946AbjJKMMo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 08:12:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234957AbjJKMMV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 08:12:21 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E730B1FD9
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:10:40 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-32157c8e4c7so6642843f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697026204; x=1697631004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4LZIUlewtVfNK9nVoiXqaExbYoS0xfZdDyCSvk2gByo=;
        b=Nf5RdwE6yhqFdyYTXpyFyz/WWrsW9eGihDz8CrOx/VB8cWbx7HtjR9xEndfboBIhci
         AwNLShAW1U+S7bSdA7mIsu/QTppLPxHIAvNXakZ5kfsyPGIrHkx7YOv3YkEk1cyrVnxO
         OE58ZjEW+5ZEzx9JDQRvrfto2Ecbq5WbNauXNtfBpKSwsYkJ4O14S1AcDJms8nPvgcx/
         IhndHCln5BGo+qKjplqrRAjSwWA13HskQpPq80jn9UJz1/98256HzBfZvzq2PMb+qhH9
         Zf0JeJfLq0jOGvL9uLnLLve/aZRhKjyZTHHbZ5hp6n++o1fbf5HNGWNTt1gy3X5f7HF5
         rSVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697026204; x=1697631004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4LZIUlewtVfNK9nVoiXqaExbYoS0xfZdDyCSvk2gByo=;
        b=l552n1PLA/tfreadxRw5CdqcZR3cDJHYyiRKKNdFwtHCS6RqdB3EJN7YLwvfjAyXyq
         G6eRWYSqmutedRxGO7+c/nIPWRSA3HwitMlMPGuPxz/g9yuKeeLnndSsN1SFtObloaoM
         uDZYM9YTjrw95YNTRE2ib4+/eGJn9ECYP2b8BK/YYD9qDfxaUxLTKuVqlg8WQ9T45Hki
         E8dhpmp6p67TIXZNScA5Y6DZ2Sxi8MfuY/0IukWCuwXncamoo0ENcc6cyiBQtlsovoAI
         KWx5gehosMjYvFYgJnSN/oe1gJWdUDviFqeDquVd+2hkvI7j9MkJWQPnKtBeeP3hpE2v
         lXzw==
X-Gm-Message-State: AOJu0YyrSvy8BYE+8C36Hd2fnZC4QP9yT0c5lBOMKowokf0gK5Mi4ezI
        rbN39YUMWRlsfEq88CeIyTEz8Q==
X-Google-Smtp-Source: AGHT+IH4maRAwRzcaevPB/f3f3E+P7d+G3CxPj36ujiSz4Q04iXxz1W4INNjCrmHRJ8dEAGjsXmhvQ==
X-Received: by 2002:adf:ed8c:0:b0:31f:9a0d:167f with SMTP id c12-20020adfed8c000000b0031f9a0d167fmr17018035wro.50.1697026203806;
        Wed, 11 Oct 2023 05:10:03 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:e551:3946:26fc:f94])
        by smtp.gmail.com with ESMTPSA id w21-20020a05600c015500b0040652e8ca13sm19012253wmm.43.2023.10.11.05.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 05:10:03 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 61/62] pinctrl: em: drop the wrapper around pinctrl_gpio_request()
Date:   Wed, 11 Oct 2023 14:08:29 +0200
Message-Id: <20231011120830.49324-62-brgl@bgdev.pl>
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

pinctrl_gpio_request() now has the same signature as the wrapper around
it so we can drop them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-em.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-em.c b/drivers/gpio/gpio-em.c
index aa31c189d0ef..6c862c572322 100644
--- a/drivers/gpio/gpio-em.c
+++ b/drivers/gpio/gpio-em.c
@@ -227,11 +227,6 @@ static int em_gio_to_irq(struct gpio_chip *chip, unsigned offset)
 	return irq_create_mapping(gpio_to_priv(chip)->irq_domain, offset);
 }
 
-static int em_gio_request(struct gpio_chip *chip, unsigned offset)
-{
-	return pinctrl_gpio_request(chip, offset);
-}
-
 static void em_gio_free(struct gpio_chip *chip, unsigned offset)
 {
 	pinctrl_gpio_free(chip, offset);
@@ -311,7 +306,7 @@ static int em_gio_probe(struct platform_device *pdev)
 	gpio_chip->direction_output = em_gio_direction_output;
 	gpio_chip->set = em_gio_set;
 	gpio_chip->to_irq = em_gio_to_irq;
-	gpio_chip->request = em_gio_request;
+	gpio_chip->request = pinctrl_gpio_request;
 	gpio_chip->free = em_gio_free;
 	gpio_chip->label = name;
 	gpio_chip->parent = dev;
-- 
2.39.2

