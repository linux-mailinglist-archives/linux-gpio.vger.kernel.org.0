Return-Path: <linux-gpio+bounces-14323-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B0F9FD6BB
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2024 18:44:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD4501655FC
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2024 17:44:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55B9F1F869E;
	Fri, 27 Dec 2024 17:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d/lIsLKI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B8C1FB3;
	Fri, 27 Dec 2024 17:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735321442; cv=none; b=Hy/Ngf+abrzbnndhgo92fagxqRdSk8J+GrrU7PIwnwhmWObHUvo0IYSzoFz7h1M8ULqQZgGK3CdWzqeaXcgrfaYcWj6qWZhdQnJsQvNQsI2Lw5cNlKuoIv4kc8y1z96QsP4ex6OP3bc1pb581X2jgInxrOGcH277LMHbXjk8wY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735321442; c=relaxed/simple;
	bh=rVom9/ZZasClWq+RMKE/v1dwwP+Hq6n5W8W09rP7IWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PU7W71Heos2NZ05pHge4OSsRQNayo9AamzvMHcVQ93xhwIY15uXzS/g5JDE44n1JwN/II1tdN++E9iCc3KfuIi6YZ+czbhvVlgbM5EeavIj3zUGsxMdtXb+Lbe/v/a4KJIq4LR9fxx63VxXdc5svrFCmjAr59UIy7wcMqJgT3DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d/lIsLKI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D0A1C4CED0;
	Fri, 27 Dec 2024 17:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735321441;
	bh=rVom9/ZZasClWq+RMKE/v1dwwP+Hq6n5W8W09rP7IWk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d/lIsLKIkBgXKQ34U15BY9lLur9y54xTZbPqCUrcmmK2ht5tdH6XqQTBo2iLHC8IT
	 bUk77LLzfY/XK+BTYPxUmSv5IV+d7yhtyEWHZzthhrcE3Lzx08Sn/D+rQOaQFgfPkW
	 IjCrvyFqLKyEDWzHv6y8jY4XcXEroGzvmNf7RSsK01wrFBESprsDn/GIcLt4RlEQEY
	 UcT9GOtN6QD3rN/PaaiouEAqbPdDRkZaJbyPnaL/4/y6mDB2BpUrsrEnWz9946MTv/
	 87rxQqBFe+U+WLGNikhg91j7MahXyIEO0XrFvFDYH7xGIEM5DZNLq0SRRg0dci09NS
	 4z+1VI1TDGtNg==
Date: Fri, 27 Dec 2024 17:43:54 +0000
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
Subject: Re: [PATCH RESEND 03/22] dt-bindings: clock: sun8i de2 clock: Add
 PLL com clock
Message-ID: <20241227-swept-seduce-d21e6537ddfc@spud>
References: <20241227-a133-display-support-v1-0-abad35b3579c@linumiz.com>
 <20241227-a133-display-support-v1-3-abad35b3579c@linumiz.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0jjBOv89hldoMdhb"
Content-Disposition: inline
In-Reply-To: <20241227-a133-display-support-v1-3-abad35b3579c@linumiz.com>


--0jjBOv89hldoMdhb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 27, 2024 at 06:30:52PM +0530, Parthiban Nallathambi wrote:
> Some platforms like A100/A133 also uses pll-com clock as additional
> clock source for the display clock. This is not documents both in
> user manual and DE 2.0 specification. These changes are mainly from
> vendor BSP.
>=20
> Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>

Ditto here, the new clocks are only in the new IP you're adding so this
patch needs to get merged. When you merge them, make 2 clocks all that's
allowed for the existing devices and 3 clocks for your new one only
please.

> ---
>  .../devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml         =
| 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t=
-de2-clk.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83=
t-de2-clk.yaml
> index 70369bd633e4..3e00905b66ca 100644
> --- a/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-cl=
k.yaml
> +++ b/Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-cl=
k.yaml
> @@ -39,11 +39,13 @@ properties:
>      items:
>        - description: Bus Clock
>        - description: Module Clock
> +      - description: PLL common clock
> =20
>    clock-names:
>      items:
>        - const: bus
>        - const: mod
> +      - const: pll-com
> =20
>    resets:
>      maxItems: 1
>=20
> --=20
> 2.39.5
>=20

--0jjBOv89hldoMdhb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ27nWgAKCRB4tDGHoIJi
0laCAQC3f8JN+f/M1J2eeAFVurWF99YyrOoc11b9kgfjtf1thQEAtw4OLJJ4yje4
qC320wF5zcGFYDEFFJjXa4TfgosTGww=
=cfWT
-----END PGP SIGNATURE-----

--0jjBOv89hldoMdhb--

