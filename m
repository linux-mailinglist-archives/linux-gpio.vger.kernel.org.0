Return-Path: <linux-gpio+bounces-17114-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E80CA50053
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 14:21:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E6463BB438
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 13:14:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C5322475F2;
	Wed,  5 Mar 2025 13:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NHPv1B91"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581A4246348;
	Wed,  5 Mar 2025 13:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741180377; cv=none; b=AobnfrRqFNdB/OABoohS5m5o3RpVW5+11GK4R2V5Lc27sYhBaTgoP5IlfdUxs0ThvlX9VlD4ht+vdbAKzHgUtZnNwNBSBzCTi4WuOeUym3m+JhgWv3CmL6oMfhqZi3tz0QKXWhpJzShIr2QdxTMpeFZhQnE0IqIAyXQAZwuBIcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741180377; c=relaxed/simple;
	bh=mUxt3qz/KgBZE3PjFr5uM4Dh49iWXqqoo3enjTOs7KI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sJbT8it8j1dPvwm0MwUXE5HMdms3HektR1v7b7U0cve37/9KB3aQcbC6T26uJI2railq3kQv+inYgQfHejNxaI+yY9F9VxJlV9/pC3t+hdoEE1FElinCwwuZwyh1rYalzAlLDb1jhU/YgUkdCQjrDga+M/QigxTmHb40pyWKR28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NHPv1B91; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-543d8badc30so7819127e87.0;
        Wed, 05 Mar 2025 05:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741180373; x=1741785173; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=++P8OGgocPeaMuo16xEVHYoWSjDiToMa6HFnAtyYwNg=;
        b=NHPv1B91uD9cLuvHnLCsRz8lEEkmQMYVfDOC/ehMfQqe9uWARzrgsI7hXl14kc8qEr
         4GKoqCW2QDt2GX2EmUWY7SBQN8zRbWWGwuVXHAx0fom8MuKFWDJyAQcK+n274fI0xnwL
         YScVvPRu3PvvkF42qT5qXGBdMn7Iw7c0SkfyRf0aGknyQbJVgHxcWcLpweY50a+r5y0A
         bbVgMHwvOsqsKk6A5wqM5tceoYJcg5Sfs0bP7GWAUx6vBWAPVMiCBOq0NTFOQ8RBcIam
         zzi+fNAByiLprhmy7zRdD87UUufAMTERiiINNsGwgC6YIoixd6jM3v0fz2VgcMfHNOnF
         f/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741180373; x=1741785173;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=++P8OGgocPeaMuo16xEVHYoWSjDiToMa6HFnAtyYwNg=;
        b=YtkANrMw84NvmuSDNGR30uirpmq8np+J4aWOX5jV1VYW7BKNjMbyznJhUMUMQ9hE/S
         naCuNJXHvczQHDuJZvkjnpGLQgoaEFvVwEalqse9JbwrOuCkKhyno9OFiQLlmpQTdiSP
         wqNvPmKiGEZPbxLeaLAanVCuuqkgtL/Z/nRhzQLKx7YBVjUxgg/urEEgsgB5VDAJTn8o
         qg4sD/v5g2nufOl/13ZwGdkrBimpCu5HPzD2Je+DWJDRSZ0eAfLjrtmkMHa+lDDRERiv
         9jvJ+0c3QYfMfqG3HL9UhmbsllUr6C/L2CJvKKtHEPs/Ff/ODpURW9J01kmhEu+e7DyD
         HjLw==
X-Forwarded-Encrypted: i=1; AJvYcCUE96ObT4uAjrdQS7fAi49JOMfrD7cJcTtnn94PZ425nx0xsjLsa84gDYcOphQKDTJ5W2vDQce1fTOm@vger.kernel.org, AJvYcCW95s+iGg6hvYHirWLWRSBYrMynYnv6tcVpjVARBQ+mTawNhInnEwsNdKHCADsyoRczDAfUye5cpp1Sk3L2@vger.kernel.org
X-Gm-Message-State: AOJu0YwrbubvGYiUgWZsaHDGcT7Deou1N93vFjLH4vdpI9XnGGhKiCw8
	vL49U7BDJiAfQj2Y87od97Z3qQ0wrPkLmD5eDv9KcvPkqnTyoHo8
X-Gm-Gg: ASbGncsySCow+zqXoySecXUHR8CJRwVSDeY+N5lhtONOHaVNRCOLI8VGODcMPjmkKdW
	ys3r0K4i+Fl82A4QM2sDxzI3fcid1s+gW9VAbd0CeSIecNf+zE8qKGwAYtdZWG7R3JgB86wcx6z
	0CAQpyA8qvWZLh7Pdr72AsnKRyDeNr/rUgH1YgcUghS9sKjixnlWLQTFmqLuVLZ1df4cKEPj+4L
	Dv0kVPq30tsubWcizlFkZdEf4HAmun0jr57+GDHT835++7iExqetx+yMUx97EJnHFjv6ZX1JI1K
	WemgtWBMsCmB/Y47WrSdQg4hR4O7ZsPvQCTQ9SnZIvStOMIWa3Q=
X-Google-Smtp-Source: AGHT+IFYgjh5om1P5ziCBs0tJzVpk/HRJSyxUZGxqLx1i5ZMB3Kd10x6efZ0KfXI/YJhWGvtIHBvzw==
X-Received: by 2002:a05:6512:acd:b0:545:8a1:5379 with SMTP id 2adb3069b0e04-5497d389e46mr1302102e87.43.1741180373178;
        Wed, 05 Mar 2025 05:12:53 -0800 (PST)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54950deac8bsm1543956e87.237.2025.03.05.05.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 05:12:52 -0800 (PST)
Date: Wed, 5 Mar 2025 15:12:45 +0200
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v3 1/4] gpio: Respect valid_mask when requesting GPIOs
Message-ID: <cd5e067b80e1bb590027bc3bfa817e7f794f21c3.1741180097.git.mazziesaccount@gmail.com>
References: <cover.1741180097.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KAykzEu+FXuHmRBM"
Content-Disposition: inline
In-Reply-To: <cover.1741180097.git.mazziesaccount@gmail.com>


--KAykzEu+FXuHmRBM
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
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
Revision history:
v2 =3D> v3:
 - Rebase to gpio/for-next
v1 =3D> v2:
 - New patch (born as a spin-off from the discussion to v1:
   https://lore.kernel.org/all/Z71qphikHPGB0Yuv@mva-rohm/

I'm not sure if this warrants a Fixes -tag.
---
 drivers/gpio/gpiolib.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 8724c7d8459e..b5f472beb3bd 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2358,16 +2358,16 @@ static int gpiod_request_commit(struct gpio_desc *d=
esc, const char *label)
 	if (test_and_set_bit(FLAG_REQUESTED, &desc->flags))
 		return -EBUSY;
=20
+	offset =3D gpio_chip_hwgpio(desc);
+	if (!gpiochip_line_is_valid(guard.gc, offset))
+		return -EINVAL;
+
 	/* NOTE:  gpio_request() can be called in early boot,
 	 * before IRQs are enabled, for non-sleeping (SOC) GPIOs.
 	 */
=20
 	if (guard.gc->request) {
-		offset =3D gpio_chip_hwgpio(desc);
-		if (gpiochip_line_is_valid(guard.gc, offset))
-			ret =3D guard.gc->request(guard.gc, offset);
-		else
-			ret =3D -EINVAL;
+		ret =3D guard.gc->request(guard.gc, offset);
 		if (ret > 0)
 			ret =3D -EBADE;
 		if (ret)
--=20
2.48.1


--KAykzEu+FXuHmRBM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmfITc0ACgkQeFA3/03a
ocUA7Qf/ZRFY9W+g5Sf7I2fazEDhkCPghF1Q249ECBlqOWHM7QtaXPd3PMFS4uEr
iqXOpWZxwxfMqS39pMameGe569WXQ6s741Hyy+yAg3avRSiY474dk7tTXpgcUsgm
puwYgPNjDRWWJNsBaAL65ssCJjeKRQTcxpjDLlQameuHk3Dh1QYSX2LBtTpNfuxX
ub6MrnoAXPTs223560on0CZZDBwmgSyqBD9e/XVs8TOrJ8a4JjF7puMwAluIFk3N
xfZnm3HehnDaWIukr4kHstgBRsTJ85jfGcRLPpLoONR67t94duCZspzO2m3aMATT
G4NDqT4iKMG5fzPxOtHh+SO8tqxCBQ==
=zILn
-----END PGP SIGNATURE-----

--KAykzEu+FXuHmRBM--

