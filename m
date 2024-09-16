Return-Path: <linux-gpio+bounces-10201-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A7297A5D8
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Sep 2024 18:19:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3E838B2CCA5
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Sep 2024 16:16:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F2D5158A3D;
	Mon, 16 Sep 2024 16:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BEhzjcBW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C1818B1A;
	Mon, 16 Sep 2024 16:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726503376; cv=none; b=eIiTJRrMDqLBsgVDdiDBGqSt2ezHNU4w0OHj53qHahfcxmg9eFUMmpVlaYXXIRr0QRQmqjPgFD7qMD+SrRs+rdZ16a4slZJCFZp7XzP+dWy1HIYes13flIpPROV3PoLwCmevvCRhHaUn/CkgcL4oJB/BRyo3GI8pn1z5cXtqkOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726503376; c=relaxed/simple;
	bh=K34CM7v91MrOP/VOs4CdQOMD/QAJ0bF/76bOsSlY7gg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dMDRIkBpLjhsZNP8Bw32lqCeRYFIkW7dOcj4durc7c5PNjJCo6++LIdT/CO6b6kg1LKpjA09BTkFgOHgo0vyc72RNxSwUQEDiHb8YMls9PaPr9DSp59xtDJ9a/zntg6CxPPkgnmMue1AoL/pOlk6PZukU3D0xDpoLMO2dHMvREk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BEhzjcBW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23320C4CEC4;
	Mon, 16 Sep 2024 16:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726503375;
	bh=K34CM7v91MrOP/VOs4CdQOMD/QAJ0bF/76bOsSlY7gg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BEhzjcBWnc1GRWfR5v9RHrp6pqg9+Vuld0ZVGaq0tQpOS4ffTSeM9ywI2ctto6pnt
	 uERfYaHT1+wtIRm8SoeBZRj21a8cXB177Kgm7MsYQ7M9mMLHSDQSOalmen7yI3luCW
	 /bAZwFtx2795r5zmLBb2gemmhM6lWFraKz4tkOXnqtf9Kcl+zREi0EDV7r/++H7fS9
	 IXWzSm2nWpqYgDyPp8GVq35Egd+wU8YANGKEC7Z7h/IHQ6bqyB/1p63e5Ie3ehMtJN
	 DZdRv63DvsQnsN3SMqsZ5jN9RfvqukuK4GSpTY22axpOGnOVEeCbgCkiZZ38kh4yhH
	 DrwzolMvjsPbw==
Date: Mon, 16 Sep 2024 17:16:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Lars Povlsen <lars.povlsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: ocelot: document lan969x-pinctrl
Message-ID: <20240916-uncut-badge-f31b97d7c375@spud>
References: <20240914-lan969x-pinctrl-v1-0-1b3a4d454b0d@microchip.com>
 <20240914-lan969x-pinctrl-v1-1-1b3a4d454b0d@microchip.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IYnUTUTB/ln/uSn4"
Content-Disposition: inline
In-Reply-To: <20240914-lan969x-pinctrl-v1-1-1b3a4d454b0d@microchip.com>


--IYnUTUTB/ln/uSn4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 14, 2024 at 09:10:08PM +0200, Daniel Machon wrote:
> Lan969x is going to reuse the existing Ocelot pinctrl driver - document
> that by adding compatible strings for the different SKU's that we
> support.
>=20
> Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
> ---
>  .../bindings/pinctrl/mscc,ocelot-pinctrl.yaml      | 32 ++++++++++++++++=
------
>  1 file changed, 24 insertions(+), 8 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/mscc,ocelot-pinctr=
l.yaml b/Documentation/devicetree/bindings/pinctrl/mscc,ocelot-pinctrl.yaml
> index dbb3e1bd58c1..45e9dfc50660 100644
> --- a/Documentation/devicetree/bindings/pinctrl/mscc,ocelot-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/mscc,ocelot-pinctrl.yaml
> @@ -12,14 +12,24 @@ maintainers:
> =20
>  properties:
>    compatible:
> -    enum:
> -      - microchip,lan966x-pinctrl
> -      - microchip,sparx5-pinctrl
> -      - mscc,jaguar2-pinctrl
> -      - mscc,luton-pinctrl
> -      - mscc,ocelot-pinctrl
> -      - mscc,serval-pinctrl
> -      - mscc,servalt-pinctrl
> +    oneOf:
> +      - enum:
> +          - microchip,lan966x-pinctrl
> +          - microchip,lan9691-pinctrl
> +          - microchip,sparx5-pinctrl
> +          - mscc,jaguar2-pinctrl
> +          - mscc,luton-pinctrl
> +          - mscc,ocelot-pinctrl
> +          - mscc,serval-pinctrl
> +          - mscc,servalt-pinctrl
> +      - items:
> +          - enum:
> +              - microchip,lan9698-pinctrl
> +              - microchip,lan9696-pinctrl
> +              - microchip,lan9694-pinctrl
> +              - microchip,lan9693-pinctrl
> +              - microchip,lan9692-pinctrl
> +          - const: microchip,lan9691-pinctrl
> =20
>    reg:
>      items:
> @@ -85,6 +95,12 @@ allOf:
>            contains:
>              enum:
>                - microchip,lan966x-pinctrl
> +              - microchip,lan9698-pinctrl
> +              - microchip,lan9696-pinctrl
> +              - microchip,lan9694-pinctrl
> +              - microchip,lan9693-pinctrl
> +              - microchip,lan9692-pinctrl

> +              - microchip,lan9691-pinctrl

This should work on its own, since the other devices here have it as a
fallback.

>                - microchip,sparx5-pinctrl
>      then:
>        properties:
>=20
> --=20
> 2.34.1
>=20

--IYnUTUTB/ln/uSn4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZuhZygAKCRB4tDGHoIJi
0lvIAP9yXS9mxfQMiq2EvDb/VAlg1TMwKuRYTDX2CWAlWJTn7gEA3mWlUXnWsVeM
qL5BqrO2CQbFP11rJt1Lf2GFYFlK5wM=
=a8O1
-----END PGP SIGNATURE-----

--IYnUTUTB/ln/uSn4--

