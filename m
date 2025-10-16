Return-Path: <linux-gpio+bounces-27220-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FB9BE4A68
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Oct 2025 18:42:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4EDD64FA15C
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Oct 2025 16:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 854CB32AACB;
	Thu, 16 Oct 2025 16:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kt+JWI8J"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376262DEA9E;
	Thu, 16 Oct 2025 16:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760632885; cv=none; b=AMam6uSFa64zXUsJ8NOIk6qtGk0L2BiUMbHtVmt0p9Yw4e7rChSuogM9EaXXIE2wqul8fAS/txS1N53l6pXVkJpInXPH0+VoJV8IW0+f8oGFeJkPp9dfGXL11nkqC5ZV35Ef1zU2bq8tZ4j0i0/KflEZQV2BcMG7tOhQOqwvJoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760632885; c=relaxed/simple;
	bh=IbSqzMhYdlbV68FwRqfdNa92zx5pPJVeMmzUDWHgwuE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GHQlKgjL2YQ175av2P48tC+Z7Jdt2hn3YLnKCZamAGAZc5sGsnC40eYZu3oD70W5++0lWTEh3AMoW/b6mbJBGaqec5f2L/pkZCqLcQ0iIaH0htaqDKeZXyw/qz6lrG1pAtmglYcIcn/XIxnv2JsFgKk2lxEGKcNcFmbB5z1/Td4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kt+JWI8J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D924C4CEF1;
	Thu, 16 Oct 2025 16:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760632884;
	bh=IbSqzMhYdlbV68FwRqfdNa92zx5pPJVeMmzUDWHgwuE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kt+JWI8JVliy5vV9qaxbOw6SoV6YE658FWqFxQhFrRAkUq/DzOhIBXCRDZUpDF0cU
	 m5eTsScchLpWnrN6bS9h8E2FqnKCuHV9buVyefHeqO5bdsqa/yb5QkMK0vvHeUU7Ab
	 dETJMK7qXwJuDRN2vBW4D7ypUc1JNM3Oc61M2qeR/ycOoedLDjmOEg2z+M+5O1S5u/
	 dEl56e5sX0bxoJB86h6at39+IAM1HqMni35nUj4ZEh1FiN0D5Z9VVxrwHCsxe0PnaW
	 orx6GzBFL5Qdo6qIkSlhZ81wG00rvZnR6OHPDb5z2rkIo12bJrTR6pjE6oDU5Vd3i8
	 qqbgijwKUC7Aw==
Date: Thu, 16 Oct 2025 17:41:19 +0100
From: Conor Dooley <conor@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: renesas,r9a09g077: Document
 pin configuration properties
Message-ID: <20251016-dimmed-affidavit-90bae7e162aa@spud>
References: <20251014191121.368475-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251014191121.368475-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4cp+vOoEUFgObXur"
Content-Disposition: inline
In-Reply-To: <20251014191121.368475-2-prabhakar.mahadev-lad.rj@bp.renesas.com>


--4cp+vOoEUFgObXur
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2025 at 08:11:20PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Document the pin configuration properties supported by the RZ/T2H pinctrl
> driver. The RZ/T2H SoC supports configuring various electrical properties
> through the DRCTLm (I/O Buffer Function Switching) registers.
>=20
> Add documentation for the following standard properties:
> - bias-disable, bias-pull-up, bias-pull-down: Control internal
>   pull-up/pull-down resistors (3 options: no pull, pull-up, pull-down)
> - input-schmitt-enable, input-schmitt-disable: Control Schmitt trigger
>   input
> - slew-rate: Control output slew rate (2 options: slow/fast)
>=20
> Add documentation for the custom property:
> - renesas,drive-strength: Control output drive strength using discrete
>   levels (0-3) representing low, medium, high, and ultra high strength.
>   This custom property is needed because the hardware uses fixed discrete
>   levels rather than configurable milliamp values.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../bindings/pinctrl/renesas,r9a09g077-pinctrl.yaml | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,r9a09g077-=
pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,r9a09g077-=
pinctrl.yaml
> index 36d665971484..9085d5cfb1c8 100644
> --- a/Documentation/devicetree/bindings/pinctrl/renesas,r9a09g077-pinctrl=
=2Eyaml
> +++ b/Documentation/devicetree/bindings/pinctrl/renesas,r9a09g077-pinctrl=
=2Eyaml
> @@ -72,6 +72,19 @@ definitions:
>        input: true
>        input-enable: true
>        output-enable: true
> +      bias-disable: true
> +      bias-pull-down: true
> +      bias-pull-up: true
> +      input-schmitt-enable: true
> +      input-schmitt-disable: true
> +      slew-rate:
> +        enum: [0, 1]

What are the meanings of "0" and "1" for slew rate? Why isn't this given
as the actual rates? The docs surely give more detail than just "slow"
and "fast".

> +      renesas,drive-strength:
> +        description:
> +          Drive strength configuration value. Valid values are 0 to 3, r=
epresenting
> +          increasing drive strength from low, medium, high and ultra hig=
h.

I see what you wrote in the commit message, but I don't really get why
you need a custom property. I would imagine most devices only have some
some small set of "fixed discrete levels", yet manage with milli- or
micro-amps fine. Converting from mA to register values in a driver is
not difficult, and I figure the documentation for the device probably
doesn't just give vague strengths like "medium" or "ultra high", but
probably provides currents?

I dunno, I am just confused by the need to shove register values into
these properties, rather than using the actual units.

> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [0, 1, 2, 3]
>      oneOf:
>        - required: [pinmux]
>        - required: [pins]
> --=20
> 2.43.0
>=20

--4cp+vOoEUFgObXur
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPEgLwAKCRB4tDGHoIJi
0lx0AP4jyo97e3Zk8i4jkScPF1zzQ+X4TFA664bvdfYVRxX59gD/RY89usrIDvLh
Di5RCQNiqFuaDUjmLZtmBFgY6FmqQQk=
=xYR1
-----END PGP SIGNATURE-----

--4cp+vOoEUFgObXur--

