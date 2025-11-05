Return-Path: <linux-gpio+bounces-28073-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 474E8C34554
	for <lists+linux-gpio@lfdr.de>; Wed, 05 Nov 2025 08:47:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD051189F8CE
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Nov 2025 07:42:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51A3E2E0406;
	Wed,  5 Nov 2025 07:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="r31i5Gve"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8A12D94AC
	for <linux-gpio@vger.kernel.org>; Wed,  5 Nov 2025 07:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762328416; cv=none; b=M2pd3McZXc4TMiAC/AzVgjoHNpTEeoVZvCzO5aTO+bqY0DjZQnHKQD0mAnZlLfB/iXzxtNeHqJnSgShizQIcqCO526nnc4iME2EBwG8xG1YHJMZF+Tc2T/Z9dGjCJej4NooWC3jKkrD8HE+U1q+pjtrhOTerHLi2V4qLihpgLig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762328416; c=relaxed/simple;
	bh=Z0uASi8PcTDWf1TumgK+cdwX9qQWmS8KYQN6ISGAmv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WndVWPZUK1tWGPPnyqXzoDkipO9DwYEE6fLnLAiKFyAtgCaALC485k2smZHkDjJ/NMJk2xPq0ZIlXRDJrUxP8ErPjjZCvbPRlsqhbiuvV/6FxVItkQUug2AmZK5a8GC7GUjTXgPo38Ok/9bZ6l4/H2GUQB7hBJ4cFYCoMgo2mwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=r31i5Gve; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Wed, 5 Nov 2025 09:40:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1762328412; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=m1cOocHUftuQ47GkJi/NADdDpPsLrFoaUKm3zQQvVJU=;
	b=r31i5GvetOTbZ20uX5MaLc4NRprRoUt86+uBEt/XAtkwQ4VBSqNWPnE/Wgjr81xT07adz0
	KJ7n0UOuRIIt0pQC08OSAYrQtctvzft+KtN3aPvPFYAZy04tcWGztLMRiDRwS+IQn7CfAQ
	FO8eXjm5rsncBA+ObBPP8g6vL/tFcEM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Matti Vaittinen <matti.vaittinen@linux.dev>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-rtc@vger.kernel.org, Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v3 16/16] MAINTAINERS: Add ROHM BD72720 PMIC
Message-ID: <8960636b76cf5b166345f6253080ad2bf627f8cf.1762327887.git.mazziesaccount@gmail.com>
Reply-To: Matti Vaittinen <mazziesaccount@gmail.com>
References: <cover.1762327887.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Cu24W2IAGUupYf+8"
Content-Disposition: inline
In-Reply-To: <cover.1762327887.git.mazziesaccount@gmail.com>
X-Migadu-Flow: FLOW_OUT


--Cu24W2IAGUupYf+8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=46rom: Matti Vaittinen <mazziesaccount@gmail.com>

Add the ROHM BD72720 PMIC driver files to be maintained by undersigned.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

---
Revision history:
 RFCv1 =3D>:
 - No changes
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fe01aa31c58b..7e3c1eac7cda 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22353,6 +22353,7 @@ S:	Supported
 F:	drivers/clk/clk-bd718x7.c
 F:	drivers/gpio/gpio-bd71815.c
 F:	drivers/gpio/gpio-bd71828.c
+F:	drivers/gpio/gpio-bd72720.c
 F:	drivers/mfd/rohm-bd71828.c
 F:	drivers/mfd/rohm-bd718x7.c
 F:	drivers/mfd/rohm-bd9576.c
@@ -22369,6 +22370,7 @@ F:	drivers/watchdog/bd96801_wdt.c
 F:	include/linux/mfd/rohm-bd71815.h
 F:	include/linux/mfd/rohm-bd71828.h
 F:	include/linux/mfd/rohm-bd718x7.h
+F:	include/linux/mfd/rohm-bd72720.h
 F:	include/linux/mfd/rohm-bd957x.h
 F:	include/linux/mfd/rohm-bd96801.h
 F:	include/linux/mfd/rohm-bd96802.h
--=20
2.51.0


--Cu24W2IAGUupYf+8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmkK/1QACgkQeFA3/03a
ocXEqAf+K7N/dvIRrJrtWp5nqEEX2gLFmBy5pRdTr3NEdtkqh73A32fHJv+n8ab/
cvhaMTOyrLW9pORjcAThv3EDnTxEUk/S2JOIDEdJmur/8ocL/9PNvDqTZMeLbgxk
X6XE5y7AJ6xmXjZK1WAQqiI2ohi8FwC3cjVPa0Q9iCF2SBqhgZl90tGXMNLXRGLj
fsxKJaeKIkwZeokIgombeKt/sj6o5JtFE8txG2neSHdI5p1feo5mUxOB3cwCQpz1
djp5PGxqz+VXKoN+tXSccZ6GY5+XB3Uipk581aT3LHeyEMPPiuItlEYvrWHpE1jJ
fs94gHU2JNiwQu3LsU3oxLoGLBwaig==
=vy7/
-----END PGP SIGNATURE-----

--Cu24W2IAGUupYf+8--

