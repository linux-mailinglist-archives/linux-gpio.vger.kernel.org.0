Return-Path: <linux-gpio+bounces-21210-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40435AD3763
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 14:54:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B8E0189F622
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 12:51:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEFE5298264;
	Tue, 10 Jun 2025 12:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="oXBj8nsG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A699E29CB49
	for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 12:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749559433; cv=none; b=oCDW6bR1DzkqBmwx73BZKrxPOiP8kxq9ECmZTGY4B/ILWlc9dHTb9uL+0NwJc2rABDEmce+oAho3niB1ZHSMjpk0LVgHM0nmPtzRgykc0xKt9olD6rjJUbZZVuwEpnhAp7jBmfTUgccXxfqwCXvxoujWIVtBdvpG0Oq6IJfUR1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749559433; c=relaxed/simple;
	bh=r4RwG6BMFebJJQQm/nElPujWnwGjcoRuHG9eSq+72y8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OOilj2sLc6iZdqy4zYiLfzTIkypuEXHdUTwJxNY6TIIZYC/7uJB+Er01GOr6xy4qZ5Vhf+F+9lz+PgdOV5htHnNlRwT54cHwSBLtVu8T0xEcyct//TK52rgj12SMMKL6RuHlKS5Za/SHOmeZqvKlnugDXaJOsyA+VUaDvU9HveU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=oXBj8nsG; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-450cfb79177so26348285e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 05:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749559430; x=1750164230; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xLUtgRRBMOnouMm1iY8Dj6SXphTk6G+W8VyW6WqMYqM=;
        b=oXBj8nsGHrJOjs996Eae0tfnTkud4DekyDKTeDTcjFrJonKbo1soH3fQhbonwvz7jR
         EPjGFvz5YIO/G9xqW07NAUwEcQn15smXaKIizSqX9xAUQJx13ckrccXykFnkMM/90Ndm
         tAlEdE8KLQ6sJWa9W6uLojiz8cf1F5BbQaFidHiIqCNtAyfUN1fkv8FVv3kBWrkBVoyx
         FZdn+beOSmMvKinr66u8f9DwHOm+C7caKFLXv4nqI/fpj3YHMpyBu77DKPJbdWZkuCYm
         Dua+3F2NsWWJGQo++qqf44mxgZorXiw8RfS1X8fbIF9QRMXtt6SSP0/qOpnSAmAuz4gt
         kdHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749559430; x=1750164230;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xLUtgRRBMOnouMm1iY8Dj6SXphTk6G+W8VyW6WqMYqM=;
        b=H9kugrd+qsWJBvX7XKcREaYmdOTLY3L9ZF34aqiXwruoWOAOcgR8HVBSYWvBvGN0QW
         a98dnjLearmRVI+bJpFrGyHphlaWp+txs7pyH18ttbV120sl9eKG6V4WIvjLYTQ0LZPd
         2Oa+bW4p6Z7hgQwgS4TVO4D6ehxRiDEPTUWTReS0kW6+/y3hz8UhSD/sY6xiXj4Ip4En
         0zyf6gLhwRYEWTwvdocY6Iu++tpf14gA34PAOJ5pHagKUa93zS5a8BsrNJlOLckiTSXT
         1H8KoIM98bWIMP03ULvQovrAtVWc3hjGMN5aRcQ11d6GsB+sR73aCRLNIzSjYXpUTObZ
         vRaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYOa9mMwNo/c9dgV5GxSxj6R+stXwr48A3L3Q+ogxGIC51gvGDAFgFlYu0dA0BmpyvRnyc+kibuYzl@vger.kernel.org
X-Gm-Message-State: AOJu0YwgP3c/kXKqgbqnWo9Wt1oscPq34IzTDtI73YhNazBrpdMv2Oow
	wlcm0JwKDnRy7+CmdkXbQvnxCJQsCyp9mwksn7TA5/3i8FKWU4H+F9rgVgzGbtMTOiE=
X-Gm-Gg: ASbGncutXIca3MjA/IUJ6NyaFMQRhiOJbS1sZUMt0Orj2DPs4iMROeM1spTlPSHfHaD
	oEqd9biwa9c52wTe1NkLRrUlMPIVztWHnwVJurcWoYbPjluy9VuxaTVzCwaKkBHWmtrYhxytykf
	4aVzCRCdtl7RteZKb0gQzpUZppIpFMkbLwmggxJpNIA1STBLdAQ2B5O5XbJDGm/2e7hzHVXAnuK
	U1bgEShIwlReuVy48YANSxWrJd6AravHZ7SWO7fwuq16MyQ4wEPlV4c1al5a1T2tFF0hQjIaHSq
	i4M4MFt4Dy6ekAv0SYcRr05UVsR3bsyi6fFJjP/mJlTZzs1s/jtl
X-Google-Smtp-Source: AGHT+IG6O9b+F56lqI08lLY8XKEyZhqIaaup/c2qpYzgGQWIUV/qCJJUCoP124GbHllskWBK+K9W3A==
X-Received: by 2002:a05:600c:8212:b0:450:cd50:3c66 with SMTP id 5b1f17b1804b1-452014b39dfmr152226005e9.29.1749559430015;
        Tue, 10 Jun 2025 05:43:50 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244d15asm12553064f8f.66.2025.06.10.05.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:43:49 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:43:47 +0200
Subject: [PATCH 2/2] USB: serial: cp210x: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpiochip-set-rv-usb-serial-v1-2-a9343ca109e8@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2564;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=dVT8Nc93hQ3BpEvg5PDCdq8/g1ooqDkHB5uyuCp0NBk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCiDSjilmUorKMsKsYngZATf+DMV+Uyi+3fd7
 8IO1GoG4WeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgogwAKCRARpy6gFHHX
 cqlbD/9XZ/lN8YDBGrUO3cZkulCFBny0CWaBk6oUi50KNpWUX9XPaoAyybYPiy+cgI9Fe6P8Wy9
 EzvGa/8+tszfiuIV/zafCbWYKqcnWeEK2xyalS+12UMxzdN8bkTtybCtHuruzzcfuRmZt3robLy
 Qv4hsuBvB9Brqz/w3MmEZ4Ii5CkhEMsMviXUElRdXQCahQeJUV6vXGUQsVdAh+bYniQeBy1xHAl
 7d5vAYw1qf4H+yKf9479mc536CPThRqcvgE9S88DWt4n2TVUPwv+td8jYZL7+uHdDbNSCCpz0Oq
 3oMiOImZ19oh0xKvvYwwsWhkM+2+EGyUdXGDCUle4i3Eewgj+1uPshbqazt1kB8ZdrTgt2t+LhS
 3s6lNFclS3sJrckqBX6t24Po4s8lA/BwB79K6x4vWZIqqH5UL/BAVuXWl21WGAB+hjBKrNsmKLq
 ck0lIEC3DfQk4hOELytH8OSRnMHYT9Dg739GSKUlBhrIgxaxaZsbs7l9K62+aF7I7VUBvpgFsYC
 H/VlKeUMbXSbeqMF8YQp8xu62OmNjERDGwqkDhPVSr4ay63P2VCujrtzSQ1ubaNIkGeG4Oy0DFv
 5VUMAzugCwexIdh9+9wwOEIMFV5QgRNx5SldrRnNCerXJhDhDCq2Ymq+XO6+1SMReWWNjqQ0fEa
 EUUn0vWMPBh2cTw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/usb/serial/cp210x.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/serial/cp210x.c b/drivers/usb/serial/cp210x.c
index 9960ac2b10b719192dfbab0a6e81b2cf80f40d36..caeb2873a60451fb7a9a5b5d25071547b5401d52 100644
--- a/drivers/usb/serial/cp210x.c
+++ b/drivers/usb/serial/cp210x.c
@@ -1504,7 +1504,7 @@ static int cp210x_gpio_get(struct gpio_chip *gc, unsigned int gpio)
 	return !!(mask & BIT(gpio));
 }
 
-static void cp210x_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
+static int cp210x_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
 {
 	struct usb_serial *serial = gpiochip_get_data(gc);
 	struct cp210x_serial_private *priv = usb_get_serial_data(serial);
@@ -1522,8 +1522,8 @@ static void cp210x_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
 	mask = BIT(gpio);
 
 	result = usb_autopm_get_interface(serial->interface);
-	if (result)
-		goto out;
+	if (result < 0)
+		return result;
 
 	switch (priv->partnum) {
 	case CP210X_PARTNUM_CP2105:
@@ -1555,11 +1555,8 @@ static void cp210x_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
 	}
 
 	usb_autopm_put_interface(serial->interface);
-out:
-	if (result < 0) {
-		dev_err(&serial->interface->dev, "failed to set GPIO value: %d\n",
-				result);
-	}
+
+	return result < 0 ? result : 0;
 }
 
 static int cp210x_gpio_direction_get(struct gpio_chip *gc, unsigned int gpio)
@@ -1599,9 +1596,8 @@ static int cp210x_gpio_direction_output(struct gpio_chip *gc, unsigned int gpio,
 	struct cp210x_serial_private *priv = usb_get_serial_data(serial);
 
 	priv->gpio_input &= ~BIT(gpio);
-	cp210x_gpio_set(gc, gpio, value);
 
-	return 0;
+	return cp210x_gpio_set(gc, gpio, value);
 }
 
 static int cp210x_gpio_set_config(struct gpio_chip *gc, unsigned int gpio,
@@ -1960,7 +1956,7 @@ static int cp210x_gpio_init(struct usb_serial *serial)
 	priv->gc.direction_input = cp210x_gpio_direction_input;
 	priv->gc.direction_output = cp210x_gpio_direction_output;
 	priv->gc.get = cp210x_gpio_get;
-	priv->gc.set = cp210x_gpio_set;
+	priv->gc.set_rv = cp210x_gpio_set;
 	priv->gc.set_config = cp210x_gpio_set_config;
 	priv->gc.init_valid_mask = cp210x_gpio_init_valid_mask;
 	priv->gc.owner = THIS_MODULE;

-- 
2.48.1


