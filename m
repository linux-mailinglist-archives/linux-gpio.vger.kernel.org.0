Return-Path: <linux-gpio+bounces-24508-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CB4B2AEFB
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Aug 2025 19:09:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27565164E39
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Aug 2025 17:06:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69317343D8C;
	Mon, 18 Aug 2025 17:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qkRfL/7Z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A47132C319;
	Mon, 18 Aug 2025 17:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755536625; cv=none; b=tcrwTUNUjpvRd5MN55o8G4NxQ1QqmXXTilD6jOSWyhCt47teJXanELc72SZ95/9EtOiFqNI/4h3pNqSnkP2aplOZADWmf8ivmDMXgDr+E4ktP/b3tTwrA9JaRQ+a6OVUAQ1PRzSwT3Q1dCrGCiv8U4tRVrVU6u+6DluT9v7l6OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755536625; c=relaxed/simple;
	bh=LsUeufe182oeOYuRXyKOtbmmFBfg6vhanNGoljpohVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IHmcprTv2ZWXzP7F3aNP+3RdlPSjrmyONFKEq5r4VPEZ99++wyxuy6ZW+kgfpK9MPKQc9v/gsl6HBv1b0YPu69YIl2A9GU/nBdK5MaOaH82x4T79fjwNp/KNdVu8aGHwD3d0gJtQCYJ8RI9Xuh5wJBtQyORBTMdNL06tpcdS2+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qkRfL/7Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50122C116C6;
	Mon, 18 Aug 2025 17:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755536624;
	bh=LsUeufe182oeOYuRXyKOtbmmFBfg6vhanNGoljpohVE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qkRfL/7ZkgW0LFbBk7UqwdcY1KYuQ/VkRLwHCquXycZ+zYdXc6Qyzz/Awl83lQYoE
	 FWN9rIIT1cB5kePfP2+JBnr5mVW5jkyuX33cYUVEVlHzjaj6P7NsgkGWwIZVdquBsz
	 hagQFujhG7jAHgNbZ4mDUi0dRqBbV4KKqTNn6I4tP51pJxXUi5nCJzeaM4OLtgztS7
	 MC7WigYjh0JRnW5a3B0jaavtgAGHkDRJvU/sbR3GhBrAMwzhXpCkMgzROcq4bHKc/V
	 RATz74UaTSb4LQ/291wp9JEPu6NlodBuotMR5PP3DzSDnaajt4RZZ7nsnPK3T9HSkT
	 2Z3DXdYhjfCrw==
Date: Mon, 18 Aug 2025 18:03:40 +0100
From: Conor Dooley <conor@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Qiang Zhao <qiang.zhao@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 4/5] soc: fsl: qe: Add support of IRQ in QE GPIO
Message-ID: <20250818-tyke-pungent-20d9ffd47ecc@spud>
References: <cover.1755506608.git.christophe.leroy@csgroup.eu>
 <cddc5e900b84826614a63b8b29a048c09dd20853.1755506608.git.christophe.leroy@csgroup.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kD3gyAnEQtUYwXo5"
Content-Disposition: inline
In-Reply-To: <cddc5e900b84826614a63b8b29a048c09dd20853.1755506608.git.christophe.leroy@csgroup.eu>


--kD3gyAnEQtUYwXo5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 18, 2025 at 10:45:57AM +0200, Christophe Leroy wrote:
> In the QE, a few GPIOs are IRQ capable. Similarly to
> commit 726bd223105c ("powerpc/8xx: Adding support of IRQ in MPC8xx
> GPIO"), add IRQ support to QE GPIO.
>=20
> Add property 'fsl,qe-gpio-irq-mask' similar to
> 'fsl,cpm1-gpio-irq-mask' that define which of the GPIOs have IRQs.
>=20
> Here is an exemple for port B of mpc8323 which has IRQs for
> GPIOs PB7, PB9, PB25 and PB27.
>=20
> 	qe_pio_b: gpio-controller@1418 {
> 		#gpio-cells =3D <2>;
> 		compatible =3D "fsl,mpc8323-qe-pario-bank";
> 		reg =3D <0x1418 0x18>;
> 		interrupts =3D <4 5 6 7>;
> 		fsl,qe-gpio-irq-mask =3D <0x01400050>;
> 		interrupt-parent =3D <&qepic>;
> 		gpio-controller;
> 	};
>=20
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> v2: Document fsl,qe-gpio-irq-mask
> ---
>  .../bindings/soc/fsl/cpm_qe/qe/par_io.txt     | 19 ++++++++++++++++++
>  drivers/soc/fsl/qe/gpio.c                     | 20 +++++++++++++++++++
>  2 files changed, 39 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.t=
xt b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.txt
> index 09b1b05fa677..9cd6e5ac2a7b 100644
> --- a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.txt
> +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.txt
> @@ -32,6 +32,15 @@ Required properties:
>    "fsl,mpc8323-qe-pario-bank".
>  - reg : offset to the register set and its length.
>  - gpio-controller : node to identify gpio controllers.
> +Optional properties:
> +- fsl,qe-gpio-irq-mask : For banks having interrupt capability this item=
 tells
> +  which ports have an associated interrupt (ports are listed in the same=
 order
> +  QE ports registers)
> +- interrupts : This property provides the list of interrupt for each GPI=
O having
> +  one as described by the fsl,cpm1-gpio-irq-mask property. There should =
be as
> +  many interrupts as number of ones in the mask property. The first inte=
rrupt in
> +  the list corresponds to the most significant bit of the mask.
> +- interrupt-parent : Parent for the above interrupt property.
> =20
>  Example:
>  	qe_pio_a: gpio-controller@1400 {
> @@ -42,6 +51,16 @@ Example:
>  		gpio-controller;
>  	  };
> =20
> +	qe_pio_b: gpio-controller@1418 {
> +		#gpio-cells =3D <2>;
> +		compatible =3D "fsl,mpc8323-qe-pario-bank";
> +		reg =3D <0x1418 0x18>;
> +		interrupts =3D <4 5 6 7>;
> +		fsl,qe-gpio-irq-mask =3D <0x01400050>;
> +		interrupt-parent =3D <&qepic>;
> +		gpio-controller;
> +	  };
> +
>  	qe_pio_e: gpio-controller@1460 {
>  		#gpio-cells =3D <2>;
>  		compatible =3D "fsl,mpc8360-qe-pario-bank",

Why is there a binding change hiding in here alongside a driver one?

--kD3gyAnEQtUYwXo5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKNc6wAKCRB4tDGHoIJi
0gifAP4zV29lsa0wp7PTs4uJEEK4ElPSQZMpreO7o/az7p/onQEA4mIyE/65qlAv
TvH4uKCtgNCyRIAPqS8vTdBswhJBaws=
=PqSq
-----END PGP SIGNATURE-----

--kD3gyAnEQtUYwXo5--

