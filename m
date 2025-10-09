Return-Path: <linux-gpio+bounces-26951-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AAABCA4F8
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Oct 2025 19:03:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 527163435D2
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Oct 2025 17:03:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 529C523BCF7;
	Thu,  9 Oct 2025 17:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gmhMLwPW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD4315E90;
	Thu,  9 Oct 2025 17:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760029379; cv=none; b=m0bvMzMJSbY47XGCtjR6bfW9jtIwcfCZAU3vgVoFidGDH7X1wRHO0hJlx+KB07F9w7i1YeB35LGRuNnCGEezFD0T9U7S/Al66TJd/RXWuwmVFY0c+McIptvKWqvRjtZrDxdmKjqVM03a5gxyMNUJx5ISexKMFE5OaCnFU15MgZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760029379; c=relaxed/simple;
	bh=CuPJwPQaNVIp3hY6I0ilMYciVhwSPCyur8NOlazcDsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jJZo5O3Ni+oslnD4tWOfdYaTMnuecX9YKhNSmiuVA0ax9sxDiFo5dxQLjP3R7Xn9IqEmnylahYlVXPGgD704nD2UHaNWP6487CfQsrWvUNLyzIfC4ccmLGHbIkCRiG/1cauh7R1q1KNDFJze1mSG9pcM3HV91J4u5SImmgSGdI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gmhMLwPW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98A7DC4CEE7;
	Thu,  9 Oct 2025 17:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760029378;
	bh=CuPJwPQaNVIp3hY6I0ilMYciVhwSPCyur8NOlazcDsE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gmhMLwPWUgZNhmXKJHZbPHhNG7RPCnqifoKOQeiolKjtiJSUuZiBCpDUWHHH/YZ4g
	 f9U+fGjqSrDWxVLOBatg3qI67patjZf+MXsbirkV3VMTJVRXgylrUDxqQwLlSTZQiJ
	 nqxetvkQYaMcc2tbuGiuqUzLWM90TNbG0z00yz2XbvSmXhL1xfPSx7MTzNDz5y8eC0
	 yw4As8939N37U7HtitFC2C1Mf7a+Dbpj/xuj8veR5/Ez8SaSokPhboNwrW4SJh5uYD
	 lPkcV4OnOBmp1X4sS5zxKW88sEasIN4KJpAGBf+S5ifI0QRKQEGqh/ZZ0hIyfcfoMv
	 9KtH2Iplk5qFg==
Date: Thu, 9 Oct 2025 18:02:50 +0100
From: Conor Dooley <conor@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jonas =?iso-8859-1?Q?Schw=F6bel?= <jonasschwoebel@yahoo.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Aaron Kling <webgeek1234@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v4 22/24] dt-bindings: display: tegra: document Tegra20
 and Tegra30 CSI
Message-ID: <20251009-steerable-babied-7b5f7a2c58da@spud>
References: <20251008073046.23231-1-clamor95@gmail.com>
 <20251008073046.23231-23-clamor95@gmail.com>
 <20251008-canopener-marsupial-a92355b656ef@spud>
 <20251008-broaden-antennae-02de66094ad3@spud>
 <CAPVz0n1NYL+t-KC1FwHYXuQ0C483ay3g8zP4SmBKVC2rh=x4Bg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HSF292molu88Asuo"
Content-Disposition: inline
In-Reply-To: <CAPVz0n1NYL+t-KC1FwHYXuQ0C483ay3g8zP4SmBKVC2rh=x4Bg@mail.gmail.com>


--HSF292molu88Asuo
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 09, 2025 at 08:35:22AM +0300, Svyatoslav Ryhel wrote:
> =D1=87=D1=82, 9 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 00:=
22 Conor Dooley <conor@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Wed, Oct 08, 2025 at 10:21:06PM +0100, Conor Dooley wrote:
> > > On Wed, Oct 08, 2025 at 10:30:44AM +0300, Svyatoslav Ryhel wrote:
> > > Of course you'd then have to add minItems: 1 and maxItems: 3 to the
> > > extracted definitions.
>=20
> What do you mean by your last statement? Add minItems: 1 and maxItems:
> 3 like this?
>=20
> This does to common properties
>   clocks:
>     minItems: 1
>     maxItems: 3
>     items:
>       - description: module clock
>       - description: PAD A clock
>       - description: PAD B clock
>=20
>   clock-names:
>     minItems: 1
>     maxItems: 3
>     items:
>       - const: csi
>       - const: csia-pad
>       - const: csib-pad

Yes, that is what I meant.

--HSF292molu88Asuo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaOfqugAKCRB4tDGHoIJi
0hG0AP9Mkkygk9Q2BjWzrDg0CFZgtvVwKgrrBLgJV/EnbFfz5AEA1V+4UBvnLGFD
xZ7p4fN/kJGOCld/pw6BT+OMgI/sUAk=
=94WG
-----END PGP SIGNATURE-----

--HSF292molu88Asuo--

