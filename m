Return-Path: <linux-gpio+bounces-8382-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB7293C40F
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jul 2024 16:25:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 84B5AB22012
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jul 2024 14:25:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7975819D080;
	Thu, 25 Jul 2024 14:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c5+KiGD7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DEE1E4A1;
	Thu, 25 Jul 2024 14:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721917538; cv=none; b=cHem840hI6saV1MdgpIiC1t2Jlc+VdIUe1AHkWH6BQMz/hLVCUaSiWqOekXsNy1nPkSVSKXJaLiN7h1XDm/jnvFYKgOgFoXZNaqGHzrvKsQmoiwlsR4InBRPh3zvWek0Gpwr3EMWLMqiRGtjzHmAK2KLmjbIvng60iy7GfgT38k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721917538; c=relaxed/simple;
	bh=xTZKezumyZvFewXix8LuYU8I83b2VIsGQU7HHPsFcPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RUNVjprbsWbi7FGJ6iYijmz7fQSnXGY6NwHCVxepaVKvdHPv3rkWSQT22wlWKbQyIUtwOlbtb/tidGb/fd+p7QoVxBDV/JX4ON1Y3acDy5iEP1lAYaP2qb6CCUT/pU3tYpC8ZOYDnK/VWssCgAvWzRJGtpEytED8XWVLfMp8Qzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c5+KiGD7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77DFBC116B1;
	Thu, 25 Jul 2024 14:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721917537;
	bh=xTZKezumyZvFewXix8LuYU8I83b2VIsGQU7HHPsFcPY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c5+KiGD71alioIQpKvL+KMTnKQmsNAerGTGT5NUCU/DXyopGx4yvDwtSfqcyIRBYL
	 Ld/Wo62UA7Ij4R+LfALaf4koDIExxNbYXK13eaAUWlmNTLbco91L5T4pPyKBl/qmHC
	 POOp2Nf3HkE4QSugTH0vmPcHmTSmRx8DwbTb+g5MXPnm9By1g0OUuX+wGUudKwgJOn
	 aQYrpVWL6bc1rEitEVznbMh8v7e8Kh/QmtGWnyL1iBrfhGKNFn04JqYTW/Ukk23++J
	 0YpeoNws7y862wzVOxOYOQUgSUuPA9589Q4p8SeHq+p3xgknB9jTVF5opQznjjy2/+
	 Pm+AGBHPNrBNQ==
Date: Thu, 25 Jul 2024 15:25:33 +0100
From: Conor Dooley <conor@kernel.org>
To: pierre-henry.moussay@microchip.com
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/17] dt-bindings: gpio: mpfs-gpio: Add PIC64GX GPIO
 compatibility
Message-ID: <20240725-prevalent-marry-66670630061f@spud>
References: <20240725121609.13101-1-pierre-henry.moussay@microchip.com>
 <20240725121609.13101-6-pierre-henry.moussay@microchip.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DQensbp2dRAb/Tqi"
Content-Disposition: inline
In-Reply-To: <20240725121609.13101-6-pierre-henry.moussay@microchip.com>


--DQensbp2dRAb/Tqi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2024 at 01:15:57PM +0100, pierre-henry.moussay@microchip.co=
m wrote:
> From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
>=20
> PIC64GX GPIO is compatible with mpfs-gpio driver
>=20
> Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
> ---
>  .../bindings/gpio/microchip,mpfs-gpio.yaml       | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.y=
aml b/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
> index d61569b3f15b..fdce88374a91 100644
> --- a/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
> @@ -11,10 +11,14 @@ maintainers:
> =20
>  properties:
>    compatible:
> -    items:
> -      - enum:
> -          - microchip,mpfs-gpio
> -          - microchip,coregpio-rtl-v3
> +    oneOf:
> +      - items:
> +          - const: microchip,pic64gx-gpio
> +          - const: microchip,mpfs-gpio
> +      - items:
> +          - enum:
> +              - microchip,mpfs-gpio
> +              - microchip,coregpio-rtl-v3
> =20
>    reg:
>      maxItems: 1
> @@ -69,7 +73,9 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: microchip,mpfs-gpio
> +            enum:
> +              - microchip,mpfs-gpio
> +              - microchip,pic64gx-gpio

This hunk should not be needed, given you have an mpfs-gpio fallback.

Thanks,
Conor.

>      then:
>        required:
>          - interrupts
> --=20
> 2.30.2
>=20
>=20

--DQensbp2dRAb/Tqi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZqJgXQAKCRB4tDGHoIJi
0re3AQD8QgYHuw3hyM5i+5EXK7rRvYGwlptD0eHB13uRHP7xQgEAoGmqq8CNrCbJ
4ipvOJ1zROMaN3JH0GIB7jvy80CLFg4=
=18I5
-----END PGP SIGNATURE-----

--DQensbp2dRAb/Tqi--

