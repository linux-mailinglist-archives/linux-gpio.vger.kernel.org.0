Return-Path: <linux-gpio+bounces-17116-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA34A5004F
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 14:21:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36C633A6EDF
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 13:14:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 906CC24A041;
	Wed,  5 Mar 2025 13:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lt6FRuzX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A922451F1;
	Wed,  5 Mar 2025 13:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741180402; cv=none; b=CSwnZqguaNlBmU0XDowyB25sfIeTDMORAosCUBLQ3ZDltnjdR1o7v2LyIVqpn6lFHs+GifQNEM+DmNNLS1hkwTq1IiS/6IGf9BSWBxOsKr3g5B1C2I9kAg367ejCZxY/hXZ0znmVCoyKrDR0u4/ZWM3HSAbXeli3+XacJu1oG1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741180402; c=relaxed/simple;
	bh=UnkPUThlesRfrFulZd3rGz1lVj7Yt27Rl6s6uTGLymM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f+kPcgjc5RjdYo9PyR8BgbKJXejw1U3936VEN1vdEQ7op/9X0Dd3tA77+x0Lo/BYNbxOOZTmBuA4y+DkGM5k0cryQ+y6NP1IbTm6W1djqju9k/K81BJy9CeBuNhVOyc2EAKaowtMDzXoRtRwoll99dK1Ww/FZAOGLCeH5aEi8pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lt6FRuzX; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54964606482so3454582e87.0;
        Wed, 05 Mar 2025 05:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741180399; x=1741785199; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QHnC8rTk/VCV1yeCHKlZbcNeKu9yNOp/8mdlXdPmYxM=;
        b=lt6FRuzXysAnKJZ/9o6z2CIQ7w6rHVZO16pxdXI8BaqqfVpw3Mp0JoKKRZS6l6Vtky
         FrnVqZIWIKR3qZcARzdD+HaU+6MbHScS7wOCrEML0ZGyCO5cLHeiP5dCekMpbTVYsawx
         YisijPH7QymMUJZi01ghjEg78yp++J8cyTMHJovZDbaq8ji3ziBhvdnrpzaFiP7HFeKH
         gMKOMP2e/3MF08CsidOwGwP22NDxexf0Akg7TKY9ihQupT124eokIiGyEFbwc6wCiwlw
         JFPKWh4pJJQCdHn4GUkTjH/B1XQ5x3odq6DLD8IP7D8ZX5afCjKg8fkcNYgooA/h9aqy
         lRkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741180399; x=1741785199;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QHnC8rTk/VCV1yeCHKlZbcNeKu9yNOp/8mdlXdPmYxM=;
        b=jbKz+lTHmC9onmmzdnfNthSJxXEBulUtG1Rdn0/90X7v6zI0kJyDmL3bpm1ncm24Ta
         g2M2A9iP0bA+2SNc0QnDY66sUcHlyEE6M92GD1MqolSAM5oTy6+624OaMeMjRlhrvCb6
         8syAm+96H7543OL1mSyULozCcoICVnwnJ9xeHQovy0ULRHS0ZzWojJ6Ia2D3D22p7E7o
         YPfcqO2RlxcxIaOcZbDapqSs9t3/SFzLkiYRmmXXbngdT/mnB/dQNLgu9HR7xO87bDOg
         6m2OsaP4o7GnPiQzKthWAkF3J1TydlaAhb7L3c/gOgbzdmiKfw+UNausK5xMRksa7MK3
         lzCw==
X-Forwarded-Encrypted: i=1; AJvYcCWlGNK9SPHxcjkUlcmSuN3GqHjddkrVBUlY5Inwc9cUptLEAL1IYu2ffn0eYWme0GGwmk8ufO9sLCf8@vger.kernel.org, AJvYcCXIaBXldXgf7Paxc0SnicOv5h7Vqhx7bQK9z1VyfmQLOCZMy8Uya59wU7bFsBZfLw9FazcPFyI4J7EPQtaB@vger.kernel.org
X-Gm-Message-State: AOJu0YzUgZCvNioy3em0MTKlpLlb/8wn8qBTqj/rglyyKFfnQovuNU1A
	oY8XEGp8W/7dsqZwk/od0RrC8oDbWBrirpTmLuBYx/BBNootiWRgDNeniw==
X-Gm-Gg: ASbGncvXoIHB3UOTLwzTFKm6SN06EooOxoSaogrQxjuo9wSbpJTIfrGOr6puESHu/n5
	/vryk3ZOHmYcWRNV1RKwvFzPNpqDTbhzFyUJRzjLCVPVmxQtUrYqxV91XucUDHvxjncwCzNFYOd
	6qTK/OWFu4jcyIomwkufEzJ2E/eNxMrg3vNCGjYXAN8tiT0NbY5OoC9J1BBN/V02y/fDcst1cAS
	7rqRU9Vwg//fmeJg+LLM6xyXfy6XdVXl1U8dL22XnGlcmBw3Ijz+Alm7SyDdU6wV9SXozYgAx5J
	jFAlUBzf2H1eniyCYHKFowKrqf/B3hyazOMYEfZtWf7JFpuYgK8=
X-Google-Smtp-Source: AGHT+IEpKQcNhVV4Fq2g9M2L3vaeHgEF81hTHFGhiGmuOzaUX8nXAWp/Fgvl1t69oczv/GT8U/t60Q==
X-Received: by 2002:a05:6512:1111:b0:545:2d4d:36de with SMTP id 2adb3069b0e04-5497d354cf1mr1183548e87.31.1741180398315;
        Wed, 05 Mar 2025 05:13:18 -0800 (PST)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5495b97bdc5sm1193457e87.115.2025.03.05.05.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 05:13:17 -0800 (PST)
Date: Wed, 5 Mar 2025 15:13:12 +0200
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v3 3/4] gpio: gpio-rcar: Drop direct use of valid_mask
Message-ID: <e46441ba8a2840e6b48ec8d2ecd5919995a5675f.1741180097.git.mazziesaccount@gmail.com>
References: <cover.1741180097.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ghYeNW3ZTfdXU7st"
Content-Disposition: inline
In-Reply-To: <cover.1741180097.git.mazziesaccount@gmail.com>


--ghYeNW3ZTfdXU7st
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
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
Revision history:
v2 =3D> v3:
 - Rebase to gpio/for-next
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


--ghYeNW3ZTfdXU7st
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmfITegACgkQeFA3/03a
ocUnCAgAjW26dDUNuzcA+xGMSOCJhKatU1Cm7sWRH2mtj3UuJrREZgi3oIdNq+Un
adF64MwAzrMlSDCokumXWS4OY2IsDheLl2wfDnfpb3BU2SQ3Sc5QmyVgXKQJvAvC
OrJfEwFvYc8tmazPZxGFTMRxETb6YdB3hLtAHBaWPrb6MOXx8csu0ta6IuOQ5Eu8
ELCYcQYOmJfTcy3Ew5GSP4HNWPRjkrZcwWfyxWoUUibpP6etrXQOjM7p2tXmiSdm
CgB6SES2ojcre3GPwWW1NPq0U8OwWZD3+5srj4HoYylbif9+DEff09ru9QDN7ZOb
8AcOB5oJTyM3lh8I4LJWb5IwqKjhCA==
=S9C7
-----END PGP SIGNATURE-----

--ghYeNW3ZTfdXU7st--

