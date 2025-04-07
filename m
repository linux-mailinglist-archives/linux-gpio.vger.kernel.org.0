Return-Path: <linux-gpio+bounces-18285-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DC8A7D545
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 09:16:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 074CE1891B0C
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 07:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E14622A7E5;
	Mon,  7 Apr 2025 07:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="k1YtE7Q3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783A7226883
	for <linux-gpio@vger.kernel.org>; Mon,  7 Apr 2025 07:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010031; cv=none; b=EfkNJxEIAOatTIroO3ZrjYbDuT2nGaixowV/fn6nyk5f14poUTPOlCTALVHSsuBN6AEeyD9zmrxiiolKGiJPsS/+cuJvANAtPRGCPoxsvrYqR5GQF+szNhm9H4R97WarCXRzM0fUPXjHB9r0JNHTCLq0BJNNdi2yZHBku8i+gSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010031; c=relaxed/simple;
	bh=ksgMNh86Gb5TqWWXr6fwh4KwzaC1B3egBIbaiSO69I0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lBQKTt2hoporItpJgvPG+m548mSq38HsCRH69fz1PCvy8Zu331x5sHRQvuWnPdn2Yndln7Dv1qhC8U0iKyO7DiLtSIJrsZAkoj5gjuWnsK5xEPW88v1sJ+QfnTieib7Q9uvEy76TIpGHQOt5GHGdI7rwSdmgWt2jQ++iGYYp+TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=k1YtE7Q3; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3914bc3e01aso2343120f8f.2
        for <linux-gpio@vger.kernel.org>; Mon, 07 Apr 2025 00:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744010028; x=1744614828; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sauICvY2GNu/d0iZ8lKdFH04dL21IXhvdergpTZ3jAY=;
        b=k1YtE7Q3b8SrNWmS9knsazM95riHxPX9ySK34IkIPSd/gRb7wcqGu843kQxgdPiTq/
         W/OfLlbubpT5SFM0JMifgZyDgY5xF/Z0fcT6xikOZ2+FFbApBRzfYt9J0caqryNs+Oh9
         S5mO78pzE0ftN88RDOIR92/l8VM5/Joa+71tFo3qP9xJ1eSUHJuAafn4F0flbPPKYfLu
         qrrcVy/mGb7f6G8stCsMvwBkAeFKzJll0XXg9qvkESRerjVQENIj5d8EUUImaurFfu+Y
         dyYpxW0EeZhaSzmHxoFI/nLdbU73TT9pP6DpdDdWcNU3e8RzCpv/XawkqUQIOg3owJJO
         RGrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010028; x=1744614828;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sauICvY2GNu/d0iZ8lKdFH04dL21IXhvdergpTZ3jAY=;
        b=ZiNzwzMqsMo5L66TNxneFRmjS60u2Fxb2n11qgv2H9S1wFgbZ2Xy+1HEq7vlU30Evv
         Xm7sbgBEU8LpKdFgUhDr8JFZhkkDUbZO+oDVnwz9pcCMc+RJmhAT0fUivqhVjpWT2BRJ
         oDlNCmPPoiuUF16/pRv7Mg7dx2Q8k2bYUrGOEe8/Qr0TKnDJ+CJPuDRAMGtliuml3vDO
         1ymN14Mm7S1hSM5Y25v6e+gCYKUHykE7K81B0e4XtKdhKaa5h4EScl3ARGCk24l9bHBv
         rU47eJyCXrP4uykPV4GjTUaNagzkKL+j9+S1Z6LMLH0pXpAWgNGdyrkoAwmVBnFalxXV
         l65w==
X-Gm-Message-State: AOJu0YyYZx7ufUGlU4iMMZju22ePUoftVnerBci0qZ+Qao1K0+zUwrPv
	ahVCAkI9hp51w2oDexfOg1frFpzTvzUxWSbnecJLErkilm/1Tf6kaMAa8/vuBs8=
X-Gm-Gg: ASbGncshQiV37wScUUGSONcIqj/yqpTbjeruTr/SuW39LcBi626BbZmJxqN/RKzQmGB
	Hxsl7qDYqy9gbPZoh/IpezxqZiHIdX4RoDgnzESRxo1EgG1tIvcCzIZAbbYkfPR9Yt4g+GjOPfW
	85JtOrO2QB1uyCkHrtDI3xM5+2BlSiyFYAG9UUzzLyIgg1zPen0+feBSwpIfG5GkWdweBDYNy0C
	lXfMsb+Wte4MDHIIJbEW0K/TczHz4FXNtP7r3QtsTRQaQ2vVbUCAvmZEqoS6vtFChZNf26PznlA
	ElV/u0EZw75B9hE9ud9V/2DCEqlvK5xjgRS2PAgXyf6wHf6e
X-Google-Smtp-Source: AGHT+IET2/k8WYw907bVllamJF5bVLK+JZ/6K0xA/5CGjA1RriXq4TqZb/drjilOXTTBto1d3wZyuQ==
X-Received: by 2002:a05:6000:186f:b0:39c:266c:136d with SMTP id ffacd0b85a97d-39d07bcce91mr9558796f8f.12.1744010023815;
        Mon, 07 Apr 2025 00:13:43 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ea97895e1sm145267115e9.1.2025.04.07.00.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:13:43 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:13:21 +0200
Subject: [PATCH 12/12] gpio: ich: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-gpio-part1-v1-12-78399683ca38@linaro.org>
References: <20250407-gpiochip-set-rv-gpio-part1-v1-0-78399683ca38@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-gpio-part1-v1-0-78399683ca38@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Andy Shevchenko <andy@kernel.org>, 
 Peter Tyser <ptyser@xes-inc.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1945;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=i9kMgN5vraePIBzVin0YNojFDKLKAlftYcTP7Y1Nccg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83sKeGi3udRSb1Sw3Ipb+p3w9GsXMiEnZljC6
 RQzVFe+nVyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N7CgAKCRARpy6gFHHX
 cuyxD/4o1AmB9t89cQnAf0YyC9wdK7KdIRyopDsQc445ExB/wWNm3fbat43Kj4GGAoLd8KCjc1q
 PG1mHa4YpBjhmNvU6hg8wUfQyN3C1wf3jXBYHOn7Ts3mHDCVi9WOitafwSf27aYja3RW3lpXl6H
 nvEbH7KVjuFrjpnYgD4AsJc8mGcUSv+g3mAAk4PUVHEPK+3THey0qzmU1uL/mgxUkw7jnOjcIlt
 raDjndjF72lCBpjaWK0iQ/WrbKlePVhcMNAUyaN239U4NpX9R3E919D+KCx8ux/6ds6hoKbLqrh
 hBCHrqgXXLAuyrJVnq8X1aMpu/pvvVW6a6ei51TUDCieBdJ2kBpGQUvO+lTWYOf3y2kd2HPZUhm
 Fh1WSwnpKe6gaUdgD6e4wC5p2UhZ7KBJonc6vny36UEvo0dZGZrxdHg5UsLO5Tq6Oj6AHxY/ChZ
 hQMVZtKIZHc2Iqi8e+3BUKD6hbS9z1J6kh/LQpqpHRdO8VxWW0kt5s8js5IKQDpTQUDkpz7hAdk
 WZpbMj//rZrYjp/djyR5irUHQ7KwBS2RsvGa0TRmdwGgyECJfhrVsIXvZDkKAzWFOJPkQhalyJq
 sNB38EemKTWipHl6P4JsX8ObhIZvAZxMXGs1fXDfq4OIrKgOQiBQYBQjCKyedokBvd9AIDEBZ7R
 qgCDTPqepWM2tIQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-ich.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-ich.c b/drivers/gpio/gpio-ich.c
index 0be9285efebc..67089b2423d8 100644
--- a/drivers/gpio/gpio-ich.c
+++ b/drivers/gpio/gpio-ich.c
@@ -175,12 +175,16 @@ static int ichx_gpio_direction_input(struct gpio_chip *gpio, unsigned int nr)
 static int ichx_gpio_direction_output(struct gpio_chip *gpio, unsigned int nr,
 					int val)
 {
+	int ret;
+
 	/* Disable blink hardware which is available for GPIOs from 0 to 31. */
 	if (nr < 32 && ichx_priv.desc->have_blink)
 		ichx_write_bit(GPO_BLINK, nr, 0, 0);
 
 	/* Set GPIO output value. */
-	ichx_write_bit(GPIO_LVL, nr, val, 0);
+	ret = ichx_write_bit(GPIO_LVL, nr, val, 0);
+	if (ret)
+		return ret;
 
 	/*
 	 * Try setting pin as an output and verify it worked since many pins
@@ -252,9 +256,9 @@ static int ich6_gpio_request(struct gpio_chip *chip, unsigned int nr)
 	return ichx_gpio_request(chip, nr);
 }
 
-static void ichx_gpio_set(struct gpio_chip *chip, unsigned int nr, int val)
+static int ichx_gpio_set(struct gpio_chip *chip, unsigned int nr, int val)
 {
-	ichx_write_bit(GPIO_LVL, nr, val, 0);
+	return ichx_write_bit(GPIO_LVL, nr, val, 0);
 }
 
 static void ichx_gpiolib_setup(struct gpio_chip *chip)
@@ -269,7 +273,7 @@ static void ichx_gpiolib_setup(struct gpio_chip *chip)
 	chip->get = ichx_priv.desc->get ?
 		ichx_priv.desc->get : ichx_gpio_get;
 
-	chip->set = ichx_gpio_set;
+	chip->set_rv = ichx_gpio_set;
 	chip->get_direction = ichx_gpio_get_direction;
 	chip->direction_input = ichx_gpio_direction_input;
 	chip->direction_output = ichx_gpio_direction_output;

-- 
2.45.2


