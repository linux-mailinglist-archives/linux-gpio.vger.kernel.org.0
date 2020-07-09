Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39AA421A581
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2020 19:12:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728305AbgGIRMp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Jul 2020 13:12:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728110AbgGIRMo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Jul 2020 13:12:44 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5821BC08C5CE;
        Thu,  9 Jul 2020 10:12:44 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id h19so3221664ljg.13;
        Thu, 09 Jul 2020 10:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NUzStD0JlDE1+lpeM+4rnfbYioBhG7w/IUJEkdm0/Vw=;
        b=DKU3CMKH/guvcv3nfGgGymRWfTw3P7mw/dEdLUiHeq1wNhKqBxXuKQsEOfJgeBRO65
         5P3Z9zsSVaybXf9pY+SNVzD/Bn5Agev7/tMieza0uUyAfb0mUmpuYhtrrPiINM4z22b/
         qpV22FW4SilWASZY/MXlAkCh0M9PU+rKHf8sJ/lPS1gOLImiM0Pco6wgFCrBhtOavrvi
         Iw8TkYAywqEbxa7Ky0Ao1BycccozFxm1bLuyyk66zi0tu9HDsZrW0dHsbTyq+HDUp+5l
         8SEF2imCZpJuXSCNfbUMMEVFp4Mvl7qqO2GfnqR2HQ0v/ii91XOYgNPEjSHip55D7e/V
         +aBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NUzStD0JlDE1+lpeM+4rnfbYioBhG7w/IUJEkdm0/Vw=;
        b=ry1eo/AX43/9Z04d/J5XmSYyfYvEm9CNiJvhmCZ2j6yoZ4w0gaJmCYcQWDi0p8De8v
         lrt54O7ltc0/U8TkmhtXO45IB+hUEDJ9rT/en673kBflRxclMQNeaYQfLAwpLVeJ9MqX
         XTBugG93eveU5yBbDbRwIIzakFdVRQPkIdV/1Wc6gbmMnUcdxyqS2QMICGEZl+kBvyMG
         jYw2BnIt14ASAoaz+Ae5E8iypBhMLj6eePFJqGQVNB7hNYB0t9xAEGh1X0YHL4eU+SA/
         LjI0P95GRbmhK/BWoPaxonfE3UlvwcMEpWdge4sZ27RWaFNtd6g/NuUf9kgDpkhqLyF6
         xNXQ==
X-Gm-Message-State: AOAM5309s4U5Bw7jKP1TpsAfs3hhrPuXko/Kjnfi9UXBK4fawYsy9ymz
        e7iteN31KPZ1XymSKKuUP1g=
X-Google-Smtp-Source: ABdhPJwaQ99lPcWRXF96Ez8T787FoH+S6jQcqAmeZzmGoAr/zqbL62PN2IiIPwE04RUUCzzIPXNQCQ==
X-Received: by 2002:a2e:7a03:: with SMTP id v3mr33520604ljc.141.1594314762811;
        Thu, 09 Jul 2020 10:12:42 -0700 (PDT)
Received: from localhost.localdomain (ppp91-79-162-105.pppoe.mtu-net.ru. [91.79.162.105])
        by smtp.gmail.com with ESMTPSA id y22sm998314ljn.2.2020.07.09.10.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 10:12:42 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 6/6] gpio: max77620: Initialize hardware state of interrupts
Date:   Thu,  9 Jul 2020 20:12:03 +0300
Message-Id: <20200709171203.12950-7-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200709171203.12950-1-digetx@gmail.com>
References: <20200709171203.12950-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

I noticed on Nexus 7 that after rebooting from downstream kernel to
upstream, the GPIO interrupt is triggering non-stop despite interrupts
being disabled for all of GPIOs. This happens because Nexus 7 uses a
soft-reboot, meaning that bootloader should take care of resetting
hardware, but the bootloader doesn't do it well. As a result, GPIO
interrupt may be left ON at a boot time. Let's mask all GPIO interrupts
at the driver's initialization time in order to resolve the issue.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Acked-by: Laxman Dewangan <ldewangan@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpio/gpio-max77620.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/gpio/gpio-max77620.c b/drivers/gpio/gpio-max77620.c
index 6c516aa7732d..e090979659eb 100644
--- a/drivers/gpio/gpio-max77620.c
+++ b/drivers/gpio/gpio-max77620.c
@@ -260,6 +260,30 @@ static int max77620_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
 	return -ENOTSUPP;
 }
 
+static int max77620_gpio_irq_init_hw(struct gpio_chip *gc)
+{
+	struct max77620_gpio *gpio = gpiochip_get_data(gc);
+	unsigned int i;
+	int err;
+
+	/*
+	 * GPIO interrupts may be left ON after bootloader, hence let's
+	 * pre-initialize hardware to the expected state by disabling all
+	 * the interrupts.
+	 */
+	for (i = 0; i < MAX77620_GPIO_NR; i++) {
+		err = regmap_update_bits(gpio->rmap, GPIO_REG_ADDR(i),
+					 MAX77620_CNFG_GPIO_INT_MASK, 0);
+		if (err < 0) {
+			dev_err(gpio->dev,
+				"failed to disable interrupt: %d\n", err);
+			return err;
+		}
+	}
+
+	return 0;
+}
+
 static int max77620_gpio_probe(struct platform_device *pdev)
 {
 	struct max77620_chip *chip =  dev_get_drvdata(pdev->dev.parent);
@@ -295,6 +319,7 @@ static int max77620_gpio_probe(struct platform_device *pdev)
 	mgpio->gpio_chip.irq.chip = &max77620_gpio_irqchip;
 	mgpio->gpio_chip.irq.default_type = IRQ_TYPE_NONE;
 	mgpio->gpio_chip.irq.handler = handle_edge_irq;
+	mgpio->gpio_chip.irq.init_hw = max77620_gpio_irq_init_hw,
 	mgpio->gpio_chip.irq.threaded = true;
 
 	platform_set_drvdata(pdev, mgpio);
-- 
2.26.0

