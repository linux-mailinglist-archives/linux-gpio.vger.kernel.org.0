Return-Path: <linux-gpio+bounces-18064-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C33A73232
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Mar 2025 13:28:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DFF83AAED3
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Mar 2025 12:27:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E513B213E75;
	Thu, 27 Mar 2025 12:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="cQKVds6D"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B96213259
	for <linux-gpio@vger.kernel.org>; Thu, 27 Mar 2025 12:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743078484; cv=none; b=k+R/Xp4/o7y5vA0h0zRRE8SitMrTGSFTAb4KFI6NzQ898+MZGv60QWwdhHl7fY9tb4e9rpUc5P5fbtyvAzUSUGi8U+MbCo98gxoI964xyhFa2Fu5exxaQdUBa5nwqnV5pw643ietBeK034CurUCDb3u5PtgroqCi2woxBJL0X7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743078484; c=relaxed/simple;
	bh=AaGkFZpautOPtNIWBgWQGF7TfFJYejda7uBwkLDZ2zU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oLGBkQVQRdJ6hhZzMCNJoWjC0EiMWYr+IvT0u55YDVP0dEkPI3B9IMHCYAIf1M62Yw/T2j/NqWxVU2PAu+hqGHVDIEhgFVEEYi3R06X12prtwxQ1QXReKGJiyFzf3FStsmUEbM2cviIF6q8VLWKEKEzX4Qh1PXNe3I34VB2+0mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=cQKVds6D; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=AaGk
	FZpautOPtNIWBgWQGF7TfFJYejda7uBwkLDZ2zU=; b=cQKVds6D4OuSoXyoO/dh
	Yocs56ryHH59lTHWPlamSchITa3MvdPq/qIRCIAfUp08h0k4mFAOcjDcqAaru7Ht
	n8uUY5kDqMXnpqnFrYazLcispEBbUxE2J5f/EnE1uSVFta+lQ1Oz8XkCUMkMwzuH
	uwwUPS+FMHRBCcQZB+N/rWRSk1sSe4kYn8jgzgpie42Tvi8eZy94GG+to1rWlmnD
	y/R4rf0lb6w1KdGlPdpQKvxyrUd4uf3EK0lqeptf4IquuqFAxKUKJzypu0l5d46g
	D6hC9bJfk6brv99nBxJsI1u2yq/SgK6X0eZ/GTQiq8CbkwCjoMhRNjKbiQ8KeHrR
	sw==
Received: (qmail 3987990 invoked from network); 27 Mar 2025 13:27:57 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Mar 2025 13:27:57 +0100
X-UD-Smtp-Session: l3s3148p1@lRR0FVIxZqsujnsv
Date: Thu, 27 Mar 2025 13:27:56 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Prabhakar <prabhakar.csengg@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 15/15] arm64: defconfig: Enable Renesas RZ/V2N SoC
Message-ID: <Z-VETFWFT5NksD7J@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250326143945.82142-16-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <41c6f512-47a5-4723-bbdc-64ed85ae8391@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KizQkLAOEp/210C2"
Content-Disposition: inline
In-Reply-To: <41c6f512-47a5-4723-bbdc-64ed85ae8391@kernel.org>


--KizQkLAOEp/210C2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> So the pattern will keep growing and none of you will ever bother to fix
> it, because you have your patchset to throw over the wall.

I dare to say us Renesas people are not too bad at fixing stuff. In this
particular case, I don't see a wide consensus that the above stuff is
considered broken? Please point me to it if there is such. We are happy
to discuss.


--KizQkLAOEp/210C2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmflREgACgkQFA3kzBSg
KbZr/g//TelLcMOOIS9o8lq5TK9vmeyE5CGHg7W0oBugLs+o1YietMaOgMmPload
EIrIbMkKfNULW7EO2Or1V91Q9RmsjhlFBZKZ9B7n0VCogzfKe82UO4wzmqbVyta0
762BIRFYHnKMrH+YSNe5voWIBoy20Tf3vqGIuDdi/G7feHmkogAsJQ9klyU3QU/S
hDMgHtDa5amsVteTic6S55SnWy7VSk69q5JSM/BIjoYSxAdPRQI67pUOjDs4lCAk
NChC8OKZaASyPJgkbveu8C9OxSRaVHO+yvVVHkVISIVfXIGBDEEAZoChYtW8ABE0
wcIR7w1u0GulTnI8fdLOET1E+7bQYkxaY7cVTQs1yt5iqa5kBh5+fIAqLR8JEJEW
WHre3BNwkt4TPt4uGPublOrGwDpq5nnPztFBGJAilnersV9dvxOI0+ZMVcZ1LxAi
NcQHe/h+FF7RjAuq+Ho+/4jkQtX+3oJuUXjILIXOjat8JRyJNbD7GUf9BVtO8Oq+
MMWRVWmWUmQNGeb34TYjBt88b6HWvr/qUTi3dweFNJD3i2Sq6xEctt+sU0K214SL
BzES5xCL52LnyR886e1/Wx10E5ITl7Er7+hq4ct1wEHCQUA90xO248jbXgqsDjl+
oIgHCjTHUjt93rzQmKdBCrAouvvIqNi9GwI3K15H/3zmTEDOlZU=
=WWXu
-----END PGP SIGNATURE-----

--KizQkLAOEp/210C2--

