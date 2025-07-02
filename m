Return-Path: <linux-gpio+bounces-22593-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 04320AF0FCF
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 11:23:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7ACDD176B22
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 09:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06C4724DCF6;
	Wed,  2 Jul 2025 09:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="NXewqVuF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9765248F54
	for <linux-gpio@vger.kernel.org>; Wed,  2 Jul 2025 09:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751448144; cv=none; b=Au2D8Ro8aMq5hN4ESLnN7/nrIxX98rJvyc3/qGUhj303OxfJUXQBuzWZKwKtVssUOuStgQq20ud1fzLCotjCnsLncq6qlZ0J9VrL8UngQhlhgTH9PvUJJ19oOJ9bUHCgHouFJ7v5IBN7XrebxIZHU42Qy4e/PogZZ9dSvAvVMtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751448144; c=relaxed/simple;
	bh=tQfSDbXmBjAlEdiXvmeFkGQTsIEZw2jAQvUsCm1LWzo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VC27nDepqvbBP2MgIrdhaPjSHEsTgvj8If2Hwe8jBigdEyOoEaxPSz28EldSXmW/6Yz+1L6/5hSRK58ndZJnAfTAxJFqHsUYUukqn3r0zKC8k22CnoHubFpRuFemOwFeymhd58F5jQeMWc812RWXi4mr7N3lmaDpWKxJSCPfXqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=NXewqVuF; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a6e2d85705so3631482f8f.0
        for <linux-gpio@vger.kernel.org>; Wed, 02 Jul 2025 02:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751448141; x=1752052941; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k0+AjDE5hY/TndXKkIwRA6Lb04rFiMbqRMpx6nKU2Y0=;
        b=NXewqVuFVAq5iDH1V4yFVYmOp0CLXIoLDbm97QBgq2ybhjpK5aZWLY37ANNHv5yHef
         8pGp1/0Tq0ZYCUdG1F7LY3MgjBJs8yHw6RRPk89rv6tAaAFmiHzF5xx87kdjLr4fLecb
         u1uCj6eMgER22vtKID7ASSot4kneQPb5wPIgQaTsJ3DB3bbEbqSChdFM9UCVdaKuvD2u
         IDevbNruhS9R8+WiFk6f8Oh+JoWRXgBpYSKQDFOXnbtqsG0R6VX4gytIky3n4huflj+0
         HxbzJEpJFgkrbuXIMANs2O3Yxv+KCCa5dc0OUY222MJo3cwSzecwf0dtjfWo6t+BTs++
         2BRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751448141; x=1752052941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k0+AjDE5hY/TndXKkIwRA6Lb04rFiMbqRMpx6nKU2Y0=;
        b=BFO/bfBDdbwQCMSXdf9+VWZBPSfr2ruTTBX2cV7xdO0cvPbY5V245064KIDmS7nl/3
         R8YDsb+CwMeg4uJBBNP6WY13FcMsJK29XgL8mDR1IEuWPLLiWVjqdJ+d+8ffUAbigtsp
         Bm/yf7n44GZ9sur+6wXkjcRZhsawRomihLyG631DOU9ioYy+M8imEhaZvLF8Uqjxyu6I
         rrX0vXzI/PaBf6ln7DigeGLekH5rORVN1HcxiSt1fu8srfQCsoBuIVUiBBZbjSAlUnGF
         PjtmLTZ2oFSV4b9UBai+zlC7mLQR3NDWctXuG2FnvvJHo3SM0mNZYDgYN4Jud1XYBi2s
         FUeA==
X-Forwarded-Encrypted: i=1; AJvYcCUeiNFfcdDfsUj4JZVqOPpm+Poe+mXZv3ZMBaeq5OUy0Lsf3CN9BchjRtZ5Z95nYJNlj5Tlk1ZJ82LS@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+PRa0hg1nAvAQ3PRyehUIA9RRXYxioEyUR7SvQBqrj6Y7YRCt
	3lR6hSag74NFgraTbPyQKqJoGvEr82gjShkro/wQTUh0pOyyfq3hfZRuLLZHFGGPCTE=
X-Gm-Gg: ASbGncs0FunQbOKGuPXrx795kiwKF4AO+Dthif2822H93F2GffXrJK4jmH2unH1peJo
	d8+EE8vI3SRfQXvMZp0r1TOCj32xDT4npDxKgagyiTUQSWiRyiOiMDuHKLUwdavmDznwUhVS/2j
	rhUZhhaxHNi8RTHX+ekgx+aWPN/d7s6G17GBB3HkrpGrOnvO2vPbrg73fzeSH3DRHUe08rnn25t
	ZKe6QPuSM8G6ILITRgdmR2LZPa98I4JKM7mEifsZVDjxItIFQwr/iiMwXR92E2x8P44hszcrJdN
	nd6Bab+Vz4X0qvajjnwRfebhD2D9f0+1BqoLH5NV2SLjuEPGY1yNrQ==
X-Google-Smtp-Source: AGHT+IFUTkQvyXFzsGNlqDX20NiNYBIQiPL8o6v8ocmr9X2/T9KyVihtWxZOoEUNTrhfgHIx4L9CzA==
X-Received: by 2002:a05:6000:1887:b0:3a5:2d42:aa25 with SMTP id ffacd0b85a97d-3b20110b277mr1315013f8f.50.1751448141188;
        Wed, 02 Jul 2025 02:22:21 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8827:d0e:25e:834a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a406489sm195844165e9.27.2025.07.02.02.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 02:22:20 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 02 Jul 2025 11:22:13 +0200
Subject: [PATCH v2 6/8] gpio: cadence: use new generic GPIO chip API
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-gpio-mmio-rework-v2-6-6b77aab684d8@linaro.org>
References: <20250702-gpio-mmio-rework-v2-0-6b77aab684d8@linaro.org>
In-Reply-To: <20250702-gpio-mmio-rework-v2-0-6b77aab684d8@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4923;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=PQq4ZbNjDNAuumzfNO2E7A4+3aqHViTTAOD8bRl9gxs=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoZPpFZzbllRL7mqefD91k5+IPwZVgoSI1gZreR
 yDHtIsKGsuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGT6RQAKCRARpy6gFHHX
 cnRGD/9SPqNvkxINyTLmM900McNidb/ByKS47CfPiEEe9qvoRuUwmKGGHy8wqUyBm9pbsLQW1Mh
 dSo5sSKujwTyeuodotZnpOLQKGqxy56FGQxzlSzBsMe19Bf1NaY1AYj13rQJ6PptHneoHlOg6Lc
 ENaGsxptlqHu5vTG1iDMbo4uw8uZOBzFdDQK5b31IAKZ0FbiLz2ZiWOGLPUNproZnLyV+o0xIJj
 V2pzIZtiQL8Y5iHjb5V3+2ghR29/+SJsGzf2zO89j41i1txJ37HT1J/w/RjAEnd+0tO4AWp6xMK
 bXBR7sf+/BwWUUg5Tx1AAIjcAamZQ5ZWi1C+3s8W/ClctXTqoU4rjXlHqiFHTQekHIpGcvF2mXC
 ty6yN9O99EZRo5dgX2pIVVn03Hw0VndG+UVqhK8M4gsWXQekXpkwYG/claiHpAZCUsTR0mSoHIZ
 Pyt/VMEI4qaP3WjADGMBn0hMGIXSGCr5tz2nfenKT9dlgahTVHDEI+osZ6xN+P7Q+CCrn/8VvF/
 cw16GxtLqgWOhXm2mzx5+2FjSSsyUkqYjb20MITcghw38wapxlk2LtXCtwEicb5ziQkr/6Rid6n
 qcypD7qC1fourQbLm719N5Ke80ZmttMhQFWo6nkS75t7p3+XYwDAYR5cZgpMf4aXCoQAX2fTi3R
 /X1eXsdlptGq87A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-cadence.c | 46 ++++++++++++++++++++++++---------------------
 1 file changed, 25 insertions(+), 21 deletions(-)

diff --git a/drivers/gpio/gpio-cadence.c b/drivers/gpio/gpio-cadence.c
index e6ec341d55e9047b2fa8718799ba72d54624388e..8243eddcd5bbe537bab1bedc72c80ee88839f5d3 100644
--- a/drivers/gpio/gpio-cadence.c
+++ b/drivers/gpio/gpio-cadence.c
@@ -12,6 +12,8 @@
 #include <linux/clk.h>
 #include <linux/gpio/driver.h>
 #include <linux/interrupt.h>
+#include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -31,7 +33,7 @@
 #define CDNS_GPIO_IRQ_ANY_EDGE		0x2c
 
 struct cdns_gpio_chip {
-	struct gpio_chip gc;
+	struct gpio_generic_chip gen_gc;
 	void __iomem *regs;
 	u32 bypass_orig;
 };
@@ -40,7 +42,7 @@ static int cdns_gpio_request(struct gpio_chip *chip, unsigned int offset)
 {
 	struct cdns_gpio_chip *cgpio = gpiochip_get_data(chip);
 
-	guard(raw_spinlock)(&chip->bgpio_lock);
+	guard(gpio_generic_lock)(&cgpio->gen_gc);
 
 	iowrite32(ioread32(cgpio->regs + CDNS_GPIO_BYPASS_MODE) & ~BIT(offset),
 		  cgpio->regs + CDNS_GPIO_BYPASS_MODE);
@@ -52,7 +54,7 @@ static void cdns_gpio_free(struct gpio_chip *chip, unsigned int offset)
 {
 	struct cdns_gpio_chip *cgpio = gpiochip_get_data(chip);
 
-	guard(raw_spinlock)(&chip->bgpio_lock);
+	guard(gpio_generic_lock)(&cgpio->gen_gc);
 
 	iowrite32(ioread32(cgpio->regs + CDNS_GPIO_BYPASS_MODE) |
 		  (BIT(offset) & cgpio->bypass_orig),
@@ -86,7 +88,7 @@ static int cdns_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	u32 mask = BIT(d->hwirq);
 	int ret = 0;
 
-	guard(raw_spinlock)(&chip->bgpio_lock);
+	guard(gpio_generic_lock)(&cgpio->gen_gc);
 
 	int_value = ioread32(cgpio->regs + CDNS_GPIO_IRQ_VALUE) & ~mask;
 	int_type = ioread32(cgpio->regs + CDNS_GPIO_IRQ_TYPE) & ~mask;
@@ -142,6 +144,7 @@ static const struct irq_chip cdns_gpio_irqchip = {
 
 static int cdns_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config = { };
 	struct cdns_gpio_chip *cgpio;
 	int ret, irq;
 	u32 dir_prev;
@@ -168,32 +171,33 @@ static int cdns_gpio_probe(struct platform_device *pdev)
 	 * gpiochip_lock_as_irq:
 	 * tried to flag a GPIO set as output for IRQ
 	 * Generic GPIO driver stores the direction value internally,
-	 * so it needs to be changed before bgpio_init() is called.
+	 * so it needs to be changed before gpio_generic_chip_init() is called.
 	 */
 	dir_prev = ioread32(cgpio->regs + CDNS_GPIO_DIRECTION_MODE);
 	iowrite32(GENMASK(num_gpios - 1, 0),
 		  cgpio->regs + CDNS_GPIO_DIRECTION_MODE);
 
-	ret = bgpio_init(&cgpio->gc, &pdev->dev, 4,
-			 cgpio->regs + CDNS_GPIO_INPUT_VALUE,
-			 cgpio->regs + CDNS_GPIO_OUTPUT_VALUE,
-			 NULL,
-			 NULL,
-			 cgpio->regs + CDNS_GPIO_DIRECTION_MODE,
-			 BGPIOF_READ_OUTPUT_REG_SET);
+	config.dev = &pdev->dev;
+	config.sz = 4;
+	config.dat = cgpio->regs + CDNS_GPIO_INPUT_VALUE;
+	config.set = cgpio->regs + CDNS_GPIO_OUTPUT_VALUE;
+	config.dirin = cgpio->regs + CDNS_GPIO_DIRECTION_MODE;
+	config.flags = BGPIOF_READ_OUTPUT_REG_SET;
+
+	ret = gpio_generic_chip_init(&cgpio->gen_gc, &config);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register generic gpio, %d\n",
 			ret);
 		goto err_revert_dir;
 	}
 
-	cgpio->gc.label = dev_name(&pdev->dev);
-	cgpio->gc.ngpio = num_gpios;
-	cgpio->gc.parent = &pdev->dev;
-	cgpio->gc.base = -1;
-	cgpio->gc.owner = THIS_MODULE;
-	cgpio->gc.request = cdns_gpio_request;
-	cgpio->gc.free = cdns_gpio_free;
+	cgpio->gen_gc.gc.label = dev_name(&pdev->dev);
+	cgpio->gen_gc.gc.ngpio = num_gpios;
+	cgpio->gen_gc.gc.parent = &pdev->dev;
+	cgpio->gen_gc.gc.base = -1;
+	cgpio->gen_gc.gc.owner = THIS_MODULE;
+	cgpio->gen_gc.gc.request = cdns_gpio_request;
+	cgpio->gen_gc.gc.free = cdns_gpio_free;
 
 	clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(clk)) {
@@ -210,7 +214,7 @@ static int cdns_gpio_probe(struct platform_device *pdev)
 	if (irq >= 0) {
 		struct gpio_irq_chip *girq;
 
-		girq = &cgpio->gc.irq;
+		girq = &cgpio->gen_gc.gc.irq;
 		gpio_irq_chip_set_chip(girq, &cdns_gpio_irqchip);
 		girq->parent_handler = cdns_gpio_irq_handler;
 		girq->num_parents = 1;
@@ -226,7 +230,7 @@ static int cdns_gpio_probe(struct platform_device *pdev)
 		girq->handler = handle_level_irq;
 	}
 
-	ret = devm_gpiochip_add_data(&pdev->dev, &cgpio->gc, cgpio);
+	ret = devm_gpiochip_add_data(&pdev->dev, &cgpio->gen_gc.gc, cgpio);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Could not register gpiochip, %d\n", ret);
 		goto err_revert_dir;

-- 
2.48.1


