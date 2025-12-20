Return-Path: <linux-gpio+bounces-29774-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 18170CD28DB
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Dec 2025 07:38:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2135D301B2DE
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Dec 2025 06:37:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 609AC2D323F;
	Sat, 20 Dec 2025 06:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="WOizmnsR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA01E6FBF
	for <linux-gpio@vger.kernel.org>; Sat, 20 Dec 2025 06:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766212644; cv=none; b=JKY1KhmwGKA/ymWBRCQ1+cdaBN5QJ2XQY4Zfc/YLAG0dnEnVrJ+5nWYrThGKAvRT+xLa+r6udWV9fKwUchunDUOpbS/Bi50gUTZ6UBV/fr1B29CYU4dZAZa+B5b0Ey6wNI7HD+I8ELr60LMw+YXhibb5Vob4pg8saRmkgu6el1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766212644; c=relaxed/simple;
	bh=1HlMZWahtRvh+Ai513lS0tzSC5dyyJiSqSEoXVWOF/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xx/qqGnpgXXFZ6YjhWt5yc+D1/TJ8nTrT1AcOw/y0ObGdzUpeylbj9JugpNXMa9QfYahVH27A5iOUEfC0GwrY2mlVCACiwTxO4bdDKd+D7/wtmgjj5JD/0sQiZmGK/MtSixn5XFNZOVtElYTPAOA0hf3TUMjJ3N8qN3LjlDGWF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=WOizmnsR; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=V9y+
	4bscS0CJHdi+P0/x/9KKTnQnOz39HudTi3/RFvg=; b=WOizmnsRwmn0XH5dXLk2
	/QpHoiSnoC17yMMbY52CDHDGfxpCKKdbU7bskF7H+6Ptrbv6kQz21jcMhQgW9Mxz
	rSf8whVYYwtz57tEXOua7Cftp/utZswPu3Fdmr56IjLwsaKL9UNePj5wPjIuKQkX
	1fYp4WKYsCQwDCFrcM5s5GUmjgX6WigkSuR1r1OUL3V+wgcwcU/C2zZ+PLJoS7Qp
	5jvzsr+7zGxhmCqgrBORJIyZkAUUE4/OCj/3qMgUr/aNS5d+NcA2YBxBxRPsZHSV
	pK+IqcGlyt4F9Ddhmhd97bOgETFmInLvHTjBByF0B+ABEnwzD1AAaY51+DKB+EuX
	nA==
Received: (qmail 3007298 invoked from network); 20 Dec 2025 07:37:18 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Dec 2025 07:37:18 +0100
X-UD-Smtp-Session: l3s3148p1@E6febFxG/KsujnvT
Date: Sat, 20 Dec 2025 07:37:17 +0100
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
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v7 0/8] gpio: renesas: Add support for GPIO and related
 interrupts in RZ/N1 SoC
Message-ID: <aUZEHSNqiMuHrCWb@shikoro>
References: <20251215142836.167101-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j6oHQz+2kkABOi83"
Content-Disposition: inline
In-Reply-To: <20251215142836.167101-1-herve.codina@bootlin.com>


--j6oHQz+2kkABOi83
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi everyone,

> This series adds support for GPIO and GPIO IRQ mux available in the
> RZ/N1 SoCs.
>=20
> The first patches in this series are related to a new helper introduced
> to parse an interrupt-map property.
>   - patch 1: Introduce the helper (for_each_of_imap_item)
>   - patch 2: Add a unittest for the new helper
>   - patch 3 and 4: convert existing drivers to use this new helper
>=20
> Patch 5 adds support for GPIO (device-tree description)
>=20
> The last patches (6, 7 and 8) of the series are related to GPIO
> interrupts and GPIO IRQ multiplexer.

I think this series is ready and I would really like to see it upstream
soon. I wonder, however, if the path to upstream has already been
discussed? It touches various subsystems, so I don't see immediately who
should pick the whole series? Or if parts should go to different
subsystems offering immutable branches? I bring this up because I want
to avoid losing a cycle just because this is unclear...

Happy hacking,

   Wolfram


--j6oHQz+2kkABOi83
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmlGRB0ACgkQFA3kzBSg
KbbwbQ//SCFU0J6gWah5tY7PtNRIzSBvqewXk63pMAFgLp4DHd1yEHcBQvzfx153
LKjajg1HlsDg6mN5CJ/JX3LHkq+PtE++cS7i3C6xYUTuodK4LkiBGzohO1+ILKXa
v610Dx/JDk9y3dDjakt9lymZv6QanP6TH+KNSCpWhDckFq5J11kpusg7SRwFf57W
Xny/VgSybsZqUFsNyQCG8omjcs9VpYh1/qteNU558YdllEi9iypYzEZQMB54RtNM
WJAXPkfr6hOVMcEE8cuoZi4bMMThcEvsPhrYUyKi3iebd1S6eqCjEefRI1n+DZtj
h1FYVGiYbE83QQLcMzR4owIN+J9SnRygzA6OQS7Fmvh944jbcYqa3wL3bkffjqQ3
aPeyeNAQX35eFDSqQpkwA+vJ2GFsiYtQvwdc12ZE2uaeuTwmdTjBBlups4LEYGSn
9lPQ06TzKgTuzEQQkdMA7stOm3BRWoNzLso+KxZeTvrcdND+t7fZlRAz90HL9Ukc
iXSPm9fCviHdMKvcuyGubOWOvqI3xA6giDkMKlrcaY1nG7BcPFa+cIZyR2WwT4CD
k4zS65bJop01Vo2Z9xWPxJljBPAdc7wj8vuKXqf4PR6Cwq2dDEN62W9TmkWzOcOu
XecumH8Trxjg9RWd7FCokbE4RyF7qaUeSjnSS0Imala9tubJRI0=
=h9Qn
-----END PGP SIGNATURE-----

--j6oHQz+2kkABOi83--

