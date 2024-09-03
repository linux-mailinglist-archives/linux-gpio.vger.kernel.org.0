Return-Path: <linux-gpio+bounces-9672-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0EF96A31D
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 17:45:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18CE91C227A2
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 15:45:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3484E188598;
	Tue,  3 Sep 2024 15:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bQsXSQxO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB48374FF
	for <linux-gpio@vger.kernel.org>; Tue,  3 Sep 2024 15:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725378342; cv=none; b=NWH/9JCD9yqhuykS7L2uidnk8csd5g2hrbGHZIY26u0EYBFOAIg8C7kFbvnegPGmrzGIBKsThHqp2BF6bD1iVyOdmivs+dMeSoRvER+7k6NqIdvHOYwx00F1AZb926R90/KfdqS7CewG4cH2IrTpnbpi2S3uz7F5S1repiXbPIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725378342; c=relaxed/simple;
	bh=744I/wZQKWyPOh5U3pqr85EuPnBBmQ6CMfkMIEazKng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P0pCHnfHXjDF8fnYNYMVhov/4hNZB/7444iGv1DY7UQOdaiE73mTEDm/rdFo4kWSXqm3w8nC0keyw8zBRRyY4ZMaxxFVOLJLmJ3jFYTEXtoDiIlmhvKOcNZQtWBoAsj9JB6+SnOiOzCyaByUlAdMBkUG55vjGz7v6saF7m4FEXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bQsXSQxO; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42c7b5b2d01so34873195e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 03 Sep 2024 08:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725378338; x=1725983138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f1X1Xz/aK7oJBE8r6yGDDbc+O0HogrYYxQPJLz3AbE8=;
        b=bQsXSQxOWlCkGFtyu4o566SjdiDDJO2hB+5hTlSrKcammFlreehKeELKgbYDzRYKsd
         jekSM+ZTClZXENJvT/tb9mqg/bRLMVkwL6CShH19wDn8sZ9Etx+dfT5JEY2zBXUpCTbf
         GygnYjOk/zbomjqU5i3dRcl89CZ0exSpInMj8Ta87TiMg6v6frm1qCs8MzCDxokjql9T
         EOQXZYViBeTdbDwwUaBZW26vBtu6c2nIk3BwqA12LXUzIQF+bemYzHSpVHOL3emBtcKG
         LXMd+ZRm8nmfuow/I8OPJsnuYcecqS2LvoRVedL+zFq8kBGHKL99Mpyec48a31RCQDvl
         gZlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725378338; x=1725983138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f1X1Xz/aK7oJBE8r6yGDDbc+O0HogrYYxQPJLz3AbE8=;
        b=r/mM8LH7bpG85Ng6HbRgr4IbVVS2bMvT9/fDinPkGfvIWvJ1hAqg+85/ABmReBwMgx
         DbjyV25O88KEnZsn+G6VDgTRi44cIhQgzq+FFpvgwWy7xaTLoQynn0y+1LCrXd7oWSeO
         3MVVHObfm0NzGbf8KwMj1nIjmEpeLQUcnIyNX1n2gJnIxAdvg+UhPkgmy48QOq77n4gQ
         /WHqkkpM7veXtPr474H4w5f3o9GPLH0Mx4y8Ju5O+Hk4kitWUz3N9fCYlu3SzM2y+R3a
         CyC5ujwG7OemQ09Az/qFJq1lxksn4ph9NHF36i/o46UlQM/qr7O91jJTwly3DtElN4y3
         vNIw==
X-Gm-Message-State: AOJu0YwS0Goxbv+n5g3mbakdCq5hYJ6LRVPRN87wlf2hZSAc+3I/QXG1
	RBdRD0kH6yNvNzrxrGKns6U/UB4QWFwREd5JxP/cvTJVvJPpylWEsXStbRdkle4=
X-Google-Smtp-Source: AGHT+IEhqzjHoaNT2CAv83hbKqh3ToB731ohp4V6Jef3U2B0Y2zPUAXgLnFnUptFhMGoznfvj2kLyg==
X-Received: by 2002:a05:600c:5102:b0:426:690d:d5b7 with SMTP id 5b1f17b1804b1-42bb01ee5b3mr159410145e9.25.1725378337695;
        Tue, 03 Sep 2024 08:45:37 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:6a50:a260:3846:9065])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6df0a42sm172256465e9.11.2024.09.03.08.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 08:45:37 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Martyn Welch <martyn.welch@collabora.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 2/2] gpio: mpc8xxx: switch to using DEFINE_RUNTIME_DEV_PM_OPS()
Date: Tue,  3 Sep 2024 17:45:33 +0200
Message-ID: <20240903154533.101258-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240903154533.101258-1-brgl@bgdev.pl>
References: <20240903154533.101258-1-brgl@bgdev.pl>
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
 drivers/gpio/gpio-mpc8xxx.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index e084e08f54387..edb228d9af277 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -17,6 +17,7 @@
 #include <linux/mod_devicetable.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/property.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
@@ -431,30 +432,28 @@ static void mpc8xxx_remove(struct platform_device *pdev)
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
+static DEFINE_RUNTIME_DEV_PM_OPS(mpc8xx_pm_ops, mpc8xxx_suspend,
+				 mpc8xxx_resume, NULL);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id gpio_acpi_ids[] = {
@@ -467,12 +466,11 @@ MODULE_DEVICE_TABLE(acpi, gpio_acpi_ids);
 static struct platform_driver mpc8xxx_plat_driver = {
 	.probe		= mpc8xxx_probe,
 	.remove_new	= mpc8xxx_remove,
-	.suspend	= mpc8xxx_suspend,
-	.resume		= mpc8xxx_resume,
 	.driver		= {
 		.name = "gpio-mpc8xxx",
 		.of_match_table	= mpc8xxx_gpio_ids,
 		.acpi_match_table = ACPI_PTR(gpio_acpi_ids),
+		.pm = pm_sleep_ptr(&mpc8xx_pm_ops),
 	},
 };
 
-- 
2.43.0


