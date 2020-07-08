Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0977921917B
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 22:28:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726100AbgGHU1X (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 16:27:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726276AbgGHU1A (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 16:27:00 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F4F4C061A0B;
        Wed,  8 Jul 2020 13:27:00 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id z24so30846802ljn.8;
        Wed, 08 Jul 2020 13:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=G8IR7Xkw7p14vPfMfu5fD9HD3w4VKtmbWzIW+OGI1yk=;
        b=k5JCEhAC9DDHSBV31YmrxT4cfj7gzylEmrkvPEuROEHuWrPUICK8NDF1TcFnO27O3O
         cEfISOikt46qhxdWTw872qbXy7IV1LKDmAwr1ArMH6m1/w1j9gkpidPGAoXQLW+y0+Ep
         Q1pIk8bjSY+V7X1M873ohUrDQR3mLq1xptFSDDN2HZnV1Y01OrG/1R3AjD/IW1+06YVL
         eOAGk8I0q0W917SbCqjLAhglgiMqBoomgOAtrUTALx9TdZv6yYAzqDpAbfRaD8/eX2B8
         CI+sUcfOanNNaR76Cxst4+ySmcSseom6K9n4wNLYevc6nmQkX28e2S21jgUBiB4ULyDh
         4BoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G8IR7Xkw7p14vPfMfu5fD9HD3w4VKtmbWzIW+OGI1yk=;
        b=p373SZTM8ZBgL00DBkDp2k9m9LQVz+INRdt2ag26mXrNbokVjtUsW+3RjPUOiScVPy
         LSTvsYLVmigZle3zm2VAAcRa+p87XLZ7PXbef6xZSEcTRxFBEoLEwZEMLH/3BeH3u99u
         bQbMva5YhrFghPaOeGudWp83H1IJlQTQEiGiOeQSoiHlbCK6leo51gCqhwXOLJmH3vyf
         GJPlmwMv0OA15fZAGrafz9msPSgSerS+6coG56HIU7jGoLh9Pbgtj0FV+70ULHO6BVVe
         CxOqrsIbSMu5qjjPGSYCZ6+8hQV01pe4AF5qmnPOTBFnv33d+BmI2zYy32VqnFe/nR3/
         cUOw==
X-Gm-Message-State: AOAM533ZWfiPE36IMG3gld0RjsSHcGAlYvj1c8Et7a2aD6Yc8Lbe9eLq
        XCXHS5b1nymomzBjuT6jREI=
X-Google-Smtp-Source: ABdhPJwymxKW4D+r7jN4D9H57HLoBeNj102sloKjvG62qW32JziVwlXpBg660Jmuz5diOlDb1IV4Dw==
X-Received: by 2002:a2e:3a15:: with SMTP id h21mr22553514lja.112.1594240018745;
        Wed, 08 Jul 2020 13:26:58 -0700 (PDT)
Received: from localhost.localdomain (ppp91-79-162-105.pppoe.mtu-net.ru. [91.79.162.105])
        by smtp.gmail.com with ESMTPSA id e29sm252568lfc.51.2020.07.08.13.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 13:26:58 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/6] gpio: max77620: Don't set of_node
Date:   Wed,  8 Jul 2020 23:23:52 +0300
Message-Id: <20200708202355.28507-4-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200708202355.28507-1-digetx@gmail.com>
References: <20200708202355.28507-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The gpiochip_add_data() takes care of setting the of_node to the parent's
device of_node, hence there is no need to do it manually in the driver's
code. This patch corrects the parent's device pointer and removes the
unnecessary setting of the of_node.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpio/gpio-max77620.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-max77620.c b/drivers/gpio/gpio-max77620.c
index 7f7e8d4bf0d3..39d431da2dbc 100644
--- a/drivers/gpio/gpio-max77620.c
+++ b/drivers/gpio/gpio-max77620.c
@@ -279,7 +279,7 @@ static int max77620_gpio_probe(struct platform_device *pdev)
 	mgpio->dev = &pdev->dev;
 
 	mgpio->gpio_chip.label = pdev->name;
-	mgpio->gpio_chip.parent = &pdev->dev;
+	mgpio->gpio_chip.parent = pdev->dev.parent;
 	mgpio->gpio_chip.direction_input = max77620_gpio_dir_input;
 	mgpio->gpio_chip.get = max77620_gpio_get;
 	mgpio->gpio_chip.direction_output = max77620_gpio_dir_output;
@@ -288,9 +288,6 @@ static int max77620_gpio_probe(struct platform_device *pdev)
 	mgpio->gpio_chip.ngpio = MAX77620_GPIO_NR;
 	mgpio->gpio_chip.can_sleep = 1;
 	mgpio->gpio_chip.base = -1;
-#ifdef CONFIG_OF_GPIO
-	mgpio->gpio_chip.of_node = pdev->dev.parent->of_node;
-#endif
 
 	platform_set_drvdata(pdev, mgpio);
 
-- 
2.26.0

