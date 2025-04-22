Return-Path: <linux-gpio+bounces-19134-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76230A97183
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Apr 2025 17:48:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A58D17889E
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Apr 2025 15:48:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE18028DF13;
	Tue, 22 Apr 2025 15:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IBCmOnDR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88C71A00F0;
	Tue, 22 Apr 2025 15:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745336897; cv=none; b=OwPXG8+wbbctrL3qeZG64gCJvERraWaVi9HflFp+AdPu/Hngctx0tmNxAHJFv74v78PZ04bwbQ9Ehul/f4ClGNDFDpO+MFz/+nifn7GJnWE3NQX621Q9nca6vE3gMjaewVWzhc2vewXCpx0nR7t3wcp9dfLdowG9orLk4nIYp1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745336897; c=relaxed/simple;
	bh=nqFcG+6F2hXaL5zy+yH+SQePgNZ/EcZEbOmErrH/3vs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mjxJtalr/uxnurAS8iTPJKNYwyiy4QPHdOTWD7qHoQTiWMh6t9avamEbi0fpVVe7BGgNQ5RNrArNLZuhja0jdOCah5hP696tXq0F6Q66/C74JW3FRQ4tzYhsP4xFJRoVSAuMbSp9qShffmU0ClmGlPHWpWuaUwf7R8D7iqkLo8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IBCmOnDR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ACCEC4CEE9;
	Tue, 22 Apr 2025 15:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745336894;
	bh=nqFcG+6F2hXaL5zy+yH+SQePgNZ/EcZEbOmErrH/3vs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IBCmOnDRYXMwdoo3rBgTGRHgMCDl35w7qmEdpl1zUZsxAeSve8j5KRVYfQyiwJIRA
	 ca2B1b8/CqrQPNKef292AjDWZEAa94YysfNqLj6xDxZdXSHHSBnTP92BnVz8oIPHDE
	 MugYkchaJaFaGq6rB+ShjZAVuitfqSMOW1syaBNE0lEOOTMG1JPyrxSzUBc17pqr5d
	 +sL5h0gOTAv/ltxa/RsfkStymPiyAn8/eo4DMicwA5oQeHywIetxGo0q/28x9r7yiQ
	 g8KfDA5B+/3+u62CLztkjoPY6Iqa4LIWXcsRez+8vjZaiJJMLCgskS2cSPqEQMOvSG
	 z0p8RB9v5NGow==
Date: Tue, 22 Apr 2025 17:48:11 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: dts: airoha: en7581: Add gpio-ranges property
 for gpio controller
Message-ID: <aAe6O8qB3d7MjT0-@lore-desk>
References: <20250307-en7581-gpio-range-v1-0-de1262105428@kernel.org>
 <20250307-en7581-gpio-range-v1-2-de1262105428@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="StZJEBqIgxJBqt0I"
Content-Disposition: inline
In-Reply-To: <20250307-en7581-gpio-range-v1-2-de1262105428@kernel.org>


--StZJEBqIgxJBqt0I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mar 07, Lorenzo Bianconi wrote:
> Introduce missing gpio-ranges property for Airoha EN7581 gpio controller
>=20
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  arch/arm64/boot/dts/airoha/en7581-evb.dts | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/airoha/en7581-evb.dts b/arch/arm64/boot/=
dts/airoha/en7581-evb.dts
> index d53b72d18242e3cee8b37c7b1b719d662fd6db8d..a8f8a9f0b807a2ee4fd11f841=
8b8e810a6945d73 100644
> --- a/arch/arm64/boot/dts/airoha/en7581-evb.dts
> +++ b/arch/arm64/boot/dts/airoha/en7581-evb.dts
> @@ -65,6 +65,10 @@ reserved_bmt@7e00000 {
>  	};
>  };
> =20
> +&en7581_pinctrl {
> +	gpio-ranges =3D <&en7581_pinctrl 0 13 47>;
> +};
> +
>  &i2c0 {
>  	status =3D "okay";
>  };

Hi Angelo and Matthias,

Do you have any update about this patch? I have some queued patches depende=
nt
on this one. Thanks in advance.

Regards,
Lorenzo

>=20
> --=20
> 2.48.1
>=20

--StZJEBqIgxJBqt0I
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaAe6OwAKCRA6cBh0uS2t
rK1DAP94bjHgjK6yU6Qawm+loboc0KNNR7UGKdg8qSO90HxTAwD+N8axwL0ELrpP
0ix+uolfAGojTy4Ky9LnSmhkOymJiw4=
=5EBn
-----END PGP SIGNATURE-----

--StZJEBqIgxJBqt0I--

