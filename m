Return-Path: <linux-gpio+bounces-16806-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AFAA49962
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 13:35:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E1F23B157A
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 12:35:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4354C26738F;
	Fri, 28 Feb 2025 12:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ohp4zMHm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602158468;
	Fri, 28 Feb 2025 12:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740746131; cv=none; b=eOrIiRjQh/9ABStHoiWMTaUahVAWehbl7C1SxqN2shTgUsxTqX+IVJByzzoQebhl55kYLSSxZ6FzbfesypgTr97xXS0O0JKUZD7os2TrSHa6tnYb0MDndftzEVT3uVKzg4pscvTxm9JoN66ATlBSK4tRFOKE2t0NMtIcQpZvM/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740746131; c=relaxed/simple;
	bh=d4yW+yrUQtiY819ka+9X4xPbNoFpYLIOVy9XP5o2QAY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t5LRhDL7wKlzJbnXoIzLeEm87A0KCLPHYdYKlsjg9vZG1bTM0C49E/P/R3qvQ58Tkl83E4SDNKTtYGLFMYNzvGjLdIo1G1SQJgpwcVSnx87mc13PzkWBoWHkAlepjSmUU/Dh9PQm7Uzuv3dSL7iyzNeg+5WOiORk2WHplOGzXcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ohp4zMHm; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5494bc4d796so1188907e87.3;
        Fri, 28 Feb 2025 04:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740746127; x=1741350927; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uJJFNoQPejUOMcFXA7UkX+MXkmhDqHTsxtxqhfJH3as=;
        b=Ohp4zMHmXIfHktbl9uPlrOYf+E9pg/tSfN0aX7HKhWwWLHTjZRDP0xsk05lFFIqwoX
         P3zLMApRiq1mWBqOHBLamCI79JInLKZEayzn8d4tmtHwmGqqkLbbyWswK415M3cI4iDX
         Hvo4WMdrvVURUK5l1lTGB+ejMHMPAj/lQE+IvwEfGprIveqDsHn2VTg4iiMFS2Z10asu
         DZQp8D7pwwHjUolM8sJot+Ru7C2hFnv9qLRUJ4IjI6jCZzjwPZ6pgRSUJxV/KWyJ7T+Y
         /4SRlfRymB0lXsmJMHi0OP55PYMdTZRsXgQFzfGVjMRl7eVCexi26KmjwwobITaloS4U
         2tOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740746127; x=1741350927;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uJJFNoQPejUOMcFXA7UkX+MXkmhDqHTsxtxqhfJH3as=;
        b=Tmm7PZb6+P1Occ2fIrbWVV9NM6xXbi6iC791vky613Jh8TAGS5rBj/7HBscDRFtiWO
         dAfVjuA28/JMB03cwV1Z2qEockuEHyIzk3xMiDSwljyFx4+uYgJ4FAiOiexkhXqyQgjd
         JEJC5urAOm3511lN7o57wcPpo8wB7ZTumJ9SoTWzQxhgOqK1hSDHwAPq1VxCxan6D6d1
         ijSAkzk92U6ft867uS4y4EWvyqhus8pxfm2pmhbcAiSrL4nfAvnBVQoeMqh1LTl1dTHr
         bl1vhbILMfo/uHoyLVlwF7wHK84Z9cpKvhV6FnLX7r0v9FtPu0b+N6AYTodjaUR6XdiJ
         RjUw==
X-Forwarded-Encrypted: i=1; AJvYcCV4jb4FEX7AxN1qER2WoKtnwpbAAjLksAfwArcW6O8Io0y9rqFKXx/1vKt3POFrV6m436FyuHx4h4B0axWF@vger.kernel.org, AJvYcCWuH6QcYLD2T/Bx4a6kqwaYaGgcVdL2EOj/j84NMDoxySNxGc2dqkItzDqR+oqdJyoZiD3qbd4qxkc7@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9zPmLxXoW0VE4jK9iuU6W9POJ4NumDSvKfxCpn6K1DxvgyL+J
	bhyytSmaTINLBqU1SCjmSuhrlDli6jQgoRyzFiXwcFPy/8unyv61qJVnSg==
X-Gm-Gg: ASbGncvFtycXOmeUtCaTDyyjCTcfViDOZBuKjnpd6MX96aThGWnY06rpkzhbhXGFqlO
	m/9ytF4Kq9LGuf47cXt3//aYOFSKDAFZYbwPGrwUqsB/oOgTqYjg4LGAZiDwD/0eJvlP7BgH6yQ
	m944j+LwWHZcoOhZ42b1knCD9fc9EPK4P+Dx5MZ0ISDi62PcrpksAhiVcztTHVef4uvxN8QOO1i
	O0rVYEZ+78Id6NI2JIoMGTHoxPRkP4bM5zIst5BLNU+Rp0lLzHl8JGOud/3q8M/CYxXgqbJ3LD9
	+ROvbJvtvOnxVu3px7imBhLzEInPBV0m
X-Google-Smtp-Source: AGHT+IFb1EHkHrkH2Zmm6fjeQg2myOsqKlhyrLLAztfMud3107fr3TPlnN/Xvj6FqYyufhU9PAQXkw==
X-Received: by 2002:a05:6512:158f:b0:546:2ea9:6666 with SMTP id 2adb3069b0e04-5494c37d8b1mr1242918e87.34.1740746127184;
        Fri, 28 Feb 2025 04:35:27 -0800 (PST)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549443cd032sm472590e87.243.2025.02.28.04.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 04:35:26 -0800 (PST)
Date: Fri, 28 Feb 2025 14:35:17 +0200
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2 0/4] gpio: Hide and obey valid_mask
Message-ID: <cover.1740745270.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OJoEwoXEK9cJlt21"
Content-Disposition: inline


--OJoEwoXEK9cJlt21
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

GPIO controllers may have some pins which can be excluded from the GPIO
usage on certain hardware configurations. The valid_mask member of the
struct gpio_chip has been used to denote usable pins if some pins should
be excluded.

The GPIO request should fail for GPIOs which are masked. Under certain
conditions this was only done when GPIO chip provided the 'request'
callback. We fix this to be always done.

The valid_mask member of the gpio_chip should no longer be directly
populated by the drivers but GPIO core does this (unconditionally,
overwriting any mask set directly by the drivers). Drivers are intended
to populate the valid_mask using the init_valid_mask -callback.

This series enforces using the init_valid_mask by hiding the valid_mask
in structure which is internal to the GPIO core. A single in-tree driver
was found to access the valid_mask directly. This series also removes
those direct accesses as has been discussed [1]. Additionally, we
introduce a getter-function which can be used to obtain the valid_mask.

[1]: https://lore.kernel.org/all/TY3PR01MB11346EC54C8672C4D28F931F686CC2@TY=
3PR01MB11346.jpnprd01.prod.outlook.com/

Revision history:
v1 =3D> v2:
 - Hide the 'valid_mask' instead of documenting it to be internal
 - Make the gpio_request() to obey the valid_mask whether the gpio_chip
   has the 'request' -callback populated or not.

---

Matti Vaittinen (4):
  gpio: Respect valid_mask when requesting GPIOs
  gpio: Add a valid_mask getter
  gpio: gpio-rcar: Drop direct use of valid_mask
  gpio: Hide valid_mask from direct assignments

 drivers/gpio/gpio-rcar.c    | 13 +++++-------
 drivers/gpio/gpiolib.c      | 40 ++++++++++++++++++++++++++-----------
 drivers/gpio/gpiolib.h      |  3 +++
 include/linux/gpio/driver.h |  9 +--------
 4 files changed, 37 insertions(+), 28 deletions(-)


base-commit: d082ecbc71e9e0bf49883ee4afd435a77a5101b6
--=20
2.48.1


--OJoEwoXEK9cJlt21
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmfBrX4ACgkQeFA3/03a
ocXCywf+KjvvkrqD48WDct5PdwOy/iYD4qk1PmcTkXcDcZEElBeGMK5m505YwIs6
igL7EGIgaldKBmFZPNEryDVZ8tnuxrmKgOBPUXj6Xs6ccCekVXiYfXMwM8RZWKYX
2m70HfYjE+BcJj2QwB5IRnHWVYIAMlJsvcVo+O90xWiYbhG0i94hHBh0vwKaOmBn
EgqNXEM7UTs/m9fsmFCBt75sH/f44guiLo7nTGOFtgMJrMuWU3lS0/sMuL3k9vnl
gWKzccF7jc2t/jYlWIEwpUnQZxsqilQ1J06NFrOmjYugOUMzExgwquriE6PY4Nci
v3/BpiqoGpzNRGur5M2JDW5ZP+o5jQ==
=tAE8
-----END PGP SIGNATURE-----

--OJoEwoXEK9cJlt21--

