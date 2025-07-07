Return-Path: <linux-gpio+bounces-22850-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87458AFADA3
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 09:51:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6552D7A4DF7
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 07:50:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6421828C2C4;
	Mon,  7 Jul 2025 07:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="r5KW2CEM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9432128B7E9
	for <linux-gpio@vger.kernel.org>; Mon,  7 Jul 2025 07:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751874631; cv=none; b=Eamyfzi3vCTEOv9/HcwayORpUUJSZDP/USNoAdnZ6yCrCUoZJZb5c1SFJIF3Q+3k1XOIcdgpKffKRtRGHZE763k1liSUfM5qnTZLIi6LBDAQ+CThGDXe9bVDlqeC1VEP7PCdBwn5H3f0ChY5eVwXea4cJZRGZLxHqOsWBCR3PHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751874631; c=relaxed/simple;
	bh=ns4HPQvyVEmwd6DgqwghvAqtJacXIUmRanS8Kt/6WXc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oD0+4vdKkT23e72wX4UEiXJvUiUvowyA9o5/MzC3cxGIRIGNyK+tL+ex81R1DS/g98hBhdw+NFC8NinJXcg3cithiTfymr4UXZF9hiCKlT72UOXFTobNYeKWpYRTsVXxnr4PTo/Oz278aQFG80tp+RhTfFqbPHgGd6j4zViScbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=r5KW2CEM; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a57ae5cb17so1687493f8f.0
        for <linux-gpio@vger.kernel.org>; Mon, 07 Jul 2025 00:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751874628; x=1752479428; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tEtmO9fJ+uBB8S0davk+ZIXu0Xo38Vmwmt1Jp6drvMw=;
        b=r5KW2CEMfxIEzB6tlqjxNxON9QH+IRfEl+EEYURHfZQfQCVcI9PskUWze5UklXBAC+
         v8CWMtzpd6yNZXZzIQ8M+trVT06dMmLueac0ty/rjZ7PH1ONZn9/0MzIbcK1j4amACLv
         QMyGN3eP0zxCPrQ4o9bHQAw5x2pb19Vc0AiIKsIASIAJVfuiOfmU20JkrP25TGU0DWgN
         K2RgavESLWZT+S/miF43agNupibaiXgqv5bGwNkj9uQbMVCT/lUgdIkgXxu4bT6f0Cja
         qYy/qPLvFcaWgKLD4vmwnI248ySfGy2qyMtxFrxVvVQjABEhpXdUB13aX65HNOMOPm6+
         Bp0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751874628; x=1752479428;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tEtmO9fJ+uBB8S0davk+ZIXu0Xo38Vmwmt1Jp6drvMw=;
        b=gRaRQoy+kJi1NYP8nqw4WKT0HhOFki+HRVXJbJWS1mT3qSLFSIxgYBEbSe21/05VFE
         GAfG22U96eqwsZi/NkBk5epb8WC5JR1tm4uWGGIrHXrm6Ygs9aeYlY0u0IdPt7FYiD9H
         cITpy3q7XvtQzqBQsYKazUmJeXB3qJ+b6A+DeAIOAg9RNzQ52km53B4dA3UWjwHxHE+z
         COANUYS/xjwBgfaBtkxiFBkbnu3WPZfGL13Id9DyFNctOAmiJ47VwWmNuu75BrJM4o4b
         bQlJ53kXS/6etPJyM0fxMKSavMdpXmSsdNrLKC73y1fwo5XGlZorTVGqZ2ji3TyYnuOn
         MsNw==
X-Gm-Message-State: AOJu0YwEl7W3LxaBG+zoSx/s0ELP5+vV8dryxNLO5vsjhFzKwcAs3rTi
	IJSAdc3XyUYOhFWIsnQVmqGUSI85hyH1A2MVj5O9+odAprgaVYMZtnKMHMFLcy8LaHHjJ3Q3jyS
	p1c1nPUU=
X-Gm-Gg: ASbGncsWMRhKDiKiMLi3JG5irFYM5iOUbx9/GL+BNC03ACNoeCvSmjSoki5aojtFwGQ
	yQWdH5QcJU76ZHpIu5DES0gF5cCcLqNuzqkXKCD18yimVq/SV5dv7+l0wLuAjLRV7e5v/U8+N5z
	enxjS+/CEYY6IdY7DvoEa1+Q2+flxslxkUnMCKhVWbTKkpq6mr4N+4NrT2VmoCTo7i9cTZbB1Yb
	9z4tV+auek+TByhOX2kcXQeS34QSEJtP6wZkuDdSZOE1HhgkC11TEOugXeGQG5bVwFub8wOBIOG
	jHWKLe0nSuCyvE1R0/bXMHL/IWPsE2HJ4YB4yI0vsEIdgCMqxeVFraSR
X-Google-Smtp-Source: AGHT+IGlE+pJSFOw6vH9Aqv3avNwNGn5mFUP5UKn0Q9HP54n73BXvlRB3Kq5i+TgrQRQO3lRBaB9xw==
X-Received: by 2002:a5d:5f55:0:b0:3a4:f52d:8b05 with SMTP id ffacd0b85a97d-3b4964df03fmr10640130f8f.35.1751874628016;
        Mon, 07 Jul 2025 00:50:28 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3cf3:a61f:85ed:69db])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b1893479sm104215455e9.39.2025.07.07.00.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:50:27 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Jul 2025 09:50:18 +0200
Subject: [PATCH 05/12] gpio: tqmx86: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-gpiochip-set-rv-gpio-round4-v1-5-35668aaaf6d2@linaro.org>
References: <20250707-gpiochip-set-rv-gpio-round4-v1-0-35668aaaf6d2@linaro.org>
In-Reply-To: <20250707-gpiochip-set-rv-gpio-round4-v1-0-35668aaaf6d2@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Viresh Kumar <vireshk@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux@ew.tq-group.com, linux-arm-kernel@lists.infradead.org, 
 virtualization@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1554;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=NgRXFxECTIGOfluzrXyJwaqY8NOQtfYF0rMAtRS6Rhg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoa3w6ErAw3SowptdZuCyqLCjwppWgEQANfdpre
 IzHnSXPb+6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGt8OgAKCRARpy6gFHHX
 chTnD/42+6CRgyNGdp2thzTybYnTiJryeQNSK/Lx2NfE2jcS4iboKz75sI8BXNYY1dR2bcGRQay
 CPk1u4V3Ya6I8jTXAZUe8S2T6ELuz1oNMQ4yvREaony2TzhBuBG8ffMuDZF0z7Bu/og3xtySKkx
 oIz3vRU/p6GtI49O5J9DpHQE8SBUg9Wd2K7rmcUklTTcmnOuIA0WY4Rj4reZHNLUeQ2nqBtIsL4
 6C24ncTwFj/e2YNxci+6lYlsrG87UZOJemMomVa28JW/JR9pxgVgLCwxQYJgggEIHsFvDPl1dDn
 V4VczZaTaTRb/CqRNawgRzseqnuZg9sNOhpWEpZtqseGjjXqVDzJt5mf0IZMPIQjGp1FpzTfDm/
 xoWSQ9rffO5MdrZBkRQ/XrfL8M2e2TfMcDDrijL4XEi3Ia8xHwhF0YKj7QP9YOoD058yxCg57Uh
 on8oGG1tn6KJgGp5RWKiW+Kml3l/NFyiNbl+yxLKMo8u9usCBkVOo94NoeTeLpphdQInkVbAO2b
 xJ5tj+q8rStmfUmkNaL553TMOEdsYEp+4HnnXLmbznSZMuVg1VuJYRXEhGHBfN9iiPdbHPdnT2T
 MJO5yz11R8Ck8meOOQSEKqfECz0WdrCyazIpGS0a2CScrg/HGmvsjElOlBmKwWqJBTuz7lGtNz+
 AzbrtTSPCMbmASw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-tqmx86.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-tqmx86.c b/drivers/gpio/gpio-tqmx86.c
index 18f523a15b3c03e083b363a026e751f7367fb080..056799ecce6a256f3438d9fd81ee4677cdd20125 100644
--- a/drivers/gpio/gpio-tqmx86.c
+++ b/drivers/gpio/gpio-tqmx86.c
@@ -93,14 +93,16 @@ static void _tqmx86_gpio_set(struct tqmx86_gpio_data *gpio, unsigned int offset,
 	tqmx86_gpio_write(gpio, bitmap_get_value8(gpio->output, 0), TQMX86_GPIOD);
 }
 
-static void tqmx86_gpio_set(struct gpio_chip *chip, unsigned int offset,
-			    int value)
+static int tqmx86_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
 {
 	struct tqmx86_gpio_data *gpio = gpiochip_get_data(chip);
 
 	guard(raw_spinlock_irqsave)(&gpio->spinlock);
 
 	_tqmx86_gpio_set(gpio, offset, value);
+
+	return 0;
 }
 
 static int tqmx86_gpio_direction_input(struct gpio_chip *chip,
@@ -368,7 +370,7 @@ static int tqmx86_gpio_probe(struct platform_device *pdev)
 	chip->direction_output = tqmx86_gpio_direction_output;
 	chip->get_direction = tqmx86_gpio_get_direction;
 	chip->get = tqmx86_gpio_get;
-	chip->set = tqmx86_gpio_set;
+	chip->set_rv = tqmx86_gpio_set;
 	chip->ngpio = TQMX86_NGPIO;
 	chip->parent = pdev->dev.parent;
 

-- 
2.48.1


