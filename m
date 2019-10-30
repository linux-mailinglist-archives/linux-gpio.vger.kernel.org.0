Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9D8BE9B8B
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2019 13:29:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726088AbfJ3M3V (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Oct 2019 08:29:21 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:44512 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726184AbfJ3M3U (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Oct 2019 08:29:20 -0400
Received: by mail-lf1-f66.google.com with SMTP id v4so1386620lfd.11
        for <linux-gpio@vger.kernel.org>; Wed, 30 Oct 2019 05:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XWc+D4bAlNaYyFqWXP+pbdIeJckIAzrV3H2Lt8z7+Us=;
        b=od9wq2omSQU6wUPacuUEwaHujmzaW298xCoZp2G7uZVU3SGyXcbe7CMn7ySvUDIp3b
         +zFL2oNv2Lj1B/qWBMOvV29m2Z4YrBXpTG+5C5/7NgAr51wzfgd5CKsMe4OOia58N3Vq
         s0TaepUlLBgP5zkvInhxVOlRetpH6LS0Kmou73oeyBuZRKYMhVYfL22HzDrxkWkOT4nD
         qAXoA1tw8vos9cFW78DmXtX61PuMGmvnRX1ygK0GFmkYb7UG+KWjzevb7sA+MFwBSJ1J
         1k1wSnR5m7d7qSzyaHJ1D7qucdkrtxvtEhG/7ACqAN7vQ2uDmDxvsRz1EBZiG/YX5PRH
         CyPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XWc+D4bAlNaYyFqWXP+pbdIeJckIAzrV3H2Lt8z7+Us=;
        b=VFPMpyj0D5fGtfyfi0WViVI5iWqMJCj9e4MbdpwPrNUisTZWjvzQzdVa+7aovnH292
         Gva2uprR0KJetN3Cr3y5gUDXXH6QkUg6VoWePHASpbVamRW+ahKAIw9gVA3TiIzwbsym
         J9XTg7dKp8t2fdTqxMQdCtIallgEiHdzDFAKzWK4LLUK1GCpmrtXk+r7JTB73/bw84nM
         3x1K1k3FPF2dFPTjiuKnGT6Ru5pTaN/c0prum3JrnLZdyqfnr6PBgCUOsfHYOltBhYXh
         4qkqX8gnpezJIkwAQMhtZAA1rSOKMMSFw/pOc/7l9SJguzKEKgEdVfPT+A4iDkcYvRPY
         odlg==
X-Gm-Message-State: APjAAAVI8hd1pDwevjOTTSJKDxR2wFqysDJuW0fzYOkdMMzT4AthhFYW
        hdOYm26u9IWptFLEejfwzb2JE2Eb1pv0jg==
X-Google-Smtp-Source: APXvYqzjv7SlM4ivwrAFGHGDRek0ZMdYnLfto5VbG5vtFWrqsD8SgAitr9xRgPV1XDqiIOPGBJ3vdw==
X-Received: by 2002:ac2:508b:: with SMTP id f11mr5333379lfm.116.1572438557038;
        Wed, 30 Oct 2019 05:29:17 -0700 (PDT)
Received: from localhost.bredbandsbolaget (c-79c8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.200.121])
        by smtp.gmail.com with ESMTPSA id q15sm724673lfc.89.2019.10.30.05.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2019 05:29:15 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH] gpiolib: Switch order of valid mask and hw init
Date:   Wed, 30 Oct 2019 13:29:14 +0100
Message-Id: <20191030122914.967-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The GPIO irqchip needs to initialize the valid mask
before initializing the IRQ hardware, because sometimes
the latter require the former to be executed first.

Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Reported-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Thinking of applying this for fixes to fix some part
of the problems that Hans is seeing.
---
 drivers/gpio/gpiolib.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 9afbc0612126..e865c889ba8d 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1411,11 +1411,11 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
 
 	machine_gpiochip_add(chip);
 
-	ret = gpiochip_irqchip_init_hw(chip);
+	ret = gpiochip_irqchip_init_valid_mask(chip);
 	if (ret)
 		goto err_remove_acpi_chip;
 
-	ret = gpiochip_irqchip_init_valid_mask(chip);
+	ret = gpiochip_irqchip_init_hw(chip);
 	if (ret)
 		goto err_remove_acpi_chip;
 
-- 
2.21.0

