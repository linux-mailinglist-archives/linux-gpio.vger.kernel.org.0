Return-Path: <linux-gpio+bounces-23836-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1953CB1258C
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jul 2025 22:31:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6BC41C260BB
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jul 2025 20:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C645B25C821;
	Fri, 25 Jul 2025 20:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dbW8S110"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F4D4501A;
	Fri, 25 Jul 2025 20:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753475428; cv=none; b=D25ZMGuZbXZOspgEUyjavzXX50BS62MH4CNfKERfWXjuolTp1ttJ8tfZ+RTPE1Yv3RcYR+RoP8qne8BnTy74ByoOBfnYPqtu8ITU77N7SXhFEEdmrYlIIurLGoYcrwb+DB/+wb2+hWdyikzqv2Pq9EZSMsMENyzEnt7h/YgfSoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753475428; c=relaxed/simple;
	bh=ba7r3CQWnc9Pg59zckBMYOhewHfZtzF4js8BFZ+0f9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lzhtPT0sbaWZxRe8SArobNPOQEcfwKcMUS1ITQMH/S5t7o0ne4APmgZHL7lz0dGN0HloMt+j99Ht2jc2ssWuOAcXo7x3pH33hWdhzA4AC05KH91G6FeDUS+VhbiRVYa8k+5Rhspt353oLTK6WAtQfN9MzHGxCtwDzz2+0p+RK8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dbW8S110; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3FC8C4CEE7;
	Fri, 25 Jul 2025 20:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753475428;
	bh=ba7r3CQWnc9Pg59zckBMYOhewHfZtzF4js8BFZ+0f9c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dbW8S110p3NBmLaJdPOPH54qeqD00XyhjoRdv89Oc/9seV5Gebju3lz+V2fFMuB/Q
	 ZG8upnvyRHMVpuySek1hBhmyctGYtzAQ6cXCXKjp1lQQHSzkE4iUJER7UN+9bgbZVA
	 QD1lVSbKRyDW0ZEe0/EMwhfbQ3E0gDpivtn/VhyvaLE9BDL80GMlVu3pdeb2Z5HYzH
	 TunHOOTBpQ6fbovuC8fjR2Xisgued54rZ+8BjIfP0ES1hs+vhy0arR1Uy65Q8BhfC2
	 L9k/9/uQq129XN7CqmqHgViTcChBd1BD0wYRt70Q9poeuLwbSEYOWmAUrgkw/tMMZW
	 DvOdLKPmgYbZg==
Date: Fri, 25 Jul 2025 15:30:27 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: andersson@kernel.org, devicetree@vger.kernel.org, ck.hu@mediatek.com,
	olivia.wen@mediatek.com, linus.walleij@linaro.org,
	tglx@linutronix.de, mathieu.poirier@linaro.org,
	sean.wang@kernel.org, andy.teng@mediatek.com,
	jiaxin.yu@mediatek.com, kishon@kernel.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	jieyy.yang@mediatek.com, simona@ffwll.ch,
	linux-mediatek@lists.infradead.org, krzk+dt@kernel.org,
	linux-remoteproc@vger.kernel.org, mwalle@kernel.org,
	davem@davemloft.net, airlied@gmail.com, chunfeng.yun@mediatek.com,
	linux-crypto@vger.kernel.org, tinghan.shen@mediatek.com,
	arnd@arndb.de, chunkuang.hu@kernel.org, atenart@kernel.org,
	linux-phy@lists.infradead.org, frank-w@public-files.de,
	linux-media@vger.kernel.org, sam.shih@mediatek.com,
	mripard@kernel.org, lgirdwood@gmail.com, daniel.lezcano@linaro.org,
	maarten.lankhorst@linux.intel.com, houlong.wei@mediatek.com,
	dri-devel@lists.freedesktop.org, herbert@gondor.apana.org.au,
	matthias.bgg@gmail.com, jassisinghbrar@gmail.com, vkoul@kernel.org,
	mchehab@kernel.org, linux-gpio@vger.kernel.org,
	kyrie.wu@mediatek.corp-partner.google.com,
	linux-arm-kernel@lists.infradead.org, shane.chien@mediatek.com,
	conor+dt@kernel.org, p.zabel@pengutronix.de, granquet@baylibre.com,
	jitao.shi@mediatek.com, fparent@baylibre.com, tzimmermann@suse.de,
	eugen.hristev@linaro.org, broonie@kernel.org
Subject: Re: [PATCH 12/38] dt-bindings: regulator: mediatek,mt6331: Add
 missing compatible
Message-ID: <175347542615.1838505.12887834541571951617.robh@kernel.org>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-13-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724083914.61351-13-angelogioacchino.delregno@collabora.com>


On Thu, 24 Jul 2025 10:38:48 +0200, AngeloGioacchino Del Regno wrote:
> This binding had no compatible and for this reason would not be
> applied to anything: add the missing "mediatek,mt6331-regulator"
> comaptible.
> 
> Fixes: 6385e21692bb ("regulator: Add bindings for MT6331 regulator")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/regulator/mediatek,mt6331-regulator.yaml      | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


