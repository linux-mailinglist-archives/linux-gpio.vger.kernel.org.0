Return-Path: <linux-gpio+bounces-10575-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA60F98A5C1
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 15:46:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D55921C2243E
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 13:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CA2C18E343;
	Mon, 30 Sep 2024 13:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T3ZYtKfy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94E11EA91;
	Mon, 30 Sep 2024 13:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727703979; cv=none; b=OYQDsA1wtrY2aiqNEIEZhF3w69BDqnVUzrZ06OdvWOoWpx71gaFU4AqPrTqNpMNDg18PELyDsBl3m+NNQa6OlbolGR5OD2IMJ8XUqWlh+zDqtAis94hCpMFnJglk2tQ8+Qr3QrqlarEPakKUshaWLT56dn8gTu1ICwpKGL1AV8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727703979; c=relaxed/simple;
	bh=aMJaYzXY1jg3S4x/G45yWq/QZRII8Ge4YR9ZlqyRsB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jy4yLAiyDIYB/zkA5XmglPm2SBBULn4K7qbyRTXsgraGSvGd6/mpWVm0Keuy7g7INZnDNEDsC2FXg9KQHxUCDCC58lDP7bkgeN8tGamQxNNguoVEUiFwYOgBYDIFqzJioPlI1qGe09XhQYDz3wV9MjFR5P4Ubi45hB/qhbLVbZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T3ZYtKfy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC98AC4CEC7;
	Mon, 30 Sep 2024 13:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727703979;
	bh=aMJaYzXY1jg3S4x/G45yWq/QZRII8Ge4YR9ZlqyRsB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T3ZYtKfyUFS48qvHgbCX7RTJf1ZyWm6pNL1pfytw04oTlnFB/AOTlFL93z46iPwP8
	 UduAsF/71nTs4Phg+5oPhQMfaBYeEWabmqUEDzx+AoMiCSwyL2MNXeld7T0X6Mvx0F
	 EPAMvxPL/97ZXqiYd6BkpfcosuV+paPkiQsL8CtQn+lPIxOlDfjItho6vmuxXTUurY
	 wo+Tll2augLHeF0U65Qz6qFCitBe0NbSycwFT4vS4upHhzbELvouP4aMYAFH2kjyQk
	 qgMdz6tUsc3nx1dvUMHbrRBqTihE6Utgf+EBEK0jiFrrRMKB+0Tx3XJ2y9giKB65gN
	 3jK0vFOIV76PQ==
Date: Mon, 30 Sep 2024 14:46:14 +0100
From: Conor Dooley <conor@kernel.org>
To: pierre-henry.moussay@microchip.com
Cc: Linux4Microchip@microchip.com,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [linux][PATCH v2 05/20] dt-bindings: gpio: mpfs-gpio: Add
 PIC64GX GPIO compatibility
Message-ID: <20240930-mourner-sharpness-1b049c7e5c85@spud>
References: <20240930095449.1813195-1-pierre-henry.moussay@microchip.com>
 <20240930095449.1813195-6-pierre-henry.moussay@microchip.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xs4yn0wAy3h5xCya"
Content-Disposition: inline
In-Reply-To: <20240930095449.1813195-6-pierre-henry.moussay@microchip.com>


--xs4yn0wAy3h5xCya
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 30, 2024 at 10:54:34AM +0100, pierre-henry.moussay@microchip.co=
m wrote:
> From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
>=20
> PIC64GX GPIO is compatible with mpfs-gpio controller, just add fallback
>=20
> Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
> ---
>  .../bindings/gpio/microchip,mpfs-gpio.yaml        | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.y=
aml b/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
> index d61569b3f15b..febe8c2cd70d 100644
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

This items shouldn't be required, the enum should suffice alone.

> +          - enum:
> +              - microchip,mpfs-gpio
> +              - microchip,coregpio-rtl-v3
> =20
>    reg:
>      maxItems: 1

> @@ -69,7 +73,8 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: microchip,mpfs-gpio
> +            enum:
> +              - microchip,mpfs-gpio

This doesn't need to be changed, it is fine as is, no?

>      then:
>        required:
>          - interrupts
> --=20
> 2.30.2
>=20
>=20

--xs4yn0wAy3h5xCya
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvqrpgAKCRB4tDGHoIJi
0rDzAP9pyLnXr2ho/eWNw9/JV5Swb++EFvIPKm55QehjzAbh1QEA+DpSQJaEpK8z
I83zNR0nHiajzvuhxVkKZjofswIbuQ4=
=Z0/3
-----END PGP SIGNATURE-----

--xs4yn0wAy3h5xCya--

