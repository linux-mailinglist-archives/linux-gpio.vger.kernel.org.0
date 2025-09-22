Return-Path: <linux-gpio+bounces-26475-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7E2B91B78
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 16:30:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E17241887EEE
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 14:30:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F06C81EF39F;
	Mon, 22 Sep 2025 14:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="e8IvNzFP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E66D219A8E
	for <linux-gpio@vger.kernel.org>; Mon, 22 Sep 2025 14:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758551363; cv=none; b=u/NZ9PldK2ikP3ZUmvfLPT5rFg+AIyBE7gngMRMMh/IwlMSoCp8RkVXIjypW4yDLWnGxne82/NnQV73j2JqBS3VUzvopM+UeTW1lEmtQT0oP0Dnzhg+pKL749VJa99n7cBD5yD5OLQ6AUcZWmVpU6st5expH0Q3vjCUWNyMJHww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758551363; c=relaxed/simple;
	bh=yGlk0yEGsz9oqFHlfX9nlnj957Wcrr89da99updnen0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cvk2xGN2xb/KkS2QIgjYaNskzrNBUMJ3AGpTRbY/9RsrrPAYmpNGhHPjSaFS/aS6OGkYFr54kqxtyLTLnuO6HJ7NypI3vAWIUby1lLCvGhCIe0SRvSXRzGAUY2KsMXozw7C6pUxPOkzaYGSFppWDvjWd8C4wel1AeRYlUyBeDiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=e8IvNzFP; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=kgOl
	zuOh/25n4EQYjJ46ea7gRIzki/d+Hkt1uNpKmtg=; b=e8IvNzFPPNA4ttOGpvPw
	cBfjy8X/nc3ct+dvp5/nMRessnlRg9B0ArGwvM1HlFVvDscfEh/dGJD7SxiAKcVe
	QcOvSjQOTSu41SpcJ7eO5pDJobVydTfNZNCe9Khe9dW6naj/WUC5RKkcTR0iyQO/
	bw1Gc0PeWaSSdq7nS2Qbo2wcO3nbC2bYUbUTE7wrasjZjSo6td1xgF76vi68h3gs
	giadPpZ6O+G7eSp5nhx/jI5DXYvRiteUDTqxlYHSEGdvDz4vgmh5gfwS4LhaXEgj
	YvZ/kLgBmKFXRfF8u9DTTMIkhyATQP9O/n2LqKibnZaQrik6/4jB7pj7VuNJ22nB
	fQ==
Received: (qmail 762152 invoked from network); 22 Sep 2025 16:29:19 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Sep 2025 16:29:19 +0200
X-UD-Smtp-Session: l3s3148p1@GsEQpWQ/wO0gAwDPXwQHAL/S9V79e5yL
Date: Mon, 22 Sep 2025 16:29:18 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Saravana Kannan <saravanak@google.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Phil Edworthy <phil.edworthy@renesas.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 8/8] ARM: dts: r9a06g032: Add support for GPIO
 interrupts
Message-ID: <aNFdPnN7UcUlrWY6@shikoro>
References: <20250918104009.94754-1-herve.codina@bootlin.com>
 <20250918104009.94754-9-herve.codina@bootlin.com>
 <aM0llhn054OI9rA8@ninjato>
 <20250919155910.4d106256@bootlin.com>
 <aM1rgY9CCF54c_Pg@shikoro>
 <20250919191211.0ed4c976@bootlin.com>
 <20250922161620.03fa8d8e@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RHfAQ3LcjS2qKNkM"
Content-Disposition: inline
In-Reply-To: <20250922161620.03fa8d8e@bootlin.com>


--RHfAQ3LcjS2qKNkM
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Herv=C3=A9,

> 		/*
> 		 * interrupt-map has to be updated according to GPIO
> 		 * usage. The src irq (0 field) has to be updated with
> 		 * the needed GPIO interrupt number.
> 		 * More items can be added (up to 8). Those items must
> 		 * define a GIC SPI interrupt in the range 103 to 110.
> 		 */
> 		interrupt-map =3D <0 &gic GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;

Thanks for digging into this. Gievn your results, I can live with a
minimal interrupt-map, but ideally it should do nothing instead of
mapping GPIO0? Will think about it...

All the best,

   Wolfram


--RHfAQ3LcjS2qKNkM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjRXToACgkQFA3kzBSg
KbZrJQ//fMsyzEgSboD4Ldh4yo6rXIxydhNXqQxq2x2GUmk1OmIP0SheZAgM3e94
PoSmVEz5zPlu3kLFlK3VPWm5HCuQDOXK8U3+1yc4e38bJmfVjW22UrY76zA5ib3M
3lNDkn+A4zewK50QTxRRgcHYU03K+Ud+ohle/YX0oaf82J5NRdMvyAbOgwKdsgbL
ZEPQsXx53uLD4XoAsqJCBnonbPgh6+zDCpjIoDe9/43SVA2gzPVWgB3hENOM4ICK
KDApwZEli6faEEzi+Fg8xhTgtsVNlmOTPkjZnnxrJPUhKuWKmRilJHeyUXpNvfB1
SdEzgynB896ZrGg7sqpmiBIAnDww+Ov4tVtTtN5X34Il/4/vwQC0FJQiCalhE7Hl
910Z7paHwGcmesMQtBSdgSGJR3dO80b+lFddm5yuEzVG21u4MwW4/Guhh2feTd22
nzJ8YfKYUPQwPLEld420CoTrE/DM7BywqumFdoyhkCcl+vgAQ2Dyc8/ejnk5hN6z
YO/fzsLEFEMUiZ1xmnJk20V9FNdtNPIH/Xl1U34KR2HAF26MQB52W75WDar5kZV8
GMdFs/xrIQJwupTbiHEuhHUKdZRQRRXto70mlOKymXPuPrNh7vGsQVMtHgmhpD9U
cItO+v9z9AeQ2PNy/wAaUfwSj0IajwCbEN5hq81deMq/z3TjZGc=
=xbU9
-----END PGP SIGNATURE-----

--RHfAQ3LcjS2qKNkM--

