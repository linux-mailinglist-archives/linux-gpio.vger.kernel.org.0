Return-Path: <linux-gpio+bounces-17113-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9AAA50038
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 14:19:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B48FD16EAB0
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 13:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4A3A24A061;
	Wed,  5 Mar 2025 13:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R60PGt1w"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFDF2451C3;
	Wed,  5 Mar 2025 13:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741180330; cv=none; b=m9nFENSgrroIMrCuP+h/tUkhdqsIWaVc9y4Gi/u7AWXzkvKDVwMDuR6bjlZOovzvfuzRhg9vBIH+yug3OWi1psI9x0fXCFzD1+LLgH1awD3nkb+CU9fUfa0YSfAwy4kNyk6kfFxp4tVdH8fvKuzPAJQyXexOjrwdtE7bnVXoXV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741180330; c=relaxed/simple;
	bh=XWF57BRJqLXtDAxpbZWGOksNU1jAu11Lx+Q5UfiE1yU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UCQ72AZyA3n9rgUVqo6+1Ct2EojjNYmxUA8xZN037q0DpLGJEzrqGX4JjSbJzFHkbzNm9A/rx/nDnQJ5Lah9igyfSTFFPpe3d1NbBPnOJGC2YS8qc7jWZ2NsCcfXGpXZ8Bp0yPbiViIa3FVLhgUCOKwM9ejsO+mRHIhubm+lWTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R60PGt1w; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5495c1e1b63so4637136e87.0;
        Wed, 05 Mar 2025 05:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741180327; x=1741785127; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gLyVk1H/T+BaRA8M8WKbV1btpn7yJl6bT0EpGKc3d14=;
        b=R60PGt1wAuShsO4bskwNHL6qLLTalzcn5y9kzBrli/4Eb9PvyjpiWV5/pzGMQYUXz4
         dOFkRWeCyEt+VEoZVKHWtoBisEzOLaLlFK9hutrrNiHQUFUbUb2HiIHLgeczhDTPyzoe
         4a2hRlfGNyfgFzq08w1KKu2f4e7eACqxW3ncVZkLx6lHWcM+XQ223pMeNxchCuM7jJqE
         ppB+TqWttlPGGEjH2hgTBARkl7erv0DMrKsu+QodYrTAg12AArsom9YHeT6oqngx0+Qn
         IojiQa9/MTSohzbIL2xTXt9QIPQauiLvtPit52ROipNQk0pw41LoAzxoKlkuQRjgABTA
         B/TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741180327; x=1741785127;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gLyVk1H/T+BaRA8M8WKbV1btpn7yJl6bT0EpGKc3d14=;
        b=Ke08VrkdfTUAZn9xfTU2BeTUlnnmRiqQIGF4tDcn6lPNVcW8VpIyqIjoEbSmWG9QDS
         bR8dzQ2X8YRkFb5RZuW1ZMc4XDDkAmS98IW6NnQ1/mki8cR8A4s0mkl75dsoC5GzV/vQ
         N3r4BewJ1TEWlNczx2u463v6LXyTEGEHkd8UVbgalzhOX/TXypq1FXIiEDJSjV8QytO8
         KHyta6SOo0w0hVfKMnnWbQBqqxkLPkXT0uZqHbBac8BptZUyElZ3FQybuNgRf08j7BbV
         L+89l9j+X9RCXRs7H8Hm/fvFg/XvwUWViTi+FNZIE1geL+9Y/uvKa/TOzobhPjBdpEcn
         1Imw==
X-Forwarded-Encrypted: i=1; AJvYcCVAthtmQ5Huy5r5en438C8DtwK8WQ+Kqr3c4AgKThUFATy6vfy4FXNARDYg9ScV00/ni4KCSWCgLXQQ@vger.kernel.org, AJvYcCVclL+l+RkvfSMGZ2eIjxFRUcyt474yx9DJOcF79TlWcucu7Vnu26ZT67bCrVkLxnX0NGkWjo462Sndf2v0@vger.kernel.org
X-Gm-Message-State: AOJu0YzknL5x3V9u4069FD7nnlJusVCXXowPinKPJ+VVtmoiAM4Fqy18
	mITERSrGP611ntMbU8vqa0Ul3KvmCHra3HvXGzRgzs5W3gwSkVAg
X-Gm-Gg: ASbGncs0FFXnZt+RhKUHru2ng884ehH/2pQel2MtAE/cQOgvVKvO2T/+ZziBce+S23O
	hJRvuzXHVLyxzA8iZlNiYZmgDUiBIylKEChcIMye8EApM92wLb/7yYhrA1sBqwf9byJWCj+z5W/
	niM0Oq/vmIh3m3rlgUWvTLlqWVAP9qX+KoKqLR4aKfGzSuq+wra6Y687Dd3RfgNzSIkIdQHfBLL
	/oXDWo5rX4lnVDxZUSQG7TV+tzDYzp4fpODYqL4kD904Eez/LPZnOBxs1z12ULrIvQ/9jbSiwJQ
	e6X0QM2D73l+eW2wxUN4nWvnLrFldnbS8Mi4Oi1sgNurAuYo8bY=
X-Google-Smtp-Source: AGHT+IFao0mdp4tr2pV/DdXUxmXZ4x0RoXao+mBWttv10JeWmGGD3KDJ0aWVgLE7O7OQ9NrH515YWg==
X-Received: by 2002:ac2:5f19:0:b0:549:7d6e:fe84 with SMTP id 2adb3069b0e04-5497d6efeaemr813260e87.53.1741180326307;
        Wed, 05 Mar 2025 05:12:06 -0800 (PST)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5495c261ab3sm1180860e87.57.2025.03.05.05.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 05:12:05 -0800 (PST)
Date: Wed, 5 Mar 2025 15:11:59 +0200
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v3 0/4] gpio: Hide and obey valid_mask
Message-ID: <cover.1741180097.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wijtUninmDGEfi6/"
Content-Disposition: inline


--wijtUninmDGEfi6/
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
v2 =3D> v3:
 - Rebased on top of the gpio/for-next
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


base-commit: 44fe79020b91a1a8620e44d4f361b389e8fc552f
--=20
2.48.1


--wijtUninmDGEfi6/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmfITZoACgkQeFA3/03a
ocW4JAf9EF0LAaL2gaAgx4U+/eJCSJKQAi+v0TTvPaUTpSjpY7d5KoyGhJpOe5ZO
g4Vajk42ZVaGWc3yyhLmML3ESGNuC0dlGA7zTKoubLclUerwsFDqFk4y6MTCOFCD
uizCndmdyxQCo2zBpcKdAmTSrCCZYiQbE111vfzOZjmJloMNIjk+xqhs+H3xL9Kj
LH8UH3AGV4mnKJpdIUMiqkUuOT/P/+k/Y9Kwu9e32ZJvJeQBK7+Q5mMn4mFxBi5U
05+CKtb5iMU5N0aFzufh3glMFaHKhmSCpwFYrG6aP8d9p6Eat9aCjE3n4EPnW7Ei
w0KRvTRqYwZu9lozkYI39z+w5S+zyA==
=rjrC
-----END PGP SIGNATURE-----

--wijtUninmDGEfi6/--

