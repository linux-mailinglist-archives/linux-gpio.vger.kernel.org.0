Return-Path: <linux-gpio+bounces-27567-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC18C03139
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 20:51:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64AD43B0F60
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 18:51:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 563E034B433;
	Thu, 23 Oct 2025 18:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="unAoiFqn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C40634B198;
	Thu, 23 Oct 2025 18:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761245481; cv=none; b=U1auBiLQCq9fo2Zr0BFoZqAnmIP/tIB4NEIrOgk0Osu4WYyb+ft4DuMDiA0KUcCLm8vscmWnbE8C9vi5WLnANh6Xn7i7ZoVXUZ/KsuceBbxFbgllFbp2IAJuD2aByk8bhCCnC08eoNsfRJmcgnn3b1XmwqXOYO3C40tSJqoMFyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761245481; c=relaxed/simple;
	bh=yAejfUUJiZAgzUJl4W0A3yvw8RvHpqUlB31kTfBanNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JU4Zyw/MKjU5oevgJO5+uYuR4qig8LjjHeBLOCf+tmxYBQ8IZ9hGlrLc4ujPt98E+dhkmM2rQPB11GcrGZwX5h7RgBSwjkb1+8WKJvyAnQsWsJqePfWBAKR6aG88IVPqe03Ts8x3M23fj5VyeqA4/GjcQ0hmwyyWqepcgTJY1zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=unAoiFqn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9DBAC4CEE7;
	Thu, 23 Oct 2025 18:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761245480;
	bh=yAejfUUJiZAgzUJl4W0A3yvw8RvHpqUlB31kTfBanNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=unAoiFqnIfbe471o7fJlWt0tAhvCj1MoRL5WGN0y+nI2rEaYyl92d3lqSkOBPLkJx
	 E4v2EsiffVLRvDCUEm+PuXMOmN1Smby4jg9/3GF86ibNDRSwTDQ1TtgTFSBmJXFBNj
	 BgCZ425F7QZN3aXLjcR6zgHXO1Po3s6/D/i0sXb0JZBX9RIL1PNaSHt0BEg9u9Mskd
	 /rvqTOF/RDjTM0YEFtro72z1H4VVp5EMcJuwFMxsSs+zlVzqNm2zp+HHrczfMBNL1S
	 Zs7wmGYy8OhMe+l1QE5dybFJYUhqwvZt8YX6z+GqiDxJUoBUD61Lq3O4cLO9qr0ZhK
	 CwTBrW9V5bKFg==
Date: Thu, 23 Oct 2025 19:51:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Fabien Dessenne <fabien.dessenne@foss.st.com>,
	Valentin Caron <valentin.caron@foss.st.com>
Subject: Re: [PATCH v4 04/12] dt-bindings: pincfg-node: Add properties
 'skew-delay-{in,out}put-ps'
Message-ID: <20251023-gab-applause-77043d499529@spud>
References: <20251023132700.1199871-1-antonio.borneo@foss.st.com>
 <20251023132700.1199871-5-antonio.borneo@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="T0BViuTcQBVHwGVl"
Content-Disposition: inline
In-Reply-To: <20251023132700.1199871-5-antonio.borneo@foss.st.com>


--T0BViuTcQBVHwGVl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2025 at 03:26:52PM +0200, Antonio Borneo wrote:
> Add the properties 'skew-delay-input-ps' and 'skew-delay-output-ps'
> to specify independent skew delay value for the two pin's directions.
> Make the new properties unavailable when the existing property
> 'skew-delay' is selected.
>=20
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--T0BViuTcQBVHwGVl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPp5IwAKCRB4tDGHoIJi
0pkRAQCj7Ijye/ExnUsIE49cWonr9m6YS7a4wxdPBucoJ2MlggD/cPri8HMwGWK7
GGWHxrCWdfLHkTbJxCga1sVo8V4lJgU=
=q/g5
-----END PGP SIGNATURE-----

--T0BViuTcQBVHwGVl--

