Return-Path: <linux-gpio+bounces-18461-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFC6A7F6E7
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 09:45:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E00017E4D8
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 07:44:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA862265609;
	Tue,  8 Apr 2025 07:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="f5qwqH4D"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC19A264FAB
	for <linux-gpio@vger.kernel.org>; Tue,  8 Apr 2025 07:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744098128; cv=none; b=pzva9qxMF3TXy8T+sBD5AqWYie92UlCioH18p0WBE3KJsroiDFOE/hNxrfHlRViCpv2yssiJYHqr8NA2PTVPZHTTlNNxVg/QCMsBSy8+wVFBw01YkIT0XUn3lDZYtBKRnm2G+ot7pkUaoAU9qoXZxH72MXLY4EaoVP0s+dAkoSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744098128; c=relaxed/simple;
	bh=w9HdOzQ+MPAl+VXOwxJ+lRF040+F46AXVGIrMR12QAU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KherjLeP4zimAbP0fO44Paro/n+fL1A0PXwioPGiYee+GXLUCdnfg2538/MEVYYkVCOA5o+1aJX6/Jlb+m4KHBhoFbamdH9EU2BwTJ8HT37ggwAXN4tfTdWOtRONkcjOzWhmGSNDzYnAmbh45ub5gdbZg5suW//IW69/QJEFziE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=f5qwqH4D; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43d0c18e84eso26651365e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 08 Apr 2025 00:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744098125; x=1744702925; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+E4+JrmdhxqWEi/lSbN287+Ko95rcwpd5gn3BuFGQ0o=;
        b=f5qwqH4DtVvSJ0eJvGpun1RuP6ujUqzZcC29/w86RTHbm/j+wAuwM+BSQjIBAWNHR1
         8s3QTu32XqUnZEnHkQwsH9DgcCNLCsFHfoQdOpWd38ldTtEutKgnVJXnsRrNZe9v/J9a
         gI6Flcm5DhCvCHBSVHNBLu7/PT+SU4YsFdPWkdmc3uvlZBPS17w6q7IvCjikNSPxSyEZ
         yoErSEZfHH8dF4E1VV4ER9+2O6nI+f8OaHsq2/iWVHbVbcrjQDu4v1fgC9pC1gMG5TeU
         ca/10YXFzNnRCxFde5GYyuNIMjdreLH2JPnLQsOOpBPtpqnisu+RkjpgNYzV9ZlJt8nX
         OtRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744098125; x=1744702925;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+E4+JrmdhxqWEi/lSbN287+Ko95rcwpd5gn3BuFGQ0o=;
        b=d++5YGOfYeK34h3XZvxcXoJkrN+bVUCqT6yzixMgcuChwOpwkQLEDkW2x3H+nBawOu
         NkgryGacLNJ9eboE4WBJO3QLe4GnkxoXbL+rDS8usWvicEFazd2U+cMFYDMKRaUzg0Kc
         82eqGg7V1WmEMfrKhVDvrcsJzmdTVXJK/v1Z3sfjPejuHCvJJv/TP4aIzYsbRIPWJ/XG
         hF1lBb6pzB7wwxcTTWs7KqtAsslUkHcn+LQVQ7q5AWuueRwuOL5aj9ihT8RvTCRwNTwG
         hELS8E2w+sHwnfjgduEujC7UNgpTVvcJf8NHiLaxRyFsroU+C+MAzxy65uUChF5FTeW7
         oBkg==
X-Forwarded-Encrypted: i=1; AJvYcCWUb8k38PAOBENVx1EHD4EOHD3tTI2ig0FPpwn0xKtIhi2z0hMwSvibdXZU1kLwOkuyUybo1SsNcqqB@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmxgp3m7+lznw7CVX5RQ2Visp3SpPHhQKRjhCWAZSdlRdPWDAF
	2LAs7Rj9W5R9Z+RxBx9OFib2/PakfwyDU3alVOQRab+UO6XP7edrN2nHbA9o/w8=
X-Gm-Gg: ASbGnctVnWpgu546CsQp9GESZdTYPXClamDeMUlbNygx2Lppg11zaqW0beCzo/DZkdh
	FI73QWjN3sjW87n6DsMyamxodbVdolHQdrpyvCCFudbdF5tiWnQYWz9ocxFEycK/5Pc12TN6F9n
	7+KbxIH8jPp3zXNM6plxHnK/HGK4MLolU6wZXxnPPsRIzZRpuFsnrA6yg2n+QSWu/iyYA2SCnIF
	U8eGxa4uDenhqFLUptoS9fC+3I4+pCI5p3bopvwkZKqx7LcZEFRXAK3+Sb7G2d17Z+vAI7wwsue
	7MYuqWVpC7SQ38BheDDfR+RF7EMMfwQwBnaPo5NsDNi+05bH
X-Google-Smtp-Source: AGHT+IEgYUJEVuD47zg99gzM4mhFe0o7lX2Qif0XxVRVrvKWgac3NPWEP6sjqY2Y/veqsO5+qA2ypw==
X-Received: by 2002:a05:600c:698c:b0:43c:eec7:eabb with SMTP id 5b1f17b1804b1-43ed0bc790dmr159298255e9.8.1744098125299;
        Tue, 08 Apr 2025 00:42:05 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3009644dsm13876928f8f.6.2025.04.08.00.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:42:04 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:42:01 +0200
Subject: [PATCH 2/2] serial: sc16is7xx: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpiochip-set-rv-tty-v1-2-fb49444827d4@linaro.org>
References: <20250408-gpiochip-set-rv-tty-v1-0-fb49444827d4@linaro.org>
In-Reply-To: <20250408-gpiochip-set-rv-tty-v1-0-fb49444827d4@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1572;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=hQMZZhr8YRzEKYPpfo+vbJ73LYUTFXlK4aC8NxOLWao=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9NNKZc8Vdaxaa/DH5AXXTlTVJB177D+PAdS5m
 FnTcJm7bh6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TTSgAKCRARpy6gFHHX
 cmvBEAC8a8bQCk7ugVP/EShWabd3phdda13V642kXNozPtEmmQX73ubQFwOanHqNpH5KHS3Sv1C
 HggbLZM8UFI9OX9AExD+mafcuzs1giV+w54uswUMUKFA71fWGMdUQuKP7WHsDj0KeNc8ry3QQb9
 IQNfaUV+V0iyvoJ0xb29Dak/jaU69jWMzqdj/XR7w3yxEL4FcZ2hhHVdVaRC0ls4paJ7OiVFJmY
 cTlCuXkyTdfn6oFR0VVnN7W8qRSD9Elejz7ByjIbmg8xRJFfcnEFAU2BD70d8NeKDsuXoBfy5yF
 uuCT7ABi0QOArFVwtKbXczovOrigULbqhJZC326+G0IYddsp3MdBcCVinZynfvLoBZSqhLqXoRC
 w2Z3s0PW8jlr9661KvtNswG0xm/O4rS75vUihyAn6EehmWb9/SnP9LV5W75TZ5xaXZUjCC11g+M
 qgQXbekLAVUSakRmj7PToxh0f4qsE3pkBk52UzhSrWy5q+zKAC1pW1TVQdqgzQx8tW4FUecG9iF
 igWSd2j5REtSlwHiLp9K8mL8XAgJloIylS+JN3MJNbl4wTvv6l3L2RV6CjmqoWpFV3SgbqQs/K2
 PeFa9CnsSBUqS2Az4ybSQDh0JhBgROU7o3tYcCw78S8evp/79pDgDwU79XZjS5FUDoWpbZIm64E
 mFsC6GdT5wM+33Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/tty/serial/sc16is7xx.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/sc16is7xx.c b/drivers/tty/serial/sc16is7xx.c
index 560f45ed19ae..5ea8aadb6e69 100644
--- a/drivers/tty/serial/sc16is7xx.c
+++ b/drivers/tty/serial/sc16is7xx.c
@@ -1333,13 +1333,16 @@ static int sc16is7xx_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return !!(val & BIT(offset));
 }
 
-static void sc16is7xx_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
+static int sc16is7xx_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			      int val)
 {
 	struct sc16is7xx_port *s = gpiochip_get_data(chip);
 	struct uart_port *port = &s->p[0].port;
 
 	sc16is7xx_port_update(port, SC16IS7XX_IOSTATE_REG, BIT(offset),
 			      val ? BIT(offset) : 0);
+
+	return 0;
 }
 
 static int sc16is7xx_gpio_direction_input(struct gpio_chip *chip,
@@ -1422,7 +1425,7 @@ static int sc16is7xx_setup_gpio_chip(struct sc16is7xx_port *s)
 	s->gpio.direction_input	 = sc16is7xx_gpio_direction_input;
 	s->gpio.get		 = sc16is7xx_gpio_get;
 	s->gpio.direction_output = sc16is7xx_gpio_direction_output;
-	s->gpio.set		 = sc16is7xx_gpio_set;
+	s->gpio.set_rv		 = sc16is7xx_gpio_set;
 	s->gpio.base		 = -1;
 	s->gpio.ngpio		 = s->devtype->nr_gpio;
 	s->gpio.can_sleep	 = 1;

-- 
2.45.2


