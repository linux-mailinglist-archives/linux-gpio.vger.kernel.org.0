Return-Path: <linux-gpio+bounces-9799-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADC696BFAB
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 16:07:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 287B8B21A31
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 14:07:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 734CC1DA301;
	Wed,  4 Sep 2024 14:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bic19V4E"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3F51D9D6B
	for <linux-gpio@vger.kernel.org>; Wed,  4 Sep 2024 14:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725458833; cv=none; b=h46DGZS+vMABVY6nj2dW09l/9CWnzSmkAdRf/92x01ciHpt0aZNtaQvkJ2wi3aL9IIh/1A0/1rFz7Q3i0OQUHrfxW5lPQnHixrmrmJKMXlWXHWr8dVvQDMmf+vEJL1ouvoXTCRm2cWjoM8Z6u/vZWwUqWdNJu0W7AncHjYP+WD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725458833; c=relaxed/simple;
	bh=4xPxlwu1bhPSXn0lYvYoNGfGIo6tkfTqVZqIzPt0jh8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gSgn1APlduy0lNsqmCyQgQS37MiyV93JkRLK3VHsNFFPNPP+zTEGdT3jqKyMn6DfaFAw6f9wHw6wWTmAyXKVyffiAUCPAdzJnpf5BfG8p+68sdyKpFjowTrlBR9XVN2Kj2lK36uT0JzIoCte/e9ewvBDVL+Qbq+MCdFWNBSoVEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bic19V4E; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-374bb1a3addso2853558f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 04 Sep 2024 07:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725458830; x=1726063630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6Nc9aX50i+dMN/1Cd07ZSHF0hwNUhEe8ygyGy7L3y3I=;
        b=bic19V4Em7ozUZ/veVq0Ba5HbTif23raa1Ahx0Vn9Jb7fQL3t7pg3oLyoJz38IH/uv
         mKKBpjkJyY9AJRN2ffftfE5XLN7BmdfhMdcGowRU3xlsToBmvCdxWg0c+ygK4qtkcqI7
         4zJz80piCF4HNLPNlpaBd89kEbDUvkwPHxv3pdndU8jG11rjx79D0d0w8fgCfAb8db0f
         SNjin8z8pSNogy2MjpoaxI35j+ykD3dWmVyIg6lwtC2oIe6JuNP232FPmKH7evx/kxFr
         /FvLjBodoFa5IgD1fVB1XtSznFwMzA+QOvC8mRbafEhmFwL9SQ1uKXE9ixHqmtTIl7db
         HrsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725458830; x=1726063630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Nc9aX50i+dMN/1Cd07ZSHF0hwNUhEe8ygyGy7L3y3I=;
        b=VJ2NKKw9VtiKnRtn8Xit5ltbDZ4BE1i2dR7oWzl+4dJ9P1Gys7KVhDMToY3Gn+6wOv
         qtFoADSXKf92C6GIA2HRkEjIp24A+39fmpnruBLXFKEoWDQZbDp8Z1QpZAXfuX6HQeHg
         nmg72T066X54LknFpOiuStN3K54gHjx3+0yJ5X74CAni6o5fiWV/kdKlYaCzFVGaKn5Q
         vO6fx1G8MATNhgGlOmTBTXT0hKl4GEVwECOs4RBUUTbaseLZOcWIx1dYcaKSL1Ozha6p
         5sRqSnDb5UwveU/VwNRyjwKcVCZhEA7j4oa5RVgpZaJ3vG67uyMV/TzsI8uUWoUjVQ4d
         16Hg==
X-Gm-Message-State: AOJu0YwpPpwfsvULgl2Hh6yaFzeQxV+aXHpV9Z+7c0YsySLjFWt2/tig
	6FQJJMFsv3dFZRI34TBqZcj5OPvJkqcgcKQso0zzKidK25jqO8jL4LZZf/Zg00k=
X-Google-Smtp-Source: AGHT+IERvN09HxpnR1/88V4krFNTYDQv3qQjgSZkek/YY4MS8sDjiitPdrGu1ZBD37ARHvs1yryObA==
X-Received: by 2002:a05:6000:4029:b0:374:ce9a:ff11 with SMTP id ffacd0b85a97d-376dea47205mr4105172f8f.50.1725458829037;
        Wed, 04 Sep 2024 07:07:09 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:66d0:70f:5bef:d67d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749ee4c83fsm17100901f8f.22.2024.09.04.07.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 07:07:08 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Martyn Welch <martyn.welch@collabora.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2] gpio: mpc8xxx: switch to using DEFINE_RUNTIME_DEV_PM_OPS()
Date: Wed,  4 Sep 2024 16:07:06 +0200
Message-ID: <20240904140706.70359-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Use the preferred API for assigning system sleep pm callbacks in drivers.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
v1 -> v2:
- include pm.h too (doesn't hurt)
- use pm_ptr() instead of pm_sleep_ptr()
- improve the line breaks

 drivers/gpio/gpio-mpc8xxx.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index e084e08f54387..685ec31db409d 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -17,6 +17,8 @@
 #include <linux/mod_devicetable.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/pm_runtime.h>
 #include <linux/property.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
@@ -431,30 +433,28 @@ static void mpc8xxx_remove(struct platform_device *pdev)
 	}
 }
 
-#ifdef CONFIG_PM
-static int mpc8xxx_suspend(struct platform_device *pdev, pm_message_t state)
+static int mpc8xxx_suspend(struct device *dev)
 {
-	struct mpc8xxx_gpio_chip *mpc8xxx_gc = platform_get_drvdata(pdev);
+	struct mpc8xxx_gpio_chip *mpc8xxx_gc = dev_get_drvdata(dev);
 
-	if (mpc8xxx_gc->irqn && device_may_wakeup(&pdev->dev))
+	if (mpc8xxx_gc->irqn && device_may_wakeup(dev))
 		enable_irq_wake(mpc8xxx_gc->irqn);
 
 	return 0;
 }
 
-static int mpc8xxx_resume(struct platform_device *pdev)
+static int mpc8xxx_resume(struct device *dev)
 {
-	struct mpc8xxx_gpio_chip *mpc8xxx_gc = platform_get_drvdata(pdev);
+	struct mpc8xxx_gpio_chip *mpc8xxx_gc = dev_get_drvdata(dev);
 
-	if (mpc8xxx_gc->irqn && device_may_wakeup(&pdev->dev))
+	if (mpc8xxx_gc->irqn && device_may_wakeup(dev))
 		disable_irq_wake(mpc8xxx_gc->irqn);
 
 	return 0;
 }
-#else
-#define mpc8xxx_suspend NULL
-#define mpc8xxx_resume NULL
-#endif
+
+static DEFINE_RUNTIME_DEV_PM_OPS(mpc8xx_pm_ops,
+				 mpc8xxx_suspend, mpc8xxx_resume, NULL);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id gpio_acpi_ids[] = {
@@ -467,12 +467,11 @@ MODULE_DEVICE_TABLE(acpi, gpio_acpi_ids);
 static struct platform_driver mpc8xxx_plat_driver = {
 	.probe		= mpc8xxx_probe,
 	.remove_new	= mpc8xxx_remove,
-	.suspend	= mpc8xxx_suspend,
-	.resume		= mpc8xxx_resume,
 	.driver		= {
 		.name = "gpio-mpc8xxx",
 		.of_match_table	= mpc8xxx_gpio_ids,
 		.acpi_match_table = ACPI_PTR(gpio_acpi_ids),
+		.pm = pm_ptr(&mpc8xx_pm_ops),
 	},
 };
 
-- 
2.43.0


