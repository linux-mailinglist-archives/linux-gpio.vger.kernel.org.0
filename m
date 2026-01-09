Return-Path: <linux-gpio+bounces-30352-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 684C4D0A8B1
	for <lists+linux-gpio@lfdr.de>; Fri, 09 Jan 2026 15:05:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9401F301C821
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 14:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E140135CBD3;
	Fri,  9 Jan 2026 14:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SCArJN5P"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4EA035CB91;
	Fri,  9 Jan 2026 14:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767967542; cv=none; b=suIblGgh7iOz+QNFCaovBIZa6TeQOGohlXOU6qvFVyo2L3VJzmf25nDqedObihiWWnDBCNdWYNLR8XnRKwGCMwX7xDIJlNoHhrVejxLn8TL8XaQTdUCGqmjEbqleEgW0zDH5XhvzgWScVfge9RVpAzIEhr8FH4IBmS6t7uPs8xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767967542; c=relaxed/simple;
	bh=yrih7gRBP3ftIXPawPbWi9tmAt3IunSJUCU6u8MVEoQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Subject:Cc:
	 References:In-Reply-To; b=SaMyYuU4wBFLqcc13cM+oKc6RAhqopLG/f6LM1PScXSE8DNeIm7QjrPHMIb2uPe7UA1DR6oPKCCMqz31+U9FXoPkF4EvfY7oyHcqqhCNoEAZcvwcldQxQiCrS29OaBLhAiDD/+gJIuWtGVADG7d3dPFvl9dwMS+wWJPP0ABppho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SCArJN5P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0230C4CEF1;
	Fri,  9 Jan 2026 14:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767967542;
	bh=yrih7gRBP3ftIXPawPbWi9tmAt3IunSJUCU6u8MVEoQ=;
	h=Date:From:To:Subject:Cc:References:In-Reply-To:From;
	b=SCArJN5PjCd/pwKwMK6SZsgCb9GhMIcljv0rv2etrYREPgWO0SK5vTbGpMpKl3MdZ
	 tUdEjuUqNdcxF+QhER6sxG55IOyosHOAC94uzgGV2w3/dAbcSxinKAbSk7Lv6uTKOh
	 07u6E3lWrUvf/snLkQwNkKVvKsKRWH35SBg95DP1yhMAYcOGTa8lyT74k7VcU5rGOl
	 sQzCTFo3Dr2lLaALs2gVn8UyAHB3cpQEcSd1e07yEQJXCiPyxeIMLpkZ0w9TsSJtI1
	 ZHtHd7vR/K/fzDarg9Jwb9irs7s1QTnPN3vQtVLwBciThEunzyl9F38qmKM2WWJqSi
	 h3E5H9vzO3ZdA==
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=f1617902ff2ddf7a2ec1316a0543e381ae6439ba0ce5a857e6cd39e18618;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 09 Jan 2026 15:05:36 +0100
Message-Id: <DFK46PUEYQFD.1ZE4WO3YCYQJ9@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>, "Linus
 Walleij" <linusw@kernel.org>, "Bartosz Golaszewski" <brgl@kernel.org>
Subject: Re: [PATCH] gpiolib: remove redundant callback check
Cc: <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20260109105557.20024-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260109105557.20024-1-bartosz.golaszewski@oss.qualcomm.com>

--f1617902ff2ddf7a2ec1316a0543e381ae6439ba0ce5a857e6cd39e18618
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Fri Jan 9, 2026 at 11:55 AM CET, Bartosz Golaszewski wrote:
> The presence of the .get_direction() callback is already checked in
> gpiochip_get_direction(). Remove the duplicated check which also returns
> the wrong error code to user-space.
>
> Fixes: e623c4303ed1 ("gpiolib: sanitize the return value of gpio_chip::ge=
t_direction()")
> Reported-by: Michael Walle <mwalle@kernel.org>
> Closes: https://lore.kernel.org/all/DFJAFK3DTBOZ.3G2P3A5IH34GF@kernel.org=
/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/gpio/gpiolib.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 0a14085f3871..5eb918da7ea2 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -468,9 +468,6 @@ int gpiod_get_direction(struct gpio_desc *desc)
>  	    test_bit(GPIOD_FLAG_IS_OUT, &flags))
>  		return 0;
> =20
> -	if (!guard.gc->get_direction)
> -		return -ENOTSUPP;
> -

Not sure, if that will make it better or worse though.

>  	ret =3D gpiochip_get_direction(guard.gc, offset);

Because that will then do a WARN_ON(!.get_direction) and will spam
the kernel log in case of the gpio-shared-proxy. Also the return
code will change from ENOTSUPP to EOPNOTSUPP.

-michael

>  	if (ret < 0)
>  		return ret;


--f1617902ff2ddf7a2ec1316a0543e381ae6439ba0ce5a857e6cd39e18618
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaWELMRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jaNQF/YUu9hoXsDgNCaCHWSY7bVlhhZZ0LXekq
91FA+1Mq8z94MJUa+UlmN+CQCnRFpoWxAXoCNoEJTDqiMgAQPNBFGAqcUPPOaVIy
5OBBM2ErcwaDfjDwh10oREu3Nwm4Yn0a+vE=
=TnJu
-----END PGP SIGNATURE-----

--f1617902ff2ddf7a2ec1316a0543e381ae6439ba0ce5a857e6cd39e18618--

