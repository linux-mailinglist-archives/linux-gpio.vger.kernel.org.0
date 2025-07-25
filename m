Return-Path: <linux-gpio+bounces-23835-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1A4B12586
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jul 2025 22:31:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15F7A1C20298
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jul 2025 20:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58CC725B2E7;
	Fri, 25 Jul 2025 20:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uZ5PA19b"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F294A23C8C7;
	Fri, 25 Jul 2025 20:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753475422; cv=none; b=f3pks0dSlbqrqbLG3IlKo05IHTV95DknvaRZSq9QBeahxD1ARcNvaxW8gaDkAXBmdh7Fv6N13rXe1GsWYe5FW7FEZLvQsnzTNbLy3am0DCV8ysudGWu5RWbueqSG18aBTFQFPm417N7Bv5CeRIE3mws1gERaz9+WueSiSTJwlfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753475422; c=relaxed/simple;
	bh=3rcW5T4b32wrtkaTZSV6Q1gWpx5l5voD3MquK0Q4cBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nn7JfAw+DaotrMaTRL9uOPnvCs4ymEbmHhhDdAR3Q6+ys/lzytEVVBm/l3Vgxac8IdDFbu55g3OecKDnjnWf1dYkPzn5BILiaPi54Zhw8I22ngFvnwnxtg2Ztuu86fGw2XxexLK5imgxkg0oQL28j3GkQCirWKlFmHDwOcOhTBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uZ5PA19b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63321C4CEE7;
	Fri, 25 Jul 2025 20:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753475419;
	bh=3rcW5T4b32wrtkaTZSV6Q1gWpx5l5voD3MquK0Q4cBc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uZ5PA19btE/yRueT0j7fKcKmN3DrMeOir0e1gsbj8yaS3uyi7D1F4UIlMCA/slpDZ
	 ihTd7CKXcZf+1sZVkBN8RJGE7md62p2I+6yNu66rojh30veUJOQKBcBuPGOPf5RQhA
	 elqqrdDAq8PsPQ5JSKaJd8sOWHhdEXt8LbrdddRC9fmK7Kt2S+ziBl/smsPhXYiSjr
	 7sSN8zjT5m4DiFA48LfhRzhV20060InQ0rid92ItlB17orD6FLLlJ+SYC6Jv6Jza9r
	 PxhNzX3yRaJYJ+TbUMIrod+90q2XCWbaLBsd+9A+s9gOjdKa5AH7eesTheQU4l+cjb
	 Qigm1vllcFhsg==
Date: Fri, 25 Jul 2025 15:30:18 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: p.zabel@pengutronix.de, matthias.bgg@gmail.com, jitao.shi@mediatek.com,
	shane.chien@mediatek.com, linux-mediatek@lists.infradead.org,
	herbert@gondor.apana.org.au, houlong.wei@mediatek.com,
	sean.wang@kernel.org, mathieu.poirier@linaro.org,
	linux-media@vger.kernel.org, conor+dt@kernel.org,
	broonie@kernel.org, daniel.lezcano@linaro.org,
	granquet@baylibre.com, arnd@arndb.de, andy.teng@mediatek.com,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
	eugen.hristev@linaro.org, chunfeng.yun@mediatek.com,
	sam.shih@mediatek.com, linux-crypto@vger.kernel.org,
	airlied@gmail.com, davem@davemloft.net, atenart@kernel.org,
	tglx@linutronix.de, linus.walleij@linaro.org,
	frank-w@public-files.de, jiaxin.yu@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, tinghan.shen@mediatek.com,
	mchehab@kernel.org, jieyy.yang@mediatek.com, lgirdwood@gmail.com,
	linux-sound@vger.kernel.org, vkoul@kernel.org, tzimmermann@suse.de,
	jassisinghbrar@gmail.com, mwalle@kernel.org, fparent@baylibre.com,
	linux-gpio@vger.kernel.org,
	kyrie.wu@mediatek.corp-partner.google.com,
	linux-remoteproc@vger.kernel.org, mripard@kernel.org,
	simona@ffwll.ch, devicetree@vger.kernel.org,
	chunkuang.hu@kernel.org, ck.hu@mediatek.com, andersson@kernel.org,
	kishon@kernel.org, olivia.wen@mediatek.com,
	maarten.lankhorst@linux.intel.com, krzk+dt@kernel.org
Subject: Re: [PATCH 11/38] dt-bindings: regulator: mediatek,mt6331: Fix
 various regulator names
Message-ID: <175347541826.1838218.10273283619500191646.robh@kernel.org>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-12-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724083914.61351-12-angelogioacchino.delregno@collabora.com>


On Thu, 24 Jul 2025 10:38:47 +0200, AngeloGioacchino Del Regno wrote:
> This binding was never applied to anything because it misses the
> compatible, hence any mistake in it got unnoticed.
> 
> Before adding the compatible to let it apply, fix the names and
> the node names of various regulators.
> 
> Fixes: 6385e21692bb ("regulator: Add bindings for MT6331 regulator")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../regulator/mediatek,mt6331-regulator.yaml         | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


