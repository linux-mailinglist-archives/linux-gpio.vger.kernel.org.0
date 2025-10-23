Return-Path: <linux-gpio+bounces-27564-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 01739C030A3
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 20:42:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CA3F035AA2E
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 18:42:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A71692820A9;
	Thu, 23 Oct 2025 18:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZlEhJnah"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6077E2571D4;
	Thu, 23 Oct 2025 18:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761244944; cv=none; b=cdo8+af80bYvvjVRX94SbbkUmVLXZWas3MgbNksUJ7OycbX03WrAGqjWdx48rxiKAHsgPBjmFkd0nDhaohjn36bo1JQANHghrXXuFSHAWjnGx5UqGeZcqCpD8i9WomeypeQUIzApUmekwXjYHcg/r7PeJ4o0RGBPOVLyzVfrCMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761244944; c=relaxed/simple;
	bh=7cg1XT3E5PgSjEeikeZ9kqIVrBH3X8dSeokFRv7rNPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cgeOWHIjJ70o7smL/8NljHR7gmeePX3034cRj0GnmPl6KMokCST7ME2K96WAfj4tH45thcHPFevZlUy0n3kufe5OhxIwT7NFlBCBdbR6RftjY2PH6Bu3deLZAyfddtGVxzN5FQcU/CkddSKN8y10Zc7C5g4yVkb0aGvwPZ/+gJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZlEhJnah; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C92E7C4CEE7;
	Thu, 23 Oct 2025 18:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761244943;
	bh=7cg1XT3E5PgSjEeikeZ9kqIVrBH3X8dSeokFRv7rNPU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZlEhJnahRlAztC+puvhNXPiKdE2U1thO894TnL/x3rf2GRYv8es3HLzcXaT/T8T/Q
	 LXKexrtFE8vvdJW+VtDlR7HcrG+5wIJPi/t1z6Xyi7Y35lzCnXM/MJMGgdOKHxSqFH
	 A/Kv+OLOenPYYFhx9dRrrEVmBbqqmP3i0TNJZLmSj/SMj7SMeXUoHrLdyB2PM9hadp
	 rrXKAC8Ln68DcI1Gf0gjjOF7g4Mxsmf+yOY7/BnMZx+iQ+xbrIB2zp7jYWHhChk/gt
	 NGxYQt8IvsITdpgWeVmYdHQp0BnhpKxcvKYnVEJ6nGg5zJ/yPRJOlu99ZphVd9h12k
	 OcQQuMSbDdYVA==
Date: Thu, 23 Oct 2025 19:42:18 +0100
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
Subject: Re: [PATCH v4 10/12] dt-bindings: pinctrl: stm32: Use properties
 from pincfg-node.yaml
Message-ID: <20251023-twice-brisket-fb7a3f439a13@spud>
References: <20251023132700.1199871-1-antonio.borneo@foss.st.com>
 <20251023132700.1199871-11-antonio.borneo@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bU1dAtIe/+VxJvoH"
Content-Disposition: inline
In-Reply-To: <20251023132700.1199871-11-antonio.borneo@foss.st.com>


--bU1dAtIe/+VxJvoH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2025 at 03:26:58PM +0200, Antonio Borneo wrote:
> Don't re-declare the standard pincfg properties; take them from
> the default schema.
>=20
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>

I acked this one in v3:
https://lore.kernel.org/all/20251014-privatize-unnerving-bb26a0626276@spud/
Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

> ---
>  .../bindings/pinctrl/st,stm32-pinctrl.yaml    | 27 ++++++++-----------
>  1 file changed, 11 insertions(+), 16 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.y=
aml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> index 961161c2ab62b..27c0dd7a8df01 100644
> --- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> @@ -151,6 +151,8 @@ patternProperties:
>            pinctrl group available on the machine. Each subnode will list=
 the
>            pins it needs, and how they should be configured, with regard =
to muxer
>            configuration, pullups, drive, output high/low and output spee=
d.
> +        $ref: /schemas/pinctrl/pincfg-node.yaml
> +
>          properties:
>            pinmux:
>              $ref: /schemas/types.yaml#/definitions/uint32-array
> @@ -195,26 +197,19 @@ patternProperties:
>                            pinmux =3D <STM32_PINMUX('A', 9, RSVD)>;
>                 };
> =20
> -          bias-disable:
> -            type: boolean
> +          bias-disable: true
> =20
> -          bias-pull-down:
> -            type: boolean
> +          bias-pull-down: true
> =20
> -          bias-pull-up:
> -            type: boolean
> +          bias-pull-up: true
> =20
> -          drive-push-pull:
> -            type: boolean
> +          drive-push-pull: true
> =20
> -          drive-open-drain:
> -            type: boolean
> +          drive-open-drain: true
> =20
> -          output-low:
> -            type: boolean
> +          output-low: true
> =20
> -          output-high:
> -            type: boolean
> +          output-high: true
> =20
>            slew-rate:
>              description: |
> @@ -222,8 +217,8 @@ patternProperties:
>                1: Medium speed
>                2: Fast speed
>                3: High speed
> -            $ref: /schemas/types.yaml#/definitions/uint32
> -            enum: [0, 1, 2, 3]
> +            minimum: 0
> +            maximum: 3
> =20
>          required:
>            - pinmux
> --=20
> 2.34.1
>=20

--bU1dAtIe/+VxJvoH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPp3CgAKCRB4tDGHoIJi
0tg3AQD8bWKk/YfN5ZMpkKgIGbTc19jQ0QsVxpdvLl3aEu+5XgEAs6z0D7RrT691
W6QkYi0onTlPEu0LmNwdPXMp2aDCAQM=
=954d
-----END PGP SIGNATURE-----

--bU1dAtIe/+VxJvoH--

