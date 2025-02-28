Return-Path: <linux-gpio+bounces-16810-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A680A49976
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 13:37:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D13E93BCC54
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 12:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A431626B2CB;
	Fri, 28 Feb 2025 12:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kvKbxYYg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910D426A1B8;
	Fri, 28 Feb 2025 12:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740746182; cv=none; b=mK/7rmojO9RByjWrf5oyRznVEBkporJmuGw08qRHxvWqwHW/owk2B5l525SDGqJrRJyyn1WottZy1TH0yRGSwq4fkehedXs35SN8ZQeUjy3DQcYIHrwpnWf+q2IuwuGt5d4L8ZQ4I5HI+8Xe5+7XV1D1J42jP6siFZNeb6PAgzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740746182; c=relaxed/simple;
	bh=hgAoXiSsc+i7JQLjoeynzodXDo0HVOSNd05Y1e+nnHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WVoTrjnfjpBUPp6LCG4x4B02CbRKwoAJwP1NWsd4U4fPt0xb/n7BN4BZBbt1ggxbJ/lOdE+MITaBaHTSql7DddFeY1xvSzgB11TSdpfLQLsbAt+oxfDtLJeFxepTstAVdhlx/8z9BXthT4PdqKo8wbYpdaQSj3UF0X10A/VdIec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kvKbxYYg; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30a28bf1baaso20162701fa.3;
        Fri, 28 Feb 2025 04:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740746179; x=1741350979; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sp1xO9Mn5bqjcagii+SKLYOzVF9oGiH93/ipjJeXRUI=;
        b=kvKbxYYgn4k8SljWDgSyMtzqx9jVdam06GB1NJGCQd5pW7k8GLYg7gveUez8svSsen
         hh/yVKcPeASfUY5HFK9nYxmQqk34GFNPim3AaVbg/qlTY3W+qDI8YVqPByDmKq0u/JX8
         fSBrUN3mjAfE0ZVtjlSHfhSo5fksmVphWK1PSRDO0qcbmfwSCxoKc5Iu5aYcdmTGKsot
         JhWiGE5b+jgymViZQYiy4sk0sKClLalLN1p8E16TtCYMzZGQ2N3awHQe3LmAsPv61oyR
         skhfbp5KV1nEX5Fd7RXHXaPjrSLlwimjhSXVesMcz37EyaLsgD+f9YUpqSfJGBox/s/E
         vDew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740746179; x=1741350979;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sp1xO9Mn5bqjcagii+SKLYOzVF9oGiH93/ipjJeXRUI=;
        b=MNHRAyq6Pz7i4wHurnxCwwm4QrZTAIFNq9CsFq2Or+xO/zB5jeO/FiGG5BxXuWVzWr
         MPCjgfqocKuu17h42ju3RrI/RCfZjCgow1cwvmOcDOdFi4PM73viJjTmqKNxPH4xGAgD
         LBF/VAz1LqzZDOGxNGerkixoOARxl3J0QUICRtZwZl3F3qw1e5mSN513kbsFF7wavhI2
         z608speSGmEPBMA2vvH9HEKa5RKBstD/a0UNOar/bAsvlejepiifJyoik3WnebPQBT2N
         EwbqWH7SJH8mxkmregYjP3oOHRvzq9R7nEfdzqTgvt2m/b9OF9UR+dXUOVT4NaekDNsQ
         H78Q==
X-Forwarded-Encrypted: i=1; AJvYcCW4NGM8RPJUut5eGN9zvPldefKB4BUM0tlamu0RKQEbYOW1GaBTD/PuBqcEct6LcNsd+Tw9Y/YS5kIqtOdk@vger.kernel.org, AJvYcCW8I0p8ZeeZDbDTC6OusWKhaw5wIm1XCdesUq8vnKBOVeJ5qD7EiPKu2JMYSqRoo0EWQu9sLzGLgPxL@vger.kernel.org
X-Gm-Message-State: AOJu0YwmewbZR+ZAV8Wz+nEhEh7DoB7OM6IDXhR6oGkY+vbBkzViULmY
	Xlkwss4YbmT8SgG5Fe7/UrIsshHTsS3DaQlYUxqbqd0r8h4bBbGz
X-Gm-Gg: ASbGnct6mx+USBovMvraO6uFMqNtHnmMEfB26L2Uh8kby9hF8U0twbUg1O64NAhyTUq
	JLTiCjBX+i9Q9wYwGvIagshHlz/kTAYJV4MXITYRcbIC9rpDhjc3kv97+uz281sQabagWJRK8o6
	p4Rl0+lDuZlM4cnxU09STz/D4QQjGIZrk5hIjKMQRPS/IKZt+ITEWu/n9pUmNtNuTFzf2d5MlhI
	Iw5Y65ZH/ll86JPRpzBsxT3eEl5sfZtakdy7xIrywDpGINjwLdZiypzwwZZd0JIh6S1/DJT0WV4
	MTnGYitnN0JcbP42kIufYv6AuZUQm3I2
X-Google-Smtp-Source: AGHT+IGBcgWI/bexpJdf4f8HpHcrS1lKA3Kg40w7t5fluuwaYQ2HlFpr9aed0iQibuZhuL7JdKO4SA==
X-Received: by 2002:a2e:be21:0:b0:300:317c:9b75 with SMTP id 38308e7fff4ca-30b93215452mr10899461fa.12.1740746178530;
        Fri, 28 Feb 2025 04:36:18 -0800 (PST)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30b867c8be8sm4981141fa.47.2025.02.28.04.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 04:36:17 -0800 (PST)
Date: Fri, 28 Feb 2025 14:36:13 +0200
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2 4/4] gpio: Hide valid_mask from direct assignments
Message-ID: <fe08d70938b63206421dd39ab71cdedd5dc458a1.1740745270.git.mazziesaccount@gmail.com>
References: <cover.1740745270.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Q3M9IPmBWmVzg7mP"
Content-Disposition: inline
In-Reply-To: <cover.1740745270.git.mazziesaccount@gmail.com>


--Q3M9IPmBWmVzg7mP
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
---
Revision history:
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
index 7e36894bab11..37e1f277b0a8 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -652,7 +652,7 @@ static int gpiochip_apply_reserved_ranges(struct gpio_c=
hip *gc)
 		if (start >=3D gc->ngpio || start + count > gc->ngpio)
 			continue;
=20
-		bitmap_clear(gc->valid_mask, start, count);
+		bitmap_clear(gc->gpiodev->valid_mask, start, count);
 	}
=20
 	kfree(ranges);
@@ -666,8 +666,8 @@ static int gpiochip_init_valid_mask(struct gpio_chip *g=
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
@@ -676,7 +676,7 @@ static int gpiochip_init_valid_mask(struct gpio_chip *g=
c)
=20
 	if (gc->init_valid_mask)
 		return gc->init_valid_mask(gc,
-					   gc->valid_mask,
+					   gc->gpiodev->valid_mask,
 					   gc->ngpio);
=20
 	return 0;
@@ -684,7 +684,7 @@ static int gpiochip_init_valid_mask(struct gpio_chip *g=
c)
=20
 static void gpiochip_free_valid_mask(struct gpio_chip *gc)
 {
-	gpiochip_free_mask(&gc->valid_mask);
+	gpiochip_free_mask(&gc->gpiodev->valid_mask);
 }
=20
 static int gpiochip_add_pin_ranges(struct gpio_chip *gc)
@@ -715,7 +715,7 @@ static int gpiochip_add_pin_ranges(struct gpio_chip *gc)
  */
 const unsigned long *gpiochip_query_valid_mask(const struct gpio_chip *gc)
 {
-	return gc->valid_mask;
+	return gc->gpiodev->valid_mask;
 }
 EXPORT_SYMBOL_GPL(gpiochip_query_valid_mask);
=20
@@ -723,9 +723,9 @@ bool gpiochip_line_is_valid(const struct gpio_chip *gc,
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
index 147156ec502b..b9a4f161db53 100644
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
index 7dfb8341b0e2..0e8621be7272 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -499,14 +499,6 @@ struct gpio_chip {
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


--Q3M9IPmBWmVzg7mP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmfBrbwACgkQeFA3/03a
ocUEHwgAyiqWUdo6ce0xEBrarfJnZoJ60RNYjvSqK2iWH9uW4VCqdSy2mh/vEIlq
eczDYPs6G1H6KE0WxZ3FBWfuGiM7GLQ8Bj4mBAnduMz5G/1IDvoi2606Yxp8BwJR
phmVlpbJhB08zUIgZJDfmXBfoRNzCDY3f3jnokRa9hgL2b1vIxLKI8slcVHHcGN2
g9MQAu9tbVscUehxbN5FBVy8aknxqeNV8Sbr2DMU3SIXggXsrvpLQQn94HPvAn1i
3BHEG0O6SuY/Vbnme8MLUrHrR1ZHIVS2IMMD1Iphdo4TxDvIVlQtQGQ246FnkJvQ
PZFFhxV3XjlnYfrlzycJ/X12H3sA5g==
=l5tR
-----END PGP SIGNATURE-----

--Q3M9IPmBWmVzg7mP--

