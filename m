Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 847F8218242
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 10:28:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727848AbgGHI1v (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 04:27:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726285AbgGHI1u (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 04:27:50 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5097C08C5DC;
        Wed,  8 Jul 2020 01:27:49 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id c11so26347260lfh.8;
        Wed, 08 Jul 2020 01:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sNU/CidpYLwzL4tCXQi3p4YTwnj9z15lm8YeixiwPKQ=;
        b=JAvQwAEOqfqD48mOyBkR3XrbmfWFTsLpk4ISvLqixWqStBTgG7NlALw8OOS/2AEn/M
         gbXjyUG7xRda5NCvkYFNtO5fwqJ1k/pY9QXnQvxcYSxGrpNMjnrG3wr835GYGxa6gDL0
         GHnhOLyKMJ9LmC1B8VqhdAy5W4pgk1JBPGYLmpQEHPd4ThpbEHSuBxwwnhLc1gF0syNB
         eN7PtxgA2NFEiFseQ94E5PWjhQdFYf60heoWLf+94rC6lCBW+qEIMhSn83mnICSNUGtH
         /nKpg+21lCfwe3OemH6g4pERtoRQxDjxeV4uuWrwZvcXyAAn0RObVbYymzhNyX7FG0Xx
         8qsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sNU/CidpYLwzL4tCXQi3p4YTwnj9z15lm8YeixiwPKQ=;
        b=U8hHJya7OywzRnwju4aMEqBdAcgwpYengjhWE66si6exgZZOiPYrI/H/eg5U8yfq0m
         X2QhMKGGVuiyL2jby9b0SfeohtQi0HggvSORIP/Cuao3M3DIZdxzJmUOMNB3LsUO1qYb
         X/bkQa/K/+4R8IIZ8oqJQRjaV7Ln84QEC2y2nQlSC41sq0hm21I1jCfW1n5iVGLEyTzb
         h8fO+iAFjsSPeG4bqebZyHmc51FMl3CN+VM7yMwG7vu9KqUS6i0jGCDn15SDfoLQY4y1
         L//CrWHspmOOedDa1s+N8oNk2iX6GubPmA6muY+995ezLsi9/U4UTxuu+mEo+i5073dY
         VYYQ==
X-Gm-Message-State: AOAM5331f7to3djsUf6J+ujoytRKHwoMin8kr9FrmUDGi1aSr2CWt90L
        FoL1evwN+IHmsMZn8s62mCo=
X-Google-Smtp-Source: ABdhPJzmaadVbB9fmg+o+M2onwSDRUCFyZUMc9qLuT9bT2nfszBwoVtdz1NeIOPdaHrrhLc0/agEZg==
X-Received: by 2002:ac2:5443:: with SMTP id d3mr35311293lfn.121.1594196868166;
        Wed, 08 Jul 2020 01:27:48 -0700 (PDT)
Received: from localhost.localdomain (ppp91-79-162-105.pppoe.mtu-net.ru. [91.79.162.105])
        by smtp.gmail.com with ESMTPSA id d2sm737555ljg.6.2020.07.08.01.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 01:27:47 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/5] gpio: max77620: Initialize interrupts state
Date:   Wed,  8 Jul 2020 11:26:30 +0300
Message-Id: <20200708082634.30191-2-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200708082634.30191-1-digetx@gmail.com>
References: <20200708082634.30191-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

I noticed on Nexus 7 that after rebooting from downstream kernel to
upstream, the GPIO interrupt is triggering non-stop despite of interrupts
being disabled for all of GPIOs. This happens because Nexus 7 uses a
soft-reboot, meaning that bootloader should take care of resetting
hardware, but bootloader doesn't do it well. In a result, GPIO interrupt
may be left ON at a boot time. Let's mask all GPIO interrupts at the
driver's probe time in order to resolve the issue.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpio/gpio-max77620.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpio/gpio-max77620.c b/drivers/gpio/gpio-max77620.c
index 313bd02dd893..473b4e900bbb 100644
--- a/drivers/gpio/gpio-max77620.c
+++ b/drivers/gpio/gpio-max77620.c
@@ -260,6 +260,25 @@ static int max77620_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
 	return -ENOTSUPP;
 }
 
+static void max77620_gpio_initialize(struct max77620_gpio *mgpio)
+{
+	unsigned int i;
+	int err;
+
+	/*
+	 * GPIO interrupts may be left ON after bootloader, hence let's
+	 * pre-initialize hardware to the expected state by disabling all
+	 * interrupts.
+	 */
+	for (i = 0; i < MAX77620_GPIO_NR; i++) {
+		err = regmap_update_bits(mgpio->rmap, GPIO_REG_ADDR(i),
+					 MAX77620_CNFG_GPIO_INT_MASK, 0);
+		if (err < 0)
+			dev_err(mgpio->dev, "failed to disable interrupt: %d\n",
+				err);
+	}
+}
+
 static int max77620_gpio_probe(struct platform_device *pdev)
 {
 	struct max77620_chip *chip =  dev_get_drvdata(pdev->dev.parent);
@@ -292,6 +311,7 @@ static int max77620_gpio_probe(struct platform_device *pdev)
 	mgpio->gpio_chip.of_node = pdev->dev.parent->of_node;
 #endif
 
+	max77620_gpio_initialize(mgpio);
 	platform_set_drvdata(pdev, mgpio);
 
 	ret = devm_gpiochip_add_data(&pdev->dev, &mgpio->gpio_chip, mgpio);
-- 
2.26.0

