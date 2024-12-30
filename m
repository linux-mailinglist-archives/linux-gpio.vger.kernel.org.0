Return-Path: <linux-gpio+bounces-14364-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F5E9FE6DF
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Dec 2024 15:12:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B7B33A1E84
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Dec 2024 14:12:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 237FE1AA1CF;
	Mon, 30 Dec 2024 14:12:00 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F9CF13633F;
	Mon, 30 Dec 2024 14:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735567920; cv=none; b=YO1aJReMtfIbKAOttRb1vSQ5VuKxrakHbruGU39AdJu0NFot0GKYvtjejYNi42NOcGmSddDHfBnLLCbhyLI/ov3l9JkWteOgrYPDYf3H7FiXSfVYgaZal2WteqwhKpbGEpNBrayFLGSKDyFeO4rsjjvh9bgRaoK/bBElIrXhMkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735567920; c=relaxed/simple;
	bh=KLogfWKejvtXzSBCyfhmc0eYpL/eDcrVcNlejQC7Yro=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rDY6LWiO4y4Ee5L2OU4sn2xiVq6r8aB6id1i5zz4oSPBnOoX8XvVEx/fccjI6PoqVSwImBSNu1woHifLaskeabhDZKRfbqpePmcK8ZE6tYi5RXzH0NsYzpGjno4sPwNTvz34yKKM4JtLjeGGIedRIpB7ncQNp/nsGNo7vD0jrZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E04FF143D;
	Mon, 30 Dec 2024 06:12:25 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C93193F59E;
	Mon, 30 Dec 2024 06:11:52 -0800 (PST)
Date: Mon, 30 Dec 2024 14:11:50 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Parthiban <parthiban@linumiz.com>
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
Subject: Re: [PATCH RESEND 00/22] Add support for A100/A133 display
Message-ID: <20241230141150.3d0c3ae6@donnerap.manchester.arm.com>
In-Reply-To: <314b6bbe-613e-41a6-955e-50db6e11ef8e@linumiz.com>
References: <20241227-a133-display-support-v1-0-abad35b3579c@linumiz.com>
	<314b6bbe-613e-41a6-955e-50db6e11ef8e@linumiz.com>
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

On Fri, 27 Dec 2024 20:06:30 +0530
Parthiban <parthiban@linumiz.com> wrote:

> On 12/27/24 6:30 PM, Parthiban Nallathambi wrote:
> > This series depends on [1] for the eMMC/MMC controller to work and
> > [2] (lined up for 6.14) which adds support for the sram nodes and
> > display engine extends it's usage. Idea of this series to get initial
> > feedback and adjust, which will be rebased for 6.14 once [2] is merged.
> > 
> > This patch series adds support for A133 display pipeline based on
> > LVDS. dt-bindigs are organized in the start and later with code
> > changes.
> > 
> > PHY is shared between DSI and LVDS, so to control the PHY specific
> > to DSI/LVDS, phy_ops set_mode is introduced. To enable the DSI
> > using set_mode, analog control register MIPI Enable is used, which
> > may not be available for A31 (shares the same driver).
> > 
> > Otherwise, A133 also got hidden independent display engine i.e
> > mixer + tcon top to handle parallel display. But this patch series
> > adds only support for the 1 mixer which is documented.
> > 
> > [1]: https://lore.kernel.org/linux-sunxi/20241109003739.3440904-1-masterr3c0rd@epochal.quest/
> > [2]: https://lore.kernel.org/linux-sunxi/20241218-a100-syscon-v2-0-dae60b9ce192@epochal.quest/
> > 
> > Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>  
> Apologize for polluting with resend again. My internal mail server got blocked due to
> volume count, which resulted in incomplete series again.

I guess an incomplete send was the reason for the original resend? Please
note this at the top of the cover letter then, otherwise it's not easy
to see why you send something again. Something like:

*** Re-sent due to mail server not sending out the complete series. ***

It also helps to split up the recipients, so that everyone gets the cover
letter, but only the respective subsystem maintainers get the patches
touching their subsystem. I would CC: the DT maintainers on every patch,
though.
It's a bit more complicated to set up, but keeps the noise down for those
large-ish series, for instance for the IOMMU people, who presumably have
little interest in DT or graphics code.

Cheers,
Andre

> I will fix the mail server issue before resending the series. Sorry.
> 
> Thanks,
> Parthiban
> 
> 


