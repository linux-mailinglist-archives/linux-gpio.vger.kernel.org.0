Return-Path: <linux-gpio+bounces-28491-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C32C5D4A8
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 14:17:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DA13E35E979
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 13:11:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C68D52FC004;
	Fri, 14 Nov 2025 13:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wbec/zU3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7781241139
	for <linux-gpio@vger.kernel.org>; Fri, 14 Nov 2025 13:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763125876; cv=none; b=Q3GqPOOpTViubGEv+QKSTg1RAvDpvKCEHgziOQYjZuQSnCrGwyuNFuATwWmVR2GTeWCo2GFMp4X0n5jOhbjg1uYejs+i6/IlWCJSfW0pnBKQrkuVQwrvRON/P7dwRysS+2p8s4AsM952nB6SD1kigdvgbYHqjER6zSGyhEBA/Tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763125876; c=relaxed/simple;
	bh=Mgrr0Jm8iMbgZAIH95lxgYjY0Nkl3G/qam925O9GaPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=czafD61D66NVxOsheFNPjdE+aTYo1PSddnEdj8/ECK190c7hf8Fp/VWQdSkWZacFPXTxUKpReCdGUe1/pbcwLPK1n3cV2HWtXgJiAouZSbnhjUqBk1uPVdt7t8x/VD0HmoZPimcWcRtjJLmdwBsLIWzQQRwdubXAtyyUZYt6K7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wbec/zU3; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42b2e9ac45aso1354894f8f.0
        for <linux-gpio@vger.kernel.org>; Fri, 14 Nov 2025 05:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763125873; x=1763730673; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z3e+JYReYn587ewMbbn7pFvtSy6/gvR+LNONtT8jYLU=;
        b=Wbec/zU3l7JIjZoYc32JfvrSoqM58SQTj4j9+Z1DYc4i2ojWUZSp+69huSb0K1xuRG
         8uodeLSFe33PhRNI69QCJZLslqomeVn6jQl0bU6uWF1WuOz7aVPWGfCjsTOomrlfdVZ8
         e5FNIltiaPmPoT5BCf0rTGj21Dy3/Do48uooxYibuPalQTIz+Y8OpcG3rtZAJUUhXR4D
         hfInx/XnPqJ7vz3uFQOPMmkbjLodEaOI0K1ytUzoxa6dkCHvcQNWEomAL9MU8vTRbZbb
         StU+cum6GwaHvJBU5Eo9C9xL4wxJ9SaHQ4YIgr562E+ZttwH+aLrNV4EG9j4pOcvouQ2
         4JgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763125873; x=1763730673;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z3e+JYReYn587ewMbbn7pFvtSy6/gvR+LNONtT8jYLU=;
        b=a3p3Uu6BYbzDYRLIiziN2D9kDs6dLwhgQg8ouJ8Hr6uCfCI4Iiadr6+TEfm83nopA7
         zCtK1Z3vbCbsY8rg4LX54S9pZzKB54ku/Pq2poutj5YqgL2qtWPiX7r5HkJQykH0FRgG
         aUhIA9RITlhbhJalyCJfr7ng7oBdYWt1wdQJ0cPFypYNWuOy50efbGE+rXsSJk5ttHaE
         hr1gMo7uYppkrxvsBxgSoU58M7V4FIdcYcqXkPqpRkZ1XjWLf3cZtJYWc9hcf9boKih3
         6GvSVefXBnzBIkXGIbmeFUi8Cs6RKibN+LPkmyLRg6zVEVarBNY34EHOb8LwU7UnzSox
         V0Ug==
X-Forwarded-Encrypted: i=1; AJvYcCU+g0WjUPmcyxTl7/UEbehTh+/0uE8PivENl68u0/S7+3/RPm+z3ewT7iTvr0gzBCP7fc91n9veZn1m@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4ZDh00AHxre5fYthTutpn+xJIgKwP3NBrlHcM/lEOlXBQrSR8
	vYvR6ktoqXgB9amH0aZ4YH9qqE3SlmjdUGLKasfXrTltoYXNU/Lo16Sl
X-Gm-Gg: ASbGnct6h8ZxS+MBy/L+7hIkqLNyxHAXPH2tlXELvMLkfR25Gby8/jVTcym90oW5uLl
	KPvlaSlvfm6mdRxYI2JpsjVxtHdGnb9wi7ZU3EdAS0GVHgfOs/sh8hMffUaMS4aqFTFciMEyf+1
	bVbVv1SXKV77zkDHFUeAOd+e4V+Ni0noJasla8lO6nqQ5mavgE8srU0jc/+ZKYwwA4zwcovfOPr
	+vDpso6/W/HFgPyVypW7fF1AADBrUgMNYyG3GSmb7/FVx5uqPi0b3ynj3H4Dej5p3rQte0qFJYx
	+lJBXpFN98P1czBgm0WE7AR7m8+klNVXdcIURCbzNPnqoZUckD5toxnfdv13t2LFwU7q7MxCPj1
	kTWXerJbzbzZyhuohCdj5dJzsWlB0btTuG4I8A8vJuLZQEwi3TwZnmO96+DyJASkJCT59EaGURd
	L2H4ooeY++sKSZ2HN5SFUtUf2pU1Po/k43WYhRpvNlQBlB/2XdBbAhxfgP+XSa+s2e/53GwqgTo
	Q==
X-Google-Smtp-Source: AGHT+IHf2sdSAEb788fz+hKroyOVeG9tnateNfLOW/uekYOuHNDek9zraoBnP0muQ6tg5JlohTVfDw==
X-Received: by 2002:a5d:584c:0:b0:42b:4194:48cf with SMTP id ffacd0b85a97d-42b593991f4mr2903780f8f.52.1763125872852;
        Fri, 14 Nov 2025 05:11:12 -0800 (PST)
Received: from orome (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e7ae47sm9497587f8f.4.2025.11.14.05.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 05:11:11 -0800 (PST)
Date: Fri, 14 Nov 2025 14:11:09 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Kartik Rajput <kkartik@nvidia.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, jonathanh@nvidia.com, 
	pshete@nvidia.com, nhartman@nvidia.com, linux-gpio@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: tegra186: Fix GPIO name collisions for Tegra410
Message-ID: <aavab3z2i5hk4wombxcz2uexpcd2djdwgxx4ihf4gisnwbr6mk@npbuiiz7aio5>
References: <20251113163112.885900-1-kkartik@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hdr3w3zgha3lxx5f"
Content-Disposition: inline
In-Reply-To: <20251113163112.885900-1-kkartik@nvidia.com>


--hdr3w3zgha3lxx5f
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] gpio: tegra186: Fix GPIO name collisions for Tegra410
MIME-Version: 1.0

On Thu, Nov 13, 2025 at 10:01:12PM +0530, Kartik Rajput wrote:
> On Tegra410, Compute and System GPIOs have same port names. This
> results in the same GPIO names for both Compute and System GPIOs
> during initialization in `tegra186_gpio_probe()`, which results in
> following warnings:
>=20
>   kernel: gpio gpiochip1: Detected name collision for GPIO name 'PA.00'
>   kernel: gpio gpiochip1: Detected name collision for GPIO name 'PA.01'
>   kernel: gpio gpiochip1: Detected name collision for GPIO name 'PA.02'
>   kernel: gpio gpiochip1: Detected name collision for GPIO name 'PB.00'
>   kernel: gpio gpiochip1: Detected name collision for GPIO name 'PB.01'
>   ...
>=20
> Add GPIO name prefix in the SoC data and use it to initialize the GPIO
> name.
>=20
> Port names remain unchanged for previous SoCs. On Tegra410, Compute
> GPIOs are named COMPUTE-P<PORT>.GPIO, and System GPIOs are named
> SYSTEM-P<PORT>.GPIO.
>=20
> Fixes: 9631a10083d8 ("gpio: tegra186: Add support for Tegra410")
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> ---
>  drivers/gpio/gpio-tegra186.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--hdr3w3zgha3lxx5f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkXKm0ACgkQ3SOs138+
s6F1cg/+K7bfCAWunPug7sxl4E0L8eFOu7qUK/WQt/1jzlPBBMtoIMaS1wlCn6t4
0xlnHLDpqOkazVRPHVGKvSyeaw4I1iICcagS0XFzoU0EQ4zMBCcOs+OjbGsRu/Wf
9KAzELWBZOpSZZrVU9e35vID5QnrR+ECODoDNw1uvivz8AEYljmkiTAKAUkocoIk
aedRAmUP117EZa571ontzztXEnETgkC9SarIKD3Y+RGx2+0nSSdzPJpPHNXy5mvf
NEMQrQS1my2goVB46IOqc9j0YGayCtkhekOjcwx+X8DtADIHRkovpqibFID4UfZ1
NfOhXrj/Gv+HNt0q6+UCrkgJIWP0Bug8zX/n7B3NYVzt2HyK++KZ4K636tXuUN5g
UhqeJba0m33ADOAh2zHLsFltm3pnzXiaPF1FU28X8bw6Vzwlttsehc90TVVI7bSK
U8sKAS3teAgmXwSMI2cQxMVtxo96LakPJRujq7wL4GVyeEc8y5ap/Op3mJJnwoPu
6mPSb30jDwYe1lq1dukXSA7OvgrqSQ9ROIFxfJrSXdeQ80xXgubSdsEThQ8OMWtt
LnVfedUDuk27Pb05ZApC/PdPlxd2D63WvY/0rPlZzNV6gsRDhf+/eVB9ZQTQZhAC
k9vIEu4bRISggK8B1+bALQfWndedwXLR2GkD9RizfvSE03ebcts=
=a/L/
-----END PGP SIGNATURE-----

--hdr3w3zgha3lxx5f--

