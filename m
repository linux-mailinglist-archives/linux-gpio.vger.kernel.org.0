Return-Path: <linux-gpio+bounces-24294-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5B7B2267E
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 14:14:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 085497A3CD9
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 12:12:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDED52F3C38;
	Tue, 12 Aug 2025 12:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="iXlrkWyy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBC72F3C07
	for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 12:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755000783; cv=none; b=psU62h1Sdp1HjNjtbgVsZhBWioA0OFM1pjmMMS+6ZdXQVFB7Ufz4O54FsP2zGjOOm23tokVsmIK+7BMAKCxXUlUJU7IHWb6O1MymlhnEgGIIw2iEq6sK9u0JiuKAljaygtn1zkUx1rAC8eI0D5nNKnx05ZJ8GiGQ0KdOhd7zQWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755000783; c=relaxed/simple;
	bh=Kt7kTlN8Qa7Pl4SqU30Df8uHnhys/xXdAQiFzxd+SRY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Voy89sht9AE6D6Oecgp1HTRNK9fHW9K/PpToQmaHH2zWefBM09nPlHhhLad1SxG3chMY3+Vpp+CjO2ksDRAll/WaR94LcBXeGKCsagJ+YR84Zc+YLv4KMzdCgxiMLtz+O6AYqXgSKrQW6taDQgy3ps5p6T3yj5LIidDQxhPIlIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=iXlrkWyy; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-458aee6e86aso35560695e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 05:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755000780; x=1755605580; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3XL7geZnhEu2GHgbcJnrbk4PK9+gLE9ZfzKbGFcoVdE=;
        b=iXlrkWyy08fsuaSeX4yyxK2+Rjr39cB8uY2LwTEohJjET3QgoE4GY4Y9pfcQGg3MNg
         HBT6OWrvS3G0c9fFTWyPop8FanJelek+e0fm4b32tiI1NLDNnKsCrwsPVL5HF7RC44+Y
         WeGVB2x2gnrgWJMJltu/WVsDqKZGEUFB/jw3lZ+UKyBuurlLWhG6j7vz4UWPri4nPvuf
         cVjsGLg02U8W38hMP1rXHDs50fyuhRFZddye2+KhXN4sgwXE0FrttulgDA+R2W0iZVom
         hgjSBWiadS1HkASCuvRsp5sD38Bs2q1yg7ZpzomIbOSUbEercxwWVG8ae/6N8I0gflFn
         H+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755000780; x=1755605580;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3XL7geZnhEu2GHgbcJnrbk4PK9+gLE9ZfzKbGFcoVdE=;
        b=P21WWelRdtVVtbWhtPPTPRzt+1VwY7gqf+uLk+7NbmNKXXRapeWaihEMwjqN3StXt7
         aPNBacdye20B24t6ZBcuanK6xc601gZZnpJ2BAWbDWoNquHM4iSLye26eEB+IXNMH/q9
         jNsdae8C5DWpOCKmqmf44T0FRDRKPmvzv69WohcxHxadC6nmEasYvJsLNbAGOQfy/+Kn
         /w3QSyb22rAbLhbtvhfLI1dJFw5rgd4IEJcgtAxr8vA5KBcHR42hBbulWOVjsbxHrsxP
         LzYol4Otl9anoVoWw1pX0jwU4EcSV9dqCwMBJ1pvN+B2+1wwFtsBon1aTZzb8bydLrFO
         y96A==
X-Gm-Message-State: AOJu0YzmQ7Vcj+WNcGtGjTiDi7N25btoT6PpQRPUeOoSDSLKe4dguK2w
	vetO1k9/LKUViN0tjvKYEO8V0dlB9+GvcJ2gTqsMTFONDvMayctKLUQsWkUgpimiaM8=
X-Gm-Gg: ASbGnctDhVPQJ9TA7508LdJP0DFWyIudk16WAfJWTDIVHoe8PseNzv7mhrM5gMIujkK
	o+TwWLDsy/PHbQGzMI+N7+tsgZhZJPn7epT3CvtRiEwdPcEBbdleaCmRsJ4b5LvWW/piLu30Z47
	8GzVZceQy+Wy4hmHGUeHHHjCxQf43QAZTMiDLyVU/0oYZnVFKaNIbEw8UkXBtW6LYfq6rqfuChq
	dagjFRbV7LaLOP1HSdksmCsk5x6Qhb5Rz+zEUdh7jsHeZKkNFLcCZ51jv7Zbca+ZYow28gKzwK4
	EqLktLJ/r6+j/aPG1YQScn/V/rilFrplPfh1BnZuhzq7fdOMTB8ddcTSH6wug1qpF19xmvxbTI4
	Xd/B6LIypz7wnSno=
X-Google-Smtp-Source: AGHT+IEPILn2ezeDHdgHGblO5LnPgpXqCH92o0onA0PD4rlV80i2qnmmx1nZzEAXazpVbXC9rkPt+A==
X-Received: by 2002:a05:600c:1c01:b0:442:e9eb:1b48 with SMTP id 5b1f17b1804b1-45a114e631bmr20280695e9.24.1755000780340;
        Tue, 12 Aug 2025 05:13:00 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e6867193sm298878535e9.6.2025.08.12.05.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 05:12:59 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 14:12:50 +0200
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
Message-Id: <20250812-gpio-mmio-gpio-conv-v1-8-aac41d656979@linaro.org>
References: <20250812-gpio-mmio-gpio-conv-v1-0-aac41d656979@linaro.org>
In-Reply-To: <20250812-gpio-mmio-gpio-conv-v1-0-aac41d656979@linaro.org>
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
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomy/AIO7gnzgnYClDRyJgPa9bqdxWNaS0o7JCo
 kpEivjPH0WJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJsvwAAKCRARpy6gFHHX
 ckAeEACpBuZdd3E7oKBEJYCiIdDjppA7PtJOjKS4jJzjYk38RZIbRF71e+ke3QZ5HXpMq6vmFKW
 Df4Hr/4AymzpQFGFN2EgHZbbs+3UNvS+urV8lGCZnBYBp2hKiVqGFMJml4z9UMlCXIS95Ugwbrb
 AXzPWS8wxHrZB1K3QmixEIKBQ7GM/e+REApDKnJry2BAtcOtL5ZJHmEi20mC621eDrbOzKp/21U
 lc54FDcCErQcZxT1lTSqz1prNxF5JuzZ4yu0gDBnNS7a8P3b3YRUhOKti16ghGnMfyZrZx9m9iC
 HoBbnkPWOwYoXVGO5jYqfiF9QLxWh5/QZvUkL6CV+IPjUyCTglP6EuKWWa9/q+cQvi7kJk3KbAl
 kPJhwJ7zqTc1vjFtkyHI6ENUyKB+iz4sTT9hpMOvcWurPTCyOVQlJ3OjRJJMVKKfmE69QF5X18l
 btvpda3umOPTz/aCGCzFmora7+HHZnqvRYFYUdqP28LLh2zIlb4BXzJdUlWPZkMW4WTPSlc3Da+
 EMlV7LFaruqsbbX3RiulvISrogyJXQWQVK8r1XEutJU3V7f0GQqm7wR3YjgdmBAL8JrxWsowPDY
 BNQAvSJ26ZSA3WrrlzG64KjH5+QCaRRZt0YGBRVkUJ53grAuTPpK13hif1HkzdfiQEBLvMEfmsp
 qnNaR8CZWTMnYqg==
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


