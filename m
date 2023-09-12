Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38CBD79CC2C
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Sep 2023 11:45:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229447AbjILJpc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Sep 2023 05:45:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231653AbjILJpb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Sep 2023 05:45:31 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 059BC1BE
        for <linux-gpio@vger.kernel.org>; Tue, 12 Sep 2023 02:45:27 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-402d499580dso57234805e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 12 Sep 2023 02:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694511925; x=1695116725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YRfuFIUTW49Hn8fWElGMAq5X0mzuQbDvwqoF+LsNH1c=;
        b=AzCvBvRlzzVCBYkRQXi+Zr0BEPi2LfpY2SCVXGSST5wtVcYv0UqHjjaOw8ojdfhzRX
         IClnlLFkyYS6QcXQxmSfKAxseC1fCRhayVWbFZwq0puFZm0BoOnlmMg8sHKrcVEGgGR0
         esceqyKjImswr7arpwBTW7mEJOCe7wSFHgFw902cFOrGnRXkDYCpFjGlUVx96jU+Ydm+
         o+YRw+JYDe1I9gJv6hqIguhIQA1pCRu+iJGrTXpL+moNpeUWwr8XRttAcDMmUpxKJcdm
         pPTF4PMAa3Yj2D8pJ/AMmMLAAKk89J8kys3sCCaxS9oCydtHKNzfitnnqYvSscWnzIJ6
         +8aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694511925; x=1695116725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YRfuFIUTW49Hn8fWElGMAq5X0mzuQbDvwqoF+LsNH1c=;
        b=bKS3nSYw49toxQyLWRfxpE8hNd7imh870BqzG41JyPH2j3FAlUO/IlQ9jWnnZjjri4
         AYyterEVkAqSyscv92k7xxvhjvvyMHPCJ7/APUSqf8mC0nVihs83iZq46cOgWTlTgHiD
         AR1Oj34gdhf9LQWx16CQOVq1w3nPTDcA0BFodQ6fM//ipoPaLwMn7vZu9aBOa3HeoHBp
         rwQMQSCD5muCeF6lkH63V6mVz+3ice1M8Tlk5W6S7i1sUBxZBjUAy4U1vA0k05EhkFCz
         LLE67H16FFKW4e6HEy4mFOZYhwXNpEpgiPKGpINiZtOOaCoLpIosMntNMWYcdUBdAhsr
         UEpw==
X-Gm-Message-State: AOJu0YyGVM7mTgMp4h6wx/qUOlW8BbSWipmGteEb+SHLjPK1RGyBmYxv
        EKWs7qUIO4LojMB4oNAr6M6Zkg==
X-Google-Smtp-Source: AGHT+IHtU50UsHXBxjl0VqDc3YeHj5oGlnYl90snSXH3GDk9o6Txx8JXskrddyi08MxGXuanMqYylA==
X-Received: by 2002:a1c:7206:0:b0:402:ceb:ca5b with SMTP id n6-20020a1c7206000000b004020cebca5bmr9583099wmc.20.1694511925379;
        Tue, 12 Sep 2023 02:45:25 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:907f:4cd7:f0ae:6b2a])
        by smtp.gmail.com with ESMTPSA id f11-20020a7bc8cb000000b003fefb94ccc9sm12321621wml.11.2023.09.12.02.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 02:45:24 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [RFT PATCH 2/3] gpio: eic-sprd: use a helper variable for &pdev->dev
Date:   Tue, 12 Sep 2023 11:45:18 +0200
Message-Id: <20230912094519.22769-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230912094519.22769-1-brgl@bgdev.pl>
References: <20230912094519.22769-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Instead of dereferencing pdev everywhere, just store the address of the
underlying struct device in a local variable.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-eic-sprd.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-eic-sprd.c b/drivers/gpio/gpio-eic-sprd.c
index 9b2f9ccf8d77..be7f2fa5aa7b 100644
--- a/drivers/gpio/gpio-eic-sprd.c
+++ b/drivers/gpio/gpio-eic-sprd.c
@@ -591,18 +591,19 @@ static void sprd_eic_unregister_notifier(void *data)
 static int sprd_eic_probe(struct platform_device *pdev)
 {
 	const struct sprd_eic_variant_data *pdata;
+	struct device *dev = &pdev->dev;
 	struct gpio_irq_chip *irq;
 	struct sprd_eic *sprd_eic;
 	struct resource *res;
 	int ret, i;
 
-	pdata = of_device_get_match_data(&pdev->dev);
+	pdata = of_device_get_match_data(dev);
 	if (!pdata) {
-		dev_err(&pdev->dev, "No matching driver data found.\n");
+		dev_err(dev, "No matching driver data found.\n");
 		return -EINVAL;
 	}
 
-	sprd_eic = devm_kzalloc(&pdev->dev, sizeof(*sprd_eic), GFP_KERNEL);
+	sprd_eic = devm_kzalloc(dev, sizeof(*sprd_eic), GFP_KERNEL);
 	if (!sprd_eic)
 		return -ENOMEM;
 
@@ -624,7 +625,7 @@ static int sprd_eic_probe(struct platform_device *pdev)
 		if (!res)
 			break;
 
-		sprd_eic->base[i] = devm_ioremap_resource(&pdev->dev, res);
+		sprd_eic->base[i] = devm_ioremap_resource(dev, res);
 		if (IS_ERR(sprd_eic->base[i]))
 			return PTR_ERR(sprd_eic->base[i]);
 	}
@@ -632,7 +633,7 @@ static int sprd_eic_probe(struct platform_device *pdev)
 	sprd_eic->chip.label = sprd_eic_label_name[sprd_eic->type];
 	sprd_eic->chip.ngpio = pdata->num_eics;
 	sprd_eic->chip.base = -1;
-	sprd_eic->chip.parent = &pdev->dev;
+	sprd_eic->chip.parent = dev;
 	sprd_eic->chip.direction_input = sprd_eic_direction_input;
 	switch (sprd_eic->type) {
 	case SPRD_EIC_DEBOUNCE:
@@ -659,9 +660,9 @@ static int sprd_eic_probe(struct platform_device *pdev)
 	irq->num_parents = 1;
 	irq->parents = &sprd_eic->irq;
 
-	ret = devm_gpiochip_add_data(&pdev->dev, &sprd_eic->chip, sprd_eic);
+	ret = devm_gpiochip_add_data(dev, &sprd_eic->chip, sprd_eic);
 	if (ret < 0) {
-		dev_err(&pdev->dev, "Could not register gpiochip %d.\n", ret);
+		dev_err(dev, "Could not register gpiochip %d.\n", ret);
 		return ret;
 	}
 
@@ -669,11 +670,10 @@ static int sprd_eic_probe(struct platform_device *pdev)
 	ret = atomic_notifier_chain_register(&sprd_eic_irq_notifier,
 					     &sprd_eic->irq_nb);
 	if (ret)
-		return dev_err_probe(&pdev->dev, ret,
+		return dev_err_probe(dev, ret,
 				     "Failed to register with the interrupt notifier");
 
-	return devm_add_action_or_reset(&pdev->dev,
-					sprd_eic_unregister_notifier,
+	return devm_add_action_or_reset(dev, sprd_eic_unregister_notifier,
 					&sprd_eic->irq_nb);
 }
 
-- 
2.39.2

