Return-Path: <linux-gpio+bounces-14041-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5BC9F84C9
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2024 20:52:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B577188A4DE
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2024 19:52:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEBAA1B4F0D;
	Thu, 19 Dec 2024 19:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BxeeJ5cc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B0A155342;
	Thu, 19 Dec 2024 19:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734637954; cv=none; b=fcU8Imd9xgz8RW3Q2W1ZYnqHtQhI+1DGLhzMpWpkmxqwFN1fjeuh649096BeBLBorV41+UOQQf7EmTM4veEfgYc7MHOMXeh35iCIBD5Do9+Gh3G/WY8Yn3Z26t2rjSzHhpb3s50D2l5unhFnM+92hdbmmkbK4D0WNq7EhrBHUk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734637954; c=relaxed/simple;
	bh=jvsgdtWvGlEi67Ya4ZxgoWj4tFejX/Od5rTFurvvA7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GS5QheGJ8Tz/4szITVc7qELTf3851ufWkC87cbq5dNMxGrkadtyYe+X+X7P7EknGcbip04YS6iXRHlSauyXbEUMmVBssJKRnRyRWkeVHe+1xW4g0vF8M/dkMQAdPIlsjno9VOTrToEsPPX2j66DO2nBDaQqS4cb45kGq3ffxDk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BxeeJ5cc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAF7CC4CECE;
	Thu, 19 Dec 2024 19:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734637954;
	bh=jvsgdtWvGlEi67Ya4ZxgoWj4tFejX/Od5rTFurvvA7c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BxeeJ5ccJXTbtf6BAHQZzhlNcIHAXUyizQ2zo2UzrSc0AhjJPF2vS8EvkFRs0KZnx
	 akewWFnGo3MhgEIdFXD2AbvqO9yTHIi9/OHf0Ycsx6t8FgvpcH1jGR9cAsTAuZuZaf
	 4oplg9471OojyE92YJAiJmiCN3CX1zSOLXYT5gvxofcTKy2S0UinDH9H+n89WtEPQr
	 yEa+bnEmltQMVIKreeGpWBt4njVFFSJm7Z8ToKLb3iqh/Y/w6tsONYrzLFNP2s9rRn
	 9vV7M4DNBCmLXPJiuXmzQQs2u/1d0Pm3XIJUfwVRNQzT2MNtHOZX90985WJLOahyoM
	 819hCxoug0WpQ==
Date: Thu, 19 Dec 2024 19:52:28 +0000
From: Conor Dooley <conor@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Yangyu Chen <cyy@cyyself.name>,
	Jisheng Zhang <jszhang@kernel.org>,
	Jesse Taube <mr.bossman075@gmail.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Meng Zhang <zhangmeng.kevin@spacemit.com>,
	Meng Zhang <kevin.z.m@hotmail.com>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: gpio: spacemit: add support for K1
 SoC
Message-ID: <20241219-secret-passenger-350d9c54fdf9@spud>
References: <20241219-03-k1-gpio-v2-0-28444fd221cd@gentoo.org>
 <20241219-03-k1-gpio-v2-1-28444fd221cd@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TlnOqraZRabZf1Fo"
Content-Disposition: inline
In-Reply-To: <20241219-03-k1-gpio-v2-1-28444fd221cd@gentoo.org>


--TlnOqraZRabZf1Fo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2024 at 03:17:43PM +0800, Yixun Lan wrote:
> The GPIO controller of K1 support basic functions as input/output,
> all pins can be used as interrupt which route to one IRQ line,
> trigger type can be select between rising edge, failing edge, or both.
> There are four GPIO banks, each consisting of 32 pins.
>=20
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  .../devicetree/bindings/gpio/spacemit,k1-gpio.yaml | 75 ++++++++++++++++=
++++++
>  1 file changed, 75 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml=
 b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..3d3d0b3bf2c144ed57b717bee=
50064949e26f087
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
> @@ -0,0 +1,75 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/spacemit,k1-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SpacemiT K1 GPIO controller
> +
> +maintainers:
> +  - Yixun Lan <dlan@gentoo.org>
> +
> +description:
> +  The controller's registers are organized as sets of eight 32-bit
> +  registers with each set controlling a bank of up to 32 pins.  A single
> +  interrupt is shared for all of the banks handled by the controller.
> +
> +properties:
> +  compatible:
> +    const: spacemit,k1-gpio
> +
> +  reg:
> +    maxItems: 1
> +
> +  ranges: true

What do you need this for?

> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  gpio-controller: true
> +
> +  gpio-ranges: true
> +
> +  interrupts:
> +    maxItems: 1
> +    description:
> +      The interrupt shared by all GPIO lines for this controller.
> +
> +  interrupt-names: true

Not that a name is valuable when you only have one interrupt, but if you
don't specify what the name is, you cannot interrupt-names!

Cheers,
Conor.

> +
> +  "#interrupt-cells":
> +    const: 2
> +    description:
> +      The first cell is the GPIO number, the second should specify inter=
rupt
> +      flag. The controller does not support level interrupts, flags of
> +      IRQ_TYPE_LEVEL_HIGH, IRQ_TYPE_LEVEL_LOW should not be used.
> +      Refer <dt-bindings/interrupt-controller/irq.h> for valid flags.
> +
> +  interrupt-controller: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - gpio-controller
> +  - "#gpio-cells"
> +  - interrupts
> +  - interrupt-names
> +  - interrupt-controller
> +  - "#interrupt-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    gpio@d4019000 {
> +        compatible =3D "spacemit,k1-gpio";
> +        reg =3D <0xd4019000 0x800>;
> +        gpio-controller;
> +        #gpio-cells =3D <2>;
> +        interrupts =3D <58>;
> +        interrupt-names =3D "gpio_mux";
> +        interrupt-parent =3D <&plic>;
> +        interrupt-controller;
> +        #interrupt-cells =3D <2>;
> +        gpio-ranges =3D <&pinctrl 0 0 128>;
> +    };
>=20
> --=20
> 2.47.0
>=20

--TlnOqraZRabZf1Fo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2R5fAAKCRB4tDGHoIJi
0onSAP4xxs/QVra4eTxc7N7zscD89ikPe+xy/u6E9H6QX4W7CQD/X+H99sdD6DWM
rW2FKZz+v4xUkPFAI/AyGM5nouWeQgk=
=cxwg
-----END PGP SIGNATURE-----

--TlnOqraZRabZf1Fo--

