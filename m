Return-Path: <linux-gpio+bounces-18433-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4B5A7F62C
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 09:25:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D70963A64BB
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 07:23:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BF4526157D;
	Tue,  8 Apr 2025 07:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="m2FBcXMs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0379261579
	for <linux-gpio@vger.kernel.org>; Tue,  8 Apr 2025 07:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744096991; cv=none; b=nrlFrgtqpz2mZmmvxD7ygplzzJo0CyfWCLoGBuLKNtLIhebyc2UnUFIk34XNKu46uviBV/IHj2EWJ2NTkGycfJ2f9V2rx2kYLiuqNxrEn3S7SojvstgoxZ8tnEHduLGCApguI6Vg1698VZqtelWHgdS+enstO7TFDBFMNd1SJ3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744096991; c=relaxed/simple;
	bh=oFDJBxlaVibC5gJZK7MUiCXZSDcBAlZc/J2265/ifHQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KH6TuJYlUZ160tQUtdGU5LS/FOHsHlmCsC+k66PbspihJ+poDFGhSXu0Z5vyg+VfwJMMmvu6yf/jFOB8v6FLND5JHzhiwVpX4UjVPjIhu6Wta/BkCICzKjHaoPb+mbV7EPW4Q8ZLNpwMuyt6YOFCiGvth8yncDr+TD9lVISzPOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=m2FBcXMs; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30db3f3c907so47595081fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 08 Apr 2025 00:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744096988; x=1744701788; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6bblWb/A3f8Vp31ZlZJvX8Y6uILdxWWSmqIBQEBD8XE=;
        b=m2FBcXMsTgUZt+ROH1fx4qrDAgOngmqIeHm0pSUnykfrXp0lep/rfcqx9XPkT/bT/6
         +vtGVpdM3bwEPRpHTVrp6Ae9vyP49/w2B1Nci9dXeinMv9fbiYWLD7pEEdSEd2JwBYfB
         h+RlqzWDwOshKbd0FFZo2kIosUhrbTtP5Qktmtq1ZMfxAOxZt/vmF76Id4RtizuxGaXy
         bDapLImQP1Ziz7ciGR7d4NExJJrIl3iT+X0FL+kdLPg88lue5qcwy0ZjqfH9Jyz09V45
         8NDJ4iXKM+a+loYLp5KV9uBevjlzx5A5YTsSiZkgxX9WgnykGmKNMkaT8tbWk050JGVB
         Jo1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744096988; x=1744701788;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6bblWb/A3f8Vp31ZlZJvX8Y6uILdxWWSmqIBQEBD8XE=;
        b=QwNhCp0LUJqz0HR0lIwLjnboxiJcMyywkXOjxyRhjcBwCMRKYSzJ0sL8dd+0kW4FmT
         vj939QIzY14KldmYBO3BiWTY+5hlp+XGeT2HODXmOH8hrLGZmrUWS/VX6L3mJn+EtS80
         Q+qzmnr4hqhA8CNyyG95aTl8Y/DmKyndXPUaLXu/iMJTy3l1+HDcXThB1B4C/8hO5H5F
         7hGUhc+VxWGRgQuqDqlQp8yjKlSKWeOukMzT1jq84uzm4ldlL4qgnd9N3C8Q/xJfwAKL
         2ZDlQiFp0KTwQjYbM453UFyd2U/eYYT2eJhRk4ixExu8h75pkR01FahNPgYAv1fxBH0/
         i3tA==
X-Forwarded-Encrypted: i=1; AJvYcCWpOf+QjZebvt0s9sx1T1Z216fosivGYDv/MK+OQCMO5FQRhBUzNnVNrmeghO4MVvxQxqL3kwgZERqS@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1hNrETaP1DDL9oduSYF78NEqJsV0IYnY3zU2k4OK1vsSmX4RX
	/Q7UKpmFgeFERJXDLLijhU+uhvquBZSxZWVEygLUI8zK4JiPB9yl8OK4dYF9o7VQD64dkmEnK9c
	PCrw=
X-Gm-Gg: ASbGncup8ufp+jUUjDeC++oPre+yB09hmL5z7ZJpn8OteiUROSZB26KoLmv82PasQ9h
	QwEXvKYmft9rfE6iRWFxC4sCU6jRnDtCPwC0ueyOMh6ToomAsLBlggHUncwiLBkACikTq6tka9C
	fc0S5/Lh+mLbYSjF0hyHojZedVqku7W6ZXPzTMWFsO9P4ojg5lzQkFT+oItSuaxMJe+PEYVuLXA
	jgjJlc1kLZOksh0LU0gYt95s1bYu8gifoaueywzh9WGZaSLJ5aq6tdx2ejSV5QVw8esaGRyjAWV
	aTjTuZILj796yj+dmqe1rGAGtG0621od//SfZA==
X-Google-Smtp-Source: AGHT+IHqIWuX5sWz9MJQWDS2IT6lTfF85m614lClDoVvdHMGky/Ix50ZxwKNqFgfUZCLhjcPg/Mzog==
X-Received: by 2002:a05:6000:4313:b0:39c:2669:d786 with SMTP id ffacd0b85a97d-39cb359830amr12025582f8f.19.1744096669312;
        Tue, 08 Apr 2025 00:17:49 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d5d1sm14257694f8f.77.2025.04.08.00.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:17:48 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:17:38 +0200
Subject: [PATCH 01/10] pinctrl: at91-pio4: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpiochip-set-rv-pinctrl-part1-v1-1-c9d521d7c8c7@linaro.org>
References: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
In-Reply-To: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
To: Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Patrick Rudolph <patrick.rudolph@9elements.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2256;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=6oXQdDn+JiYI7kPrR9MR4Ulr8BlxDaIdgOQst72f6aI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9M2ZS1CVSr+OpPpLt+g73dsnxK7Cn+5jOBkEm
 S4RhLYFpI2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TNmQAKCRARpy6gFHHX
 ckshEADgmKAecLNRDwbY5cLUNohPOOEtx7wPD6IeqZgsOFSImxcR1AYiTklwNvcEyx4WnHhAmzb
 oG3lzRmS0xFVCzQi9mX4uHbuIJXP1MxN2ddsgnB6lg1CEj1b4qv6DNNxxtBQ0ipnDwRNuawQcwH
 aeYqABy61n2vfrZJBJVOSi9TQAkdSEJwgvanfueiX/vJnvVKET+cxjJqHSgRCxlPdre/sm0kKMI
 CCPKVMovBcpT7OOGP0j4+p0kCB6NCqevlaTewuoV/h4tWjYpF6SH9gESREPjsk7R213eO+DWr4n
 UFTfB1ByxQw7vd5agHmcng2yl1ZV7SUNOsT5kf6nSoI4cvkeO4ons+t63tePlkRUDoQumIQzhga
 N/mIkjV7W2xjVvZrcZEGS63D38/fzY4sA7sVuWaWgZwWrCrfhPajPxotxjxOsvTWXSWJkfh6ixI
 f2yLdNBgi9wSYNat2UoYPTLeRh3lzFjphWxPajFb+ZQczTx/bXcjtpDXNQewa78BXhZ30rEIrF/
 M3gIErsXpEjyv3RmSJV7CGPdxfLwaxjHq9SZNfNqeeYValUtoqirxITK0jSaQrmdUBMmUx/IqJs
 XwWZMdG3msE++lZ6NvgjhT2WFVsie3VhFAI2l/WdsxXhiwXItFE0r0m2V8VtqyUKn2/YCh5ew2+
 nnZya7p1LkYH6fg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-at91-pio4.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-at91-pio4.c b/drivers/pinctrl/pinctrl-at91-pio4.c
index 8b01d312305a..5db839fa9b3f 100644
--- a/drivers/pinctrl/pinctrl-at91-pio4.c
+++ b/drivers/pinctrl/pinctrl-at91-pio4.c
@@ -390,7 +390,7 @@ static int atmel_gpio_direction_output(struct gpio_chip *chip,
 	return 0;
 }
 
-static void atmel_gpio_set(struct gpio_chip *chip, unsigned int offset, int val)
+static int atmel_gpio_set(struct gpio_chip *chip, unsigned int offset, int val)
 {
 	struct atmel_pioctrl *atmel_pioctrl = gpiochip_get_data(chip);
 	struct atmel_pin *pin = atmel_pioctrl->pins[offset];
@@ -398,10 +398,12 @@ static void atmel_gpio_set(struct gpio_chip *chip, unsigned int offset, int val)
 	atmel_gpio_write(atmel_pioctrl, pin->bank,
 			 val ? ATMEL_PIO_SODR : ATMEL_PIO_CODR,
 			 BIT(pin->line));
+
+	return 0;
 }
 
-static void atmel_gpio_set_multiple(struct gpio_chip *chip, unsigned long *mask,
-				    unsigned long *bits)
+static int atmel_gpio_set_multiple(struct gpio_chip *chip, unsigned long *mask,
+				   unsigned long *bits)
 {
 	struct atmel_pioctrl *atmel_pioctrl = gpiochip_get_data(chip);
 	unsigned int bank;
@@ -431,6 +433,8 @@ static void atmel_gpio_set_multiple(struct gpio_chip *chip, unsigned long *mask,
 		bits[word] >>= ATMEL_PIO_NPINS_PER_BANK;
 #endif
 	}
+
+	return 0;
 }
 
 static struct gpio_chip atmel_gpio_chip = {
@@ -438,8 +442,8 @@ static struct gpio_chip atmel_gpio_chip = {
 	.get                    = atmel_gpio_get,
 	.get_multiple           = atmel_gpio_get_multiple,
 	.direction_output       = atmel_gpio_direction_output,
-	.set                    = atmel_gpio_set,
-	.set_multiple           = atmel_gpio_set_multiple,
+	.set_rv                 = atmel_gpio_set,
+	.set_multiple_rv        = atmel_gpio_set_multiple,
 	.to_irq                 = atmel_gpio_to_irq,
 	.base                   = 0,
 };

-- 
2.45.2


