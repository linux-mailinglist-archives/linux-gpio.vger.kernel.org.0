Return-Path: <linux-gpio+bounces-23832-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 810B2B12571
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jul 2025 22:30:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF331AE407B
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jul 2025 20:29:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E566425B30E;
	Fri, 25 Jul 2025 20:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nmhx7Z8/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902BF25A343;
	Fri, 25 Jul 2025 20:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753475339; cv=none; b=AwQWg6nj9eacfO6rrwb8U8qCpp7LCLwfe3EzVSkILaSzvhJghCOuakn0xDtUGSuvl84YqFmV1pohnBp78fgR0Rax3vGR1M2dF5wV3YLD9h8uH8UJnJkqzikumHC85Es9xZnuOg54+YYEUrL5e+wFTaSExgl9Ppgjp0yD1tzbL2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753475339; c=relaxed/simple;
	bh=2lR8zBkPfCL0XzsAZKYS6/0c97bv4h+0epH74tNqB9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mxVSbyhr+Bv+Htq0NMpFXrzunwgBsxBLGv1TmRnoOw6P1O8z4lSTwcfOANktlk+h33yLHSU3yjjgheVBG3xTsVGzwtLTP8eVArgvujG7AYPWID89oASlABcMOA6PYmnYQQ7vWmMD75kr3pS9FTTQ/05J02DHxZFpmc7GX4gv1eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nmhx7Z8/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBE74C4CEE7;
	Fri, 25 Jul 2025 20:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753475339;
	bh=2lR8zBkPfCL0XzsAZKYS6/0c97bv4h+0epH74tNqB9s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nmhx7Z8/FBwNijNFPpZf4SqJoOStQ0XsxTd/CcwodEvheITYeVzDATI0vkqopVZpN
	 ahWJcPhWgy+F6oKOWucoyS8HKVtTZ65qkKO8rnMdpLbkTDaCq5kdB43VdABXLgIuDr
	 AM/H9YWG4msnlSmTFWa7aBLB+g4755Mt+4XTP+zmXW/Yj4MklkggEMOnWzWa+wULQ5
	 WGiC6obE6FEykCeFOOC0Vg2eGT4khYCcJCTXm7Kcot8eL3Y4GZ6LqEPpW7zeM7EEVS
	 8NizKGJ9SwGA6+f9JSlBLusqpEgsBUK4k1GQ/Wm6GpWdOOeE//dPy40IOSp7ZOPZfq
	 Lrk5Ir8nxLrrQ==
Date: Fri, 25 Jul 2025 15:28:58 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, mripard@kernel.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	daniel.lezcano@linaro.org, krzk+dt@kernel.org, vkoul@kernel.org,
	chunfeng.yun@mediatek.com, tinghan.shen@mediatek.com, arnd@arndb.de,
	herbert@gondor.apana.org.au, shane.chien@mediatek.com,
	andersson@kernel.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
	linux-phy@lists.infradead.org, airlied@gmail.com,
	matthias.bgg@gmail.com, linus.walleij@linaro.org,
	jieyy.yang@mediatek.com, granquet@baylibre.com,
	maarten.lankhorst@linux.intel.com, mchehab@kernel.org,
	linux-media@vger.kernel.org, tglx@linutronix.de,
	conor+dt@kernel.org, jiaxin.yu@mediatek.com,
	frank-w@public-files.de, davem@davemloft.net, sam.shih@mediatek.com,
	broonie@kernel.org, kyrie.wu@mediatek.corp-partner.google.com,
	chunkuang.hu@kernel.org, eugen.hristev@linaro.org, simona@ffwll.ch,
	andy.teng@mediatek.com, linux-remoteproc@vger.kernel.org,
	tzimmermann@suse.de, mwalle@kernel.org, ck.hu@mediatek.com,
	houlong.wei@mediatek.com, p.zabel@pengutronix.de,
	olivia.wen@mediatek.com, jitao.shi@mediatek.com,
	mathieu.poirier@linaro.org, kishon@kernel.org,
	jassisinghbrar@gmail.com, sean.wang@kernel.org, atenart@kernel.org,
	fparent@baylibre.com, linux-crypto@vger.kernel.org
Subject: Re: [PATCH 06/38] dt-bindings: timer: mediatek: Add compatible for
 MT6795 GP Timer
Message-ID: <175347533780.1836400.4840892261408767765.robh@kernel.org>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-7-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724083914.61351-7-angelogioacchino.delregno@collabora.com>


On Thu, 24 Jul 2025 10:38:42 +0200, AngeloGioacchino Del Regno wrote:
> Add a compatible for the General Purpose Timer (GPT) found on the
> MediaTek Helio X10 MT6795 SoC which is fully compatible with the
> one found in MT6577.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/timer/mediatek,timer.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


