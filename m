Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D8672A6DE7
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Nov 2020 20:32:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731537AbgKDTbF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Nov 2020 14:31:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730788AbgKDTbE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Nov 2020 14:31:04 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32546C0613D4
        for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2020 11:31:04 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id s9so23291815wro.8
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2020 11:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PfaggvFtdrOq7HMZ8nUir6KiglSCvEmyQ3kUEaGT+6M=;
        b=OsdPJIomd69BhDyc9fg34yfsJj+muR6UcvOsSuGalhlbj1c91hG/Pk7tQ3DprEEVbU
         BtEa1i4nmIeAJawI9HvI2Nu9t+PfqSF//7VbO15EdAu6fW1fKK1sLXAHZG+yxS5o2hLD
         XPEhpXVbvBkjmpyHR++CudxD+yuRRwI+b2cHjpJDRUsFoKcSw4JPzZv25YYFC41CYwBh
         Ei8Rk4WnRZkAVA12xa+SXFzo7JZDAzZAP/mSjZSLGrkv7lzXYrmzDoaavdlTyI4U0My7
         Qkf/k0NUzi21gIsEcXvcKhFfvt9kc3S9jyl3uoLk0M7b9LKKAEN11U8IhtRVM1MK6xnC
         uZsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PfaggvFtdrOq7HMZ8nUir6KiglSCvEmyQ3kUEaGT+6M=;
        b=QSZj/JQLt5ui2h1/x1Q3khiNw298gNG/Sl4xKwkohqxPcgS0k6GqeKFdIfhbd7TNXI
         s6a32epHe4jxFM8oSQG1YHy8PW0UrMEr9tb6LTOwJRRcluZAu36J/8F8NDwXYS9sUaLm
         xC9jI9SryP7JkpgTNG4ia9n3VXmeRz89lcM91xBeh1CEls3NuPVx+M6XplBHYbMACp5y
         xiZFLJN6dwfB33Gx6Wn7f+7UPwWQCVK4IDmc4OZqR0OrYlMb2yca4f+GuFJvF/uCuGMZ
         4kfcGqNgBOrlb8WpncAjQTT/wC/F4o/j7Lo2Of33CPCWLYdI4WhZbrz5XLkICiWy5N3m
         DhcQ==
X-Gm-Message-State: AOAM5329LJXTfD36ICSTgwZxMVNsKjt3DUt8yGeZI69QIeN6cu0c9Eo2
        XBukFcSUGPxztTd5+jqyFI/2VQ==
X-Google-Smtp-Source: ABdhPJyl+5LxdbZHeWV1XMmLoAnA5++zG1zykwQR0D3QUEbfi6nyl4tK2QgVIKXmf6EHP+zC74SeNw==
X-Received: by 2002:adf:e5c1:: with SMTP id a1mr29328591wrn.12.1604518262880;
        Wed, 04 Nov 2020 11:31:02 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id m12sm4051671wrs.92.2020.11.04.11.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 11:31:01 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        David Laight <David.Laight@aculab.com>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 5/8] gpio: exar: use a helper variable for &pdev->dev
Date:   Wed,  4 Nov 2020 20:30:48 +0100
Message-Id: <20201104193051.32236-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201104193051.32236-1-brgl@bgdev.pl>
References: <20201104193051.32236-1-brgl@bgdev.pl>
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

