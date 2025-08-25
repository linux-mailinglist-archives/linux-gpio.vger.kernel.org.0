Return-Path: <linux-gpio+bounces-24907-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B871B33B9A
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 11:50:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE8742042AA
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 09:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CB902D5406;
	Mon, 25 Aug 2025 09:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="lkwXmo2F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E7A2D46A1
	for <linux-gpio@vger.kernel.org>; Mon, 25 Aug 2025 09:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756115342; cv=none; b=PonLSJwrQgPWy10Agf+lmOW1qnE7Ezo8Do1tT6UOYnrfH8mpZ3qrhkzJZX12wQ/mHAzTekgAlTVDecfMrLZjt+AwSo6YhSILY/H+R2wCkVU8Aag+cUEZDrch7ugxeqcZAcnRScUTj++RPqk6r9Ga1Z8W6gbTRj7S8pEYKM8ZNB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756115342; c=relaxed/simple;
	bh=Kt7kTlN8Qa7Pl4SqU30Df8uHnhys/xXdAQiFzxd+SRY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZTmU37m7RsYHf3iW4U87tUw/PTPE13HMSwOHOw69bDOXvpGDWqjz2mDx7SwXvHdOKVaoK/xkHwMYIhR5C3yQbIdDJUAfbS93F5rrJ5dAGhmoHWcJlbds8f/NwZQnZXLM1YQ3hZWyOJR8UmY8g4/bJhtLDou8y5Z1F/QoKGyw4C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=lkwXmo2F; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3c8fe6bd1a2so303822f8f.1
        for <linux-gpio@vger.kernel.org>; Mon, 25 Aug 2025 02:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756115339; x=1756720139; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3XL7geZnhEu2GHgbcJnrbk4PK9+gLE9ZfzKbGFcoVdE=;
        b=lkwXmo2F6QcZMA/K2sMetobqQ8NWtXTKkEJlWcOUOGC8RxH5/3MwZrGYdnpQb9ducy
         umAax4uoc/1luMHIbviHIs4xvU5QTjd3DM+PMY6o+41o+vBykAuLxZWRPjU5WqJ2Qy+w
         RHewi8KH6xlR1zFwLp7FA9Lh0MS8a8rvW7DbGPkCKIBQs1MD6FNgnsbuUQubpLRHs9Vh
         XU8+++dTaEuqje4h7B9PUUkRHllQ630mngJ2z/Wc6gN+lm/5Fpoa1iDmvwph4E02QohD
         p5sBvut2lskmDsBeGB2CUh+cX4ooKzioqPZLq1MKXZUrrvYQUFnBbodTrfisqOIoOFfd
         UKbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756115339; x=1756720139;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3XL7geZnhEu2GHgbcJnrbk4PK9+gLE9ZfzKbGFcoVdE=;
        b=ws/C5pvrDCkq38eWED7J1VtHRLGGhEG/0JqIjqqu3/d/Ss815qBDoqck4OFwdSIGzN
         jN1TBvwu3O9u54hD1oGdP2TVg1wmKFQ9iSMe7sD0H8sv+WEgxdnxiVrwCbzsPodKv1S6
         RW1AwA5guCpXKdLFCUtnfDnsf/cRIwFzkb7rPNzjz+r6P6tWxj/YJqq1+66TKKZl3YWE
         UUWJAGXRneVqFT9sl0gKX2Nh+TUyuGgyK0NYvhie8JzV+EDFq9RlbrEvUzYMLL2w8nBT
         a1+Fowpwf4KgDJhZvqMunA+IhDX0UzizoHC1Oxndniv0sfd8IhRzNF8KxxYyCvKcSmIG
         P0tw==
X-Gm-Message-State: AOJu0YwvIL7/cfdXKwiEr9+Nj5nfa1KjLmI2FlzjgcBmlj0Do9LH/47U
	QbV6gNlTb7Q0mQPohSm3P1U9xJGVmCZ2keoG4sFH/Fr9sas9PQQHgEy1fEQwE1tiJAg=
X-Gm-Gg: ASbGncsuNy1Nkc8MtT2Kik4BDEctUuAbzkpCoxMbdPOXx3uPHTbdUNOH6CW8BKfkIfV
	P6aEaHrrBFx9B+kySXHdsoFPKYGgsg4rWSldQ5BC49xVsmvRtrEWN7eVQheNpgdoIb90MI6LMif
	7DKmyssyhSz6y7mlgh/kdSsYo9tROLgRp9lS6XXNDHb6rAcjAFRqPBCOBubiIKm+xAT40WCfaMJ
	1hxiT1szYFrFTfIzWOp/p9y27u4DbxNqut/CyPdJLx7KDvWG3MKYBImbvv+gTia6B3or311FHFN
	XVg5PPnSB6nzKmoaQQG0bgDhLilug4m3mnQJW7KI8XxE5XDKZKCE+/ibbqVCcexz9sYITLnk2Tt
	1vBf6h6r7dbmOy748dw==
X-Google-Smtp-Source: AGHT+IEegOIMU9MY8ViLpXUpgmi0qzunmqMgdKsRZ/R1rOCcGUkKbBKLGa79Jl9AtpUG8cW2p0LW0A==
X-Received: by 2002:a05:6000:3105:b0:3ba:cff3:2e9 with SMTP id ffacd0b85a97d-3c5daa27683mr7362068f8f.1.1756115338987;
        Mon, 25 Aug 2025 02:48:58 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:ef52:fc8d:34ad:9bfe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c711bb1e3asm10877449f8f.57.2025.08.25.02.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 02:48:58 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 25 Aug 2025 11:48:49 +0200
Subject: [PATCH RESEND 08/14] gpio: loongson-64bit: use new generic GPIO
 chip API
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-gpio-mmio-gpio-conv-v1-8-356b4b1d5110@linaro.org>
References: <20250825-gpio-mmio-gpio-conv-v1-0-356b4b1d5110@linaro.org>
In-Reply-To: <20250825-gpio-mmio-gpio-conv-v1-0-356b4b1d5110@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
 Hoan Tran <hoan@os.amperecomputing.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, Yang Shen <shenyang39@huawei.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3657;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=q0nDOolzmEolL80kYOdLVFVSG8jdJDB+vSKLox1kAgw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBorDF/z4zF1+EzbSX44wW9kp5C98zyXeFWHMG99
 qM5rdbUe8eJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaKwxfwAKCRARpy6gFHHX
 cgkAEADb79ImSyrjWksRjQwnS5++P92g47dudBXPy9h3Q0D8aRDzB4vpmH49EUY9gzVQP23hHEs
 hZngF6HTmH6JBuL0DT5v453QiPforXrkouXp7V3AvUMrZP+Di/tSXxwNDFz9N+dEHgx0Y8//3eS
 aacgJ8wdtl+k+y9VAwkQ8Gw0jOspifdoMpiP7PCs2W8wE+J2SuPR+hHGwBdmykLlLmjeBWFsVkm
 g85RWVYDwM4xVEYUyaRb844JrOxkEfXvL4IbQcdve3kCL7JJqujpSxwNeS6eUfKnoH2PbnN5LiW
 ZrsBdVU+Sp6Y1EtS4lgX5MpnRYtdh9eacHK3m/Uw7x80+2rV0uEZGP5zo0zRpdwt0nBHRncgkNz
 w8ZWYThFpX4J6vchCC8vrRPIszWRXmVm1Gv/APHMPSSysfaeeTBLR2f4C++5RzpkwOe1dwWLZgv
 UJ/Gs9uqXy0Dml0IUrBcCoKOBUqgKn+Ut3YFwwbuw+fPOlothO9+MbySYEv2godYhJ3woXtd6Ef
 tKNGmZfVUEseCIGCdSDoBVCrzytkAZ8e1hlLySQipfHjW5pFNswyBgMvqFE6s2q47zjo0eDe6nS
 KNP/jh4kjpCU/Xdmftn/ElIAHKxVghpEIs+oNhQWsV0nIicqVpvt1fp1VVuFsYOg7K+Zu8hIG14
 zOPbKvV5wIPoaEw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-loongson-64bit.c | 42 ++++++++++++++++++++++----------------
 1 file changed, 24 insertions(+), 18 deletions(-)

diff --git a/drivers/gpio/gpio-loongson-64bit.c b/drivers/gpio/gpio-loongson-64bit.c
index 818c606fbc5149b2e4274f0776e558332700d916..482e64ba9b4209443c2f64ae7426b8fa9034011a 100644
--- a/drivers/gpio/gpio-loongson-64bit.c
+++ b/drivers/gpio/gpio-loongson-64bit.c
@@ -11,6 +11,7 @@
 #include <linux/spinlock.h>
 #include <linux/err.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/platform_device.h>
 #include <linux/bitops.h>
 #include <asm/types.h>
@@ -30,7 +31,7 @@ struct loongson_gpio_chip_data {
 };
 
 struct loongson_gpio_chip {
-	struct gpio_chip	chip;
+	struct gpio_generic_chip chip;
 	spinlock_t		lock;
 	void __iomem		*reg_base;
 	const struct loongson_gpio_chip_data *chip_data;
@@ -38,7 +39,8 @@ struct loongson_gpio_chip {
 
 static inline struct loongson_gpio_chip *to_loongson_gpio_chip(struct gpio_chip *chip)
 {
-	return container_of(chip, struct loongson_gpio_chip, chip);
+	return container_of(to_gpio_generic_chip(chip),
+			    struct loongson_gpio_chip, chip);
 }
 
 static inline void loongson_commit_direction(struct loongson_gpio_chip *lgpio, unsigned int pin,
@@ -138,36 +140,40 @@ static int loongson_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
 static int loongson_gpio_init(struct device *dev, struct loongson_gpio_chip *lgpio,
 			      void __iomem *reg_base)
 {
+	struct gpio_generic_chip_config config;
 	int ret;
 
 	lgpio->reg_base = reg_base;
 	if (lgpio->chip_data->mode == BIT_CTRL_MODE) {
-		ret = bgpio_init(&lgpio->chip, dev, 8,
-				lgpio->reg_base + lgpio->chip_data->in_offset,
-				lgpio->reg_base + lgpio->chip_data->out_offset,
-				NULL, NULL,
-				lgpio->reg_base + lgpio->chip_data->conf_offset,
-				0);
+		config = (typeof(config)){
+			.dev = dev,
+			.sz = 8,
+			.dat = lgpio->reg_base + lgpio->chip_data->in_offset,
+			.set = lgpio->reg_base + lgpio->chip_data->out_offset,
+			.dirin = lgpio->reg_base + lgpio->chip_data->conf_offset,
+		};
+
+		ret = gpio_generic_chip_init(&lgpio->chip, &config);
 		if (ret) {
 			dev_err(dev, "unable to init generic GPIO\n");
 			return ret;
 		}
 	} else {
-		lgpio->chip.direction_input = loongson_gpio_direction_input;
-		lgpio->chip.get = loongson_gpio_get;
-		lgpio->chip.get_direction = loongson_gpio_get_direction;
-		lgpio->chip.direction_output = loongson_gpio_direction_output;
-		lgpio->chip.set = loongson_gpio_set;
-		lgpio->chip.parent = dev;
+		lgpio->chip.gc.direction_input = loongson_gpio_direction_input;
+		lgpio->chip.gc.get = loongson_gpio_get;
+		lgpio->chip.gc.get_direction = loongson_gpio_get_direction;
+		lgpio->chip.gc.direction_output = loongson_gpio_direction_output;
+		lgpio->chip.gc.set = loongson_gpio_set;
+		lgpio->chip.gc.parent = dev;
 		spin_lock_init(&lgpio->lock);
 	}
 
-	lgpio->chip.label = lgpio->chip_data->label;
-	lgpio->chip.can_sleep = false;
+	lgpio->chip.gc.label = lgpio->chip_data->label;
+	lgpio->chip.gc.can_sleep = false;
 	if (lgpio->chip_data->inten_offset)
-		lgpio->chip.to_irq = loongson_gpio_to_irq;
+		lgpio->chip.gc.to_irq = loongson_gpio_to_irq;
 
-	return devm_gpiochip_add_data(dev, &lgpio->chip, lgpio);
+	return devm_gpiochip_add_data(dev, &lgpio->chip.gc, lgpio);
 }
 
 static int loongson_gpio_probe(struct platform_device *pdev)

-- 
2.48.1


