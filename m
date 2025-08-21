Return-Path: <linux-gpio+bounces-24770-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB72B301CA
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 20:14:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1B5F57BBB80
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 18:12:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4514343D6C;
	Thu, 21 Aug 2025 18:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u8QczOCu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B543343206;
	Thu, 21 Aug 2025 18:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755800053; cv=none; b=LVs+4nhGp72gGTgLpFRseVLO3lRyhnRiBcBgGE6p96ypU4y1nZAPrlNwE/kKectILTL4UG870zm2yDfg7awCcJTBk4tc0Isa/z3TonGDy9sotrkTlTvDQ6sLQTO8RITrjc8Fl4fSCiwXQKZoemFLxue7lzsJc5+UxLRNM9d5QtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755800053; c=relaxed/simple;
	bh=nBWsjCFrH9n831mWGNuiepEV6u0UFeNqezMi0WiliNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aUhd2P1LdGWpfabtveJnpoxAnoTszYYjcrUpGJdU+VBsqV17BCe+peHc7hlbGgr2jRrH1F8moCppUiSSAhDlExPtM+oJQl1rNoE6KExf8IecSRhL5cw4r2oHpMVJvH5CxCreBfb5d1vb5mAaflHkrBHWbGMjJ9pZyB5gU1ERaaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u8QczOCu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC7FEC4CEEB;
	Thu, 21 Aug 2025 18:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755800053;
	bh=nBWsjCFrH9n831mWGNuiepEV6u0UFeNqezMi0WiliNU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u8QczOCu3hUV3EkOPZUZoDb6NG/gF9OkmSC6u9l6/LSrHjBoxfoLrnSur8aZwduuU
	 3iBm5CHqlpmIp88XTqjKZmv56SEDkoMIwKB2Ury1FTapOrxBWHEbdLwRuYdKd4AUOK
	 ECVewGg3dzWJSlvysrqItlyGL5U4TaDsfXFPOCohGVwnOhM2K98k5wSsBVdjuWHWwL
	 lkmvza+LcbhIy1RtJ698Ce0Vdty77capjEf3jmeFMQbXOGb4BG146PftJmWFViZxV+
	 x+Z36fIOs9cMxtOvAtI1JXK12jGd7IBeIFKv8Sn3QrmQ+N4fMSYSUUAvERID6foUmk
	 UM/Dc2Lidj0Rw==
Date: Thu, 21 Aug 2025 19:14:08 +0100
From: Conor Dooley <conor@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [RFC PATCH 7/9] dt-bindings: pinctrl: add compatible for
 Allwinner A733
Message-ID: <20250821-pancreas-unadvised-301d1c97d893@spud>
References: <20250821004232.8134-1-andre.przywara@arm.com>
 <20250821004232.8134-8-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fN0j2auDIV16SvDf"
Content-Disposition: inline
In-Reply-To: <20250821004232.8134-8-andre.przywara@arm.com>


--fN0j2auDIV16SvDf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 01:42:30AM +0100, Andre Przywara wrote:
> The A733 contains a pin controller similar to previous SoCs, although
> with a change in the MMIO register frame layout.
> This SoC uses the new style of DT binding, where the pinmux values for
> each pin group are stored in the new "allwinner,pinmux" property in the
> DT node.
>=20
> Add the new compatible to the existing A523 binding, since they share a
> lot of features, including the number of banks and clocks.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--fN0j2auDIV16SvDf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKdh8AAKCRB4tDGHoIJi
0lKcAQD8RyJydvqrkR+jJa3Wl0CkRS+neXINdwjdjqrN8vpVvwEA5y2g4dnXspVS
iaMQLZXHzU4D05bspJveUFNNS+RimgQ=
=OXBk
-----END PGP SIGNATURE-----

--fN0j2auDIV16SvDf--

