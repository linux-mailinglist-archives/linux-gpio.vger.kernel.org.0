Return-Path: <linux-gpio+bounces-29775-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D659BCD28FF
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Dec 2025 07:42:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 402C830155E3
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Dec 2025 06:41:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D698A2F3638;
	Sat, 20 Dec 2025 06:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="RsO3ahsW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4952ED858
	for <linux-gpio@vger.kernel.org>; Sat, 20 Dec 2025 06:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766212902; cv=none; b=nI3vhlJq2M4JBtt2AR9/Hc6U7NBErn2lmgxzaEp98PDMIR90peiDavWuM1UAO8JMnSLM/EX0pTmkbfMOyReLRmH838wMWUcdzCbK1GzPaJA1s1c8HjUAXDFWLhgZCIoPr33cTxIFNJhZ5w8LdO00K14gbDQ4OYMM8mEvELzuVBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766212902; c=relaxed/simple;
	bh=5BUGE3m1cJV+FhRw1hwF1KEtaIMYn2UR3X1AW+de8Z0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JyMXESQlFbigeaQIl9XxzPBaILYeN5ASSxc18bQQjQoH0FI67KrzHPxhUp9Ly1MKeurQUCaCaLkXcPgWDHPq3qkIkwdST/8V61uRBnER6Ex3dLqnsbAl3ps91ZinVSiZvvvwxP7XvjUHFTFgHp97PsZTwvbo6qWLIJqjwluFcKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=RsO3ahsW; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=5BUG
	E3m1cJV+FhRw1hwF1KEtaIMYn2UR3X1AW+de8Z0=; b=RsO3ahsWYnWHMNgdmXO+
	hWzZtVr1B1SRkwn4l3CgPmJ1beKFD/ndXU2q4r8MsziEuDV4BvZppAOCICKUTQhe
	Yq4AXAYv1mEcO1mtuuUoSdOz3mTe99oWiy2IBxpcl7UFSjfqQ66N4KNLKr4zUmZx
	0XHtevzHKGx+yUKurq3o5/47fhpq6pV62QkYRZgduR4rByJc1V2NKhnlo6SlicPf
	2gPT5r2Kq/BSqk/yiguk8+Hoa/v/NUUgG2SMFhr6f31nbP1pGr5fSg68anLFpTAF
	Ni3gctY47lRyPPH2+mw3gKIRD/cxEYrACwjOcb958wUgUf96HJbTTO0Jn3rRLoo2
	0Q==
Received: (qmail 3008093 invoked from network); 20 Dec 2025 07:41:35 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Dec 2025 07:41:35 +0100
X-UD-Smtp-Session: l3s3148p1@aSQ0fFxGSMoujnvT
Date: Sat, 20 Dec 2025 07:41:34 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Saravana Kannan <saravanak@google.com>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v7 8/8] ARM: dts: r9a06g032: Add support for GPIO
 interrupts
Message-ID: <aUZFHkkDBiE4X7O5@shikoro>
References: <20251215142836.167101-1-herve.codina@bootlin.com>
 <20251215142836.167101-9-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4IlLqTWWmt+Ora/C"
Content-Disposition: inline
In-Reply-To: <20251215142836.167101-9-herve.codina@bootlin.com>


--4IlLqTWWmt+Ora/C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 15, 2025 at 03:28:30PM +0100, Herve Codina (Schneider Electric)=
 wrote:
> In the RZ/N1 SoC, the GPIO interrupts are multiplexed using the GPIO
> Interrupt Multiplexer.
>=20
> Add the multiplexer node and connect GPIO interrupt lines to the
> multiplexer.
>=20
> The interrupt-map available in the multiplexer node has to be updated in
> dts files depending on the GPIO usage. Indeed, the usage of an interrupt
> for a GPIO is board dependent.
>=20
> Up to 8 GPIOs can be used as an interrupt line (one per multiplexer
> output interrupt).
>=20
> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.co=
m>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

I used this patch successfully with my N1D demo board. I will upstream
the board changes once this series hits mainline.


--4IlLqTWWmt+Ora/C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmlGRR4ACgkQFA3kzBSg
KbbqGQ//YdF0gMoEZgGi/3kCJjIAVYhPoanIUWE/cLcstncvcdddPy6NMqv8O3pu
cpxgAZiSj9RKxOMTRbXCcGO/BQaxkV3IUEPn+Po3QjzxDkxzYGBph4o/DwdD/csW
3q0pyp4jMR8bw8wg0egBbs47sB3Hp4aFnwM/n8Ehx5UWP47H8sXH4Ww1V9FtZTfj
23+w9LsHiQnLoU9/L3q1sp6OFeO9iAZvKS8sLaLB0ckQI89o7MlmshPiyTj8kkTz
uOzpKjATUGYVh/T1Hz0yG4R3BpDk+EC8WeywyrFUUawUdbNEUPORlmOLcJMNPW4g
IvNOkR93Xh6Jy4lCQRSx99lR2N/Soqyjk0oMknJmOp3WoAvhJrXeP628X7DYrQ7O
aj1yyApsKBGvq3Eyi+Yz/hzyoWt+agtUzp+GMAbzuOVPoR2oey8QPklTfRXUvKlZ
Mj+EvdM5UHseab8GSHTpFsz3KCqbFP1uifHL0SdEAPH+jLbG/JPuHkVp+ESJZzY7
y64s0e/bvnmDRzo3OOD881lOgo0Giw53134mLv3DweniFnQpnVLju+bpksci8L8d
bAkNPT1ynGMmDwMtMr6zTEjZsHTV7ciiCdUeJ2yo/Ky7p1tjH0JYnlVI+7wsPK1d
TzGmB+tfe0NC2vm7o2AqX9kiaVgrdKSqhPoaj7RZOFUEc7MdcO0=
=ZIt9
-----END PGP SIGNATURE-----

--4IlLqTWWmt+Ora/C--

