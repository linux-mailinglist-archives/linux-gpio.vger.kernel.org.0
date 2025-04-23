Return-Path: <linux-gpio+bounces-19173-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F01A98053
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 09:17:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF6B6194080D
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 07:17:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6ADD26A0BA;
	Wed, 23 Apr 2025 07:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qvMwyblT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDBE72676EB
	for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 07:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745392529; cv=none; b=Se9uWbENGQz+WrrlLwA8vRe3R/4mA07waTIdpdaulknyK3WCH7RCiSyRl6hCBn8FNo1qy7p72Fy7P3hpANAPtoZrP1Lzk2ZRKG9aVeXg9xuquM2o46hYNy2tiMMXmt1nmIewMAKOQOqzHOTn4xQfwnerPpEjRQpum3udB72nWk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745392529; c=relaxed/simple;
	bh=HxZIVHd7Ya/Rp9rdtaZgnyu2HXbkzYuPBcLzfbMctys=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UO61iFWmvuc9WNx+sj9sJKgh/X31V7erT5kOMO+GkAXmBhXwjv4QyH+lmrSeG/tEOaKK2/pYe2QEFGf/XTR72tjh1gcOVrCSdVK/vQVphkLeFggJsFlHcCnFmXKqBg0xviZCYG5G+K3ohN5g7uiLdRRqJghMUTYeIWLV4OaL99E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=qvMwyblT; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-440685d6afcso56725045e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 00:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745392525; x=1745997325; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5A9jSD/uIlp6QoHu76NxtQ37T1ywzmxmW0tNa71VcTc=;
        b=qvMwyblTF70gdkEepDKYC0ht6T0G/gZPeUP0X7WtLVUGfG/EXh0p4K4F4RbkbWi5NR
         kGiDZTVNxp9vmB9YXOR3Yz8CvS1pGnbIS3hsT0uFsL0JZUvf9UFa4WKzOF1UyEEux3RA
         XIVkpOnpCmVu5rl2m+nS/Bp4/k67MiRoQ3KebXMz073R8gjcpbBYEcW3UkQxcCfQTwou
         hNdmQvAzo6LKazDzx455RXqazEwwauNDRwuQMND28HgSi9fWlRELLeUoXlKX1sLSOUF7
         O0y7glq1h2UR+/SqI/ve203QnQwn56e0o6IPhdaXQJGJ2kSkbbGjeG7Vhm4cZKb4yh7I
         WrEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745392525; x=1745997325;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5A9jSD/uIlp6QoHu76NxtQ37T1ywzmxmW0tNa71VcTc=;
        b=O1EPUpudKLlAqKedkrAPNxC/aVBSgfp9pr/w1gOHHAzIh6tmyHNWpa6NxyMX6Rwtv0
         O4MOAJDy5nKRD4kNzFzE8peqIoO1A5BeFk9EfAizLZk09jOmSeIGyFpR46i5A96Iql3S
         +DkTJc5CWppbMhnl48ie/8n156eQNNcAOnKulnF5aXUgE9yoeh91OMb+97YJi/O4fjHq
         JWDMAGO50APeSdgu3Zk0UleEqoSJaO/dMr7HmqVf8JSHwE1w92R5PnkAf/HNn9NkrC/W
         +iSGteP5K7BS8L0k/Mu7S18couz0I0xxerJwNZsWASKK/vLFpiStfEZPq9Ih7CsjGWCx
         yYPw==
X-Gm-Message-State: AOJu0YxV2oozziu+DLe+Mfnj3AtsOJoLuuoITq1/99cOf2X9G9GFlEVN
	nIBkxZgTiGP+T+5FnHaIdVzyg3zF4D+iLy2eLIc9kJ6/I7Z+/vka+bjiUjtguP0=
X-Gm-Gg: ASbGncu4ueBdJIz4USeVX0O5nEEomYmKk9rKV/GbYWTOn3UkTDGLmZMWrTAQcZcrAwG
	SDIyzd/ufc+qS2Mdzod+qS5VrR5V0yf7MOl+qh1jnWv+RDJFfAeYzw5caCBQhFBC5Okmyuq51PC
	UpeI/2tveF42GY2IbPkKhj6HeuBNzwPUoAMC5F0apAdq9I06yo/zzP+FFMtblHdlceP2fq5WjVv
	o+c83FxopMbTLcqbjMMMWwlfcubo6910yGXvtuzQFRe35Hre4p6K4cSXoP7obC+2UNuPV3nk0rU
	IOymOVPCvEP4HENW6FXU9zp2TGWwfSLeDQ==
X-Google-Smtp-Source: AGHT+IEn1spt/h2u5dpKe8vDHbB7DwPQ7hB5lVmJHia8LQyke4IXqZH06mvc9G/kfquH6FxEAPcrzA==
X-Received: by 2002:a05:600c:1914:b0:43d:45a:8fc1 with SMTP id 5b1f17b1804b1-4406ab70701mr153653645e9.4.1745392524615;
        Wed, 23 Apr 2025 00:15:24 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:74b0:71bd:6dda:dcc1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493446sm17696935f8f.74.2025.04.23.00.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:15:24 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 09:15:10 +0200
Subject: [PATCH 08/12] gpio: ljca: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-gpiochip-set-rv-gpio-part2-v1-8-b22245cde81a@linaro.org>
References: <20250423-gpiochip-set-rv-gpio-part2-v1-0-b22245cde81a@linaro.org>
In-Reply-To: <20250423-gpiochip-set-rv-gpio-part2-v1-0-b22245cde81a@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Lixu Zhang <lixu.zhang@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2030;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=b4e9Yh21OkyIv9obgoEt9uaVpzJ2jn0uGM1AhPkmL8k=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCJOCVzTKB9P3OgjYJzBe1LF+XVaeO2f9Li9su
 ekmz2jV/HuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAiTggAKCRARpy6gFHHX
 chT0D/9Pz0ea0xoZZIO8L5T7J6QFHTeq5HWhqnCTnNTNkelWPIudJu0KNhs3oCRhcZT/u71VnLL
 WcJEsXuNcdIoK7140LbEMlu3xYC61N0tP0CCMtrRT4B4Ddv2FQZY9WOE3FaFsluPeeDlaZKjIJI
 xNbkSCV/U3XJO8dxLCewcUf+ju3Tb/kddy/4qFAC07yNbcjEEKFg8wROjW10gAQDu2L1famCSmL
 Q9vP0Fiynki7tK7OSm8dDdN4a3oLsmuyx+c79R2h/o0YnvAoivFZXfoe25SwXg0BRkk+hWRtlZP
 r5c3EhV8g44ZfP6E4D9t2xzFNLpuV3pqruIsgzse5vuIsW2UKLFzeiq5MTArUpDRuj8jiuDNbSO
 g33fz+nv37+1yzrIzstqCtSuNe0B64gixzlLEmRlLxq2yrM2Dsmr/bMs5upNB4UdlU2/Aoa1wp5
 QPqX2giIFEH+huZ65p+6UJoPU067Q/kFuZmGVO/KzrFNMRcO0EWeyspwsBTBBK/+1FdQPADGpI7
 gDrHr5UCRdmfoCd4bQLS7C4AosydlvVkfNTnSjgy0JK9ORZcpsKIYzxEnUyHHfv2hSrdqJO98MO
 4I0iE2dE1nBKtQKxvrFQRIF8qPKrJtCoHpZMSJci3zKDDWnqShghUOaMKQpof5pYSu/UYM6rADX
 fYZqx3dLCF4OPIA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-ljca.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-ljca.c b/drivers/gpio/gpio-ljca.c
index 817ecb12d550..61524a9ba765 100644
--- a/drivers/gpio/gpio-ljca.c
+++ b/drivers/gpio/gpio-ljca.c
@@ -144,8 +144,8 @@ static int ljca_gpio_get_value(struct gpio_chip *chip, unsigned int offset)
 	return ljca_gpio_read(ljca_gpio, offset);
 }
 
-static void ljca_gpio_set_value(struct gpio_chip *chip, unsigned int offset,
-				int val)
+static int ljca_gpio_set_value(struct gpio_chip *chip, unsigned int offset,
+			       int val)
 {
 	struct ljca_gpio_dev *ljca_gpio = gpiochip_get_data(chip);
 	int ret;
@@ -155,6 +155,8 @@ static void ljca_gpio_set_value(struct gpio_chip *chip, unsigned int offset,
 		dev_err(chip->parent,
 			"set value failed offset: %u val: %d ret: %d\n",
 			offset, val, ret);
+
+	return ret;
 }
 
 static int ljca_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
@@ -183,7 +185,10 @@ static int ljca_gpio_direction_output(struct gpio_chip *chip,
 	if (ret)
 		return ret;
 
-	ljca_gpio_set_value(chip, offset, val);
+	ret = ljca_gpio_set_value(chip, offset, val);
+	if (ret)
+		return ret;
+
 	set_bit(offset, ljca_gpio->output_enabled);
 
 	return 0;
@@ -432,7 +437,7 @@ static int ljca_gpio_probe(struct auxiliary_device *auxdev,
 	ljca_gpio->gc.direction_output = ljca_gpio_direction_output;
 	ljca_gpio->gc.get_direction = ljca_gpio_get_direction;
 	ljca_gpio->gc.get = ljca_gpio_get_value;
-	ljca_gpio->gc.set = ljca_gpio_set_value;
+	ljca_gpio->gc.set_rv = ljca_gpio_set_value;
 	ljca_gpio->gc.set_config = ljca_gpio_set_config;
 	ljca_gpio->gc.init_valid_mask = ljca_gpio_init_valid_mask;
 	ljca_gpio->gc.can_sleep = true;

-- 
2.45.2


