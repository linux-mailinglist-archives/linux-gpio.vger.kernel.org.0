Return-Path: <linux-gpio+bounces-24068-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 858C5B1DAD3
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Aug 2025 17:30:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 683E41AA3708
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Aug 2025 15:30:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3FD1269808;
	Thu,  7 Aug 2025 15:29:55 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDCF79E1;
	Thu,  7 Aug 2025 15:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754580595; cv=none; b=NQ35QJS3kri0eXihdXqiWOPNURWFndfBVinTyTBWwB/uA/HBIbUxWqfMpsXGdhSSqA3d+U/IGArmCTv3rD/BRr8GGmYGVBiJPt6l4b5gXKhKueqCK6yIoSDcayM1WxmG2NCFblI8kTwwk2cXe/kB1zdcO/EyQembP2/GPdfIONs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754580595; c=relaxed/simple;
	bh=JDkJkErFKX9RQyyIdOKl+y9by9iWdYoaFq9gT2vqHP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jEAc9wXw+yUyb6F3Dqs41tmrFS8ElnsjdGTMVq6GyKrPGtMoUC9ZYK/WMugtKXID2aI5pUyiplcS0Y8p8k8SXyo6p7HNqjPZDBAezBnwjIrvnUGcnxPluuSxGsSnvWzFi+KWiHv878N467v+WCTroRscLPrJieRQVm15R5hSFY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 623241F00050;
	Thu,  7 Aug 2025 15:29:43 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 226F6B012B4; Thu,  7 Aug 2025 15:29:39 +0000 (UTC)
X-Spam-Level: 
Received: from shepard (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 6AAF7B012B0;
	Thu,  7 Aug 2025 15:29:37 +0000 (UTC)
Date: Thu, 7 Aug 2025 17:29:35 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Parthiban Nallathambi <parthiban@linumiz.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 09/22] iommu: sun50i: make reset control optional
Message-ID: <aJTGX7z5QaneVAVs@shepard>
References: <20241227-a133-display-support-v1-0-13b52f71fb14@linumiz.com>
 <20241227-a133-display-support-v1-9-13b52f71fb14@linumiz.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="r6JMmJ4BvieUD1JH"
Content-Disposition: inline
In-Reply-To: <20241227-a133-display-support-v1-9-13b52f71fb14@linumiz.com>


--r6JMmJ4BvieUD1JH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri 27 Dec 24, 16:37, Parthiban Nallathambi wrote:
> A133/A100 SoC doesn't have reset control from the CCU. Get reset
> control line optionally.

With the dt bindings fixed, this:
Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>

Although feel free to use a first uppercase later in the title after sun50i!

Cheers,

Paul

> Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
> ---
>  drivers/iommu/sun50i-iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/iommu/sun50i-iommu.c b/drivers/iommu/sun50i-iommu.c
> index 8d8f11854676..2ba804d682dc 100644
> --- a/drivers/iommu/sun50i-iommu.c
> +++ b/drivers/iommu/sun50i-iommu.c
> @@ -1030,7 +1030,7 @@ static int sun50i_iommu_probe(struct platform_devic=
e *pdev)
>  		goto err_free_cache;
>  	}
> =20
> -	iommu->reset =3D devm_reset_control_get(&pdev->dev, NULL);
> +	iommu->reset =3D devm_reset_control_get_optional(&pdev->dev, NULL);
>  	if (IS_ERR(iommu->reset)) {
>  		dev_err(&pdev->dev, "Couldn't get our reset line.\n");
>  		ret =3D PTR_ERR(iommu->reset);
>=20
> --=20
> 2.39.5
>=20
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--r6JMmJ4BvieUD1JH
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmiUxl8ACgkQhP3B6o/u
lQx11g//SV1ixRT6s+TozocWIV+MP1xw+AZD5hEjtTQ94o3x2r/fbEdRtxGLxRYM
YJe8mZkZCifNu+QgBg78/DiCw0wsnRXA3y7gfMnIvk501LovWrpX2lFmdYnVBu9O
WIJpWrZzMb3dku5kVhC87X7IOxLL4ORnM8BKOJ4T2iZvxlBTRmMyzV9iujvthL1M
wYhQDxJ+Dj6sDNjPE/HonEJQMlv8MiYWZHZSUPZxBMlxaCZ96gqPhjpS/ZF5VKdx
w8oVitiYduHemohWVRcqv8Rrl9ZLat5kLm5ikgMv3iv07lXrxd93v41x1nS1pYO6
ahBa8PwTf4AZ91eJfulyiteRqnUZgG3iyI0+Ao12tyeN8WOlBo009cW6j5Y6q8u7
Pxppv1+zfxY2VX+Ws0hCHYXLFPVeuaUzvMKsXlAVxai3NgOTj0PgEoOCGwCdQw3K
kQCq0/T9GCJa66mc8jyuslUTBPKuUTJBJa10s6X60rCQaAVMDYEv/TfM8Vo0MidK
Pw9VpmlUgPK/bLTAB7D9q2vYrSLP43UHMUOVC6OG+4dNEdpk10sx/qalZS1Ly/eN
eDA9iYwUFeJdc5iS6/BAM0dgylbnaBQ23nldgwYa8HdEGG+SpXfBafdRNKBk+rEI
NkzLWI9FRp/JLXkWCFoUSgAdIAvjaIqoeupMjNTS8UXLORXeebk=
=UG1q
-----END PGP SIGNATURE-----

--r6JMmJ4BvieUD1JH--

