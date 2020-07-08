Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 973E1218C5E
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 17:59:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730471AbgGHP6z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 11:58:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730400AbgGHP6x (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 11:58:53 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03F81C061A0B;
        Wed,  8 Jul 2020 08:58:53 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id q4so19138054lji.2;
        Wed, 08 Jul 2020 08:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SS5JmUNY+EZUs7f4zpIcMZNQ272C8fvt1BVON3vpREM=;
        b=KOmnzE29mAxhu/MAwDiv/erO3agu5LD8PiU6//LxX7nE9ZFKKLpebbjlxnT61cSsh4
         ex/jtMrxbnDHtO09kD0ZEJAI7jd+zFWadT7p7Ho8HtR+13P/cosmM0DrXr1ixf8MfWBj
         q5kjfDU7iCTbzFS/f+YJbZWiye1M1Z2Hp1nuef9KsYHsX6wGCjAi+cZr45y7z9qg5NLD
         v9j1cMXYzsiwx0ZQitre0uZTnrMNm0KQJFH40e6wSOXbscq8TKaGyABXxlRbg4GMWO88
         9FmevpGfQw+nYM8m/PxggSIOniBcINZt4HuvdV+8yX74lcWobwlIMOZnogkSOftYJ9+j
         UyUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SS5JmUNY+EZUs7f4zpIcMZNQ272C8fvt1BVON3vpREM=;
        b=VlGQH/H1dpAihj2yWP6nNP+oza5YD1suDrnqyoaAStIUKcIeSnjnM/x7RDH6j4poe3
         A5KNH4jOMSze4hIzeDkB40fua77Sjumg3gYJAuEgmLMibwaOauSfDODgh56+NZE5OpXn
         Zn/uz7DcyvEv4k+PvuVaRi9mCua3wHOtVwHTbj6RdD+vAbEEd33aMXImz/XIkrI02J8S
         IQA8lCPlHvYbtHaVkoRvBJu8ePgSSAw0XvGCPlteYVCscWf6YZsfGZq49f8LKmMQ93vq
         t8CcnYxxMbTJ1q3amuiTmTmZMfl+s7m1yTsC1lxBW4AqzSC1iR8i2aCv+4X038q1uIQy
         mh2w==
X-Gm-Message-State: AOAM533SVdGZlhROd+vBvdoMgh8l1cD0cqKWia/5eJH9dNGMXWuiYvm+
        zy/ELE/nHOrnlroxQQkjbZo=
X-Google-Smtp-Source: ABdhPJzTlbshfzYnGK9RvKuiw58IcIeHD+kpjYaz4cnqbojB+s+EpMr+AaW3USHjhCHYzZ9l09KyZA==
X-Received: by 2002:a2e:3304:: with SMTP id d4mr14218685ljc.115.1594223931495;
        Wed, 08 Jul 2020 08:58:51 -0700 (PDT)
Received: from localhost.localdomain (ppp91-79-162-105.pppoe.mtu-net.ru. [91.79.162.105])
        by smtp.gmail.com with ESMTPSA id 16sm37977ljw.127.2020.07.08.08.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 08:58:51 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] gpio: max77620: Initialize interrupts state
Date:   Wed,  8 Jul 2020 18:58:33 +0300
Message-Id: <20200708155834.19762-2-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200708155834.19762-1-digetx@gmail.com>
References: <20200708155834.19762-1-digetx@gmail.com>
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
driver's initialization time in order to resolve the issue.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpio/gpio-max77620.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/gpio/gpio-max77620.c b/drivers/gpio/gpio-max77620.c
index 313bd02dd893..970ad6397a56 100644
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
@@ -288,6 +312,7 @@ static int max77620_gpio_probe(struct platform_device *pdev)
 	mgpio->gpio_chip.ngpio = MAX77620_GPIO_NR;
 	mgpio->gpio_chip.can_sleep = 1;
 	mgpio->gpio_chip.base = -1;
+	mgpio->gpio_chip.irq.init_hw = max77620_gpio_irq_init_hw,
 #ifdef CONFIG_OF_GPIO
 	mgpio->gpio_chip.of_node = pdev->dev.parent->of_node;
 #endif
-- 
2.26.0

