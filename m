Return-Path: <linux-gpio+bounces-8999-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0CE95BB58
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Aug 2024 18:06:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E12FC1C229A4
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Aug 2024 16:06:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCED11CCB35;
	Thu, 22 Aug 2024 16:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YCLoBA6w"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA0D28389;
	Thu, 22 Aug 2024 16:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724342809; cv=none; b=LNujKUyVVmIIawDmUSQv5XWCbHYyZX2kPuO+Fa7fcC33Hd7pqHNYe0eYMQyjoNa7DMV581OBF6XOO/2PxW3Vgfz3Uo7qF4nTr+y1GwaI9BnWqQ8gRVyso7uU0PBX3pvnlSI42rk71hVF1L9qdwve775I0u2pMF61aaq3cR82+BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724342809; c=relaxed/simple;
	bh=JKSc2pCJPHiBPYG6O9itMsD/N2edGQ/08PARRYFbmoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OgFfjVVp3Jwnv95d+mmT8ZfdDuUruq9Rw9gzg8boYyLj0aRK4u6WHPhv0ZbipVwWlj6BtUGh/Hp1GSFC0Yrm/kPVsP5hpUzIsvBaCE09vs9uiA2FeFDb+lwLewVCvHTE8dehOwDfd0g9rY74CsQYYlcKXsaz6zz5kD2DbOr/3cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YCLoBA6w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27058C4AF0B;
	Thu, 22 Aug 2024 16:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724342809;
	bh=JKSc2pCJPHiBPYG6O9itMsD/N2edGQ/08PARRYFbmoI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YCLoBA6wK8HES0FLgfc3r7p3Ru9S+uWShWHV6U2bduADrNBxYRHYMnkOnIHGsttl9
	 sjbtOtDejqqhu0hiMg+FQSmBCotX5JNMyTPMxXIBixGBQAMwV93LEwSHP1HRNeKjzi
	 BvkKOjlYiKSlqujAelZfBsUYKMtsHrhj6NeeRo6TIZet+iOdvxVbh+twWZ0I109THi
	 CtOfdiu6gWyo4mqB0C8iTN/fj88Il4RTdbsNVZxoLgJ9/qB8ShBoJAhpLkXaxjrtJ1
	 rFtIroybZd3RB/4hjrnHEdpt3MxtHWV4LytV1fNDJE1MjjjpqG9og5qGovqU2ghEqp
	 PoGwLrdks5XAw==
Date: Thu, 22 Aug 2024 17:06:44 +0100
From: Conor Dooley <conor@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	upstream@airoha.com, benjamin.larsson@genexis.eu,
	ansuelsmth@gmail.com
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: airoha: Add EN7581 pinctrl
 controller
Message-ID: <20240822-taste-deceptive-03d0ad56ae2e@spud>
References: <20240822-en7581-pinctrl-v2-0-ba1559173a7f@kernel.org>
 <20240822-en7581-pinctrl-v2-1-ba1559173a7f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Keq2bc7KVkSdMDBF"
Content-Disposition: inline
In-Reply-To: <20240822-en7581-pinctrl-v2-1-ba1559173a7f@kernel.org>


--Keq2bc7KVkSdMDBF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 22, 2024 at 11:40:52AM +0200, Lorenzo Bianconi wrote:
> Introduce device-tree binding documentation for Airoha EN7581 pinctrl
> controller.
>=20
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> +  reg:
> +    items:
> +      - description: IOMUX base address
> +      - description: LED IOMUX base address
> +      - description: GPIO flash mode base address
> +      - description: GPIO flash mode extended base address
> +      - description: IO pin configuration base address
> +      - description: PCIE reset open-drain base address
> +      - description: GPIO bank0 register base address
> +      - description: GPIO bank0 second control register base address
> +      - description: GPIO bank1 second control register base address
> +      - description: GPIO bank1 register base address

> +      pinctrl@1fa20214 {
> +        compatible =3D "airoha,en7581-pinctrl";
> +        reg =3D <0x0 0x1fa20214 0x0 0x30>,
> +              <0x0 0x1fa2027c 0x0 0x8>,
> +              <0x0 0x1fbf0234 0x0 0x4>,
> +              <0x0 0x1fbf0268 0x0 0x4>,
> +              <0x0 0x1fa2001c 0x0 0x50>,
> +              <0x0 0x1fa2018c 0x0 0x4>,
> +              <0x0 0x1fbf0200 0x0 0x18>,
> +              <0x0 0x1fbf0220 0x0 0x4>,
> +              <0x0 0x1fbf0260 0x0 0x8>,
> +              <0x0 0x1fbf0270 0x0 0x28>;
> +        reg-names =3D "iomux", "led-iomux",
> +                    "gpio-flash-mode", "gpio-flash-mode-ext",
> +                    "ioconf", "pcie-rst-od",
> +                    "gpio-bank0", "gpio-ctrl1",
> +                    "gpio-ctrl2", "gpio-bank1";

before looking at v1:
I would really like to see an explanation for why this is a correct
model of the hardware as part of the commit message. To me this screams
syscon/MFD and instead of describing this as a child of a syscon and
using regmap to access it you're doing whatever this is...

after looking at v1:
AFAICT the PWM driver does not currently exist in mainline, so I am now
doubly of the opinion that this needs to be an MFD and a wee bit annoyed
that you didn't include any rationale in your cover letter or w/e for
not going with an MFD given there was discussion on the topic in v1.

Thanks,
Conor.

--Keq2bc7KVkSdMDBF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZsdiEwAKCRB4tDGHoIJi
0uKZAQDj5+09ic83KcLDIq5zWWJ09DULVEuilCvZB8SXAroqgAD+Jui9Hf6JNAuM
9ieVzZOf+irfrtrGnPCFLrkKqBC7hAQ=
=dqn2
-----END PGP SIGNATURE-----

--Keq2bc7KVkSdMDBF--

