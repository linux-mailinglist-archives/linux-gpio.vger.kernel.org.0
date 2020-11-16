Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CA492B417A
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Nov 2020 11:45:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729209AbgKPKm4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Nov 2020 05:42:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729231AbgKPKmx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Nov 2020 05:42:53 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8934AC0613D1
        for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2020 02:42:51 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id j7so18128241wrp.3
        for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2020 02:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Q02O158u45chZEvNdMxWNUDzuTb+nVdXQtak9tzkd6k=;
        b=MCQuYzsE94uZ96MrROaVasMh9Yb+lHebTfb8vcCk3r0lVc8aEq/89ihbTdreqEjXL4
         hjT5x13lZgRMOVTJYM3lj7DwDQCx+ypJeChiWSdYTg+eBWytFW8S/c8FpdnRUyplERRI
         RzAe2PDp1stjjQKzNKvoh6rV39adoUMS7nYMnpojzVaVaQRW6nj46qvwG5uYlbU3GjjJ
         YsMxW4qxcpOZRDRF1H9LO2AeMFo4L5bd42DuK69IbZX+SV2RlY9uGy3jplDhayDZbfGh
         fKJNwhQqzm/QFxS1fzpThR+dc0zSL5ffNl+eRIvOZ15uXxl5szI+jmjIadCk0NyXOc79
         4LSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q02O158u45chZEvNdMxWNUDzuTb+nVdXQtak9tzkd6k=;
        b=Xm2Bd1myrHlpAzNdruuaEwNZlOIdy0L5b+DEJSpBjwSpTsOEjmbaTn+Y58W6sGlyhe
         f+YBO/oKq3qNVWbJeBW3/GAOTh6QfGDmyE1XhGvTz9+lfNkPCHq9mKKJlxlJEw55gsjv
         Tt/oSQ/ko9oLjMJyllWOf7oYPBWk+vEKpSFqZJvl9tujuK5c9WH8Jy6rwFj/nFpyDtKe
         DYpVvmDz1l0HtWA4p0s8HB6LWCCQp+5woZ5fcgTEWqAYfstgVEb6vtBg8lcNSByKwaD1
         RHma4wfScyBNoPmbTAvjk3YblnSK97n9JJCzz76qt4SxANQ6GqEBgNGf4CqMqAoRUKrZ
         4IxQ==
X-Gm-Message-State: AOAM533P+HZTduCr/tRGOtS0Xz5N5UuHcnxG/PERyC+LS5oNB30iUm5O
        rC5DiDoSjGsaphrRyzDo6Zo0jg==
X-Google-Smtp-Source: ABdhPJyeaaYf9GeNATyQ2b7LcbL4id4iZBCKBQvrW1miT5wze9Rl7bxXn3r/PPAFCvUExed3atltnA==
X-Received: by 2002:adf:fa10:: with SMTP id m16mr18573031wrr.194.1605523370347;
        Mon, 16 Nov 2020 02:42:50 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id v16sm20583283wml.33.2020.11.16.02.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 02:42:49 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        David Laight <David.Laight@aculab.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v5 4/7] gpio: exar: use a helper variable for &pdev->dev
Date:   Mon, 16 Nov 2020 11:42:39 +0100
Message-Id: <20201116104242.19907-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201116104242.19907-1-brgl@bgdev.pl>
References: <20201116104242.19907-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

It's more elegant to use a helper local variable to store the address
of the underlying struct device than to dereference pdev everywhere. It
also has the benefit of avoiding unnecessary line breaks.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-exar.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-exar.c b/drivers/gpio/gpio-exar.c
index 752e8437ff80..db366d85b6b4 100644
--- a/drivers/gpio/gpio-exar.c
+++ b/drivers/gpio/gpio-exar.c
@@ -120,7 +120,8 @@ static int exar_direction_input(struct gpio_chip *chip, unsigned int offset)
 
 static int gpio_exar_probe(struct platform_device *pdev)
 {
-	struct pci_dev *pcidev = to_pci_dev(pdev->dev.parent);
+	struct device *dev = &pdev->dev;
+	struct pci_dev *pcidev = to_pci_dev(dev->parent);
 	struct exar_gpio_chip *exar_gpio;
 	u32 first_pin, ngpios;
 	void __iomem *p;
@@ -134,16 +135,15 @@ static int gpio_exar_probe(struct platform_device *pdev)
 	if (!p)
 		return -ENOMEM;
 
-	ret = device_property_read_u32(&pdev->dev, "exar,first-pin",
-				       &first_pin);
+	ret = device_property_read_u32(dev, "exar,first-pin", &first_pin);
 	if (ret)
 		return ret;
 
-	ret = device_property_read_u32(&pdev->dev, "ngpios", &ngpios);
+	ret = device_property_read_u32(dev, "ngpios", &ngpios);
 	if (ret)
 		return ret;
 
-	exar_gpio = devm_kzalloc(&pdev->dev, sizeof(*exar_gpio), GFP_KERNEL);
+	exar_gpio = devm_kzalloc(dev, sizeof(*exar_gpio), GFP_KERNEL);
 	if (!exar_gpio)
 		return -ENOMEM;
 
@@ -157,7 +157,7 @@ static int gpio_exar_probe(struct platform_device *pdev)
 
 	sprintf(exar_gpio->name, "exar_gpio%d", index);
 	exar_gpio->gpio_chip.label = exar_gpio->name;
-	exar_gpio->gpio_chip.parent = &pdev->dev;
+	exar_gpio->gpio_chip.parent = dev;
 	exar_gpio->gpio_chip.direction_output = exar_direction_output;
 	exar_gpio->gpio_chip.direction_input = exar_direction_input;
 	exar_gpio->gpio_chip.get_direction = exar_get_direction;
@@ -169,8 +169,7 @@ static int gpio_exar_probe(struct platform_device *pdev)
 	exar_gpio->index = index;
 	exar_gpio->first_pin = first_pin;
 
-	ret = devm_gpiochip_add_data(&pdev->dev,
-				     &exar_gpio->gpio_chip, exar_gpio);
+	ret = devm_gpiochip_add_data(dev, &exar_gpio->gpio_chip, exar_gpio);
 	if (ret)
 		goto err_destroy;
 
-- 
2.29.1

