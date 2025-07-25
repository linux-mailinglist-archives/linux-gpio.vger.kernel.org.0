Return-Path: <linux-gpio+bounces-23834-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C30B12582
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jul 2025 22:31:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 520D2AA0D9D
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jul 2025 20:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0251625F963;
	Fri, 25 Jul 2025 20:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jKwaEjYN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C26E25DAFF;
	Fri, 25 Jul 2025 20:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753475376; cv=none; b=tS0WnTE2Iem6ENMiaaipxZXlelhUz7FHIUxTY1rkDjsRv7rqONEK3mm4PE4Q+t2931+RmFyRV72hOBRY0KdxGlZXTDN3Xneox6sQb0Dr1Ef7BBFqoAbggqaXQWW/RiMGmIxNnnTbhGLLttSDalBi3wGwxuFRmF9c8Ed5V+gFsSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753475376; c=relaxed/simple;
	bh=FpiQA0h1rzmVXkCXdxYXb5ICmJTBTxxEhCePZRRuCHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vyb5BNtnok5FGh3E6jxrcFJ5EY2dLtUbLK2HX47VWSO8utIa7Q0b5lWbLWdHPOD6WLEpI3Uki02QmIhaCRspm0RqTyWZ9vTpSErMmcprVo9BNZb0kpLZr81r0kaGSOedPAqiCI7DoO79TMXNoze0dFirC+eo1yUDQwP1DCJW8f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jKwaEjYN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F213AC4CEE7;
	Fri, 25 Jul 2025 20:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753475376;
	bh=FpiQA0h1rzmVXkCXdxYXb5ICmJTBTxxEhCePZRRuCHA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jKwaEjYNVtXEiydTCcEXLSyh+1Hte1oAwHkS4BihjjRez/a8NVKcMBqFkGy3BEjuq
	 +X3eWAJWkqsX9CAX38Gq9toeBq6zU0OGfjuMPHzK604QZONe0tfL0x7mgWzcHqHdZu
	 vlOXoFxUcNZhtdWazggpl9Z/j9sQ4HWRJu4toM8I/xgTLt0i5/upQFIw/sO2Do7hgl
	 JegXzXTVwDd0NCMgkZqdfLubKFRC5Rot6gn4SVzsCSjZDN4fLGSWCN0dGldo3Qm8wh
	 nyH+PzpGN3FsB4DrzfCqJGE3Fa/7MeveQBlDdwA+V8tXz0sKj41d/P+hzWWrpzuUQ7
	 o3cXKDZLnLdUw==
Date: Fri, 25 Jul 2025 15:29:35 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mchehab@kernel.org, houlong.wei@mediatek.com, shane.chien@mediatek.com,
	airlied@gmail.com, arnd@arndb.de, lgirdwood@gmail.com,
	kishon@kernel.org, sean.wang@kernel.org, sam.shih@mediatek.com,
	linux-sound@vger.kernel.org, jieyy.yang@mediatek.com,
	linux-remoteproc@vger.kernel.org, p.zabel@pengutronix.de,
	davem@davemloft.net, linux-mediatek@lists.infradead.org,
	granquet@baylibre.com, linux-crypto@vger.kernel.org,
	linux-phy@lists.infradead.org, conor+dt@kernel.org,
	andy.teng@mediatek.com, linux-gpio@vger.kernel.org,
	krzk+dt@kernel.org, mwalle@kernel.org, vkoul@kernel.org,
	chunkuang.hu@kernel.org, atenart@kernel.org, broonie@kernel.org,
	tglx@linutronix.de, jiaxin.yu@mediatek.com, simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com, chunfeng.yun@mediatek.com,
	linux-arm-kernel@lists.infradead.org, ck.hu@mediatek.com,
	herbert@gondor.apana.org.au, jitao.shi@mediatek.com,
	tinghan.shen@mediatek.com, fparent@baylibre.com,
	linux-media@vger.kernel.org, mripard@kernel.org,
	daniel.lezcano@linaro.org, frank-w@public-files.de,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	andersson@kernel.org, olivia.wen@mediatek.com,
	linus.walleij@linaro.org, kyrie.wu@mediatek.corp-partner.google.com,
	dri-devel@lists.freedesktop.org, mathieu.poirier@linaro.org,
	eugen.hristev@linaro.org, tzimmermann@suse.de,
	jassisinghbrar@gmail.com, matthias.bgg@gmail.com
Subject: Re: [PATCH 10/38] dt-bindings: regulator: mediatek,mt6332-regulator:
 Add missing compatible
Message-ID: <175347537496.1837320.18080816352465991088.robh@kernel.org>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-11-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724083914.61351-11-angelogioacchino.delregno@collabora.com>


On Thu, 24 Jul 2025 10:38:46 +0200, AngeloGioacchino Del Regno wrote:
> This binding had no compatible and for this reason would not be
> applied to anything: add the missing "mediatek,mt6332-regulator"
> compatible.
> 
> Fixes: e22943e32e1f regulator: ("Add bindings for MT6332 regulator")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/regulator/mediatek,mt6332-regulator.yaml      | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


