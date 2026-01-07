Return-Path: <linux-gpio+bounces-30236-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C00CFFDDE
	for <lists+linux-gpio@lfdr.de>; Wed, 07 Jan 2026 20:55:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 811C632ECC9C
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Jan 2026 19:21:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84D1233557B;
	Wed,  7 Jan 2026 19:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="c7HCsouJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D154A334C1B
	for <linux-gpio@vger.kernel.org>; Wed,  7 Jan 2026 19:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767813640; cv=none; b=EHUPev5yHAQ3vz/BJc9PQKQcoS0bisw/7ZbUi7jCI8z1Srs2XvhZc8b16EkoG1iXbmcv9e2p+VpmbxqxYI9LlS+Y/X1P30EMYTuXf2+FE8hxXh+y41CdaNXEUiwzgVLLNSkWVt38UGNr9WxqIszy7Ae4+DEylWPh7WdRr5WgqPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767813640; c=relaxed/simple;
	bh=x+dlnWr3s7D3BsixgplAk7KJn6o/+RLxfLcPiqaQsZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CYcHtDbVbXyoVx1smrcEzNnqNg8tdYal9doUihj/qembVF8EkluT0tgCoaWJrOH59MOk+WydbW8G8+WHOIm1mMTsQvntpzW2SzIE147TmGXzV9HRoRSjXuzX7X6eClPLWLhQvKD5MjhsKT6oNC2mocmfgbt3+kT4zsVjeCLwwrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=c7HCsouJ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=8S+Z
	Ehb/OyuFDEP7reAgW50H5fLpJDiLAxo6RAat56I=; b=c7HCsouJtzzz0Y7uJdlf
	K4lSjmiCdtcFXAmzmbz6OUnots0OYzxnSO8+p16yrVqR8jotfug7Eb+Qq53GDJ8l
	iyfJexdJNYOuDLDim8y2uZW1NUgUk5bye65Chu79J3HE8JsR4xQWkP+Dxeo+rja3
	OhOKZjVaVzycrsVwI/9RTeFMgFDgEJbyksIcrlLXAA/niSvHNjPaZN+nHIzCYgnQ
	qUuzw1aAkPudtUfhJ1aeCk4TMf0K/SdIlQGPJoO4vWCKpSgnRT8Wg7zpU9Uy1mSD
	Dpb8v7YiA2HMt3xltcKPrXxdaAAyBgw3+syPTRO/NCsl7Hp6pIJXQJe/YCI1lH98
	1w==
Received: (qmail 1246597 invoked from network); 7 Jan 2026 20:13:53 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Jan 2026 20:13:53 +0100
X-UD-Smtp-Session: l3s3148p1@A6TJF9FHILsujns3
Date: Wed, 7 Jan 2026 20:13:52 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Rob Herring <robh@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Saravana Kannan <saravanak@google.com>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v7 0/8] gpio: renesas: Add support for GPIO and related
 interrupts in RZ/N1 SoC
Message-ID: <aV6wcIE0D7ozKeQn@ninjato>
References: <20251215142836.167101-1-herve.codina@bootlin.com>
 <aUZEHSNqiMuHrCWb@shikoro>
 <CAMuHMdXTZ2LDs-nFQRh+Q5YAW_LD+j6j=Mzv0RxyB-1wnJgbuQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4mNGKgcTAdepvUxW"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXTZ2LDs-nFQRh+Q5YAW_LD+j6j=Mzv0RxyB-1wnJgbuQ@mail.gmail.com>


--4mNGKgcTAdepvUxW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > I think this series is ready and I would really like to see it upstream
> > soon. I wonder, however, if the path to upstream has already been
> > discussed? It touches various subsystems, so I don't see immediately who
> > should pick the whole series? Or if parts should go to different
> > subsystems offering immutable branches? I bring this up because I want
> > to avoid losing a cycle just because this is unclear...
>=20
> We actually did[1]. Unfortunately that plan was never executed.
> The DTS patches I can easily take through renesas-devel, as they have
> no hard dependencies.
> For the remaining patches, I see two options:
>   A. Rob takes the first two patches, and provides an immutable branch.
>      Then Thomas takes the irqchip patches, and I take the rest.
>   B. Rob and Thomas provide acks, and I take the whole series.

B) should be the easiest for everyone. Rob, Thomas, are you okay to ack
these patches? If no reply here, maybe a resend is in place with proper
description of the suggested path upstream in the cover letter?


--4mNGKgcTAdepvUxW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmlesGwACgkQFA3kzBSg
KbbruA//Wmnbt6VFSWKA4meDaNZAI5ecD1Fq+NufGvLiPci651D2+M8jBbWZe/w/
jVRpe6iEhCmjltaRzlQgWm5WGCxt82UpOSMR24li+fXjzVIEcmJrx0S+rnZ6VAnJ
HQ8tbgmP9glunijCyhyc1DIiiQrdP9JxH2CBdlaB2K3YFjML2dvAVjAJwIDR5G+e
QjFKcE66CPuBF0SKutD3unUBWGNFz2b3kiRhlkwin7S7+FjlS+pH8oYTc+k94j2k
GtH5m8fniVwk9HU70WQeyZeNj9OGWVrGlTnBVS/DOZqUCPrv4wuFCQXiqniTWNHb
JrW+Kc82BBFqMI0Dxq8XYzoQwRue+ODr5js+mUNNxpC0GifdCgfhAM4JhWgo2Xqa
YJmotsVspbHPDlzL4/uVQ1krj+0AIhJtkaIH97DrqW5xV/VjKxr1UFkO1DRlusFQ
L2lAn3AsYefBrG7D4zSdB+qh+4ajDJuW8tcRs0kfiTazX6w5EBJPlAW9DoPEc1wh
QT5Kap5ogtk07f9fyX1TcQpFgoSwzYvSDnXLhKTexRMNBs8z9zp1JWTa0X54EaEk
fAXgUewUUKg7pJpciS49Z+otVKvEAV5FX+jqUB0+yq3PLd189dvp0D3qncly5roe
7ny7rOygX00p3jSBheP42asd3HW3ODPbjUWhCb5ZyeMVtrFSIiY=
=92nq
-----END PGP SIGNATURE-----

--4mNGKgcTAdepvUxW--

