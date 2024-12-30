Return-Path: <linux-gpio+bounces-14363-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 519F99FE6D7
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Dec 2024 15:09:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 418CB1881A22
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Dec 2024 14:10:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87E881AA1C0;
	Mon, 30 Dec 2024 14:09:53 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87C4519924D;
	Mon, 30 Dec 2024 14:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735567793; cv=none; b=jO3gm2xWa9SzcgN2UD07xOqKHAPlnk5tAOJGlQdXuzN9PM1d9c74iKsjXrQudVW9LmGm9iVmHSMFQM4ozWJrL5/cUU51IVj+KG0nBaaUsEJhrHh3Q7ujDheJGnrQl94v7BjTUQwzpfGrojqJMbbhd2e2cQf9KpIxKSq0TgNVhJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735567793; c=relaxed/simple;
	bh=W4upIrS4JHFRgA6s2WiFuPX7fFm2TqcwPXcWygQBwVs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nt/5t/s4x+GvFn46szgvpCUqFl9n/vfde4R+2duutI7SYyRKmN6upx9XQ65PHO1IBCNVgxbssryLTTcATNmwS6o/7sJ70kFtEVIBqRO3EImERu+BJtvMq3KFeb3e5gINSVZvXsL61//nm/yrQHNAUPmfha1XGq2UsMGM/1M5VbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0317E143D;
	Mon, 30 Dec 2024 06:10:18 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DAE383F59E;
	Mon, 30 Dec 2024 06:09:44 -0800 (PST)
Date: Mon, 30 Dec 2024 14:09:41 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Parthiban Nallathambi <parthiban@linumiz.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin
 Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu
 Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Linus
 Walleij <linus.walleij@linaro.org>, Vinod Koul <vkoul@kernel.org>, Kishon
 Vijay Abraham I <kishon@kernel.org>, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH RESEND 16/22] clk: sunxi-ng: sun8i-de2: Add support for
 a100/a133
Message-ID: <20241230140941.00aaed1f@donnerap.manchester.arm.com>
In-Reply-To: <20241227-a133-display-support-v1-16-abad35b3579c@linumiz.com>
References: <20241227-a133-display-support-v1-0-abad35b3579c@linumiz.com>
	<20241227-a133-display-support-v1-16-abad35b3579c@linumiz.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 27 Dec 2024 18:31:05 +0530
Parthiban Nallathambi <parthiban@linumiz.com> wrote:

Hi,

> Display clock uses 1 mixer without rotation support is same
> as v3s. There is also a hidden independent display engine
> with independent tcon_top available in A100/A133 bin (based
> on vendor BSP).
> 
> Add new compatible for A100/A133 to accommodate the future changes
> for the independent DE.
> 
> Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
> ---
>  drivers/clk/sunxi-ng/ccu-sun8i-de2.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
> index 3e28c32050e0..067820ab704d 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
> @@ -342,6 +342,10 @@ static const struct of_device_id sunxi_de2_clk_ids[] = {
>  		.compatible = "allwinner,sun50i-a64-de2-clk",
>  		.data = &sun50i_a64_de2_clk_desc,
>  	},
> +	{
> +		.compatible = "allwinner,sun50i-a100-de2-clk",
> +		.data = &sun8i_v3s_de2_clk_desc,

That wouldn't be needed then. *If* we find some incompatibility, we can
add this line later, pointing to a different _desc block, but for now you
can rely on the fallback compatible to match.

Cheers,
Andre

> +	},
>  	{
>  		.compatible = "allwinner,sun50i-h5-de2-clk",
>  		.data = &sun50i_h5_de2_clk_desc,
> 


