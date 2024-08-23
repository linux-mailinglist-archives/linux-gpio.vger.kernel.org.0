Return-Path: <linux-gpio+bounces-9055-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B2A95CDF5
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 15:32:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78DE01F251D7
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 13:32:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F369C18755C;
	Fri, 23 Aug 2024 13:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="brZY86nX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC6814387B;
	Fri, 23 Aug 2024 13:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724419944; cv=pass; b=ABG2nhIV/6ttA/qAskDUlTNE/5rJkBt1halMMtTHjQp5wmM3NqnZXEQuElTgnbEgjJglRvW6673xbSJwIzQxs+Yyy7pN8JPB4Ot/1FppHjM3kCK5LrlIm4afLJXCcHQ1l05SftFrUQY6ho+nnGqR7fhzeiO0spteO8kXKuv7Hzo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724419944; c=relaxed/simple;
	bh=4GVfqZ9yOekn4tnZ0CwmT/G8IupJRVl+CvpU1zQpgwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PJ9J1wfLcV3B0pGj6b56PaNQo9TtPZQyuWgInFXWrpwKCCASAYZuesOMUGMOk+wgzp+ZK51wxMwGmelZLXEvJESuQWFC7ZWj2QrNyONdRwz8ZVKithHSlBDURlkvQH8ZDlXemaQTGlwuYJwMFLo3t0VZ4YnXYei6qwnj6TsuHW8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=brZY86nX; arc=pass smtp.client-ip=136.143.188.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Delivered-To: detlev.casanova@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724419928; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KPAyQPg5eTVOLlCTUyJVq1JaBUlGmOOewxA+F0jfoYKiejNzjEzAFuw3xEOHTrrVA0mNYOCiBoDwxDfC9GYqyOnUE9nu2PSYg10NvmWorAAoZIl8ZeiKnSJf+JpQn7aVn9MwO8WmB7vJU+rPoy0Do2TDUA7HEIYUQ6Sznyzp/70=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1724419928; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=36+a1glbwxcI0a2i+ISO16XDr0TPQCW8/sEg2TiO13k=; 
	b=TXxIwHfmoj2KuqJfrKd99zhFQ2LWlnQxKppEhaU4UJqckb1e+uYa/fQW600Vt2+Z8VdrWvXLfo5q3jXzVwhtbsbxxnqx3UPK/OyCdFp+Be3EbaeuQZJgzd0mE1NpmILrWLAJPRzbJJzJxcBTFEKozgNUYP2YzCdzs7LSGy+Deu0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724419928;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=36+a1glbwxcI0a2i+ISO16XDr0TPQCW8/sEg2TiO13k=;
	b=brZY86nXo+B9PwbZJ+W2OizsPGsYK2O/CIryusHuS/EvssKKSXAkAzfGLqiQCQRU
	NXWK6RpGiVr2agI2aie/kPcL5t6QGlOLLt5QdthlvXmAWJCG33IyRFM2uyjX5dnXkr/
	uQAqjPazjh7QKY6XcL9r6eU8979HuuDTUAs92QhU=
Received: by mx.zohomail.com with SMTPS id 1724419926661174.78715179759513;
	Fri, 23 Aug 2024 06:32:06 -0700 (PDT)
Received: by mercury (Postfix, from userid 1000)
	id 3A8581060533; Fri, 23 Aug 2024 15:32:01 +0200 (CEST)
Date: Fri, 23 Aug 2024 15:32:01 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, heiko@sntech.de, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, mika.westerberg@linux.intel.com, 
	andriy.shevchenko@linux.intel.com, tao.huang@rock-chips.com, finley.xiao@rock-chips.com, 
	tim.chen@rock-chips.com, elaine.zhang@rock-chips.com, detlev.casanova@collabora.com
Subject: Re: [PATCH v2] gpio: rockchip: support new version gpio
Message-ID: <c6mvxcgono3s2jtotks6sfqojenj2nmvf4b5fau5uc6gmlmerb@oi34wxnqna4n>
References: <20240823034314.62305-1-ye.zhang@rock-chips.com>
 <20240823034314.62305-9-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kvez7yto2c3wu2kd"
Content-Disposition: inline
In-Reply-To: <20240823034314.62305-9-ye.zhang@rock-chips.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.3.1/224.322.35
X-ZohoMailClient: External


--kvez7yto2c3wu2kd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Aug 23, 2024 at 11:43:11AM GMT, Ye Zhang wrote:
> The next version gpio controller on SoCs like rk3576 which support four
> OS operation and four interrupts
>=20
> Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
> ---
>  drivers/gpio/gpio-rockchip.c | 40 ++++++++++++++++++++++++------------
>  1 file changed, 27 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
> index 25ddf6a82c09..5289c94d5c60 100644
> --- a/drivers/gpio/gpio-rockchip.c
> +++ b/drivers/gpio/gpio-rockchip.c
> @@ -29,6 +29,7 @@
>  #define GPIO_TYPE_V1		(0)           /* GPIO Version ID reserved */
>  #define GPIO_TYPE_V2		(0x01000C2B)  /* GPIO Version ID 0x01000C2B */
>  #define GPIO_TYPE_V2_1		(0x0101157C)  /* GPIO Version ID 0x0101157C */
> +#define GPIO_TYPE_V2_2		(0x010219C8)  /* GPIO Version ID 0x010219C8 */

The comments for anything but the V1 define are redundant.

[...]

> @@ -648,13 +655,20 @@ static int rockchip_get_bank_data(struct rockchip_p=
in_bank *bank)
> =20
>  	id =3D readl(bank->reg_base + gpio_regs_v2.version_id);
> =20
> -	/* If not gpio v2, that is default to v1. */
> -	if (id =3D=3D GPIO_TYPE_V2 || id =3D=3D GPIO_TYPE_V2_1) {
> +	switch (id) {
> +	case GPIO_TYPE_V2:
> +	case GPIO_TYPE_V2_1:
>  		bank->gpio_regs =3D &gpio_regs_v2;
>  		bank->gpio_type =3D GPIO_TYPE_V2;
> -	} else {
> +		break;
> +	case GPIO_TYPE_V2_2:
> +		bank->gpio_regs =3D &gpio_regs_v2;
> +		bank->gpio_type =3D GPIO_TYPE_V2_2;
> +		break;

Can't this just be handled like GPIO_TYPE_V2_1 (i.e. reusing the V2
case)? Also it looks risky to use >=3D on gpio_type. GPIO_TYPE_V2_2
looks like a simple enum, but it contains the ID. Is it guranteed to
be increasing? In that case any ID > GPIO_TYPE_V2_2 should not
default to GPIO_TYPE_V1?

> +	default:
>  		bank->gpio_regs =3D &gpio_regs_v1;
>  		bank->gpio_type =3D GPIO_TYPE_V1;
> +		pr_info("Note: Use default GPIO_TYPE_V1!\n");

Can we have a list of valid V1 IDs and default to -ENODEV?

Greetings,

-- Sebastian

--kvez7yto2c3wu2kd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmbIj0YACgkQ2O7X88g7
+po2CRAAqG5J+F5LRYbd+YUt4EK3DRMoN2w4n0P/DMq1lXgeH555/OJOW4pncyrR
6/wkI8KYwKLLEZSbRbgo3PCOiobC6GlEtyX9p0h9ZDl8ioLAymUIbHT0EOkVtj7N
PlgLcAu/bZRH1IucSOP7ks474ePpdePiCLw6101pqWpjLpVrQZryq6iEA5YJU60f
VpaSLcNp3HF5nAyo5tlfyUexgEJEDMhMDpzf/Rrm4Z6o5yJxbGjn+tSkGJm64atu
EkGmFX96ACW+9HtGrX6Oc7FModh1mPwDJBc9VIvxTCbhvvrZ4BTUcPbdRxHUdKNs
kfSYmZ6t2HMEVG+madk+4IJgFHRdd8IeD9i1XDfpSni9lv/qQNgBQibYd6CVGvc2
bMk6h/WmLv/Mc1mSQ/CLPahSjoYRjKzbWrvg96aZkLejBOU6UcY4fO3/CpSTXGp/
HNWe/TSfY1B2ErSdKp4Izw5SbXC93SrZZvPf45FGX/iUUkw9RdhvirVRaTbV/jmI
J3Ih00t+XHPsIuwRnuRglAlloHPPkJp2TUMv9WkpI5dTuAzh3TO5JABsxNx0WwF0
UtJBEEuYtV9bDwVDWsvG+aI4cf5zmxAriWbAZljpu5hbruVjmX00YZXWxyj3FxjU
5EnhBWyiLQHGHakN5okQj7BC2Z0pDc6UXVcZPvrGNGMa8nySYN4=
=xJ6l
-----END PGP SIGNATURE-----

--kvez7yto2c3wu2kd--

