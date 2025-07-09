Return-Path: <linux-gpio+bounces-22953-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8ABAFE047
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 08:45:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33804587549
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 06:44:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65BB92737FA;
	Wed,  9 Jul 2025 06:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="MnG/awsE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8546274FCA
	for <linux-gpio@vger.kernel.org>; Wed,  9 Jul 2025 06:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752043348; cv=none; b=Prh7eTPevQYHhZH+6QS4wCPWus6QcZ8lDRz3XKn9Yn/s05kXbrm4GprFs5WlxI03L2zAUF1AB/NINk713hhLPupvRnPbQc6fWa4jhnVTZM56QT3NO6UoJffmeSSPA4jlFRWBZqJdQhuWVmXCG93MaqotJedIHVBByvrydZMni+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752043348; c=relaxed/simple;
	bh=4Ye7yuqIfr6XY+USy/NobcAKhKl10YFV+hdJKUt+slM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mUyBj0nbwKLBBgz64qonlNR/DYxUEMR75MSlS9BEi/yEMIY1d7rTUmA3HSYl/u8gdf87E0fIYuHagbUtyk/OsnBklHlxJot72/OAoRYxkN8sw+KwxqyKCmVQGnuRaxaLIXfoiiZh+mAeKn71MQFqdqUmFGsVMG+lCXcbjP3d1ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=MnG/awsE; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4538bc1cffdso44940985e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 08 Jul 2025 23:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752043345; x=1752648145; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FP1ZIJv1PeVV2n8Zz7UzEHnFrb/L/XYOOnuWBlLFluA=;
        b=MnG/awsEP02oDDlhVKlXaWSFdZ0k4uOu04t6dOkgUA0YhbtZItOFDzx+g+keAvi/O7
         vRcHV0ag0X44mtDcA/okE6Ho+My7aUwG6T81gTiBu6fSACPe5YvfUV9keiQIxRAahATZ
         PcOcaQIj4MaFd21WhhmOC1TEanaLwfezvSdipsxWRjiC3V7RMB61PvDCFBpJT67+J1St
         lfM0HACQCvFM3Ux55h2lCRUgdW28zJCu5CKdJa6mkJwcGjKGf3bDXEMiDn/V1b6Op6dh
         75PB1Ocoi6JyPfNvX7KureuNUrLwSa4N84eIBGjPAfne3KURUy7XYPDhxQf7HIrqsREg
         JNaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752043345; x=1752648145;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FP1ZIJv1PeVV2n8Zz7UzEHnFrb/L/XYOOnuWBlLFluA=;
        b=K/dyy5GpwZ+j5VLIsjmUQ2TFJJcOr93eNlP6WrvTOgf1P6tI+g96eiprEoxsfV7MWz
         EzMt3tJaUGSfypm/DGYM2LYNgWjlGzyKiUzSXbtTRy6p4KJTSf/R3kG7E5ix/yBIh4q2
         ijyRuJJdpc1R55pVSWxmpE+ohQ7hI0UN/sH2HXFgG4Tue/8QyLeNN6rtM0GBoS8NLLXk
         EsNTaRoIEsyrgaDFBxnl7SGP+0kg4oETLlxK9DmFNFFXZAhfnWLZeQsK5tCO3VOvz1UI
         7ti42SPbhmoXTEafHgmzLqN4mSssgyUaGu7lMGC8seMXVQ8tYsm6rr81dGgaUrrosSh9
         D3ZQ==
X-Gm-Message-State: AOJu0YwPKbUB+GmzgQOrpm1Mj/iBXgZ5Nqz0OgRCWK2l6k6BbL6N6zqw
	pG623jQwsv+8qFzWb9QNlOy+gNr9n0P8tuzjoKFOLHsyAwW4MGZ49FuDVauff5bVLRA=
X-Gm-Gg: ASbGncsWQYV2ahN5hlvmUKzxAthkh0hvZK9pnPs8hHhbEMs5y6vj6NIVruzazuXAN2X
	gmUyx+5HYkKFVnZHJs74ApaIvdy0EfMCNc8XWNtr0N7eJ1LzQxmeniZB9Hhw+1U9g8pWG6F/gtp
	6+d8kW6KOvRs4U20CZggdFKtmMUslUsnjwiSp7JnKjCs8xTmQoDUoZrm6jhU/pavsb+IasTW7Fp
	tUqzB5wdTDmYz7pxB1XEL+b2I1P40tqAHscP+Lxd8a0FrO0xaXIvWKyywoDMAhbwQDVDlY4Q/5I
	nVg2GejcPDpmWV+NmfyDU6FsvNnxJZukpZAehpNccR+3NYfw+kv7tZ3x
X-Google-Smtp-Source: AGHT+IGoJ69ezNTOtmmhAiNL+5pDkJp8ZCkFur0QRkzgVB9fB4r3QAFrgHAALDoXBvTb2fqHyMWaTg==
X-Received: by 2002:a05:600c:83c4:b0:43d:ac5:11e8 with SMTP id 5b1f17b1804b1-454d538f8b0mr7399745e9.21.1752043344951;
        Tue, 08 Jul 2025 23:42:24 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030c443sm15115341f8f.11.2025.07.08.23.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 23:42:23 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 08:41:46 +0200
Subject: [PATCH 09/19] gpio: xgene: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-gpiochip-set-rv-gpio-remaining-v1-9-b8950f69618d@linaro.org>
References: <20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org>
In-Reply-To: <20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
 Srinivas Neeli <srinivas.neeli@amd.com>, 
 Michal Simek <michal.simek@amd.com>, Nandor Han <nandor.han@ge.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1655;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Osm+ULbHr1nM6uy+4Eu6nmXEimCDO9FqH7az0zHp9wE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobg9CfTttEp2sdK3tnvuV3eWY86ZQPneyybyso
 AJNq7R+x76JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG4PQgAKCRARpy6gFHHX
 cmqfD/9PGgPW84uUengf1aZQBpsaDyUggIrJmREh1u2hZWuPJFXBaN+3WznK670S5teqOMS6omm
 3EhWkN5cICq4H9li8m3HHy7140h28isSYmzw6f0veoLdVX7P+4Bx0v7nEAeTj+coGtZsJXhUGX4
 ozcpHJy++C273DjQAGU+Sujyngy91hNZ6B4RHs5K55y6BWWIFbuHO/ES2FICBgVIowFPMDE86ub
 ATXYUAHHFp7Dsnnm4jpNIKki4RxHWQEqSyXFKyg7s5+mtrHeHnt7cxxrMMA7yaRFozCYagvAmep
 ZqJ5+ACll/c3Li85S+WwnWwB4Bd2YTEtZqZajNzkgV9iEVw5NEzHW6tIBFmuJfI23zxcg/9AOhK
 utgtgT+iJ3Z2NPBnvfWhfT0WTeNYVJlWnpECn5vCOZTjesBW8rJ1QeNAnVjGfbBMY8EzrKNYGXP
 s1/KRIIjVzH60FYXKjNHlXa8DFQRDhhI7zvlCZyhd6TZy0glMOFrehdgeinqWkIlCaazSKtOTRK
 4XxwvTBmSoGrii9pDpmkH2RAS/33u7hvAVrYPQQWyQ2zPa7aQqL4t71l7jGLzheRYw5skZtotkq
 Oz3olGmhC+VRmgFL2YHC6kgdYWvLOZqxNFGRwPgV38bTL3GscQQrVFfg3+0xBzOaKlq367GFopF
 4n6tYRdQwj79h5w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-xgene.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-xgene.c b/drivers/gpio/gpio-xgene.c
index fb4b0c67aeef46a3810178a3a1b6870d04c8ecdf..28f794e5eb26c06088a205ac7294a226fe63843b 100644
--- a/drivers/gpio/gpio-xgene.c
+++ b/drivers/gpio/gpio-xgene.c
@@ -62,7 +62,7 @@ static void __xgene_gpio_set(struct gpio_chip *gc, unsigned int offset, int val)
 	iowrite32(setval, chip->base + bank_offset);
 }
 
-static void xgene_gpio_set(struct gpio_chip *gc, unsigned int offset, int val)
+static int xgene_gpio_set(struct gpio_chip *gc, unsigned int offset, int val)
 {
 	struct xgene_gpio *chip = gpiochip_get_data(gc);
 	unsigned long flags;
@@ -70,6 +70,8 @@ static void xgene_gpio_set(struct gpio_chip *gc, unsigned int offset, int val)
 	spin_lock_irqsave(&chip->lock, flags);
 	__xgene_gpio_set(gc, offset, val);
 	spin_unlock_irqrestore(&chip->lock, flags);
+
+	return 0;
 }
 
 static int xgene_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
@@ -176,7 +178,7 @@ static int xgene_gpio_probe(struct platform_device *pdev)
 	gpio->chip.direction_input = xgene_gpio_dir_in;
 	gpio->chip.direction_output = xgene_gpio_dir_out;
 	gpio->chip.get = xgene_gpio_get;
-	gpio->chip.set = xgene_gpio_set;
+	gpio->chip.set_rv = xgene_gpio_set;
 	gpio->chip.label = dev_name(&pdev->dev);
 	gpio->chip.base = -1;
 

-- 
2.48.1


