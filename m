Return-Path: <linux-gpio+bounces-29897-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BF3CDE0A7
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Dec 2025 19:49:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6A8DB30052A6
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Dec 2025 18:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A46E27CCE0;
	Thu, 25 Dec 2025 18:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iMAyxaJg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F677F50F
	for <linux-gpio@vger.kernel.org>; Thu, 25 Dec 2025 18:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766688576; cv=none; b=b83bDhJxM9Zhb5S/Hy4aLrMhPkcG95MPyCErkt4IoD2R563PuAlJNmxx9FireDTBew3FTfYTFS6+zbg823+sosWOU6q5GZLF/Yz7M+Xm59WqvMXYlEiP2k9zUH16sKYp0OaQs8wrSoS1ZHZIdnYr91PtnOkL8TbG+FhG7W6wmPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766688576; c=relaxed/simple;
	bh=/GLmmBp5IxXzJeH6mbbMRLZztQZUxgTxdEss9ySj2+4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aGc1ZbRx5Ln7LzkeEcrlPI0g1MRPkrf/FQQx/avLtjsA4elPpHaticou33eWxcCBuz1+kgWnVAL8ShS/72EWBrZeC27nzqH+xv/bIP1rxgDAyNjjGUXPtbtXYFU+XfCb34vHo0AsxNTyTk27waEINwOWaMBMc55OG/b0DoN608s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iMAyxaJg; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-649e28dccadso11241020a12.3
        for <linux-gpio@vger.kernel.org>; Thu, 25 Dec 2025 10:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766688573; x=1767293373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lwi/wOL9435JfspVqwNHJS0rgXD9DXGNHXUGNZoo1YM=;
        b=iMAyxaJg0onJpjLCnCTpuw1FCQoUxmZx/LQVA1tv+EGqo89Czx2RG/3VzNe8bW95G9
         /dmDchU1xgr7xNYUwmhey/tLgqvJ49nDl6zw+99/TX/SQ7bh+9wPrxR9Uvmp0Rbs/EeH
         OisrrM1dAXHEh7hDDd0/qwWJz4rcqW1A1WKTRScnfAoszrJYfVoaGWrg9NJyGneb0KFl
         yF+AY74BVPV7zBJYFLf1aXusBaWRR3+Ve8j9Cr5xkWm4RpWDjHvwC7gGpSw78trwm+2S
         xchQsAZ6EN60COOB6Hfv8VlsbZKx12OIccwjQhfPwQP2rG5gl8kNfWdbYXBelF/WT+Pu
         K9WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766688573; x=1767293373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lwi/wOL9435JfspVqwNHJS0rgXD9DXGNHXUGNZoo1YM=;
        b=OzSh4GIT4v3KCD4GmCla0lDMWzErvmWFLe/VardFnOSZywcxCh6Ad+vKX566SXaD58
         gOh+jJuAAafRYXMVZmzbEWdBF3RrkmDsxTjzQZoGZHji4tdMelSdM23xB8fo1Pr2rGJK
         csfAYH2qgPBfs5nwW9wjPgBJNEypCDJFyyRk+vrpK3qPntdckMIZLaC5RiEVRAN27rRt
         OANeeCCg3ek59LSaLX9Frdu06OasYIcufvh4PCqe3uLjPEAR//Z3KuYEQZevxh0QfqMw
         YulptxSOu0QQeUh0W7lix7LraHdgSN8P7L42CnlE/PPdzEKQBDaDzIgJoJD61c0HNQns
         QGNw==
X-Forwarded-Encrypted: i=1; AJvYcCWKxn2iyZhCVcupSvkBLRjE+aOFA/xwrkyHWpHK6aQBk9I6uIEUZCoEHHBhySVm9QnlYkwqBGzMkF6x@vger.kernel.org
X-Gm-Message-State: AOJu0YzboNZXDTvjhNcEFldN0AtElWpISizj2iIcF3p22+YzuE66Egc5
	BiMGUHGj3a1aNUOyFRWB0QhGlZb1ck2VteDpjZpBsmxoK5vVM8RXmSRy
X-Gm-Gg: AY/fxX6g8bpcWnJ0Q+McMOPS3XyjmujOaBd0+6TFDxgspJduck+01UAyo8wjor+iuGc
	qX8MVRYMZ7srs2dVecwCmS05l031nbzRZwE4GGdG+3xr0CXJbckgr0JgRu2S84aiZAi6vU4N/bW
	GMJlLDzDILpctc8vDQrBKEZd9LB6ZrrPjXdecs1g6cP8LiylCvgRJ5n+PCsauWR+flo5MrkPGhm
	XoqB/cIIM++GLA6/P5MsJuejZ9BJWbDplVEzfHaZbOYONHt1yVMFmQF3ohZcc2b7fl9qzQ/OPCu
	mlNExkrJrWYNNcWtWXzwTXO2d4BZrgcvLi1OOMT2cQnh0xwBwA2q9pJKSqZBfIGMWcwkiD+G7dx
	sgYlPgwG4d/a2u+Jzprq8F3iOztq0CWafWgm4oTBpmeYkxFn8tFvE7c4zIqNmcSDNpdBcJMI0+d
	VPdRwl+ULpzwEs2SeJeZ7XNkBPtiSV4feLzb+6xBgTdbo=
X-Google-Smtp-Source: AGHT+IHGj4ugPVsyxVEKdshMmhjzljqKZD5JHwjw22tMZO+csxcebOAuFJVgXAVvGwk2iqbs87W2hA==
X-Received: by 2002:a17:907:d8a:b0:b73:a2ce:540f with SMTP id a640c23a62f3a-b8036f55069mr2086910366b.17.1766688572432;
        Thu, 25 Dec 2025 10:49:32 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037a614b7sm2164305466b.1.2025.12.25.10.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 10:49:32 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Linus Walleij <linusw@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-gpio@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 4/4] ARM: dts: allwinner: Replace status "failed" with "fail"
Date: Thu, 25 Dec 2025 19:49:30 +0100
Message-ID: <13929653.uLZWGnKmhe@jernej-laptop>
In-Reply-To: <20251225103616.3203473-5-wens@kernel.org>
References:
 <20251225103616.3203473-1-wens@kernel.org>
 <20251225103616.3203473-5-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne =C4=8Detrtek, 25. december 2025 ob 11:36:15 Srednjeevropski standardni =
=C4=8Das je Chen-Yu Tsai napisal(a):
> The device tree bindings specify using "fail", not "failed".
>=20
> Fix up all the ones that are wrong.

While patch indeed fixes the issue, I wonder if "fail" is proper value?
According to specs, it means that device needs repair. What about just
keep "disabled"?

Best regards,
Jernej

>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> ---
>  arch/arm/boot/dts/allwinner/sun4i-a10-dserve-dsrv9703c.dts | 2 +-
>  arch/arm/boot/dts/allwinner/sun4i-a10-pov-protab2-ips9.dts | 2 +-
>  arch/arm/boot/dts/allwinner/sun6i-a31-hummingbird.dts      | 2 +-
>  arch/arm/boot/dts/allwinner/sun6i-a31s-primo81.dts         | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/allwinner/sun4i-a10-dserve-dsrv9703c.dts b=
/arch/arm/boot/dts/allwinner/sun4i-a10-dserve-dsrv9703c.dts
> index 63e77c05bfda..f2413ba6a858 100644
> --- a/arch/arm/boot/dts/allwinner/sun4i-a10-dserve-dsrv9703c.dts
> +++ b/arch/arm/boot/dts/allwinner/sun4i-a10-dserve-dsrv9703c.dts
> @@ -112,7 +112,7 @@ axp209: pmic@34 {
> =20
>  &i2c1 {
>  	/* pull-ups and devices require AXP209 LDO3 */
> -	status =3D "failed";
> +	status =3D "fail";
>  };
> =20
>  &i2c2 {
> diff --git a/arch/arm/boot/dts/allwinner/sun4i-a10-pov-protab2-ips9.dts b=
/arch/arm/boot/dts/allwinner/sun4i-a10-pov-protab2-ips9.dts
> index c32596947647..e0c7099015da 100644
> --- a/arch/arm/boot/dts/allwinner/sun4i-a10-pov-protab2-ips9.dts
> +++ b/arch/arm/boot/dts/allwinner/sun4i-a10-pov-protab2-ips9.dts
> @@ -96,7 +96,7 @@ axp209: pmic@34 {
> =20
>  &i2c1 {
>  	/* pull-ups and devices require AXP209 LDO3 */
> -	status =3D "failed";
> +	status =3D "fail";
>  };
> =20
>  &i2c2 {
> diff --git a/arch/arm/boot/dts/allwinner/sun6i-a31-hummingbird.dts b/arch=
/arm/boot/dts/allwinner/sun6i-a31-hummingbird.dts
> index 5bce7a32651e..5dfd36e3a49d 100644
> --- a/arch/arm/boot/dts/allwinner/sun6i-a31-hummingbird.dts
> +++ b/arch/arm/boot/dts/allwinner/sun6i-a31-hummingbird.dts
> @@ -170,7 +170,7 @@ hdmi_out_con: endpoint {
> =20
>  &i2c0 {
>  	/* pull-ups and devices require AXP221 DLDO3 */
> -	status =3D "failed";
> +	status =3D "fail";
>  };
> =20
>  &i2c1 {
> diff --git a/arch/arm/boot/dts/allwinner/sun6i-a31s-primo81.dts b/arch/ar=
m/boot/dts/allwinner/sun6i-a31s-primo81.dts
> index b32b70ada7fd..fefd887fbc39 100644
> --- a/arch/arm/boot/dts/allwinner/sun6i-a31s-primo81.dts
> +++ b/arch/arm/boot/dts/allwinner/sun6i-a31s-primo81.dts
> @@ -90,7 +90,7 @@ hdmi_out_con: endpoint {
> =20
>  &i2c0 {
>  	/* pull-ups and device VDDIO use AXP221 DLDO3 */
> -	status =3D "failed";
> +	status =3D "fail";
>  };
> =20
>  &i2c1 {
>=20





