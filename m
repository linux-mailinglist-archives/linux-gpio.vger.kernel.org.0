Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF8ED219169
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 22:27:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726247AbgGHU07 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 16:26:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbgGHU06 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 16:26:58 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BB98C061A0B;
        Wed,  8 Jul 2020 13:26:58 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id q4so20026582lji.2;
        Wed, 08 Jul 2020 13:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AVFmhaeA5cvY8qQWmM2cLZu7hHq0yenJIow/Vk0mZ2I=;
        b=eVK8hKTdtIXPUZOZXtTZKYgZ3RgH/i5BHBuFZk3AJO6QaexqPG9IoNJk1CfsL7XjnW
         lJPllUeAN9h2ofoqdpeSkFENA+h0WcaCtZiDWT8qtn3YhIaNO6aD9XqsFRcUZjjCVhy7
         DvHRThf0/p07m8x5BgTStYKJ46W109i/xupEV7kuhEdMsHSBBr8hbWTZsWFDjrcXwdwX
         hp3AH+pO1Iw7MGYJML7Uqkpc/9DQ2QA78C6Y0RFwQ3sxthD9fvJsVHMTjYdsOIeDsuWQ
         fMWzF7FOw9u1CzlaE/DhJ+efu12EMeVotAB4rTgOZUvcIfOsUADFsaYckYpWkqtQqc5S
         e0wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AVFmhaeA5cvY8qQWmM2cLZu7hHq0yenJIow/Vk0mZ2I=;
        b=mBzEO3yKIal2A3Mkb/ia5LPBik0l46upU75WPn6mn36fss5qj8JNvyW5l/tRBVG7it
         8FrTpVO/LB1S4jeZNUNV/Ey8pRr4cwYtDArCe+j335wgyTFyAsgeaY2sW1FY/cLa5ZOS
         dXqNO+hJtthB4JJthD2jRrr2ViYlAwbJD+Q/1y3jW5/gilqwBpFXl70ldf58MA63bI+J
         aazmVZq4dDYLIS/ylTjBNcTEPrIQN1Jubl+PGLK0FqdYLYf6MNkjWSYsOLABoA40cnn/
         KtVhZ23p/nhs2WZxhYY5YZrTJ3H4wcd77X6XSQBqbgN5t24xlaLUxMNDLvvzGRKScR1N
         uYQQ==
X-Gm-Message-State: AOAM533KgmNRhD+a93e0ggeYKpF1bxeJtKHhQCXeKk6M50ZFnNocKt69
        GsNGjh2pF1ze/YyXYI1Qhtg=
X-Google-Smtp-Source: ABdhPJzFZ9tL3aVPDUSm+fuPTBkpyEq8/aaHkGVmc4H0PZh6XQi7qQbdN4YEoIkkOZP6kH08UE9hwA==
X-Received: by 2002:a2e:5d8:: with SMTP id 207mr33377701ljf.257.1594240016560;
        Wed, 08 Jul 2020 13:26:56 -0700 (PDT)
Received: from localhost.localdomain (ppp91-79-162-105.pppoe.mtu-net.ru. [91.79.162.105])
        by smtp.gmail.com with ESMTPSA id e29sm252568lfc.51.2020.07.08.13.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 13:26:56 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/6] gpio: max77620: Replace 8 with MAX77620_GPIO_NR
Date:   Wed,  8 Jul 2020 23:23:50 +0300
Message-Id: <20200708202355.28507-2-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200708202355.28507-1-digetx@gmail.com>
References: <20200708202355.28507-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The MAX77620_GPIO_NR enum value represents the total number of GPIOs,
let's use it instead of a raw value in order to improve the code's
readability a tad.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpio/gpio-max77620.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-max77620.c b/drivers/gpio/gpio-max77620.c
index 313bd02dd893..4c0c9ec2587d 100644
--- a/drivers/gpio/gpio-max77620.c
+++ b/drivers/gpio/gpio-max77620.c
@@ -19,8 +19,8 @@ struct max77620_gpio {
 	struct regmap		*rmap;
 	struct device		*dev;
 	struct mutex		buslock; /* irq_bus_lock */
-	unsigned int		irq_type[8];
-	bool			irq_enabled[8];
+	unsigned int		irq_type[MAX77620_GPIO_NR];
+	bool			irq_enabled[MAX77620_GPIO_NR];
 };
 
 static irqreturn_t max77620_gpio_irqhandler(int irq, void *data)
@@ -38,7 +38,7 @@ static irqreturn_t max77620_gpio_irqhandler(int irq, void *data)
 
 	pending = value;
 
-	for_each_set_bit(offset, &pending, 8) {
+	for_each_set_bit(offset, &pending, MAX77620_GPIO_NR) {
 		unsigned int virq;
 
 		virq = irq_find_mapping(gpio->gpio_chip.irq.domain, offset);
-- 
2.26.0

