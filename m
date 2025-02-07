Return-Path: <linux-gpio+bounces-15561-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DA25EA2C942
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 17:49:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77222161F5B
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 16:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F3F31922E8;
	Fri,  7 Feb 2025 16:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eyJ2i8Ov"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289AC161320;
	Fri,  7 Feb 2025 16:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738946973; cv=none; b=QVwmgeezf2TCFINvp8Lsaqn/dMQPcyTVWYdI1d6ubbMGUUq4tlj89lYuU42srzvkGA1wumba8rSCBvyd9l9uIkeiRy/0MYHRigpdN7DBQoDwlOLEkF8EJ6hhrErXTw95w2ecaIhw6ePL1hlpEqEsLCNJvQGvIfztOKqb2GjsCJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738946973; c=relaxed/simple;
	bh=ItfnGfst8Hsw1pgzRl9nYJMmsBmHoauxcyRGeQCngLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gee5upgp3zwvOiw3RxEfuysL6/hINwqXkmC/36VkT1V+TA72HEANorxhicZKkgo4pmInjD90XZ79fE4aBAXqbC9ebX96dlpC5aATxLxhNsYg/6Jpq0/y5Pc0UQ72GGfoZMXDQBcApJXUE4pRtbcrTT41gLbFU0FJq5LPYd4/sVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eyJ2i8Ov; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D809DC4CEE5;
	Fri,  7 Feb 2025 16:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738946972;
	bh=ItfnGfst8Hsw1pgzRl9nYJMmsBmHoauxcyRGeQCngLc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eyJ2i8Ovem9vEjhEOnzIOUbfpDskXresbo3Vu9Shg4H0KMRy/Z5mEROxqxaOCe2Do
	 ytRsmC2tgpq8vRIyNCUqez2TR21GN+AZin39Bpr+gxXKDAFo57GSy2U6a34zsOKCH6
	 dasozOdoK+VvcGPOm3SPt4Ic04PfNZZX+hTgv/UHcbZQq/395R+WKHZBejTNI/IZs3
	 q0g7LeTNP7AZ1MDr2ZL3pyQRuY3bIRkm3FTPIbunNXhFxJ2TRI64f5XXqGBmP1BGMd
	 IiZgUKVHtzYUoccrjxosruabdh+ZTlX8sJ9Om1lb2bn6MPRIgtJ1hShMrW9ImFNW7y
	 cMy8mpcwByX2Q==
Date: Fri, 7 Feb 2025 16:49:28 +0000
From: Conor Dooley <conor@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Alex Elder <elder@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, spacemit@lists.linux.dev
Subject: Re: [PATCH] pinctrl: spacemit: enable config option
Message-ID: <20250207-promenade-hazily-d7900cbc127e@spud>
References: <20250207-k1-pinctrl-option-v1-1-e8a7e4d8404f@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rYTB+GBMkx5iLYMN"
Content-Disposition: inline
In-Reply-To: <20250207-k1-pinctrl-option-v1-1-e8a7e4d8404f@gentoo.org>


--rYTB+GBMkx5iLYMN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 07, 2025 at 08:11:42PM +0800, Yixun Lan wrote:
> Pinctrl is an essential driver for SpacemiT's SoC,
> so let's enable it by default for this SoC.
>=20
> The CONFIG_PINCTRL_SPACEMIT_K1 isn't enabled when using
> 'make defconfig' to select kernel configuration options.
> This result in a broken uart driver where fail at probe()
> stage due to no pins found.
>=20
> Fixes: a83c29e1d145 ("pinctrl: spacemit: add support for SpacemiT K1 SoC")
> Reported-by: Alex Elder <elder@kernel.org>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
> This should fix problem that CONFIG_PINCTRL_SPACEMIT_K1 is not enabled
> when using make defconfig, thus fail to initilize uart driver which requst
> pins during probe stage.
> ---
>  arch/riscv/Kconfig.socs          | 1 +
>  drivers/pinctrl/spacemit/Kconfig | 1 +
>  2 files changed, 2 insertions(+)
>=20
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index 1916cf7ba450ec9958265de2ca41dc504d4d2f7c..17606940bb5239d0fdfc6b5ae=
fb50eeb982d14aa 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -26,6 +26,7 @@ config ARCH_SOPHGO
> =20
>  config ARCH_SPACEMIT
>  	bool "SpacemiT SoCs"
> +	select PINCTRL
>  	help
>  	  This enables support for SpacemiT SoC platform hardware.
> =20

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> diff --git a/drivers/pinctrl/spacemit/Kconfig b/drivers/pinctrl/spacemit/=
Kconfig
> index 168f8a5ffbb952cbeae3e3401c11149558e0a84b..aa3dea535def87ed75d86bc55=
5b2b90643adbdea 100644
> --- a/drivers/pinctrl/spacemit/Kconfig
> +++ b/drivers/pinctrl/spacemit/Kconfig
> @@ -7,6 +7,7 @@ config PINCTRL_SPACEMIT_K1
>  	tristate "SpacemiT K1 SoC Pinctrl driver"
>  	depends on ARCH_SPACEMIT || COMPILE_TEST
>  	depends on OF
> +	default ARCH_SPACEMIT

This is effectively just "default y", since ARCH_SPACEMIT is a
dependency.

>  	select GENERIC_PINCTRL_GROUPS
>  	select GENERIC_PINMUX_FUNCTIONS
>  	select GENERIC_PINCONF
>=20
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20250207-k1-pinctrl-option-de5bdfd6b42e
>=20
> Best regards,
> --=20
> Yixun Lan
>=20

--rYTB+GBMkx5iLYMN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6Y5mAAKCRB4tDGHoIJi
0n9bAP9XtCzAV2iiq9j3juCE6vQIfvx2/7YUbFSqiWXDIxWXEgEAgRXKFqkntGmr
M0aPk8b4FjhWokyIM7/Xo2cJz9vhlAI=
=gtfL
-----END PGP SIGNATURE-----

--rYTB+GBMkx5iLYMN--

