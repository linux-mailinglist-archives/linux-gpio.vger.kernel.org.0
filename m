Return-Path: <linux-gpio+bounces-14526-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 576C5A020B9
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jan 2025 09:32:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D64DF3A1FE4
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jan 2025 08:32:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99DE8199EA3;
	Mon,  6 Jan 2025 08:31:57 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994F51D88D3
	for <linux-gpio@vger.kernel.org>; Mon,  6 Jan 2025 08:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736152317; cv=none; b=NJCaT6QyF+dV497Vq6TkbZ2JSB0kL18N+FnQU49rXo5iJ0kWKInPxgIQvOHArNxuRy2tW2OqXS+Sf/ou0Y5uQCKv3gg7KC02WlevNkQf2of5DWjbmsC325BEZfuYhz8TXKeX6aUHM7mOJQ1O5rvp9GLAFoDD5NvmNVrZs6aTfWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736152317; c=relaxed/simple;
	bh=mdW1Dhp8mTPIbOJSIufuNdW74kuICsBuLYeqGtO4PG4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eynLuZNymRI+p8YROm4++zvKh6XwrVftwZVGczNGbnYDTAdF7Gps2MUfxs4alockV9fHTw+WubUHnadIvwouXKOIzBMkMEIKPtqStWy6EpmTPKesS3dyDViJ/oJsJ+hDWrvvJlh9xDe4Tak9b123z8bbHCxfCjcsQCwncizF6kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tUiVn-0003Dn-TL; Mon, 06 Jan 2025 09:30:59 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tUiVj-0078KE-2q;
	Mon, 06 Jan 2025 09:30:56 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tUiVk-0008wh-1m;
	Mon, 06 Jan 2025 09:30:56 +0100
Message-ID: <ee93bdca7fddb03a1d1e8997ce21a9cb7339ae63.camel@pengutronix.de>
Subject: Re: [PATCH RESEND 09/22] iommu: sun50i: make reset control optional
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Parthiban Nallathambi <parthiban@linumiz.com>, Joerg Roedel
 <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy
 <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>,  David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Michael Turquette <mturquette@baylibre.com>,  Stephen
 Boyd <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Vinod
 Koul <vkoul@kernel.org>,  Kishon Vijay Abraham I <kishon@kernel.org>
Cc: iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-phy@lists.infradead.org
Date: Mon, 06 Jan 2025 09:30:56 +0100
In-Reply-To: <20241227-a133-display-support-v1-9-abad35b3579c@linumiz.com>
References: <20241227-a133-display-support-v1-0-abad35b3579c@linumiz.com>
	 <20241227-a133-display-support-v1-9-abad35b3579c@linumiz.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org

On Fr, 2024-12-27 at 18:30 +0530, Parthiban Nallathambi wrote:
> A133/A100 SoC doesn't have reset control from the CCU. Get reset
> control line optionally.
>=20
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

With dt-bindings changed to require resets on those platforms that do,

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

