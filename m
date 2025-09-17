Return-Path: <linux-gpio+bounces-26302-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DC6B81940
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Sep 2025 21:22:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8291B721CE3
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Sep 2025 19:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D35830C0ED;
	Wed, 17 Sep 2025 19:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NqtuiUAC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034C52FF15D;
	Wed, 17 Sep 2025 19:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758136788; cv=none; b=iWaZIsHFvY99DQyoECw9WgkW9tH2TCyROjY/i/2CcDntFvqQPQQOLqFpdObCMJocNFkBuxIsgpWVMxtK6vIs1+gAaJR+yLeP5bGYiuDDy63Q6cWFB85qnrZIU1y2cLSJbfmYGYakYeu1fXTVw1xGq7Ju6WTCpn7bCYt1M6EkndE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758136788; c=relaxed/simple;
	bh=w5App2lZy9Ue5d4FnpqjXUraR+uQvJr8LQHwa7QQqSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R/YdXYcIxOrctQ1qgc/2jaV1qmUxioep0N7ue5kES7kZS9tYtd/nfEt7PL7LPJeLLPXAVA5oewK8EOwK67N4wii9Ju4myF96AhjV1VXdnBY7ECxrt0MVVnb8cbsq8t4hGS5y61JRIyPbHTElBW8+nHGXA52UsLPMFBrB7XURy1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NqtuiUAC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 006E5C4CEF7;
	Wed, 17 Sep 2025 19:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758136787;
	bh=w5App2lZy9Ue5d4FnpqjXUraR+uQvJr8LQHwa7QQqSA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NqtuiUACJpzo5gkpXtYqwrgsfl+MNVA0aGNWRyu8ZSqghjOM7BZ8QtlNEK+5teMJT
	 9fT15QgC04Bf4CKeWXb6T3cDdvhaXPe5Afel13hIHwTs1ZqzNkR5zytX1I3tx8qIqY
	 9cCU9E61wNpp0hbUyEHeXOq6o9X07LsCnHXPy+v/fLXooomhVoOTXpJlKkOqYQXLB0
	 9dtvfTMM6/9rVuSvfBpPrDOzluqhm63Z46sPSn1sv8YhebhpNG6uZiCq0ucZIAuOoK
	 SRoN4C5OZAwvzOmhmS0sAURtRRM+1iC15HJ75z2sI0pCcgydlwTM5e1yg8DrL7MO3Q
	 al8Znsh3+oxcw==
Date: Wed, 17 Sep 2025 20:19:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shawn Guo <shawnguo@kernel.org>, Michael Walle <mwalle@kernel.org>,
	Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 02/10] dt-bindings: fsl,fpga-qixis-i2c: add support
 for LX2160ARDB FPGA
Message-ID: <20250917-document-enhance-4a6cb6053882@spud>
References: <20250917090422.870033-1-ioana.ciornei@nxp.com>
 <20250917090422.870033-3-ioana.ciornei@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DaAPDeI8ICb8eSbe"
Content-Disposition: inline
In-Reply-To: <20250917090422.870033-3-ioana.ciornei@nxp.com>


--DaAPDeI8ICb8eSbe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 17, 2025 at 12:04:14PM +0300, Ioana Ciornei wrote:
> Extend the list of supported compatible strings with fsl,lx2160ardb-fpga.
>=20
> Since the register map exposed by the LX2160ARDB's FPGA also contains
> two GPIO controllers, accept the necessary GPIO pattern property.
> At the same time, add the #address-cells and #size-cells properties as
> valid ones so that the child nodes of the fsl,lx2160ardb-fpga node are
> addressable.
>=20
> This is necessary because when defining child devices such as the GPIO
> controller described in the added example, the child device needs a the
> reg property to properly identify its register location in the parent
> I2C device address space.
>=20
> Impose this restriction for the new compatible through an if-statement.
>=20
> Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> ---
> Changes in v2:
> - Enforce a unit address on the child gpios nodes (remove the ?)
> - Enforce the use of unit addresses by having #address-size and
>   #size-cells only for the newly added fsl,lx2160ardb-fpga compatible
> Changes in v3:
> - Replace the trivial-gpio reference with an explicit mention of the
>   accepted child gpio compatible.
> - Reword the commit message.
> - Add the 'else' case to the if statement.
>=20
>  .../bindings/board/fsl,fpga-qixis-i2c.yaml    | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/board/fsl,fpga-qixis-i2c.y=
aml b/Documentation/devicetree/bindings/board/fsl,fpga-qixis-i2c.yaml
> index 28b37772fb65..e889dac052e7 100644
> --- a/Documentation/devicetree/bindings/board/fsl,fpga-qixis-i2c.yaml
> +++ b/Documentation/devicetree/bindings/board/fsl,fpga-qixis-i2c.yaml
> @@ -22,6 +22,13 @@ properties:
>                - fsl,lx2160aqds-fpga
>            - const: fsl,fpga-qixis-i2c
>            - const: simple-mfd
> +      - const: fsl,lx2160ardb-fpga

How come this is not compatible with fsl,fpga-qixis-i2c ? Seems like
that device has a feature subset of that one, given your changes here.

> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> =20
>    interrupts:
>      maxItems: 1
> @@ -32,10 +39,37 @@ properties:
>    mux-controller:
>      $ref: /schemas/mux/reg-mux.yaml
> =20
> +patternProperties:
> +  "^gpio@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +
> +    properties:
> +      compatible:
> +        contains:
> +          enum:
> +            - fsl,lx2160ardb-fpga-gpio-sfp
> +
>  required:
>    - compatible
>    - reg
> =20
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,lx2160ardb-fpga
> +    then:
> +      required:
> +        - "#address-cells"
> +        - "#size-cells"
> +    else:
> +      properties:
> +        "#address-cells": false
> +        "#size-cells": false
> +
>  additionalProperties: false
> =20
>  examples:
> @@ -68,3 +102,27 @@ examples:
>          };
>      };
> =20
> +  - |
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        board-control@66 {
> +            compatible =3D "fsl,lx2160ardb-fpga";
> +            reg =3D <0x66>;
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
> +
> +            gpio@19 {
> +                compatible =3D "fsl,lx2160ardb-fpga-gpio-sfp";
> +                reg =3D <0x19>;
> +                gpio-controller;
> +                #gpio-cells =3D <2>;
> +                gpio-line-names =3D
> +                    "SFP2_TX_EN", "",
> +                    "", "",
> +                    "SFP2_RX_LOS", "SFP2_TX_FAULT",
> +                    "", "SFP2_MOD_ABS";
> +            };
> +        };
> +    };
> --=20
> 2.25.1
>=20

--DaAPDeI8ICb8eSbe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMsJzgAKCRB4tDGHoIJi
0sFlAP9ec6NMDaXY0lpCg8p1Z2cDJCqMGjRdn/HLs7eqWASDbAD/R3xsaasgAaF1
997IkysPI75MqTEU+K3k/zbihFA00ws=
=EIw5
-----END PGP SIGNATURE-----

--DaAPDeI8ICb8eSbe--

