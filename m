Return-Path: <linux-gpio+bounces-14534-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 03757A02454
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jan 2025 12:33:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 794F61885A5F
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jan 2025 11:33:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 571E31DBB37;
	Mon,  6 Jan 2025 11:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="s8EREmB2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88AEF156238;
	Mon,  6 Jan 2025 11:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736163208; cv=none; b=MIXkzAQqA7I4JT6U0rJ3MlGTT09QlR+9BV5rVv6ISm23MMtoZD5Q2o+lg4BjQhHKAY+q8/8AbTUqxmqI+tCar6Hwu4OMv3uySsfINrL/i8i8wzmyKGlf43ADvhhJAbedg3fSXVh+9V3S2SoqRnjIqsXrDVJ0xjEoFFZR8FpRtgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736163208; c=relaxed/simple;
	bh=A2VbHCh2nvdE8f5DyLA9vLSAC91A3zhxUCopF+zUwsk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E/OqJe2zIrcNQjZdGuscRVvk9myfGEf+7/XbNP003sTsqquZh0HND6deEHXku6A3zRCNQkL0kbl+uOhUd3IgcLzcAet3ML3xDQ/WbITjI7ViL6I5sjUbLgQ8uzLfSF4x59/QvJH4OyUWQuA6tU0/Ftkcxp+J4ayC91tWI5JO1jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=s8EREmB2; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p54921e31.dip0.t-ipconnect.de [84.146.30.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 46E6B2E0016;
	Mon,  6 Jan 2025 12:24:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1736162687;
	bh=A2VbHCh2nvdE8f5DyLA9vLSAC91A3zhxUCopF+zUwsk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s8EREmB2Oljv3DrxUsRvmMVdnIZeXQOKGmreXPF1w/R8bB/8ImGDiR6Ra4TYb+cLr
	 ZEUmRouXeJ8L3ZVWIQhFm0wXAIR9WG1jGXNVFhaii1V3Rt0p+0TJHnCg2yw6Td/2sM
	 1ilO4a1IQbNvExxFWnpVZo4xinTJsj/RXfMKH0qK5f2EzMZb7ZrQ9kKw9FNOansmuy
	 6pAJsXGw9ssTZu2UaHL/9gyItieOHF4hebKU775HU97zaC7/Fo9PvlpFOrEvP6N6Ny
	 eApdlDbnkayhisHkOXTbq7RQyOuwyzrxS3MjSog5MFJFxC+AQ+PVld/RqnRQydX7ci
	 pndIhk04I4JbA==
Date: Mon, 6 Jan 2025 12:24:46 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Parthiban Nallathambi <parthiban@linumiz.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Rob Herring <robh@kernel.org>,
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
Message-ID: <Z3u9fuZ2n1y3Or_-@8bytes.org>
References: <20241227-a133-display-support-v1-0-13b52f71fb14@linumiz.com>
 <20241227-a133-display-support-v1-9-13b52f71fb14@linumiz.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241227-a133-display-support-v1-9-13b52f71fb14@linumiz.com>

On Fri, Dec 27, 2024 at 04:37:56PM +0530, Parthiban Nallathambi wrote:
> A133/A100 SoC doesn't have reset control from the CCU. Get reset
> control line optionally.
> 
> Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
> ---
>  drivers/iommu/sun50i-iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Joerg Roedel <jroedel@suse.de>


