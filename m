Return-Path: <linux-gpio+bounces-16809-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BB9A4996F
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 13:36:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1F3D173B1D
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 12:36:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB23026B97A;
	Fri, 28 Feb 2025 12:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ipQWeIzw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DDD25E471;
	Fri, 28 Feb 2025 12:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740746170; cv=none; b=Flp4YFLhMqB08NXeea1Tn6OlAaTJSvCP0QLdVO6aQtcOCk+TkY2Gq5H7YEnwnea3BpHuBbaCsnWC/k51RlGswx7OKgjcAbxd8E7tZLsfWep/vohSv5zEpJ+OigTgaftyNlgJTITsp1exzeaNmIYWR2DGYENA4hQb+LE8SdCH/vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740746170; c=relaxed/simple;
	bh=Q4mIv6d1Xkm+34bu8KlWTvemG9bsWxb2/7JMr1FQ7gM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dG0JWWkaaIJQryFriDE9AwbKUc+99oWOH528VUwC0cdyah6I5nhEJJQZZ+nVkrfsAk0n2c1HNuWEFiehYMPv4o38f/HwQLiP1PHcyJ6cl/pS+FHkDNHkztKgZkjJp/NRxMXLxm4bjhAR9vVUMJNKnxs7xvtfHfzam/XFfjpp8yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ipQWeIzw; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30a69c1a8d3so21347351fa.3;
        Fri, 28 Feb 2025 04:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740746167; x=1741350967; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/iowLL7+2kEroYZoI4bPOoU1drVuTgJ8hI6YhqKSW8g=;
        b=ipQWeIzwnyHUwIjBihakOJ7GVCqxc/MSkqzelUQPe6sXxyz/wIVO91uUN0GzJ9UPtJ
         /4rnpsz/Rlo7hf2dTEYmFmWlGs/IeTSZgkgjUs7bbQrR8iSjpnnSrIXQV90fTW1dRcVH
         y9z11ZW2Ikjg0vjwbjksDtTJxDY/5/M2kCbfH2wTvt9w24YMi0QcC9DeKcqCinX2mzkB
         wSArpylWiaWh2z0xgcG/pP5JUj8K1QUqr+zuvYgNbq/3BlO9Q/jkI+G+ISS5ElK567o0
         Ns1Nea4r/6hZEh2S0N1KQNMGDbAZUvaegC9vEpxstvtikvT2wxLcnZ5ZAAzIL4pM3eTG
         H1cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740746167; x=1741350967;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/iowLL7+2kEroYZoI4bPOoU1drVuTgJ8hI6YhqKSW8g=;
        b=h09karSQjpqUXGZLEkj5lgWNgeS83I0vmtCdO7dIX3oLz3e7ZAni9lIegjDn3fE6fM
         c/MqCEPqs+sX95UpUIlCspRm1IEdJ9M1yN2umbYnue7tnUIchFh7Z9wb2wMxcVUY4z34
         ZMxUcSzcPNVB+dIotvYqX2CmI4S+aXT7vfNoiwMETqzgHv88wS2PGIdqdDf1BrgDJUVH
         /lbv2EvyfRvgFhXSt15iThhNUW/m1xVvwkRXWEkcWNaZv2vJ3QIfSO0UWS0awtyC1nMq
         NJoxI8KCd8Sb7/4iFF8gHlfT5+A/LFyQQYYBGIBxQeX+RFsHX3XWMgSFzczfRxfXE6LT
         W4oQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCcipaJGiZZBcRHMR3BApJOLQUfBQJk+5ADyvWWS0YCkiLkMZODfv0LD58Jc1YnkRy71AOaWD24dqQ@vger.kernel.org, AJvYcCWm3NY4SEa3rom+F8PIccKlo91Hdhcw2jfQ/v7Lbs+gSnje3SqHdTB7kCMlGJ4bW9LFUCjaaxT8vgbW34Fv@vger.kernel.org
X-Gm-Message-State: AOJu0Yys9zl6Flx4BrgRdtXXMv6ptVt3Q2VFiXuSUE6lyx2JoACJGqGP
	eutxRJx40DrVeXhfZ1S7ylxe+ADFVKUZpD3D7SVQqRZXpXI7zjkW
X-Gm-Gg: ASbGnctsK9qxP1Bid13bPAwP6tgRD1bm2cYQWXpVZ6WNiow9wH7bZ+idLZ78zKlw1hJ
	10aNu/gr9YXaAmIuK0k8JfvcEWwNbcjVGBW6mBefhiUr0UTDYO9tC9J3DbU8d/FmQT4sNRWLmj1
	FprMlIShhsVk0UTAURSf63jMQqpVMYMyS6p+LeX9Tq1Pz5MiAAYKLn7n4bsNUNNpLme4GfLTNRI
	vq/4ySY8z1/9nvgk6t0HMTwTaUQUt5gPyzt2YfcN0t2+pr7PjApH96St+awGwIK0as8cabD2bV8
	ICDBcxuAsLWqq4gAmuNpqvCKMqlHvmQM
X-Google-Smtp-Source: AGHT+IGxcEuoGdguSv+9314BpRKdqdkNtk0mDD8xaq2UpZ7Gax/H11fwZGMXE190GtnkyyipBPUO2A==
X-Received: by 2002:a05:651c:1541:b0:307:2bc6:5eb4 with SMTP id 38308e7fff4ca-30b931f9d32mr10004901fa.3.1740746166565;
        Fri, 28 Feb 2025 04:36:06 -0800 (PST)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30b867c8f64sm4938531fa.50.2025.02.28.04.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 04:36:05 -0800 (PST)
Date: Fri, 28 Feb 2025 14:36:01 +0200
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2 3/4] gpio: gpio-rcar: Drop direct use of valid_mask
Message-ID: <fae20f205d4d3c9f0bafb133e51dd115f68de84d.1740745270.git.mazziesaccount@gmail.com>
References: <cover.1740745270.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tBXZ0PzyD4qk4GD4"
Content-Disposition: inline
In-Reply-To: <cover.1740745270.git.mazziesaccount@gmail.com>


--tBXZ0PzyD4qk4GD4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The valid_mask member of the struct gpio_chip is unconditionally written
by the GPIO core at driver registration. It should not be directly
populated by the drivers. Hiding the valid_mask in struct gpio_device
makes it clear it is not meant to be directly populated by drivers. This
means drivers should not access it directly from the struct gpio_chip.

The gpio-rcar checks the valid mask in set/get_multiple() operations.
This is no longer needed [1]. Drop these checks.

Additionally, the valid_mask is needed for enabling the GPIO inputs at
probe time. Use the new valid_mask -getter function instead of accessing
it directly from the struct gpio_chip.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
---
Please note that this change is compile-tested only. All reviewing and
testing is highly appreciated.

Revision history:
v1 =3D> v2:
 - New patch

[1]: https://lore.kernel.org/all/TY3PR01MB11346EC54C8672C4D28F931F686CC2@TY=
3PR01MB11346.jpnprd01.prod.outlook.com/
---
 drivers/gpio/gpio-rcar.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index 2ecee3269a0c..e32d731d0473 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -336,9 +336,6 @@ static int gpio_rcar_get_multiple(struct gpio_chip *chi=
p, unsigned long *mask,
 	unsigned long flags;
=20
 	bankmask =3D mask[0] & GENMASK(chip->ngpio - 1, 0);
-	if (chip->valid_mask)
-		bankmask &=3D chip->valid_mask[0];
-
 	if (!bankmask)
 		return 0;
=20
@@ -380,9 +377,6 @@ static void gpio_rcar_set_multiple(struct gpio_chip *ch=
ip, unsigned long *mask,
 	u32 val, bankmask;
=20
 	bankmask =3D mask[0] & GENMASK(chip->ngpio - 1, 0);
-	if (chip->valid_mask)
-		bankmask &=3D chip->valid_mask[0];
-
 	if (!bankmask)
 		return;
=20
@@ -482,10 +476,13 @@ static int gpio_rcar_parse_dt(struct gpio_rcar_priv *=
p, unsigned int *npins)
 static void gpio_rcar_enable_inputs(struct gpio_rcar_priv *p)
 {
 	u32 mask =3D GENMASK(p->gpio_chip.ngpio - 1, 0);
+	const unsigned long *valid_mask;
+
+	valid_mask =3D gpiochip_query_valid_mask(&p->gpio_chip);
=20
 	/* Select "Input Enable" in INEN */
-	if (p->gpio_chip.valid_mask)
-		mask &=3D p->gpio_chip.valid_mask[0];
+	if (valid_mask)
+		mask &=3D valid_mask[0];
 	if (mask)
 		gpio_rcar_write(p, INEN, gpio_rcar_read(p, INEN) | mask);
 }
--=20
2.48.1


--tBXZ0PzyD4qk4GD4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmfBrbEACgkQeFA3/03a
ocVVOwf+MFzFGoU6nJwi4F8sg8/YsmS31B3LHAiwrgc7H3OPaadYuBRTKLZHBvz8
ahCf7UcEZ/MO/iOwvTRF/vJJ5M8WsuyuZPHVb/66DIzL1KEh1u93P7O0cpkqWbk1
IlD6tz1LyA0s78M/O35gl9XeEXuK/IR7PKprRqhmbH/YhdhrNBVIG7az9lpIX2uc
k3nalkoB02b+WT+9gWjC3DaovunI6P4JLy9g0QUeeA4WjM9OU1zvcf19xlrkq0UE
RSqoyglSswcfYC6Yk9qk+jQ+CiZLspC+cLhGFN1iZ+m+hrbI+2Ot6ONxOTLyUOsR
cKXkRmw33ruy8CgepanhgK2kb//ocQ==
=tCpa
-----END PGP SIGNATURE-----

--tBXZ0PzyD4qk4GD4--

