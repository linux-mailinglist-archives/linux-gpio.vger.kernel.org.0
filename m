Return-Path: <linux-gpio+bounces-30547-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EA5D1E520
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 12:09:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2D30A300C5DE
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 11:07:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77B2A392C4D;
	Wed, 14 Jan 2026 11:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="J18n4ggm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECC2387590
	for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 11:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768388821; cv=none; b=QvA0NKa5n9+OUyH299ztpr76v0zr1yl6O9UHXBAn3x14hsgdOJWTrFF8M4NAxqIgpSJwI0vzyGSoTVR3Sg2+6s/l6qFd9P/JFPzvGGIQu6rN1vH6okt1bBDMUKcBmzbEjjkNCp5KdhzbEd2SYeWoEcZHXiDHfgSj+CDuwf3DABA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768388821; c=relaxed/simple;
	bh=lZNQT/lVvB3aRMXapPy5xduNiS/QYtu/j2dRCMggPtk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Va7hwTlyy4YNxRFPtEZXYtSi21IgGCgo3xwFgcvRlTcEeXg8uY3/oBHuxRoJKNBxz30nVNPdK3yvNWHGRjlQWXdDG73ZYU6KPCwtckRDwgHK044DCJaX80ItwjhU5mEZT9zRztyKQ2WnJqvMnEwod2xd8OYBBdDWcBe6LzwZJC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=J18n4ggm; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=lZNQ
	T/lVvB3aRMXapPy5xduNiS/QYtu/j2dRCMggPtk=; b=J18n4ggmxqEwAd771RRC
	jDpl64Haa2Yut/ObJwU0FDpvi2X9JinBEKOGEXkBKNRJcCBL/CZMcocx0hMbrnhk
	Z7uHLFpXjZN9GjkFrHRGsjPmhMAJiGSBPX8iIJhbWu6eCfENkAg3DNiI1yCKui4d
	yTaoQ5XvnnpJmtcSGrvk2IHrEOpVyLQLfI2zMNeFDQN3ve2YMmhOZ432uT/tq7m7
	zA33zcUaj+TIHghjOiN9GkuMOspLnl5wqJeH/KHKf2be96A+pMGxAsXPT4lebNKh
	ebReGpnq+6PUcbYRKWjSknFpxJXui2jUrbfFl+Bt1LT4+nft1c6sEoimTtqccLRi
	1w==
Received: (qmail 2092519 invoked from network); 14 Jan 2026 12:06:50 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Jan 2026 12:06:50 +0100
X-UD-Smtp-Session: l3s3148p1@51PZGldIDNkujnsM
Date: Wed, 14 Jan 2026 12:06:49 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Saravana Kannan <saravanak@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v8 0/8] gpio: renesas: Add support for GPIO and related
 interrupts in RZ/N1 SoC
Message-ID: <aWd4yZA6GXey8Q_S@ninjato>
References: <20260114093938.1089936-1-herve.codina@bootlin.com>
 <aWdp_jMVUBN04is3@ninjato>
 <CAMuHMdWkGevDsBuUs1k=r5yeKJZHvs93b2SDfPwKoF4fFr-3Ow@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZxrGIdy71iEIqHwl"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWkGevDsBuUs1k=r5yeKJZHvs93b2SDfPwKoF4fFr-3Ow@mail.gmail.com>


--ZxrGIdy71iEIqHwl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> The irq and SoC stuff depend on the of stuff, so doing so would
> delay the former by one cycle.

I know, but it is still better than nothing happening ;)

> On IRC, Rob sort of agreed to option A from my proposal (see v7 cover
> letter):

Cool, didn't know this.

> Unfortunately that part hasn't happened yet...

IRC to the rescue again? I'd think it will be easier for Thomas if he
gets a PR from Rob. Maybe Rob should take the first 4 patches even, then
Thomas only needs to review the PR.

Thanks!


--ZxrGIdy71iEIqHwl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmlneMUACgkQFA3kzBSg
Kba3Qg//ZNBhfcFimNZVrYxvCimeSv+NJdUPbyUFaGZIIg/EPKrqrqfLgk1grdhN
fUOL9CdUCGn0jd8UsLfq4PhpZb85MhbFnuiC/WmIxWdiJyYmTLaoYX/d3MKQRaDj
aK19RiPoP24C7UfkuXb+BHTF3FkNdC9fCN0ldcWwiiBO8596sUiDS2TCSG0zJgha
qYnMnCem0suW7orbWHIkUtMqlBJnsWePZkm2WKNqvLDjbpdeu+lMoIwQRWVvHCw5
UM6ODFxR2W5MgvF/JOmpiaIs74GhFPSz44F7ZCrURCkjwpmqKlZoSgcZcVxdfl7z
307ZGTyEw35vX6Y3YQ6atAD+lmr3oyw83VwJvoHc+1q8a5P7Nuc5d7JFeu2PQILs
oolEE/k9px0maFsDFDaG3aCj5kaztlsG6d/CRT1XfnllI2yX0VATv5Ayb/9FkGJX
Ncz9hQq5HtGYXVsE2af5dzsLy784s3ftYcV2OOZdc9a85Mf7166ei4nP5FrodlgJ
FrBEql3NUjyivf51hxk81EgRumlu9lx+B0armCoWadjraRiTm5RVmYNioFFUqNc6
Xy8w3rVFim0J/1U1RevTDFM0dO7r5QWolqDypr5sH2eZn09eWCb/Z65L9Gl0u81I
mCBAzr/P7k4Njb3u0JzMKZqQmsaqI63K3cQqDQWWRipuQ7vxKIw=
=46i1
-----END PGP SIGNATURE-----

--ZxrGIdy71iEIqHwl--

