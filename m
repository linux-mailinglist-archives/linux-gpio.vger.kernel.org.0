Return-Path: <linux-gpio+bounces-12833-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BFE9C4928
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2024 23:37:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 567FDB24AD4
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2024 22:27:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DCE9171671;
	Mon, 11 Nov 2024 22:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="hPhRr9Em"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F71150990;
	Mon, 11 Nov 2024 22:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731364066; cv=pass; b=Px5+dMjEdsv9i4mRKq7HjD37H8yn+Xrrp73ggxqKqvr1395F229E4NqZhOPyNscs1Ma144MZQ6pFsWrDQ4ZdWywjbCdTX7xer+EtrdtvR7iwwyceH6gxFccGI1LVnsVuJNubzWRJf3G0mNVNxXcH3dGLA9q9GfEa42fNPUImWpI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731364066; c=relaxed/simple;
	bh=Ox3nFenrZeeiI8LGwiAzfxtkd5mjSf6RiBt2h+ftAig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fFKv555cNxRGlArxeqWsT/fIRWxfP7Y5QAygayYT4GSTmQMZexdZVxyptG4iWACdukXB7vIvlVzQbyWzYv5JQvgtNFz8F05TJQww4gJGj7uyatof7lYXSOUz62IFNhkXPpM9xtUv3X12Ery9kOsZ3Z1lsQQnENh1OIrfALgmkGE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=hPhRr9Em; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1731364048; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XYcI1ZMq4lyB+M6pCxKTx49dLj1eGACHkSjwVWYdi9Lchib3oXrQbEUrmbtWOYsra+Bcr4ocZt4bzBiCDkoqeUc2b7rwIE4b7ec/KWfieMf+KonPeE6n8KVYLoJQCxXol6eKDzopiQQiVgO4W05yAcS2KjrBB5ZFRTSOu78tiYI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1731364048; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=CCUoKkey3DUp6iL88Vt9EotitG4C5/eAMN0v9USxUDI=; 
	b=KfjpskdgGcLaVSrY1XLVvOHz/vdQe9tciSUdvT33iH4qULPCl3V+MGgchLChVYWZWdzBsvLhC1uDs8Xl42DNSIT51ZxodWh7JasQHl5UEwtg60Uh1frDeUWvvXehMGBwm1wbIDRk2bBY3eOWVBTD7lpjDYKP1sOvZkNTVPS1lwQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1731364048;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=CCUoKkey3DUp6iL88Vt9EotitG4C5/eAMN0v9USxUDI=;
	b=hPhRr9EmL76Xd8PdVGuIvNLBPlvJTLGPVUZxURD9enBCMo/nPm13xoqvljwfB9i1
	afw83CCoVz7PSiNri3q1NI6WhRHQlUaaaBEsy1u5zVK+kYeo461iyhu+Vh+rQQlpCE9
	/CG9glMB/R3Ka/sX2AxG/9SbYFz0xH9vD+Ukx1rg=
Received: by mx.zohomail.com with SMTPS id 1731364046934984.4728785857724;
	Mon, 11 Nov 2024 14:27:26 -0800 (PST)
Received: by mercury (Postfix, from userid 1000)
	id 1EC311060457; Mon, 11 Nov 2024 23:27:22 +0100 (CET)
Date: Mon, 11 Nov 2024 23:27:22 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, heiko@sntech.de, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, mika.westerberg@linux.intel.com, 
	andriy.shevchenko@linux.intel.com, tao.huang@rock-chips.com, finley.xiao@rock-chips.com, 
	tim.chen@rock-chips.com, elaine.zhang@rock-chips.com
Subject: Re: [PATCH v4 3/4] gpio: rockchip: support new version GPIO
Message-ID: <ufc7neof2dxlfsb3cfssk3aa6vrorgue4htmgpjbhqkkcs2zpn@mejkcq6puntn>
References: <20241111023412.3466161-1-ye.zhang@rock-chips.com>
 <20241111023412.3466161-4-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7u42vpw7xhebrsqx"
Content-Disposition: inline
In-Reply-To: <20241111023412.3466161-4-ye.zhang@rock-chips.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.3.1/231.261.35
X-ZohoMailClient: External


--7u42vpw7xhebrsqx
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 3/4] gpio: rockchip: support new version GPIO
MIME-Version: 1.0

Hi,

On Mon, Nov 11, 2024 at 10:34:11AM +0800, Ye Zhang wrote:
> Support the next version GPIO controller on SoCs like rk3576.
>=20
> Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

This is needed for 6.13, which introduces RK3576 support and
currently (linux-next) tries to use the GPIO controller in V1
mode.

-- Sebastian

>  drivers/gpio/gpio-rockchip.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
> index f05b92e0e977..b7a43e492965 100644
> --- a/drivers/gpio/gpio-rockchip.c
> +++ b/drivers/gpio/gpio-rockchip.c
> @@ -35,6 +35,7 @@
>  #define GPIO_TYPE_V1		(0)           /* GPIO Version ID reserved */
>  #define GPIO_TYPE_V2		(0x01000C2B)
>  #define GPIO_TYPE_V2_1		(0x0101157C)
> +#define GPIO_TYPE_V2_2		(0x010219C8)
> =20
>  static const struct rockchip_gpio_regs gpio_regs_v1 =3D {
>  	.port_dr =3D 0x00,
> @@ -674,6 +675,7 @@ static int rockchip_get_bank_data(struct rockchip_pin=
_bank *bank)
>  		break;
>  	case GPIO_TYPE_V2:
>  	case GPIO_TYPE_V2_1:
> +	case GPIO_TYPE_V2_2:
>  		bank->gpio_regs =3D &gpio_regs_v2;
>  		bank->gpio_type =3D GPIO_TYPE_V2;
>  		bank->db_clk =3D of_clk_get(bank->of_node, 1);
> --=20
> 2.34.1
>=20
>=20

--7u42vpw7xhebrsqx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmcyhMkACgkQ2O7X88g7
+pr8Gw/8C6issbH3YOd0OP/TIl2LHTPwlZjgXew5kIc7ctl6AKper5SRZBZTzs4U
QpEjm3DHKinsATe24Um295qZZtP8CIUADLPGNirMNo7oNSY4D63jRiTOteYNHqm0
9qRhLLSDcOIqhGUQS/JoxGhH6acSf+DUz9/EiNJEX2DG3PB4ePwfTUNyMiaiE+yA
ffk87vL6sQdiEVzEiY8oLmvI1+vJ9R6CdsRltq55exxI1pVDPcSpWK0XHXeKbGBe
jlFn35G+bKhkhuzqV9WRlE3pBJEQvn6p8ju0P+doNA7KWhWoPNFhh4x5GGQWrh34
ERdg/cRtLj5A3lie8Ozlf6RwzC77c+GtQrH8HIrdZ3L6uTueh2fwQ6e/Tu1PeAei
2xB+F8QzJmduS7rL/zWEvU5i7tT/8bfCoDLlasbXA9zVdkryiqKDezjURt8k3bHW
pOjnO5C/YrFHF2YFl6ckfJ8C5AJ23Lgd3eSqkenh1RY22BV5iTr1OqlG/DxFt+ge
8jRQBvl7wSU+0Z7cVgHH9BxSkisDYWWCnrDkTL6mGe5AsLWWnz2LUi/1ltaaWY63
E6Dj7hrjORSvWnr5ZxubYDPtJ1gUAQn2mio7zPhGOcbOSfKkTWarMaKxDNXDbTi0
R2c9JHxKYmqFyYbnoFa0zjL/fiEmI8rO0CRWUwNZYHKtig8hxHw=
=hXQn
-----END PGP SIGNATURE-----

--7u42vpw7xhebrsqx--

