Return-Path: <linux-gpio+bounces-14322-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0FC9FD6B6
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2024 18:42:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BBDA3A2989
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2024 17:42:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E0161F8694;
	Fri, 27 Dec 2024 17:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uerjnRn9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23FD1FB3;
	Fri, 27 Dec 2024 17:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735321342; cv=none; b=L801y9ufbTGKyalWW3C40SpLiJ4vAA2JlaqF0mB5GvZRR8D5JX6PANKQFwHGAJ6WmFX9p1IiDpcJNINkyAfHjFNfVLWOm3yqSktvveCjHtaXVgohDjC1qTi+ObxHs+poV5ydX5dtEC5ylu7fFrTKsKU7bBHtXmakSS98lbgie4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735321342; c=relaxed/simple;
	bh=0bFdHqCzn5f2CvXlfqGybIGbQK8L/GTLyJ6yIAZPZGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CqTuIyWLQTrY12Cyk2+00snUpUurTqylBk5/tkx2sd01epGTZxCLgnaXS69PnriL28TmqfizkkhSWIpPQiFTd8N+Yr3olLIbd5j58krnCOlDxEVH5Hv7ZDlPXZsyIq75ekj9F8BsBSu6mb9fVyUU3zrPtb3cUfxLG1LldFkr25k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uerjnRn9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52404C4CED0;
	Fri, 27 Dec 2024 17:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735321342;
	bh=0bFdHqCzn5f2CvXlfqGybIGbQK8L/GTLyJ6yIAZPZGs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uerjnRn9qAtLEzUGvZUSOs4DGdLkb3mptAl+BnZV7M2SiEq/UIHP/l0jB2/M0W039
	 cJliRm9pTDW4UIfHiEjFo6x8zVtR9urPmcZNvivkXRGKgTaBmSVnVtlQZyurpnuZH7
	 ENOWgO44kAx4z4xp0qAJtcVsJNdBm7N90JE935SHx/bA/ZVe2hKaF3LcOMU7Hh1MYg
	 Ro8u/DqH21EFFVPzpb1bZmIkCLZ0fYL8S/r9GY7DpWgmluLOItuC9q2xLHgwIS4kkJ
	 jJhuQMuzsppKHclV2BRo23cKrw+fR8CbGdTG3n90j3sMPl80w7iYFi70InS2zL3imK
	 WJKmnYJPtwe3g==
Date: Fri, 27 Dec 2024 17:42:14 +0000
From: Conor Dooley <conor@kernel.org>
To: Parthiban Nallathambi <parthiban@linumiz.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH RESEND 01/22] dt-bindings: iommu: sun50i: remove resets
 from required property
Message-ID: <20241227-backward-sandfish-3734dadba8a4@spud>
References: <20241227-a133-display-support-v1-0-abad35b3579c@linumiz.com>
 <20241227-a133-display-support-v1-1-abad35b3579c@linumiz.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jmNM+Wy3mOmacT9A"
Content-Disposition: inline
In-Reply-To: <20241227-a133-display-support-v1-1-abad35b3579c@linumiz.com>


--jmNM+Wy3mOmacT9A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 27, 2024 at 06:30:50PM +0530, Parthiban Nallathambi wrote:
> iommu in a133/a100 does not have reset control. remove it
> from required property to make it optional.

Merge this with patch 2, making the reset required for the existing
devices and not permitted (false) for your new devices please.

>=20
> Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
> ---
>  Documentation/devicetree/bindings/iommu/allwinner,sun50i-h6-iommu.yaml |=
 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/iommu/allwinner,sun50i-h6-=
iommu.yaml b/Documentation/devicetree/bindings/iommu/allwinner,sun50i-h6-io=
mmu.yaml
> index a8409db4a3e3..03176f68485b 100644
> --- a/Documentation/devicetree/bindings/iommu/allwinner,sun50i-h6-iommu.y=
aml
> +++ b/Documentation/devicetree/bindings/iommu/allwinner,sun50i-h6-iommu.y=
aml
> @@ -42,7 +42,6 @@ required:
>    - reg
>    - interrupts
>    - clocks
> -  - resets
> =20
>  additionalProperties: false
> =20
>=20
> --=20
> 2.39.5
>=20

--jmNM+Wy3mOmacT9A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ27m9gAKCRB4tDGHoIJi
0gDTAQCkD8Xhuyviy0vhXeZ4H+KJGL4kLQQgH/BbJQrWmtEiKgEA0tU2Y5TQpef1
SQ6NyzqbRTQrGqT89fyibG21/6vErQs=
=VGkJ
-----END PGP SIGNATURE-----

--jmNM+Wy3mOmacT9A--

