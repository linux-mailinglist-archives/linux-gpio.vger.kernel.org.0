Return-Path: <linux-gpio+bounces-16807-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C70A4996A
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 13:36:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8668A173114
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 12:36:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 063EE26B2C2;
	Fri, 28 Feb 2025 12:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q92XBbwn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9CE26B2B2;
	Fri, 28 Feb 2025 12:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740746144; cv=none; b=lQLa2MgMRnljr4icLPrVDHh/xJg4Dn4Lx7iaPvzv7E4FjtyyzeQY5AeUZbvt0gYVuXMD2OvbA+CgkZcvyp5drx4P96EJYNY8zBUhyHTPMnHcRVxrNNJMa93KZLGpy+Vm6PCk0yjl8BeltAyMlQnJzx9gJ9ltlGC4ZaaYJPbKqHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740746144; c=relaxed/simple;
	bh=dsOTKlXKboHgcbOBwSNrkBHw6cg7QKw2BDCF6ogxwQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AfcScWcpEmiVAwm2CCdpn+Ddqbd12kK4JBaeVaOyQbv2w+yKEbqtCluUCIN9Ix6vdN/Fq2rtBxxAAIfWenGKT3FvxZc1ZMK2u4uwgsBgTAV9CG2owqsQgXLDKo+3io9mMKXjEVlLxeVhp/U2vS+wvAWfEqhcHkWajgmOwXN91zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q92XBbwn; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5452e6f2999so2056485e87.3;
        Fri, 28 Feb 2025 04:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740746141; x=1741350941; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dr3FBm3cBWDRNg+q5SiEHRNOifqF92GXXQF7rhydtfg=;
        b=Q92XBbwnnkrWEJFJOx1TdnLhrMJfIWX70xMl9ObzoiT0KOuJZP1zG/m2dNQKS/UW+M
         dB1MDA2UgrpRZdw4axSb2N4UjBWHWGh0b7nZkr6W2zi8hDvXluh5y9ze4tRxSzRDBze/
         anaPPi8dLiSTKKu7BAvnz3kXM+MRQLJWxFEx63D+mzRF9lFelg71vdf+LnaVpFp9VIFG
         Yxbn8Fe/NxZ/Vw2V47eL2QxO4bh3Gg9fRAZXh9erD5Q0+pvNir7sVdBbzqD/O/kvXpTW
         f1jOuzVcOwz5vgsSXW6Yx1bYXtVR76mGYrXjJ2RMaYIJzv5EAL73jgjA7iJ+uLL8YWLb
         F2PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740746141; x=1741350941;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dr3FBm3cBWDRNg+q5SiEHRNOifqF92GXXQF7rhydtfg=;
        b=i55NDui0kFfCLdypdhdAKJ0GxBYTlTagsCAynjY/h73ifx6Qwh0RBHQCl5tM4H2+hu
         ddQMOsg3adozw1ei2H7YVeYjEZTPMoymKYf4Vx42oIp7YNJBd6024w1qsNAMfpl9kTmW
         FcnC6S2gYcxt4Y5C3vtYoaKTmbzD1bt0ixnJoilTnMao4V0v98QZqm/uWd9gX50zuEdw
         ofqQix920stde0UC1QYR6KxPTSj7gzK6i2zrztYy3pvgaiY3z9DS4mziYIPxqKuSRLJL
         JuorTS1p5UVAvC8VDSAZoXZG+dZaaUT3y9/2P8gg4YmYVJM4zjrL15ScVrRmVGX4oVRD
         BoyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHM5WV5aDgskH6CjFJqcFI8a+hge1a75UZqNwAEtmODC8Iu3s5bVw4TX7pI8ut2KgqOKZUT5vRk8Qu@vger.kernel.org, AJvYcCXRpL/0ilCAqn4zCcI2gmHVfrU863K5XyQp5uGyMuylIYuf9tp+iXk8VO/A8DbuXku2sMW2EwwP7Jq8WDS9@vger.kernel.org
X-Gm-Message-State: AOJu0YzizBdiCRA8Bb/7KGjtt6vlt34eFz9bwVzyEYkFfO775Jhd1pVK
	W47h6L/mrZKh9nav0fDtLCrjQ0hXzu0Y9P5mZJghjXKS1Sjw3jdN
X-Gm-Gg: ASbGncvNVDpiA7+gzfPWUfvLqz8TqXrr5Z9sQhTTaon61kX62K8Y5wJhBadnh+7KE1w
	bWnrSUCdc2mdyhQ8jpxwitf6qvAv8zqncfBVqYctHwhzn5Cz3ADdFmIPkQUZK8AhaYGbfPs8Nj7
	fcLhj8UbPa0NUxq8YX7WQwpRxL++0/19bFAHFGIf/xAy7AzaFh99cx/zTlP9p+zooWFibKjX9wC
	qxmTxtrDxFgmMcHn+y16+YUY6ncZD0KLa31dk/b7s9I5BBq7Cz83s4gt2KALvmsoMOK8iF5XvKv
	d21dEcTKuqXUMmxTQ8sELLO0h/lBZjr7
X-Google-Smtp-Source: AGHT+IEOqoYIIjnNvkZr6Tpc+drZNnzC9B0mXFQCZv1WU/rAc6a6y09EDahRv8lLiiKRnnCMsLQmjA==
X-Received: by 2002:a05:6512:2214:b0:545:16d3:3bd4 with SMTP id 2adb3069b0e04-5494c39abc3mr1123282e87.53.1740746140777;
        Fri, 28 Feb 2025 04:35:40 -0800 (PST)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5494c098c04sm284323e87.133.2025.02.28.04.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 04:35:39 -0800 (PST)
Date: Fri, 28 Feb 2025 14:35:35 +0200
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2 1/4] gpio: Respect valid_mask when requesting GPIOs
Message-ID: <e50cf74a587b33cae3133a6b9e0081062f771249.1740745270.git.mazziesaccount@gmail.com>
References: <cover.1740745270.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ODObMk7EP2TWqcbf"
Content-Disposition: inline
In-Reply-To: <cover.1740745270.git.mazziesaccount@gmail.com>


--ODObMk7EP2TWqcbf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

When GPIOs were requested the validity of GPIOs were checked only when
the GPIO-chip had the request -callback populated. This made using
masked GPIOs possible.

The GPIO chip driver authors may find it difficult to understand the
relation of enforsing the GPIO validity and the 'request' -callback
because the current documentation for the 'request' callback does not
mention this. It only states:

 * @request: optional hook for chip-specific activation, such as
 *      enabling module power and clock; may sleep

The validity of the GPIO line should be checked whether the driver
provides the 'request' callback or not.

Unconditionally check the GPIO validity when GPIO is being requested.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
---
Revision history:
v1 =3D> v2:
 - New patch (born as a spin-off from the discussion to v1:
   https://lore.kernel.org/all/Z71qphikHPGB0Yuv@mva-rohm/

I'm not sure if this warrants a Fixes -tag.
---
 drivers/gpio/gpiolib.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index fc19df5a64c2..98543d79f69c 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2326,6 +2326,10 @@ static int gpiod_request_commit(struct gpio_desc *de=
sc, const char *label)
 	if (!guard.gc)
 		return -ENODEV;
=20
+	offset =3D gpio_chip_hwgpio(desc);
+	if (!gpiochip_line_is_valid(guard.gc, offset))
+		return -EINVAL;
+
 	if (test_and_set_bit(FLAG_REQUESTED, &desc->flags))
 		return -EBUSY;
=20
@@ -2334,11 +2338,7 @@ static int gpiod_request_commit(struct gpio_desc *de=
sc, const char *label)
 	 */
=20
 	if (guard.gc->request) {
-		offset =3D gpio_chip_hwgpio(desc);
-		if (gpiochip_line_is_valid(guard.gc, offset))
-			ret =3D guard.gc->request(guard.gc, offset);
-		else
-			ret =3D -EINVAL;
+		ret =3D guard.gc->request(guard.gc, offset);
 		if (ret)
 			goto out_clear_bit;
 	}
--=20
2.48.1


--ODObMk7EP2TWqcbf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmfBrZcACgkQeFA3/03a
ocUq6gf/ZjhjWSCYKfx2crwm5FWLzBywO7NJ+qDRxuKsBMZStYHVkOfcWHIXfye8
Ge4U1miaS/vR4ru+1E33doXnDp2Ccoz94xi6Yp0tyzYTjzSTvsg/etVYNE1NAhns
rD3uUDGrwMykiWVcdxKrvd46CMfzmg9wnbkqIFIjW49ZNKdIT5nvglmKgC6k1Mbm
CuKnfQIjACOJN1OOhbIKVQpUlLOI4HtyqRVAT1EWwjSUmWf5B4Bi0fvPnBGdPS07
noJ8PAnZjB03g/eJsmn7eABH5bczfwpKmcQ+Y+7G5JkQvBds9Ch+yMO3M/PSeDf3
ZfevwLCOz4MYo7olLuSkZEuiE3yb7Q==
=Tp03
-----END PGP SIGNATURE-----

--ODObMk7EP2TWqcbf--

