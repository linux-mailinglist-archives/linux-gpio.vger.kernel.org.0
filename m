Return-Path: <linux-gpio+bounces-21459-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFF8AD7196
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jun 2025 15:21:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7F483B4692
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jun 2025 13:17:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72CDB25B316;
	Thu, 12 Jun 2025 13:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bXrkb48K"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C58246778
	for <linux-gpio@vger.kernel.org>; Thu, 12 Jun 2025 13:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734144; cv=none; b=rghwTu/JLvnYTYvSz2hoq4hazU2VGMJcl6clDVzlyKIEQeaAVLqwBLaBhy5lBYp6zyv3X5cFecLstP3lSgWMYYH9D4XVj87JAmUz4DLMb01YlhP6oL9P+4nYLaMNEkpfRqUUGxSZPN+9BtCk9+125ZY2FB+CQHJItcUJuCc4Ylo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734144; c=relaxed/simple;
	bh=zp6d5z1sYxwWEw/wzKNXZwt1zjGFDbts1CmdEZq0nus=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bXT8zjuXXOAqPJlBu0VxQIbklNZ0jimDjuko8eT59NDoHfCYvuUoD4A7Jrrcv3OOVXVgWzVbXwoK0mLSi1vYHpdEHlcdlfXS5a5mJHCRsyQuPhMBTIRfDgVn8TGDhQ8t8XLaDlQXv/vG8qM80uy2ghckBik6SWStlENfzKmwU64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bXrkb48K; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45024721cbdso7995625e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 12 Jun 2025 06:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749734140; x=1750338940; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xRVP/g9ETBrQ7ivNn5p21D3d98uF7eL3W+bgcNUMLx4=;
        b=bXrkb48KkkSVvRL1fIduwlV9Iul7exkzSy2jUZ2IG2BpKquYn8FgeUhUoQn97ZlxR2
         qiaG+TQIboy+JPrDjNDVnSMjoSvZTzlex1Ij82+GTQvJIBURJWhBhVDj++GSQNzwd1eb
         ZwVDxBL3BDKafJ63eNjrvz/qjH0gkHA/+UI98rNARVQhY9bK8yhJG0Xb7o4dPpq4EDwl
         GQrNMfjCypLMjZIdLIPc6Eb6NM11wHMRx5N/0KJcBPeJHRrM7psgW3od2QdSMvhdQZxU
         Fddj1wg8ZZPEZIK13MYzZxmxE7rcbcp8l4Nv4JlUVrWAW/VEbpgchDcGQDX7nOOFL1VX
         iTGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734140; x=1750338940;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xRVP/g9ETBrQ7ivNn5p21D3d98uF7eL3W+bgcNUMLx4=;
        b=qupYn1h0Te41nxVFiIhJLh3mRV4fWeCc9IE8+vZh8sVQICJtFHtN3FgO2x4Yieb8t5
         vOJw6mdNvQgt2cSAtS6eaquDxkTPVYNVK0BJ8uy1V6kZNILBGAXO2jQm+UaHi0aiPTxq
         GpoMrod2/ZQjU9uWt28gJHXEqJLEqT7LhYvq9TmyuKiFTYnFdmTE+Mc5pNlwjBSy0SrE
         0wzE+7CX0HpfUZmqFLOcf2wST+gt/Dd5rxEzzyX3uoOMwmw4i/3jIUOZW8DA3whRCgrI
         9ohAyrBFEzmZi44n+K6LPPW+pfndH/Q58mJcA/L9JTLl5efMMew827ECV62TPak9g61u
         Qkqg==
X-Forwarded-Encrypted: i=1; AJvYcCWHkBs0nSj9owOKzQxFuhRbm6qelMNxy8TpWZ5x40AL8T609LIWEC8GhSp5jBEiuOUWpxOp7O522R2O@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+dx4inqR19KhQvwo3+bhGM38Snklc8aKvb79zZXThui0mMgib
	6IsV2OOeJveS6UQfEPGzunzcj0Afv1A0rCITrPoM70vwgTrN0nE+J2w/iHXcnG6nyN0=
X-Gm-Gg: ASbGncvRcBXQKAWT0WB3D6AM64/4SDZf5nqow3sZPOtoKD0iCMadUQrk+IgyKAKNmuN
	upVTzGEy/45PK6KVPGTsVwZjk0/FdLFlnMjZKJ7efhgQAYuzcNJRshiQZiskuisEUThrRZ/iTzz
	MDC26FMTnpMxJsOI3VzCdHQnRr3O2QmNw7lYcCq/tAIZrGzv+Ww4AwfmlNr2Yl08+BXC/AJMCHj
	Io4lyyy1tQBx/BfYdsEGnQSRJznjGjpgmv3rr8q5mHBp+LEoyY+Rzq13K270spZ4ihN/tvr4xFz
	3RD3eY34gL2qR9HHdatr2+GHwtLYVJd706cy/TKgGiXiQjHfXDh/Tik=
X-Google-Smtp-Source: AGHT+IHSRKRz+S4AqZCA7nk2lBD5FvLjirlW/aLzXrlkeH/hiH8EEnGTppCPiobvVp5rFO/8nRH0ZA==
X-Received: by 2002:a05:600c:6304:b0:442:d9f2:c74e with SMTP id 5b1f17b1804b1-453248cadc7mr61464915e9.23.1749734140174;
        Thu, 12 Jun 2025 06:15:40 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8b99:9926:3892:5310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea17d7sm20619795e9.10.2025.06.12.06.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:15:39 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 12 Jun 2025 15:15:22 +0200
Subject: [PATCH 13/16] pinctrl: keembay: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-13-556b0a530cd4@linaro.org>
References: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
In-Reply-To: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
To: Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Baruch Siach <baruch@tkos.co.il>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Viresh Kumar <vireshk@kernel.org>, 
 Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, soc@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2154;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=uiWkBcfY0fL2/5gsJ5RtTL76wdCKi/XJJns8EXZp1Uc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoStLmMUTq/R3HYvt1qPLJCXHDLlLJ2q7Mprw3y
 q+tW19o7dqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaErS5gAKCRARpy6gFHHX
 ct8fEACqt7lUq3+S1tzRy8OrX4O3CMfw4nPrYnVysPwnIX5aR7rCUP9il86P5OxnBe1clhRmwf9
 HoPniYHRVUQF6YnI9EAGIDwhSUum1jbEzozs8EuWZ7akwxiY2lALTFQUB7pAw2aWqDQurWwASrh
 BAPCmHKNGQdiW4jPkj3dLIslFjsYCDyb4a7d0h7Rv4tHvOUJjwZTpmSlxh6jQhmj8/OnfF4FmSD
 A8SD5CTEpda8DN7KqBB1fsTu8o8/TRNLf1sa/DJf4UITLByVIfbtYMhfr/RbkMTCOa1I/Dca2/P
 Y8qdU4ZwwfmOTHnc/lA2TI6ioK5BvuhNtqvz4Cb1IEgG2Zlg+c5asL8lkSQySfaQCuWVBZ6+2Hp
 6pgnwuG0nSOllmDlZu6Tkzrd1ImxXcHfrsa02KtJ491H2I3Reth1gL1neP6RR6Nl3UDYNrcfUn3
 VqyShql609Nvgybzi+iTFSjRiwiPqG2yqgild3NQGG4yXE8kfSUys5UhBTzPaS5B8+VvpC/ZsAX
 xJfJ0KUdYCJumelmLmj2UUWKfC2pS9l4NPnQ9EqQOSiTnderpXlz7vJKNljTZW5Xz7ra3xmDff3
 VwRuV7ZIQrTn1lzp1FlY9U4bZ1Finj92YfG99YcWHQ0kTqN/Y0O3a7ioGWw4qxRszN5QakMKHOF
 J+HEqcwBsnDzYvA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-keembay.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-keembay.c b/drivers/pinctrl/pinctrl-keembay.c
index 0d7cc8280ea2168e69cf3d0ea415f6d2389efd03..622000139317e9dfb95e9a76f2478366daebdcaf 100644
--- a/drivers/pinctrl/pinctrl-keembay.c
+++ b/drivers/pinctrl/pinctrl-keembay.c
@@ -1188,7 +1188,7 @@ static int keembay_gpio_get(struct gpio_chip *gc, unsigned int pin)
 	return keembay_read_pin(kpc->base0 + offset, pin);
 }
 
-static void keembay_gpio_set(struct gpio_chip *gc, unsigned int pin, int val)
+static int keembay_gpio_set(struct gpio_chip *gc, unsigned int pin, int val)
 {
 	struct keembay_pinctrl *kpc = gpiochip_get_data(gc);
 	unsigned int reg_val;
@@ -1200,6 +1200,8 @@ static void keembay_gpio_set(struct gpio_chip *gc, unsigned int pin, int val)
 	else
 		keembay_write_gpio_reg(~reg_val | BIT(pin % KEEMBAY_GPIO_MAX_PER_REG),
 				       kpc->base0 + KEEMBAY_GPIO_DATA_LOW, pin);
+
+	return 0;
 }
 
 static int keembay_gpio_get_direction(struct gpio_chip *gc, unsigned int pin)
@@ -1231,9 +1233,8 @@ static int keembay_gpio_set_direction_out(struct gpio_chip *gc,
 	val = keembay_read_reg(kpc->base1 + KEEMBAY_GPIO_MODE, pin);
 	val &= ~KEEMBAY_GPIO_MODE_DIR;
 	keembay_write_reg(val, kpc->base1 + KEEMBAY_GPIO_MODE, pin);
-	keembay_gpio_set(gc, pin, value);
 
-	return 0;
+	return keembay_gpio_set(gc, pin, value);
 }
 
 static void keembay_gpio_irq_handler(struct irq_desc *desc)
@@ -1480,7 +1481,7 @@ static int keembay_gpiochip_probe(struct keembay_pinctrl *kpc,
 	gc->direction_input	= keembay_gpio_set_direction_in;
 	gc->direction_output	= keembay_gpio_set_direction_out;
 	gc->get			= keembay_gpio_get;
-	gc->set			= keembay_gpio_set;
+	gc->set_rv		= keembay_gpio_set;
 	gc->set_config		= gpiochip_generic_config;
 	gc->base		= -1;
 	gc->ngpio		= kpc->npins;

-- 
2.48.1


