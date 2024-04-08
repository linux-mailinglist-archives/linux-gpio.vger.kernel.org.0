Return-Path: <linux-gpio+bounces-5199-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E30389CA2F
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Apr 2024 19:00:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ED563B29543
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Apr 2024 17:00:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 191C1142E7F;
	Mon,  8 Apr 2024 17:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M1/J2Rkt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D6663CB;
	Mon,  8 Apr 2024 17:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712595602; cv=none; b=fUhqlAYvSJPZ33NViK3uvyDvE56UiWQf8z6QPGBQdECwXL93jrKe22fXTveERwZW/kCCnqGKXoLkcCG5ag5muupwGD0HFbgN3KcGA7maWzCixal1V8zBceH1lxKFicLH5SMcacGb67KX+4HMDcyVy8fG78/1j7PV6IK9eRwVUXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712595602; c=relaxed/simple;
	bh=F/uYNaxS40sMgeapgyTFuu5ZgXbsKvLU68sRwUvp5DQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nH4B0Ewl4tHip9JToNARGgDQnM+Rrk/fFN+3bVtwODc+Gg4wYoS9MRvBmN4vuAF6Q0gMLXpvkYpQPLJp1drd5tCKwuWgJQ3AbpflHgF0Nfd+bigjVXPatCODDtD1pQ99tsFnKsG1ZMYM8WwMX0WzFDq8WFWpAGX5KopN4tYb9Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M1/J2Rkt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87AF4C433F1;
	Mon,  8 Apr 2024 16:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712595602;
	bh=F/uYNaxS40sMgeapgyTFuu5ZgXbsKvLU68sRwUvp5DQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M1/J2RktfG5kHxBNWr8/izq5bs5OMINTvwhNG8SR5nDCs6pbMIJKo3fIvqCC3ggMw
	 5BvVkO/6IyybsrO/st3QjoJLiQQiTd7dp0vxTYcdtFIhOsmOLv2gsYYYaz9U/7XHCO
	 IxCi9KUrGuORgjA5uGJfy4iz+PqQ36eQNIL+stkeQwWm+WFTehkjroHdlBiWAoteEz
	 8Ewu5cBMSV6Z8ba8ijgth1JyByG439fozXVB5usK2SNJ/5z2kgCxa9Q+m12jlRQDtB
	 oSelpKIi9UW9IS7IFMMJBzUF5XofUMWl2T899zlDBOtM0l/yG7dnMKhTSBJjD/7UWi
	 ZXfhxoqjOZXbg==
Date: Mon, 8 Apr 2024 17:59:57 +0100
From: Conor Dooley <conor@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH 3/3] dt-bindings: pinctrl: mediatek: mt7622: add "base"
 reg
Message-ID: <20240408-hydrated-swimmable-26cec8823926@spud>
References: <20240408090506.21596-1-zajec5@gmail.com>
 <20240408090506.21596-3-zajec5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="woQ3kIQkUiTpoflU"
Content-Disposition: inline
In-Reply-To: <20240408090506.21596-3-zajec5@gmail.com>


--woQ3kIQkUiTpoflU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 08, 2024 at 11:05:06AM +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>=20
> Both: MT7622 and MT7629 use two reg spaces: "base" and "eint". It wasn't
> covered by the binding and also example didn't match incomplete binding.
> Fix it.
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> ---
>  .../bindings/pinctrl/mediatek,mt7622-pinctrl.yaml         | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pi=
nctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinc=
trl.yaml
> index a9ab623b2697..eaa65512161a 100644
> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.y=
aml
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.y=
aml
> @@ -19,10 +19,12 @@ properties:
>        - mediatek,mt7629-pinctrl
> =20
>    reg:
> -    maxItems: 1
> +    minItems: 2
> +    maxItems: 2

This should become an items list with descriptions IMO.

>    reg-names:
>      items:
> +      - const: base
>        - const: eint

Why isnt the new region appended to the list?

--woQ3kIQkUiTpoflU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZhQijQAKCRB4tDGHoIJi
0qVCAQDStiQ0FQ3sVsUTP7LLvXFpzx5JiKs1w+Zlv2KOUeKJ7QEA8gTc2psWCnPr
SUjNx1TwH3zr3xRMwWjtIkIsF2gMGgs=
=xevL
-----END PGP SIGNATURE-----

--woQ3kIQkUiTpoflU--

