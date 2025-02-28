Return-Path: <linux-gpio+bounces-16808-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 175B1A4996C
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 13:36:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A4FC1729B9
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 12:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12B0126B2C0;
	Fri, 28 Feb 2025 12:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VY37AO1Q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123EC25E471;
	Fri, 28 Feb 2025 12:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740746158; cv=none; b=TGkbHO545G99GvLFRI5fLhguOE9g5gA4mquni/qKqgcwrmi75ctOfwfX5F/zqZ6mQW2vwor1sqeXb9o1CcZHOefvCbtda9vVeX/JLDOy4E1DOvCCu6fhbombG0U36z5Q41w/GuiL5fS4tj5IT1O8a/H/iLQLkga/jETzFkna3W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740746158; c=relaxed/simple;
	bh=895BS+4b6ZONcSoX3CU1uCXlX4Dl0BbuLESUXofkzzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=scYjcZ9G8Q5GfgQTmzAnXtwTEEubx4JM9J4rzmoUTcevHpG8l1al/lQPhHI8h6EW8gyhtOeVcM4NyEG5hcT4BAzI+mLKQcXUtooExLqSJXwDx/qi1a0mTEwXpwS/VkYO02RRBmAQsWKTOEUzZ8bdeGESVqUv78rZUNHmNdq8ddM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VY37AO1Q; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-547bcef2f96so2144775e87.1;
        Fri, 28 Feb 2025 04:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740746155; x=1741350955; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RqMmtPFDDrQVgCpwXp60P+80B3nL7OF4m1P19IZvz+8=;
        b=VY37AO1Q6CJaNITc4oNTkOq7WtNter9erxYI+deZdR/VNzsoTqQAEmYV0/zKatsa/n
         5sAhogw6hnizbU64pGix8lwvw3xDMD8A9ap4Kn79hyiHt2beqKTPHKOPJ18nlX3rQHWB
         WMwAydXmAwR95bYAEDorLvZdy2HOIgB/r6X33+HGYVmfvKc0PMjYyLZmTRcVeclVBNr9
         i7iYG6YnlPcucIardYQGGtPTuWG3UQUcuWsb1yKE4gGjJuiBu+YiNJvvS6L9E30rD9hc
         /jNHS4o5yLUX5jW8Bc1ngr+v+IBTSI3ELKuVB9ZUxvPNjhNyNKGsBrd1w+2KwlKbxea9
         G6sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740746155; x=1741350955;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RqMmtPFDDrQVgCpwXp60P+80B3nL7OF4m1P19IZvz+8=;
        b=eITdT7hRvoMnXlF/LswcxfggyqCj2XyOKPGNCi0+3tbjKXkakVr8Mo2Fz+YjJuPz2w
         tDex2441WU4ZMicbOqmoHuHQLqOe2kXGVK8hDz7DltaX+8hwrC6+skT7haVLwRd2lfns
         EnFAb2E+697pjaAiF8ICWqvIDPmUTYNmgqAZXs6kJWluBMCq+Xc7yAzfrc6UmXaL3s/3
         zs1+7GCkawuuCdDpRFgKClJzb0ecpNPqro7TIJsdX6n6yOiUG03oMCM0NDKwQ1uMZvkP
         SgwrV1+YNB0B3xA/o7R6BveYQwLOavCrQmIiOTuHdu7Z2XICxKbwFD8aNqQoLkUwAGSJ
         PEeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWa+LboJTzHdEVi6F0ITJilVKznWE7HbF7ZuSTd9wKgNGNjQ1DieSsImfySnTyb++FD1RIHiqZGdnc0@vger.kernel.org, AJvYcCXGEs13gcaMRUSS9zq5CnMA1cii817LhxYPyLQW9R2tyQF7dGfmdMmzGgrotglAKSPf5Cjl8z0oRfVWPkid@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk5asNveST2QP+d/HvslpbaFZteUHwrRqxRStUOW/cCY1LcCU7
	UpkqhcR/AVDsdLm8Za8VtU5EujPwNpQo/pRG/dSe4cDXEkHnHFc3
X-Gm-Gg: ASbGnctYGoBCJqrrhPVboI5xb9Bcm0dbP3Y6FKNwQWO+mY72tklix6du8xWcCDDD4a3
	aufVH6RkP0zmuIwR908wCmNT99BOsppu6+tDaiAI42G0/AnhOt+A6WLd1UKd752x+roB2894BYe
	vdWCo7RMmPPjhqmHmB/l8mcsR+4hQCQhtGm43Alfhr1zsJvhi1lR0u4Fnr5yloZXXH+Qu/uWsDv
	NZniJDcZDj9xVXc+/mxte8mTiCDjckswDSijHd9y1z7lOtAt/SakLoOKduQuohbG9NwNdjMai/+
	AoVK2jf5V6TFbN8Eq/UoBReBtDTKKzqh
X-Google-Smtp-Source: AGHT+IFgMBj7fY02qCQ25l9Rhnznqe3ywOhaOTHfy9yesk9dv6hwcnvTwRXz4kqJBFmxGo8xBtMDwA==
X-Received: by 2002:ac2:4f01:0:b0:545:a1a:556f with SMTP id 2adb3069b0e04-5494c36ef31mr1529808e87.50.1740746154720;
        Fri, 28 Feb 2025 04:35:54 -0800 (PST)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5494e8399c4sm234882e87.213.2025.02.28.04.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 04:35:53 -0800 (PST)
Date: Fri, 28 Feb 2025 14:35:48 +0200
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2 2/4] gpio: Add a valid_mask getter
Message-ID: <50003ead72a41672ad25e90b7a273ce48f04c8c4.1740745270.git.mazziesaccount@gmail.com>
References: <cover.1740745270.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Sv5ixRUglUVj6IOD"
Content-Disposition: inline
In-Reply-To: <cover.1740745270.git.mazziesaccount@gmail.com>


--Sv5ixRUglUVj6IOD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The valid_mask member of the struct gpio_chip is unconditionally written
by the GPIO core at driver registration. It shouldn't be directly
populated by drivers. This can be prevented by moving it from the struct
gpio_chip to struct gpio_device, which is internal to the GPIO core.

As a preparatory step, provide a getter function which can be used by
those drivers which need the valid_mask information.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
---
Revision history:
v1 =3D> v2:
  - New patch
  (spin-off from discussion to v1:
   https://lore.kernel.org/all/Z71qphikHPGB0Yuv@mva-rohm/)
---
 drivers/gpio/gpiolib.c      | 16 ++++++++++++++++
 include/linux/gpio/driver.h |  1 +
 2 files changed, 17 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 98543d79f69c..7e36894bab11 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -703,6 +703,22 @@ static int gpiochip_add_pin_ranges(struct gpio_chip *g=
c)
 	return 0;
 }
=20
+/**
+ * gpiochip_query_valid_mask - return the GPIO validity information
+ * @gc:	gpio chip which validity information is queried
+ *
+ * Returns: bitmap representing valid GPIOs or NULL if all GPIOs are valid
+ *
+ * Some GPIO chips may support configurations where some of the pins aren't
+ * available. These chips can have valid_mask set to represent the valid
+ * GPIOs. This function can be used to retrieve this information.
+ */
+const unsigned long *gpiochip_query_valid_mask(const struct gpio_chip *gc)
+{
+	return gc->valid_mask;
+}
+EXPORT_SYMBOL_GPL(gpiochip_query_valid_mask);
+
 bool gpiochip_line_is_valid(const struct gpio_chip *gc,
 				unsigned int offset)
 {
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 2dd7cb9cc270..7dfb8341b0e2 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -678,6 +678,7 @@ bool gpiochip_line_is_open_source(struct gpio_chip *gc,=
 unsigned int offset);
 /* Sleep persistence inquiry for drivers */
 bool gpiochip_line_is_persistent(struct gpio_chip *gc, unsigned int offset=
);
 bool gpiochip_line_is_valid(const struct gpio_chip *gc, unsigned int offse=
t);
+const unsigned long *gpiochip_query_valid_mask(const struct gpio_chip *gc);
=20
 /* get driver data */
 void *gpiochip_get_data(struct gpio_chip *gc);
--=20
2.48.1


--Sv5ixRUglUVj6IOD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmfBraQACgkQeFA3/03a
ocXyagf/XKv7IOZGmHu6xCtTLESzbdhtzNCXjsiq4FdA4nYJN9JRR6NtB5vtITuW
kxvTTKQiJa39rk7uyoKQn9xcc1Q/3ExV1Zl0CenqkpboMZpc4nQJGmTs7vHX2jYW
ESzAj9L5JWxQNz8K7NRENMxP/F7121NjyDnJy1ljtW2BPWymZWunTBnkv+OA8qlN
DRGUqKU/UoKmU2c4ggsx7aQsRURKWWmY3I3nqM7kBSttvk0r29Le4qjIdJlHHfh7
PqXPtPnrQEA01wpIO4sIYALKNa8pAiurrIytgXQfelBTGOCeZ51nA8raJfyn48FF
pCtW6gJKe/VCltxu39X8sG20qtUqdw==
=CF52
-----END PGP SIGNATURE-----

--Sv5ixRUglUVj6IOD--

