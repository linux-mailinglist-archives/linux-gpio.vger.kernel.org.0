Return-Path: <linux-gpio+bounces-17117-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAEDA50044
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 14:20:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B9301899EFF
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 13:15:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF2DB24A051;
	Wed,  5 Mar 2025 13:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PRswpnwq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF4224502D;
	Wed,  5 Mar 2025 13:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741180413; cv=none; b=CA48GTC+aQp4mjzsE7HHBfxa5YmiQq2PGa8Pb9vGzzqnToM6iJeSye6EtxBrPlgss0XQKifh/OfF35rwht6c62BmGwhwW8QSCyGYmw6UnoHluXVLsSCFzL2eRWxH4u867yvwyodE8DszbxSSm6obhrErZjo0ZDA73DIXEwT7+FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741180413; c=relaxed/simple;
	bh=1b56dqW04XIiQlZgdsKTpR0rfGqwLyqlxFWw2yQrr6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WyGPgTRfZkyQDRQgeEsToMvYvEJLQ/6fh2OaVna1ed/NdLFefiGWyYEbgD63Upbde0I0I6mzKNdX1cHzTLxfiPEKNGP8WP2tD/MXM8rASZNznks+UiRQThLGmEML+/Iaxl4zHzvNw5JI8a6YYv55LelZYMaRlWTIGaoQS+s75Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PRswpnwq; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5494bc8a526so6193445e87.0;
        Wed, 05 Mar 2025 05:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741180410; x=1741785210; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6njS7STEyzXZEmTyfJ0XJ141GOP+CIiuu0sZuNSrs2k=;
        b=PRswpnwqF7vybwkQlUA/OfaLL7Wl7b4mJaE8yFmV8WhjWBc1Z8AcWMxQlZr5txoy2l
         bidjPzVOayXE5dpDDhF0/m3X00Pg415oRvqXY6XE8yzycPsbt41qgq1bEKh6vTAcuvAw
         6mtgUUQYKNfC+RTvUaChVgGAjtvgG0uFdnMUufEJqwrEwcAHNQEvFdK7HwUW5Mu6MZqt
         xcJJIm4bQ8+GJBK5Gt4XWwAks2ZNoY1DfS5WaRUV/E5cM3T8eS6iocrtJDRHk1c6cW34
         JR1g+ApjQWR0ivtD2UMmLCxny/wVIg2erFGHaL4BAzI49VG6LK67doDJn+wUnkd+Qt6U
         T+WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741180410; x=1741785210;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6njS7STEyzXZEmTyfJ0XJ141GOP+CIiuu0sZuNSrs2k=;
        b=Zi5wZ9MJE87a0/OKpjjpkeTAxAiKNjEz1HrGxIa4l6R9eEYbfynDQFomyoMrOgFYf6
         49HVfZucTlBJZAr2ZoZCAQ9ZhTG2i7C1c9pkrxrVwXuhwJDQziLZVljRtoZzEaRI3+BK
         ZbGcWa4GST7BIiyib0soU+NqLyOK3kBKfIxx/gtyq8nf+Rvov6hBLAV6zOlAMCqO/BYX
         y4TXzunDuwmHeLvi9JrXPI7cZZmTBdqYcokZYm2STxp8eonG9NMXzG47KyetFjzvBqi9
         s5TTJ4+ZGmU7bmwAcTnpJYO25JDEFUaxoX0y8acYM5UucPtR/m/WX+qiDQ4dw8yOt+GX
         MUjg==
X-Forwarded-Encrypted: i=1; AJvYcCVbsYP0+XVkootyTfn9odiwL+VyK/xUhWnB9fKJ9HyDMdMinFtfo14/LK+L3qw1iztgiFE2r9atCINhMZFk@vger.kernel.org, AJvYcCWt8IjvsYZC0zuLVOjPVYOKAiGpIpDVkXCvUZCmbi1v5u3JfIXKFRQNDCUSpni7ZgLJJkdGppYkyri1@vger.kernel.org
X-Gm-Message-State: AOJu0YzCb/ZcnABWV6UhlWb8g71uwWDV5bit4GXQNTpdc5XphWQLFrw+
	owzTz3dWNCP5nVT1rLELDl2neNTYCaIuWmbNITaMDe/a/r4N3FS6u1J7+A==
X-Gm-Gg: ASbGncvMPEc6VkQ/n4HQ4K2kM3SdaI+Q1R1ei+6gjqo8sq9madLLowlYs/ZrsgWVRRl
	TprJFZ8C6qaAlr/rZ06YDMo6McboMoMEIjSICD9aWnaEDqTOeUaMG0ecl52h8mZVZ6PLB7HqxVn
	WaZTV3WX8PYv91DMAdYINcbHKftMyto9WTfe2P/iKJE90c8h87njOTV3w/rMbVclgL+CWSlJ56s
	Fv2m3LSGmmvB6maGS1JgcelO6PpKpbtEBAd9aI2EEzPsvDT8rP+3JKF5UKBAakcYYroxzPbqww3
	QzQWOz9Fmzp77xUoSTR1+62rL/NbrIDtntyQVXC7uasiVlF854s=
X-Google-Smtp-Source: AGHT+IHzBoz5KK3U4ujh5jgRP4Q+GBBj7IcLN7LFsYoLBE2hTjPSKWI+wQlvQnG9BB2blWe31T4XYg==
X-Received: by 2002:a05:6512:281d:b0:549:5b54:2c66 with SMTP id 2adb3069b0e04-5497d345ea7mr1160393e87.23.1741180409421;
        Wed, 05 Mar 2025 05:13:29 -0800 (PST)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5494d6d2fb6sm1678785e87.137.2025.03.05.05.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 05:13:28 -0800 (PST)
Date: Wed, 5 Mar 2025 15:13:25 +0200
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v3 4/4] gpio: Hide valid_mask from direct assignments
Message-ID: <4547ca90d910d60cab3d56d864d59ddde47a5e93.1741180097.git.mazziesaccount@gmail.com>
References: <cover.1741180097.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UyT2nDIBwLJN+qa7"
Content-Disposition: inline
In-Reply-To: <cover.1741180097.git.mazziesaccount@gmail.com>


--UyT2nDIBwLJN+qa7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The valid_mask member of the struct gpio_chip is unconditionally written
by the GPIO core at driver registration. Current documentation does not
mention this but just says the valid_mask is used if it's not NULL. This
lured me to try populating it directly in the GPIO driver probe instead
of using the init_valid_mask() callback. It took some retries with
different bitmaps and eventually a bit of code-reading to understand why
the valid_mask was not obeyed. I could've avoided this trial and error if
the valid_mask was hidden in the struct gpio_device instead of being a
visible member of the struct gpio_chip.

Help the next developer who decides to directly populate the valid_mask
in struct gpio_chip by hiding the valid_mask in struct gpio_device and
keep it internal to the GPIO core.

Suggested-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
Revision history:
v2 =3D> v3:
 - Rebase to gpio/for-next
v1 =3D> v2:
 - Hide the valid_mask instead of documenting it as internal to GPIO
   core as suggested by Linus W.
https://lore.kernel.org/all/Z71qphikHPGB0Yuv@mva-rohm/
---
 drivers/gpio/gpiolib.c      | 16 ++++++++--------
 drivers/gpio/gpiolib.h      |  3 +++
 include/linux/gpio/driver.h |  8 --------
 3 files changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 4c15a70d4d80..e5eb3f0ee071 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -672,7 +672,7 @@ static int gpiochip_apply_reserved_ranges(struct gpio_c=
hip *gc)
 		if (start >=3D gc->ngpio || start + count > gc->ngpio)
 			continue;
=20
-		bitmap_clear(gc->valid_mask, start, count);
+		bitmap_clear(gc->gpiodev->valid_mask, start, count);
 	}
=20
 	kfree(ranges);
@@ -686,8 +686,8 @@ static int gpiochip_init_valid_mask(struct gpio_chip *g=
c)
 	if (!(gpiochip_count_reserved_ranges(gc) || gc->init_valid_mask))
 		return 0;
=20
-	gc->valid_mask =3D gpiochip_allocate_mask(gc);
-	if (!gc->valid_mask)
+	gc->gpiodev->valid_mask =3D gpiochip_allocate_mask(gc);
+	if (!gc->gpiodev->valid_mask)
 		return -ENOMEM;
=20
 	ret =3D gpiochip_apply_reserved_ranges(gc);
@@ -696,7 +696,7 @@ static int gpiochip_init_valid_mask(struct gpio_chip *g=
c)
=20
 	if (gc->init_valid_mask)
 		return gc->init_valid_mask(gc,
-					   gc->valid_mask,
+					   gc->gpiodev->valid_mask,
 					   gc->ngpio);
=20
 	return 0;
@@ -704,7 +704,7 @@ static int gpiochip_init_valid_mask(struct gpio_chip *g=
c)
=20
 static void gpiochip_free_valid_mask(struct gpio_chip *gc)
 {
-	gpiochip_free_mask(&gc->valid_mask);
+	gpiochip_free_mask(&gc->gpiodev->valid_mask);
 }
=20
 static int gpiochip_add_pin_ranges(struct gpio_chip *gc)
@@ -735,7 +735,7 @@ static int gpiochip_add_pin_ranges(struct gpio_chip *gc)
  */
 const unsigned long *gpiochip_query_valid_mask(const struct gpio_chip *gc)
 {
-	return gc->valid_mask;
+	return gc->gpiodev->valid_mask;
 }
 EXPORT_SYMBOL_GPL(gpiochip_query_valid_mask);
=20
@@ -743,9 +743,9 @@ bool gpiochip_line_is_valid(const struct gpio_chip *gc,
 				unsigned int offset)
 {
 	/* No mask means all valid */
-	if (likely(!gc->valid_mask))
+	if (likely(!gc->gpiodev->valid_mask))
 		return true;
-	return test_bit(offset, gc->valid_mask);
+	return test_bit(offset, gc->gpiodev->valid_mask);
 }
 EXPORT_SYMBOL_GPL(gpiochip_line_is_valid);
=20
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 58af0491e60e..a738e6c647d8 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -32,6 +32,8 @@
  * @chip: pointer to the corresponding gpiochip, holding static
  * data for this device
  * @descs: array of ngpio descriptors.
+ * @valid_mask: If not %NULL, holds bitmask of GPIOs which are valid to be
+ * used from the chip.
  * @desc_srcu: ensures consistent state of GPIO descriptors exposed to use=
rs
  * @ngpio: the number of GPIO lines on this GPIO device, equal to the size
  * of the @descs array.
@@ -65,6 +67,7 @@ struct gpio_device {
 	struct module		*owner;
 	struct gpio_chip __rcu	*chip;
 	struct gpio_desc	*descs;
+	unsigned long		*valid_mask;
 	struct srcu_struct	desc_srcu;
 	unsigned int		base;
 	u16			ngpio;
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index e3b59fda62e0..e6e5304c99ca 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -514,14 +514,6 @@ struct gpio_chip {
 	struct gpio_irq_chip irq;
 #endif /* CONFIG_GPIOLIB_IRQCHIP */
=20
-	/**
-	 * @valid_mask:
-	 *
-	 * If not %NULL, holds bitmask of GPIOs which are valid to be used
-	 * from the chip.
-	 */
-	unsigned long *valid_mask;
-
 #if defined(CONFIG_OF_GPIO)
 	/*
 	 * If CONFIG_OF_GPIO is enabled, then all GPIO controllers described in
--=20
2.48.1


--UyT2nDIBwLJN+qa7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmfITfUACgkQeFA3/03a
ocUsuwf8Dnmqt+DyeMnAwypeJdOxFxsILGXLi0gkUoMUKkQtThfkic6qslXf7iJO
b2kyRNJfpccqCgDLZr66nTZJPJlUwbQXC1KSItlpby0jE5iLPL08WOabbhtnoFcA
t4/WeUW1k6OwI8pzLsu53hfgllD6iEfxzRyn8lfqm6YfXJiw6QVJkgjbdjY807tL
pL2S0VaB0euog2fOU1O5Y7KYpFZ1oCcYec8whZTvSFjeCYd1ZD1ESwserS6w2MKm
VP0qhRMokt9rA3LEiDGo2cWES5QcNTyHavYRUAv8uf+a1ue/7M+UdgRg3fxjCDtI
V2BTUoaHZd+vaqS6HVzW1f5BLLqe1g==
=ZRvV
-----END PGP SIGNATURE-----

--UyT2nDIBwLJN+qa7--

