Return-Path: <linux-gpio+bounces-27485-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DC324BFD814
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 19:15:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 69DC2564208
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 17:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F086627990D;
	Wed, 22 Oct 2025 17:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TkAbGohs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2896224891;
	Wed, 22 Oct 2025 17:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761152985; cv=none; b=eyCNEt/t+wdlPxZnrKoXDTCLd2k9M2rWxoP+WJxRwBDBU2MRvAiiyuM/DbpDBKZSdaiy9NQ2/zyxsvvPdDI1jBNyrJbVZ3Af0Ttov0rcZCKWYPdGvZcqUNnsVt0jYWDc10+Y4cHpFJYLuwndRTMTHU7LHOxnunlM5tmChw8q+ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761152985; c=relaxed/simple;
	bh=ydlTxjvYq5Gbbz05N9YC6KCF1ed5gKytazDIpqij1vw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xek4lYpeIGcTmealBsYv/vftB08kkmax/Nxg1D7fr0PQDSAFEtNEDyhn0GAGoO912YgHvuSgRRN1w5lZyk8odg0B8zN/OT3ea0i18vYI03WlqBQ1rohgmC9NNyhQ7jlCEccnlXPysQvs6WVlAb2th/h+ewbVNqxxdgsOAVicmjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TkAbGohs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7B5CC4CEE7;
	Wed, 22 Oct 2025 17:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761152985;
	bh=ydlTxjvYq5Gbbz05N9YC6KCF1ed5gKytazDIpqij1vw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TkAbGohsjFE2PmC5J3+B5AhYmxAZOt9QBJ9AqO7gndioVHRicMTS/t4a7GN/50y5C
	 OpI1maQRestudc0QW9UFiMIOpLWBexwCVWo637tpeEPODDz4lSKDH57BJwmQi9EKaQ
	 iRiN61u6qDwq0uMERlzBFgJlVxBS/eN/q59jEzsdNIF5iXLa6j9dVe5hca2p4T9q4k
	 FhiymCb/qOxWW/Mxri4x1JwhXARodSgexLjwpawz4cV+FKyi105lBaqy8ZYgPliaHp
	 6ukssOFpJY2jjAqLSxLBo3MWY2wcHO35ANp6YLV4MbOJyLxZQXuTDGy9ewBnlZibgZ
	 u54QbKR/Y5i0w==
Date: Wed, 22 Oct 2025 18:09:40 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Punit Agrawal <punit1.agrawal@toshiba.co.jp>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: pinctrl: toshiba,visconti: Drop
 redundant functions type
Message-ID: <20251022-magnify-skirmish-de92e7055795@spud>
References: <20251022133425.61988-3-krzysztof.kozlowski@linaro.org>
 <20251022133425.61988-4-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iqpAgK9IAwUWzlVV"
Content-Disposition: inline
In-Reply-To: <20251022133425.61988-4-krzysztof.kozlowski@linaro.org>


--iqpAgK9IAwUWzlVV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 03:34:27PM +0200, Krzysztof Kozlowski wrote:
> Referenced pinmux-node.yaml schema already defines type for "functions"
> so $ref is redundant.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.yaml    | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/toshiba,visconti-p=
inctrl.yaml b/Documentation/devicetree/bindings/pinctrl/toshiba,visconti-pi=
nctrl.yaml
> index ce04d2eadec9..0eff0a0ee9e9 100644
> --- a/Documentation/devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.=
yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.=
yaml
> @@ -42,7 +42,6 @@ patternProperties:
>        function:
>          description:
>            Function to mux.
> -        $ref: /schemas/types.yaml#/definitions/string
>          enum: [i2c0, i2c1, i2c2, i2c3, i2c4, i2c5, i2c6, i2c7, i2c8,
>                 spi0, spi1, spi2, spi3, spi4, spi5, spi6,
>                 uart0, uart1, uart2, uart3, pwm, pcmif_out, pcmif_in]

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--iqpAgK9IAwUWzlVV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPkP1AAKCRB4tDGHoIJi
0gdcAQD7GTUJXvhA+RwYqh6TGon8QqMhvI96fkPeC9+JX0Ju2AD/VYaxl3bsh0Kk
8ADeQ3fRjl7GcBL7FT+uDuYtw6UenA0=
=VdM7
-----END PGP SIGNATURE-----

--iqpAgK9IAwUWzlVV--

