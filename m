Return-Path: <linux-gpio+bounces-27254-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 47420BEA75E
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Oct 2025 18:06:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 823321AE6170
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Oct 2025 16:03:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA3A322FE0E;
	Fri, 17 Oct 2025 16:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hBoIBZkF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA25330B35;
	Fri, 17 Oct 2025 16:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760716918; cv=none; b=WX4IEkZzt4rKUl28pInZauepduvJW1+JOX8cK0cr05QLS0VDpTXZDN09CHaf5GzdGDlmZzgCZZ9hxglXROaJjyuGO8Ufn5aafYpeWT/mGdCzsEp9DVwT2nQE9I6Q51BNkLzBUc1uio8/VVTIpqcyFnOgeNkumkT73FDIUlwQIHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760716918; c=relaxed/simple;
	bh=QKceSGaY38ubIJxFqjBFxdozyMDtA0Dx78G823wgoEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BKljDcW6ZnMq+F9HXOMUfQNhfDxX7OZ6jKI3kBHjywt2M9tZ1d5cXixBYRUtpkxw0uIQSTnGlF/7NW1zu0lO9oLx3iairZCAi/QyUv5MMC7EIoP3kHzUWxKAQXHzASMuCpEz6UP5RZheeKJ/UYYsuvGquOUPJd0v+v37Xpjtgt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hBoIBZkF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFE7DC4CEE7;
	Fri, 17 Oct 2025 16:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760716918;
	bh=QKceSGaY38ubIJxFqjBFxdozyMDtA0Dx78G823wgoEQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hBoIBZkF/T4PGDBCdEkR8JNVNR7OaJA375S1C1ZwwtHU5ItFsMytfeZaDJmNs/TPK
	 obQTXDazN6Is5B0tIupFJOKMJGwTl4N1shOpiY3oYsfF6FM6gz0Q2SQKfiGXEYhQSv
	 t16L29q67/PxAOq+CYjnbAUa2SGZULzC0QVkalxsD1TMcDgS1cOkzQniMLqxODlA41
	 MQooD3vP2T8tpjZcRt0PGxQ3jOQpWTS3w/qsV9VjKPkeIuW7XRxL22s4uWcpSPTkEC
	 1OAKUrueyLFsOoU7xzsEV5EyikFrtomK4Yju7SCiqJbu25LYYtL0ZMrvSLmIjBs1hJ
	 eKGcM9fGWM8UQ==
Date: Fri, 17 Oct 2025 17:01:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Gary Yang <gary.yang@cixtech.com>
Cc: linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH v4 1/3] dt-bindings: pinctrl: Add cix,sky1-pinctrl
Message-ID: <20251017-sporty-public-fca6e77b2368@spud>
References: <20251017074646.3344924-1-gary.yang@cixtech.com>
 <20251017074646.3344924-2-gary.yang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fta6H4olrjk+9Tyz"
Content-Disposition: inline
In-Reply-To: <20251017074646.3344924-2-gary.yang@cixtech.com>


--fta6H4olrjk+9Tyz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 17, 2025 at 03:46:44PM +0800, Gary Yang wrote:
> The pin-controller is used to control the Soc pins.
> There are two pin-controllers on Cix Sky1 platform.
> One is used under S0 state, the other is used under
> S0 and S5 state.
>=20
> Signed-off-by: Gary Yang <gary.yang@cixtech.com>
> ---
>  .../bindings/pinctrl/cix,sky1-pinctrl.yaml    | 94 +++++++++++++++++++
>  1 file changed, 94 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/cix,sky1-pi=
nctrl.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.y=
aml b/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml
> new file mode 100644
> index 000000000000..4ad160734353
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml

Please use a filename matching a compatible, probably the first one.

> @@ -0,0 +1,94 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/cix,sky1-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cix Sky1 Soc Pin Controller
> +
> +maintainers:
> +  - Gary Yang <gary.yang@cixtech.com>
> +
> +description:
> +  The pin-controller is used to control Soc pins. There are two pin-cont=
rollers
> +  on Cix Sky1 platform. one is used under S0 state, the other one is use=
d under
> +  S0 and S5 state.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - cix,sky1-iomuxc
> +      - cix,sky1-iomuxc-s5
> +
> +  reg:
> +    items:
> +      - description: gpio base
> +
> +# Client device subnode's properties

I'd drop these comments, they're just stating what's "obvious" for
bindings.

> +patternProperties:
> +  '-cfg$':
> +    type: object
> +    additionalProperties: false
> +
> +    description:
> +      A pinctrl node should contain at least one subnode representing the
> +      pinctrl groups available on the machine.
> +
> +    patternProperties:
> +      'pins$':
> +        type: object
> +        additionalProperties: false
> +
> +        description:
> +          Each subnode will list the pins it needs, and how they should
> +          be configured, with regard to muxer configuration, bias pull,
> +          and drive strength.
> +
> +        allOf:
> +          - $ref: pincfg-node.yaml#
> +          - $ref: pinmux-node.yaml#
> +
> +        properties:
> +          pinmux:
> +            description:
> +              Values are constructed from pin number and mux setting

I think this should actually say how the values are constructed, one
shouldn't have to reverse engineer it from a macro in the example.

> +
> +          bias-disable: true
> +
> +          bias-pull-up: true
> +
> +          bias-pull-down: true
> +
> +          drive-strength:
> +            description:
> +              typical current when output high level.
> +            enum: [ 2, 3, 5, 6, 8, 9, 11, 12, 13, 14, 17, 18, 20, 21, 23,
> +                    24 ]
> +
> +
> +        required:
> +          - pinmux
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  # Pinmux controller node

Drop this comment too.

> +  - |
> +    #define CIX_PAD_GPIO012_FUNC_GPIO012 (11 << 8 | 0x0)

> +    #define DS_LEVEL4 (8)

Delete this define entirely, it actually just obfuscates the actually
amperage.

> +    iomuxc: pinctrl@4170000 {

Unused labels should be removed from binding examples.

pw-bot: changes-requested

Thanks,
Conor.

> +        compatible =3D "cix,sky1-iomuxc";
> +        reg =3D <0x4170000 0x1000>;
> +
> +        wifi_vbat_gpio: wifi-vbat-gpio-cfg {
> +            pins {
> +                pinmux =3D <CIX_PAD_GPIO012_FUNC_GPIO012>;
> +                bias-pull-up;
> +                drive-strength =3D <DS_LEVEL4>;
> +           };
> +        };
> +    };
> --=20
> 2.49.0
>=20

--fta6H4olrjk+9Tyz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPJocQAKCRB4tDGHoIJi
0iZyAQCXi00+BFpGerAO8331wYcnK7l8ya18y6X2WdMXteZ53gD8CjFUYulWSNl9
uaPjJOtH6eNa09G51u+sFzFYoBVQCQY=
=eShT
-----END PGP SIGNATURE-----

--fta6H4olrjk+9Tyz--

