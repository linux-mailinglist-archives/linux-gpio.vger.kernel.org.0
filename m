Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F32D22AD663
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 13:34:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730188AbgKJMem (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 07:34:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730368AbgKJMeT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Nov 2020 07:34:19 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9277EC0613D4
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 04:34:17 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id l1so8079365wrb.9
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 04:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PfaggvFtdrOq7HMZ8nUir6KiglSCvEmyQ3kUEaGT+6M=;
        b=XgP2lpZ7sNTP39KAJnM5hk59mZAsUaQddhD+TeG5HVmWaqo+DMqn5V5nSmXA7svd3i
         OwoDDQHaqK4/unX2hjgegiZ04JxLFOICSNwhuUJO2mJAQizZzTdwPPfstZuUv7gAJMeU
         rWhflojQF7gxeD+uuvNrxCLRPHNTmzy/DIqPR6MKbVz5BX8z0CMvsdEPCDQLA6IAeAxB
         NUpwX1MZ3+aNbamdbuAYbZU2/dHYFmCKVfkFymAG08kLvdjfhO6C7qUAiylXsLjxccpy
         eY6I81FUOTZWUe9TpJOas+VEWyW1+8RE5jhfbSH7StdH5oTb3Fm8jcIdCLn29yPTzrWc
         5JTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PfaggvFtdrOq7HMZ8nUir6KiglSCvEmyQ3kUEaGT+6M=;
        b=O2Kv7IqLhujert34JTEnIJmDg/Su9Wifo9tWe6jilgYznXYmwl27xvsdJYwK0Y90bJ
         BQPBOuSHxIjkdFOAgB6Ilqn1L+2XQE3suMkMu+EFImc6aUm8SL5aOBfRJKBgQJYj4SBf
         ukxTa0A4DkUmtDBtYPDVszPcO2P2rrjmRWZKeyCyqCMqW5kq/bBDirdjEwVZNVT5iuJG
         nCejCZbbkQcIJAGCdOyc+wV3GMT76/7GzvLNNrpmk65s/mC8vcwSlaZeuEiXUUR7k84z
         vhBJGWbr2Gu7KV+0vgqdxmX2iFlkBRq12mBvNSIhDJgpMOvlauk3v8n3r55armm+GV+M
         C5+w==
X-Gm-Message-State: AOAM533J3gCcnE+96QPXJ6Fk5msjl7AqY/kcVRNskCZQcRiwmvRIVpdj
        0AxiJmRdc7Z422l1AKptlvZzTg==
X-Google-Smtp-Source: ABdhPJyPMyCWcCWV/S4h71OligLEe2M2Aku7IwEAteDmmEXoxBfE8GUYL7QJkzyHPj+7FAZNdRGlrg==
X-Received: by 2002:adf:9124:: with SMTP id j33mr22958848wrj.376.1605011656352;
        Tue, 10 Nov 2020 04:34:16 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id s8sm12942217wrn.33.2020.11.10.04.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 04:34:15 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        David Laight <David.Laight@aculab.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 4/7] gpio: exar: use a helper variable for &pdev->dev
Date:   Tue, 10 Nov 2020 13:34:03 +0100
Message-Id: <20201110123406.3261-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201110123406.3261-1-brgl@bgdev.pl>
References: <20201110123406.3261-1-brgl@bgdev.pl>
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

