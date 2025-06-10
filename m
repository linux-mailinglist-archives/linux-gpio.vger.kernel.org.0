Return-Path: <linux-gpio+bounces-21209-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 15861AD3780
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 14:56:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9AD03A3A25
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 12:50:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7426829CB58;
	Tue, 10 Jun 2025 12:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="s6vIF1qS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980D7298244
	for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 12:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749559432; cv=none; b=sCKnwodz7orLdIfxeyuMaLp2xF2UYfWeFSwi+B+AjyFmvJ6mISPeZpmdWq0W4SAVUxHqTjrm8rlIwMab0jy8TmmclLehO1eIF5nz5pt4jPv9VMcixUraysnUKP0ovxPa9VlbYd/jyalersodj8rqC8t6up83kowuko12XtHAINQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749559432; c=relaxed/simple;
	bh=JKlrooLoXVp4otsnMroGFsVNqHxJcoPceosfJ7R7mWc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LoD4gQBFJ4WeS41IkJJrE8QUNKZdVCzpDPkEa+LvG2Y4S+RpTvFiskhwOvIUySh9v0B1EAYuoMmrxXR3Q6WWvuZBElrvRIz5NUPzoaHujJUWudAo6j+YJhRiHE52XkXGL1785fn+W+6bJEIH9P6KnzINH7m5oACztMek9Bpccww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=s6vIF1qS; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a531fcaa05so2130739f8f.3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 05:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749559429; x=1750164229; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eygfCzasIRR3NPibew8zyzczajRJM9GmBBR2GnMe634=;
        b=s6vIF1qSmdibBy02NYK9xYoF1I/iBVs575hynTzS1y3L4qQTrXdaZVGca4K+Xpcl/1
         KKIcqSry7LVZDYVvG7D1At6R4YijAGCCPy2SVH4/ascUBrnTuKJPxjO4Zrx3MY8LROEy
         VjOp7hgKzISpqcoHCqWYUGmAdtmsf3qIoTc3CcUcBLfN+30IM5ppuSw6t2ic8L7vI08c
         F1mAfwq2snw7MIC1R/sr0oGvQ4cUC3E/aOOH2O2LPzCLUhZFYY+YOzmwEit7urrAWvd7
         pwXJ0S1rexhgjAavS1uOZmhRfLlwa+z48QvYksGJ52A5ckiO72lEaIp4vOmTIkV6MJeO
         k80w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749559429; x=1750164229;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eygfCzasIRR3NPibew8zyzczajRJM9GmBBR2GnMe634=;
        b=SQJ7Eg7G7AYmoTAcJo4F8/trgsqfrVk41p17kW+UMhhMe+fqWEgIXJj+X+V6K4Idjn
         dH+HsJG835uHbn5daXPLjv3cMBlksxUvKOfo3S/afKkLUvp7lZEcOhxmUNcZKT4mRnkm
         ZxIPd/PzC06zOzajrjf6iZEkd3S6s2CUu2mXh81HlQOTJTBxeKI6944EFdwPbwECfGCc
         CgBNVRODPv3HnCpPVqF/Qt7zMXEYEMrhjv/dmWgZO4kYGOdwS6c0YKjJg4hZhEznqbeS
         Kt5JTzMeJ+3Kr4x5nWu9tDeuU2w2ADXWcHh8E0UczT9QUPDKZcqG+n0sb+SjvdbL9qhn
         2HDg==
X-Forwarded-Encrypted: i=1; AJvYcCWxOxJqjnukTh1LL7DevZ+Yotpwc8jaxpEHt4CI49oVHjyc/SGStJl1lvGvqtdQ9Qrn7Q8jntpO8qHY@vger.kernel.org
X-Gm-Message-State: AOJu0YwHfiYCQfiO8z+mNdtg2zpWlzN5akiMOlwSQ4rccn57/n9NzIYt
	DSi+yMRErZtOOtlkWFReNQHKIw+XmNrFOE01yJVBitIbONT9pDoMlsPeHgXUkkRb2VU=
X-Gm-Gg: ASbGncsabo0rf/UoglhL6Q5eM7spQQ8g0ounjsYxOITqVcXnmJKJmk0GsIQf3VV/wAZ
	VJqrU8slGg40h5F2qwFBBeHAevjrCmbfVmWiM46izIjKYMo27BIFfw2GW3igW7Vx52UwqNK+rgP
	luGYPfi+VmXvY9v+3Lu5kZQNuDqFtbNWh6FCJiy91H+fTNKVZBVIEfzL1XEZxQR+3ipv4ZRUYHm
	xe8dzEHOzPrz1f6JbtLcszLQ8jTERckq4OvL1BSEG5tVwqmV7JkoleZj1RNMnmIPqVJ9OOErfO0
	z2ShBk/cGZ98JDyyjHdnbVQ9mIO1j7175DmcG/CCi0L8c20p1gNY
X-Google-Smtp-Source: AGHT+IF3fGDy1AyQ9L739/gcqGq+4wcTiOboywwXAXMnnVkPoC4LeaZiAn+ue3UUWkdfxhfU+3242w==
X-Received: by 2002:a05:6000:144d:b0:3a5:2cb5:642f with SMTP id ffacd0b85a97d-3a531cc57c7mr12419240f8f.34.1749559429042;
        Tue, 10 Jun 2025 05:43:49 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244d15asm12553064f8f.66.2025.06.10.05.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:43:48 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:43:46 +0200
Subject: [PATCH 1/2] USB: serial: ftdi_sio: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpiochip-set-rv-usb-serial-v1-1-a9343ca109e8@linaro.org>
References: <20250610-gpiochip-set-rv-usb-serial-v1-0-a9343ca109e8@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-usb-serial-v1-0-a9343ca109e8@linaro.org>
To: Johan Hovold <johan@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2752;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=8QYiaDcuByp6lX/VMJqGh5FavZ76N3lPhAN3orOxS4s=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCiC3hDkV5qrQJQfwWwKg4lyii80XYWx4iVXK
 19Xdy/LEX2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgoggAKCRARpy6gFHHX
 co2PEADN+62cRIEGlkGvbWf3Tw/2QzFAKuOBV+pbh7axCB1TCIwVhh9ZV2XwrVY8c4GpLJBGSdk
 TPxquqhzqSykev2HB9mh8YJPL/JQafKLWYQToyeOHDVhZTWv4KKplyoe9hijQwdqgkyKm2QeJsV
 9nQtUkmgQ1EpXqpeqJYP3N/Ouympuzz4UA+cfwgCGIjqYGBCRw+Si7+OZKkhJOUDlZCxUZqr44a
 l9SX8ZhSpmWmvL/iXVekPKsKq7wSXYv8x9Oe9PF9tMZlnr5Vi6deHkchz82IKkkFvEaSPP+ga1m
 Zxrs0GwrqXLSUyuUsQ5UBRhxjII4jU7F/Jv6Nd3xkLCflkAs/RoGUa5oIfGX8wO3GkLypgEO1lj
 f56pI++/xrbiedx+4vcRgXiY35NvPFZyyPe+ZcPDPiSymZMFTEd3sPDfmU2G6G3z8TpF2A+PR7X
 yav4Qqzr53scJANqaAFM+3t4mrioxdMe6oLB5/1WFGZMuMaUBBTmCTD4QKjzNIK7J012oppKktf
 U4ZyPmfsqq9Nculm/1VJdIkCQP9LdeY+/48YSnIlzg+y+hHjniwJfOFcnBqOWEp8zhIHm9xOEa9
 BYXqbp8P0rOoHYj0Ah72IYynMkMRCabmc/lFookilpOQE0IEBiuqHxu2s37wKJHscAxdOZwL2DA
 RuotubRfmgAk3WQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/usb/serial/ftdi_sio.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index 6ac7a0a5cf074e0629dfdd3b2330bfa05ca31663..d0a190c6dff38f64e393c11d1bc7759e52876d4e 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -1857,10 +1857,11 @@ static int ftdi_gpio_get(struct gpio_chip *gc, unsigned int gpio)
 	return !!(result & BIT(gpio));
 }
 
-static void ftdi_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
+static int ftdi_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
 {
 	struct usb_serial_port *port = gpiochip_get_data(gc);
 	struct ftdi_private *priv = usb_get_serial_port_data(port);
+	int result;
 
 	mutex_lock(&priv->gpio_lock);
 
@@ -1869,9 +1870,11 @@ static void ftdi_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
 	else
 		priv->gpio_value &= ~BIT(gpio);
 
-	ftdi_set_cbus_pins(port);
+	result = ftdi_set_cbus_pins(port);
 
 	mutex_unlock(&priv->gpio_lock);
+
+	return result;
 }
 
 static int ftdi_gpio_get_multiple(struct gpio_chip *gc, unsigned long *mask,
@@ -1889,19 +1892,22 @@ static int ftdi_gpio_get_multiple(struct gpio_chip *gc, unsigned long *mask,
 	return 0;
 }
 
-static void ftdi_gpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
+static int ftdi_gpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
 					unsigned long *bits)
 {
 	struct usb_serial_port *port = gpiochip_get_data(gc);
 	struct ftdi_private *priv = usb_get_serial_port_data(port);
+	int result;
 
 	mutex_lock(&priv->gpio_lock);
 
 	priv->gpio_value &= ~(*mask);
 	priv->gpio_value |= *bits & *mask;
-	ftdi_set_cbus_pins(port);
+	result = ftdi_set_cbus_pins(port);
 
 	mutex_unlock(&priv->gpio_lock);
+
+	return result;
 }
 
 static int ftdi_gpio_direction_get(struct gpio_chip *gc, unsigned int gpio)
@@ -2142,9 +2148,9 @@ static int ftdi_gpio_init(struct usb_serial_port *port)
 	priv->gc.direction_output = ftdi_gpio_direction_output;
 	priv->gc.init_valid_mask = ftdi_gpio_init_valid_mask;
 	priv->gc.get = ftdi_gpio_get;
-	priv->gc.set = ftdi_gpio_set;
+	priv->gc.set_rv = ftdi_gpio_set;
 	priv->gc.get_multiple = ftdi_gpio_get_multiple;
-	priv->gc.set_multiple = ftdi_gpio_set_multiple;
+	priv->gc.set_multiple_rv = ftdi_gpio_set_multiple;
 	priv->gc.owner = THIS_MODULE;
 	priv->gc.parent = &serial->interface->dev;
 	priv->gc.base = -1;

-- 
2.48.1


