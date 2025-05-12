Return-Path: <linux-gpio+bounces-19974-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 980A2AB3D66
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 18:25:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31803860564
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 16:20:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB40B24BC01;
	Mon, 12 May 2025 16:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VjysGgJz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BA41DE8B6;
	Mon, 12 May 2025 16:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747066823; cv=none; b=KIFNHUV6/AAMnqaEO8ZioijkFfmJTDdnC6ChtB53obVR7UFnFs7kF6UuNI1J14VwSVraxSVIjiMjU1KuHY3medYd3UPrsoddd89xH736DCSrMGL1L4uS+o4FxDkSF7xqZpggZuKaUr9z0aPr83O9LZBIzLFBntuIm8hNAc6kpSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747066823; c=relaxed/simple;
	bh=b5ymMBBwucx7+JF/datxr1WkwzE4Zs8iDCFOHv48tqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TAAsrf0V9+BB8mkFJWZhAzRXHxDY9GBoZRnHeN80T0MWEzvVi+jiu8zs2LH0AHHufK317RBvS2iINRdiDxLLUwQvOYN+GH2f7qbU/C2zK06AHpkTRk1V5Lw0gFmOLEOr7pD8PcoX5F+wPk1+BK5YESslQOg80/gA23He+f4L50A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VjysGgJz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4096C4CEE7;
	Mon, 12 May 2025 16:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747066823;
	bh=b5ymMBBwucx7+JF/datxr1WkwzE4Zs8iDCFOHv48tqI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VjysGgJzJJLphZ0edNmXQywCsu+ffDslXm+r0ytGgaxUaypHawC+Te0sEGQSW5FE7
	 h3Yn0kU5FjnoN3Iv2zwNmeQ3Q6+QEx5Nq6V3uqKl2GXXvTCsYJEe8E8WtH2Z/2CVnY
	 a5O3iLfMe/AlsxVbEq8ZCx76qgd6PfwXLxEgeuJLMOBX3tOY/ipPdnMeABgONzb8hc
	 r7Rvuwv/dd/b/arkXtedAVynMIsTqGMWPNZr5o5557B82zTv5tmPiLHmBpU+QS+jqU
	 kSX7rsdTwW+G7Dfj7eZzGfnPnhL0/Svge1/cY6g/ZpUcHacq2l6HCbF6ah+D8fvL16
	 D9MQqxMB1ee/A==
Date: Mon, 12 May 2025 17:20:17 +0100
From: Conor Dooley <conor@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 1/3] dt-bindings: firmware: nxp,imx95-scmi-pinctrl:
 Introduce nxp,iomuxc-daisy-off
Message-ID: <20250512-mongoose-vacation-f81a56dd6c5d@spud>
References: <20250512-pin-v1-0-d9f1555a55ad@nxp.com>
 <20250512-pin-v1-1-d9f1555a55ad@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="p3X005M6v+zmT/88"
Content-Disposition: inline
In-Reply-To: <20250512-pin-v1-1-d9f1555a55ad@nxp.com>


--p3X005M6v+zmT/88
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2025 at 10:14:14AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>=20
> The IOMUX Controller in i.MX9 family has Daisy chain that multi pads drive
> same module input pin. Each SoC has its own register offset, so
> introduce "nxp,iomuxc-daisy-off" property to specify the daisy register
> offset. With this property being parsed by driver, there is no need
> to hardcode the offset in pinctrl driver for each new SoC.
>=20
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../devicetree/bindings/firmware/nxp,imx95-scmi-pinctrl.yaml      | 8 ++=
++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi-pi=
nctrl.yaml b/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi-pinc=
trl.yaml
> index a96fc6cce502c10ab415e0b26bff1be8c3bc82f5..b5b2a9c8688a7f6525cdb6a32=
db22681f4f1a0b9 100644
> --- a/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi-pinctrl.y=
aml
> +++ b/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi-pinctrl.y=
aml
> @@ -13,6 +13,11 @@ maintainers:
>  allOf:
>    - $ref: /schemas/pinctrl/pinctrl.yaml
> =20
> +properties:
> +  nxp,iomuxc-daisy-off:

Same comment here as was left on the driver.
I also don't get why there's a property being introduced from something
you can determine based on the soc.

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Specify the IOMUX Controller first Daisy register's off=
set
> +
>  patternProperties:
>    'grp$':
>      type: object
> @@ -51,3 +56,6 @@ patternProperties:
>        - fsl,pins
> =20
>  additionalProperties: true
> +
> +required:
> +  - nxp,iomuxc-daisy-off
>=20
> --=20
> 2.37.1
>=20

--p3X005M6v+zmT/88
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCIfwQAKCRB4tDGHoIJi
0khFAQC5DQ545yCr9AEOhKd8i29tmIKpIty6ZUOCeKl1lWVjdgD/ZzV9eDXWsx6D
TpQsgh7YeLJOZL4WeO+YJ6gCuuFgHwk=
=StPd
-----END PGP SIGNATURE-----

--p3X005M6v+zmT/88--

