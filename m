Return-Path: <linux-gpio+bounces-26403-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B234B8A647
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 17:48:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1AF51C840BC
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 15:48:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F74E31CA4E;
	Fri, 19 Sep 2025 15:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="iRx/Ku4b"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F72A314D33
	for <linux-gpio@vger.kernel.org>; Fri, 19 Sep 2025 15:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758296912; cv=none; b=rUIxo6U1RwP8J0JaTS/SZHlKQuCqK9Iiwe42xKkLa0IGerze4iOb8wnPnfAv/x8fXMPVzWeCSPFBuWzrd5xYTycgSXwO+msT+g35A63KBiAniuJSDnlEXJWAF9yLwubqZjBG+p4nPewx4eUA9T+/WjwfqDmhyv1wtpkafWWPEdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758296912; c=relaxed/simple;
	bh=u0vGF1+Z1rrRnWW+KC1hbB8IFqjlexdvrw2BH4hB5Lk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BiNqZnUtQs7DXVaaLTNEKr9Hs0d2fKSqLNpb2PVro16SiqNtN4A0+hP+sUw0XjbfSGaMnhcI7lYXeCHNkVc2m6bwlOPcbLSctzXwTs8/svkxdseWx0zs9gZXlDHisJCVErAG8kEBvm12oO81nhDtQzPXmvW3MsZwX1Pjbn9d9PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=iRx/Ku4b; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=u0vG
	F1+Z1rrRnWW+KC1hbB8IFqjlexdvrw2BH4hB5Lk=; b=iRx/Ku4bNLZg+n2rHgKS
	qAxbw7syg0QyihGUmqyNwUuEfrXC3WL29J5ndVK+RcHw0BTTJ4IXuQQnltJbuTLD
	lOrhO4Je+JGzMF5A9yiM1tfcmsDkgMQBaMU5yBm4zfz97qHmoRE+Jpf6Ezy667XS
	PDS77XcKmo8l/DVudCIEHeajrygf6D0IZrjNxAger6pZujRzW6HvY11CdyT86ruw
	zdFEfvaqWZIpPGr15ngwW3wH4obAMPeO+pY9P56OIrsSLTjyToO5J0U0D/43j4tl
	ZHdb9CaKKJUSFBSTo2aawhgz47WdltyOmDNvtWrGGbLN+u/KCbBxH3bx7/hvBKHC
	Hw==
Received: (qmail 3968457 invoked from network); 19 Sep 2025 17:48:28 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Sep 2025 17:48:28 +0200
X-UD-Smtp-Session: l3s3148p1@4kOaZik/5LwgAwDPXxLYAMR913XberYj
Date: Fri, 19 Sep 2025 17:48:27 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
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
Subject: Re: [PATCH v3 0/8] gpio: renesas: Add support for GPIO and related
 interrupts in RZ/N1 SoC
Message-ID: <aM17S8VWTNvPAaDN@shikoro>
References: <20250918104009.94754-1-herve.codina@bootlin.com>
 <aMztGzYMHEPL1GVt@ninjato>
 <aM0ltldIXG5gwsDn@ninjato>
 <aM0ocJOCjctW6Lad@ninjato>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2paa0KuInPy4P9RY"
Content-Disposition: inline
In-Reply-To: <aM0ocJOCjctW6Lad@ninjato>


--2paa0KuInPy4P9RY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Maybe I can test patch 4 later today on my RZ/A1-Genmai.

That needs to wait until v3 of this series.


--2paa0KuInPy4P9RY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjNe0sACgkQFA3kzBSg
KbYi2w/8Dg1l6YOqbIoSLU0xqdeJfmKpPpzvmGsJBDAym+QXKjw04nDtczDHi31J
ks2l6oz9NznwoqNRgT+ogoUGwBPvAdxQPqskvA3d3jvUm21ItVRU/xsNWh6S2a2Q
6bIf1uNAGe0qwSrUbG6aW4Ov2NvnLES9qwoNz/8f6Y5rMi+MP52xIXYzg/C8uOYk
22qjFaUblYXQ+V9Hc8WPl2WRPiTbwwhN3rOwt3wc6N+eBeu5RNBUv027O5uUBQ+c
wiDLqTexGA5vifkyRUIF42a/JKT3NQF3ze8wHqOnNA16Q6ZLDoXjWyaFwvokoFGM
k6E4uwNm4Nk5JcO5anfkSiOo15cyTFL5WEkwKgpLSfdfDeCwGr7CLk/0pn7Z26EE
uFsDAwYwKnHntNGR6MTdMvoS8RJzSvifm2c6KCDEMqfm+YxYv/kLmNqBL9FQ/73E
N4ZEOC9PyugOKSL6Yvrc/Boic9OOi+uXLeH9aJPgLR0d+6IXO5e3JlN2BT1yg94r
0op4weAOBzFRSGKs7G/cS7rrkfU2h/20rCF6Xuzi6n7KLp8ErNQ8G8iNSoG1CyfL
C3pj//s56DeJs7kUxhlwlYRF/JR7h3i1jEkjuCLqx2755lOhBx2iNNXEE5pFT6dI
15dv1syP1JaeUIb+aFbEyuTnuNwwdoUn35Zd67yShVB7x6gX/MU=
=te5E
-----END PGP SIGNATURE-----

--2paa0KuInPy4P9RY--

