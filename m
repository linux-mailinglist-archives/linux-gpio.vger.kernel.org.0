Return-Path: <linux-gpio+bounces-12832-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1805A9C490B
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2024 23:25:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D018A28473E
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2024 22:25:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 183331BC08B;
	Mon, 11 Nov 2024 22:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="EmVmzz4I"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C09176231;
	Mon, 11 Nov 2024 22:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731363921; cv=pass; b=Qs1ku4DxeWGx0HrHnB8Nub6HfnYYiV+l4lWTyvgUKXz+txz+cJMp05xghdKgxz5t7SeiyVXRAW2Kpgb1pCD36z4TgvSD1c74zDvDbEZpj/pgE0VE7d289cgRGtR5fvdOiQwv+kgWMRdKqiMLWDfTc8M8dSi5Yw3pL4zp/5qYC0c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731363921; c=relaxed/simple;
	bh=q1fy+MZSyE7ajGOgEbpEERe+49It71yULwgGC3WaLLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OphuSCSpx1r3TEsg3HWomdrgKoSkooKgAHufWgB4D8nBiWkKexunLrX6HI2CXdRKNn97bq2aFC0aTcZPB3XnAFiB2LsjqSbzSfwQRIh+NDuVhRcFbNT+igMMisNMAmHG5OywIfy7CiP6pxV1X2ri65PGFyO7GvB5a5QVLk0EVj0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=EmVmzz4I; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1731363901; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=g6Q6lEqRF3mAMWuHhrROQyDor9bc0B8R2f6QV2vno0hePCfS7IwZnDd2FbI/JAiMukYqqSV5Wv5sCxhkoBHLaNLOKBn01yz84fMYoG8ocMb9cioUIfmq4dmLLJW3VIqwLXCS5xkohadK0sm36HdkvCjMQi1NjF11pixcBtQOLLM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1731363901; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Y+TpjgBVGRmeOwgTGMmxF5i16Q5dwmhLR/v9pNyTtPQ=; 
	b=DkKY/zJwjUhmMFxjHBc+OA/TAAAmfUwwy/tO91kD2to6aPMIn2A1UpTEcGQEFFezYQNKRYABgu3mFTYHR5otYGbgcLXkOzbAAj2EwxgXdDqAj7yxhOJlNFhLK4dI3a7aLFXkj1NLtHoIUQAbW8U9A+JiYU3t/rvI9fFX8T246xE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1731363901;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=Y+TpjgBVGRmeOwgTGMmxF5i16Q5dwmhLR/v9pNyTtPQ=;
	b=EmVmzz4IwInYhyy4PLojruni4yPVHzr5eE4qHwRTj1XALaecYb+morKRs0aJc8sS
	GOkGG/p9WC0OrI4HXwVX5n6SLkkVBRaqlTKj9M7S0wmIja2wb4nuRSB/v+xbDbIV7pW
	vGC7BAcTwvFYUkrTA/O9FPm6kYHiRLfDlf8vsitg=
Received: by mx.zohomail.com with SMTPS id 1731363899386675.8494422225675;
	Mon, 11 Nov 2024 14:24:59 -0800 (PST)
Received: by mercury (Postfix, from userid 1000)
	id 835E81060457; Mon, 11 Nov 2024 23:24:54 +0100 (CET)
Date: Mon, 11 Nov 2024 23:24:54 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, heiko@sntech.de, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, mika.westerberg@linux.intel.com, 
	andriy.shevchenko@linux.intel.com, tao.huang@rock-chips.com, finley.xiao@rock-chips.com, 
	tim.chen@rock-chips.com, elaine.zhang@rock-chips.com
Subject: Re: [PATCH v4 1/4] gpio: rockchip: explan the format of the GPIO
 version ID
Message-ID: <pf3objqv5sh6me56iuvdm2rq2q5rpibgy2zjaj5aj3u4het5ua@37ztk34zrao6>
References: <20241111023412.3466161-1-ye.zhang@rock-chips.com>
 <20241111023412.3466161-2-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="b6656zhf2jq3tyeo"
Content-Disposition: inline
In-Reply-To: <20241111023412.3466161-2-ye.zhang@rock-chips.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.3.1/231.294.59
X-ZohoMailClient: External


--b6656zhf2jq3tyeo
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 1/4] gpio: rockchip: explan the format of the GPIO
 version ID
MIME-Version: 1.0

Hi,

On Mon, Nov 11, 2024 at 10:34:09AM +0800, Ye Zhang wrote:
> Remove redundant comments and provide a detailed explanation of the
> GPIO version ID.
>=20
> Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  drivers/gpio/gpio-rockchip.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
> index 365ab947983c..71672d654491 100644
> --- a/drivers/gpio/gpio-rockchip.c
> +++ b/drivers/gpio/gpio-rockchip.c
> @@ -26,9 +26,15 @@
>  #include "../pinctrl/core.h"
>  #include "../pinctrl/pinctrl-rockchip.h"
> =20
> +/*
> + * Version ID Register
> + * Bits [31:24] - Major Version
> + * Bits [23:16] - Minor Version
> + * Bits [15:0]  - SVN Number
> + */
>  #define GPIO_TYPE_V1		(0)           /* GPIO Version ID reserved */
> -#define GPIO_TYPE_V2		(0x01000C2B)  /* GPIO Version ID 0x01000C2B */
> -#define GPIO_TYPE_V2_1		(0x0101157C)  /* GPIO Version ID 0x0101157C */
> +#define GPIO_TYPE_V2		(0x01000C2B)
> +#define GPIO_TYPE_V2_1		(0x0101157C)
> =20
>  static const struct rockchip_gpio_regs gpio_regs_v1 =3D {
>  	.port_dr =3D 0x00,
> --=20
> 2.34.1
>=20
>=20

--b6656zhf2jq3tyeo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmcyhC0ACgkQ2O7X88g7
+po2UQ//SaaGn6KvUKLzfv6DxDAi3EtbLuUg0+4X9iyEI/lQ46DQQzLZ3dhoa6vp
Pg5bjpTppFJq4ZAh9ANH6ngoXPmmE8GHq0lVca2cJFQHW7nPb5Dr5ffgtLiC720Q
Y/ZJBMlFQ6cCy0jftIF989pUD9q+tuP6rC1bfFjpW23a/vD83bvraRKXf/shonuZ
REM5GxHugB0nQrXWEFa+45zmE1IBEgikI+/g4rgc/JNsAlL1kgZHkfVCVqHqx0GF
5f0l00IOPTQBT1nc2G9dk3yARdOGx7zLWidD5b7tS4uwY+pKBBE6VzwqEoPSHWI+
aQkH7RZ2ljfcbjhzV9KpxgxTKKJzz/uaR5lsUJuHnHuk5bniTrp5xaVEQZaQRutW
csnIMrSZJZekyFnMASLY7uG+Een/8/8qQfGTjkeDTtpKqBUJ7HfWv1u2R2CZWAvM
Vw7U5wGuFlhRjuNQ3UdCVA43duIcVR8Aljd3a0LxqpgZzjEf7Jl0UmN6M42S3PKl
tpDxcOKAKcHeA5FsHrS0pTqQjFz7oCrP17mCmmvmLsSUkhuxg+NOwDYrd/ZKH/8k
Lo9b+bjWe7ajZoW6I9ndV2hOejdWsE6/5cGKI0VHdlEoURlooeL8iMEMiz+HjEub
zP5zTfdXeop/eXdOCGNuBcnlbC42Ubf3uWnCyjj+QlY+vHagkno=
=zlKr
-----END PGP SIGNATURE-----

--b6656zhf2jq3tyeo--

