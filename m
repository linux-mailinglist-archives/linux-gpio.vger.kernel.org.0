Return-Path: <linux-gpio+bounces-19172-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A69A9804B
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 09:16:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B64323BEEE7
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Apr 2025 07:16:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0789426981C;
	Wed, 23 Apr 2025 07:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="s8Inao+H"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E772676DF
	for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 07:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745392526; cv=none; b=uivBJBROBWo18GeNCS4xlRyGdo7YrWXhJgPg3inM2lj4k6vNFO2/RBcKlypPq4tdmGN7mNwDSze0F8VKmcPd42wLkC+N+Oa1MXZVRy2rMG7sy5zYeu3hgXbgJOa+qK6GBwZltYV1X4TXKw7pXifxhlrtz5BaJDfnxcSf5iUngt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745392526; c=relaxed/simple;
	bh=Yz8WOxIm3KcX8ffshwPSeQmdmfycny0IGC1PIWIi2Ws=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jfnJ59E49Mx5RWijjmz5Kr9p64DqmRzN6CbIctPuBov8bkAJrSQgkWcWKucWSqo9Hzt5/1rEuixSUxH+plo93o+P9HriSwRMbAgz/FYhHhUZ3l0SNmpHNcTvpeXs1zo8ZqUF775XV8GtLx3QcompZqLVZiQr2810By21gHvanHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=s8Inao+H; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39c0e0bc733so4781703f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2025 00:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745392523; x=1745997323; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cOrKi22/dqfrB3rRPsto8GuhAZh+Tay+I6m8tbaX9ss=;
        b=s8Inao+HBsn/qzLtzG0AMkI1+V8LEHbhpySNhCFQ9yC5vzrTw+H7usY45Gl34JGaLC
         jDVat0KzWvoeuxvPOC+bZGlGBICNLhrs6W5wg9Bbd+d6AESBynP9eVgWIWvpk5qbSWzN
         snYRWUDRyS2tml6DR+MJoLNKsYdKihC6AgC8X5WmMr4+Q0hZ/8z7JJmfN2/IU5bC3shf
         iqcVkHFRif89BDi7VvJE6AXSAkD1CPrc47chrDl6T1dxCTsxm81L+XdjEDKRITP+Mcim
         iSHD5RYikTfe3KM3cCv+YG8g26wp+rwXn8+QAwzEw9fep1aR/d98YOB11hB2MNnXodXJ
         JsSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745392523; x=1745997323;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cOrKi22/dqfrB3rRPsto8GuhAZh+Tay+I6m8tbaX9ss=;
        b=OOivNW7F8hTp7YDQeRbd5EJD0raL8pTlwc5JGtkr+/aNSWc8zs++7Zel2NDZBHkwmq
         6tNyImmI4BpqKPpCzdlrZtmPBj++ncejgnJs08Uzew/xoJLhLtmHq8RdyQA/o3UyWxfJ
         BXs2K4nxFzX9FPiB3geZRsbNFJFHx8lMhVT73p8SvHjVRWiUtRiRHOEuWPjiUBD/FY9I
         2DMPzr4goE36ENf8IBAdijWwMw0+xNxXnJOTiSYntX3zUfix8KLvFvu2eq7iBveaZOh3
         zg8Jw1IYV9nV7H0jHBTy225vONLhV3+lwWaUi2bJvMThUhpIpZ5BtJiW+M2fZR6lixbS
         no2Q==
X-Gm-Message-State: AOJu0Yy5vhGztmfI4j8GIwO1eEUbE2NwPkEWgXFIW6/LbNnN6MsGsFhK
	6mUwM4Dh9uUQQ+Trvkq6pkEruYKKmrlEy3QF6QPrxGwgU3DaOyGsQqqAE4AnXvU=
X-Gm-Gg: ASbGnct7WAiwXlT5A/hZf55q9p/F8/Jj+jJU8QgrbyUPFSnv66BdB6x8YgRudlShhw3
	kCr1GqSCkzxm6azPae1vXte9oIKD5am1CHBYT9BIlWPJd6/W1rJBiw5Qxl66Gw7d+W5+109y1uF
	Hf0yASNpihnDumuFKcImZw/tehHDwFAfc7JUd+G8aRvQ7ArRVuRrr9z5PFZYSTEi7P459KQjhTc
	tYDCDLU8MU4ISoPejE8EfLrkR6tmat+8DkhCBP0muAoHWDUe8Z3uABN42X4yTx285uiOyfgra7T
	RGapf4CugQ/Sq1Gk8Q14y5Cq1NUCnHXfIoAqJ11Howfs
X-Google-Smtp-Source: AGHT+IHdkGntLIJpgevULhTBulmEF5ptbiFqEcKnuw1ZYC5LO7PfKcAh/nJQn8PlRTrDNV7n7jcsNA==
X-Received: by 2002:a05:6000:1ac9:b0:39b:fa24:950a with SMTP id ffacd0b85a97d-39efbadeb66mr15392672f8f.36.1745392522799;
        Wed, 23 Apr 2025 00:15:22 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:74b0:71bd:6dda:dcc1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493446sm17696935f8f.74.2025.04.23.00.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:15:22 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 09:15:08 +0200
Subject: [PATCH 06/12] gpio: janz-ttl: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-gpiochip-set-rv-gpio-part2-v1-6-b22245cde81a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1427;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=oGCmkNdKxO8RV4qMx171fBCKku3RxsPW1rRe6wl5k5U=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCJOC3ZB4v8rJEF242h0kCZt7/M/4vNi5Q9Irc
 rSkGUQUQIuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAiTggAKCRARpy6gFHHX
 ci9aD/wMJoqanBDyhWyV2ciSgT4vnvNazG6/H6xjmAw90A83pI0LeE/uBgMTjVvQcXkJ5sq9IYL
 pMQSAJDO+V6stHMm3pb8C6op4t6h3Uc3VyntOGzonCdXOhYHjtd3z7+1O1AgceR1Sfh+XqzK8Ap
 RDabrPY6r0T60Q66e9DKH6C/GuUq++t7HdI6+p8bK+4hyg1KsZ2riCv/y6Jv9RDUwkDHeAgSPMi
 n+xeuvQH4kpG2kutaopWhLWTNt4QLNFjzcR3NR6t7PXKfsVZmXpG3wGWmCs1pazlZaoVTuidua3
 JPPn+8N1sO/TF+0t1fMuq7nmhzaXJy6wvGv7qUVzk4yVVZYqHd0TzaWfpTdXmtfcrTyGKVM1zQh
 WpNYEX+OG/GZqgllUCdo2g2HfGMcvoyyOtsArAdwuUMDRgyasslD5iMmf72CTQBi2h0boA/y5HD
 JAcVLK498gmhcjsDh8Z2B3G2OWMC4JnTWtyh5nR7PXGa+bL3h23eyxp58LPtNBE49yPAfgYZnkH
 EYbwRzldFMMFKj+1mPfhV0R4xDhTYuItjYD0wgpt8WkyqXqstGuhJJmEXA71c5ieMeTYtvYPDba
 LmT0B9ncjdETBR3ARAWI6mdFerI79rP7ovhcgTOb0S2D4kUYBribi4KtAcjp5K+gjNU5ZXZAJ5i
 2pDfSwy4Bdlnp6g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-janz-ttl.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-janz-ttl.c b/drivers/gpio/gpio-janz-ttl.c
index cdf50e4ea165..9f548eda3888 100644
--- a/drivers/gpio/gpio-janz-ttl.c
+++ b/drivers/gpio/gpio-janz-ttl.c
@@ -76,7 +76,7 @@ static int ttl_get_value(struct gpio_chip *gpio, unsigned offset)
 	return !!ret;
 }
 
-static void ttl_set_value(struct gpio_chip *gpio, unsigned offset, int value)
+static int ttl_set_value(struct gpio_chip *gpio, unsigned int offset, int value)
 {
 	struct ttl_module *mod = dev_get_drvdata(gpio->parent);
 	void __iomem *port;
@@ -103,6 +103,8 @@ static void ttl_set_value(struct gpio_chip *gpio, unsigned offset, int value)
 
 	iowrite16be(*shadow, port);
 	spin_unlock(&mod->lock);
+
+	return 0;
 }
 
 static void ttl_write_reg(struct ttl_module *mod, u8 reg, u16 val)
@@ -169,7 +171,7 @@ static int ttl_probe(struct platform_device *pdev)
 	gpio->parent = &pdev->dev;
 	gpio->label = pdev->name;
 	gpio->get = ttl_get_value;
-	gpio->set = ttl_set_value;
+	gpio->set_rv = ttl_set_value;
 	gpio->owner = THIS_MODULE;
 
 	/* request dynamic allocation */

-- 
2.45.2


