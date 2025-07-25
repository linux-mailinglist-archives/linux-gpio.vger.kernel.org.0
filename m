Return-Path: <linux-gpio+bounces-23833-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9436FB1257A
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jul 2025 22:30:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 475BD1C260F5
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jul 2025 20:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D29025D53C;
	Fri, 25 Jul 2025 20:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TBmk1V9I"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476ED259CB9;
	Fri, 25 Jul 2025 20:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753475360; cv=none; b=atdjOlyrDUBlnrdHoECVys+VosU5ZT+pj6zZDz3wSLsJMPPKZrh0vvOFIvw2r5OtQ3DBuFrK38JSpX1+1vC6PXNU4FzMc3kwqpPc2BEX6kQs4PyImkoC9v+3Yuz2+07137xSm2kkafzr8kg8W+99RQkfLYZTpR1Mvez4KnlhSJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753475360; c=relaxed/simple;
	bh=Imha4OX0ZhwOigvJh8YFnyOUROjweFoNk0pUIHBrpJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bnDcG1Q0mYGDakb39GlobpzI168B4HBn6G1j67o/kU4HpSyCwhrYWuqR5MJjB0/kZxpF1Z0IkWBysY1zRzQw3QXHVajX/kb3pMIO+NuoC6IUfHgXjMriaitAmH0jeW1qL0IK1UuzL2kX//JCTA9gvm7RSPD4IeaFTH7KAROtHco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TBmk1V9I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B468AC4CEE7;
	Fri, 25 Jul 2025 20:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753475359;
	bh=Imha4OX0ZhwOigvJh8YFnyOUROjweFoNk0pUIHBrpJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TBmk1V9It9WMtACxnpGuqS+dXcJZbCibN0qJhMdmR7JXzU7UcDGxqXVSN7TX1Ukyp
	 K7oxYEDuNuZMKcDqLLt8nfuvt91BAayZZTmBtbUUk+SnPjZ8nWirQQYi4O8yeWXVum
	 XHKOThHlkOkCC7yoBj/Pz41F+ly97Cem2yaOjDdFiU1DUjW0NrB9BpuzUVVXcCjugU
	 GCBlWm/NGprv2S/hXMCwSZayD5LKPhTcHANkfzcgAclohf/gEDSuesMG0KaEnbJMX8
	 cHwf5O+G6ZypWaVIo2L0zsp1lGOraVhUfEHkWY9JaASwnHqt4qU26DFMbBfeEGA6HX
	 LWzDSdQeLlHAA==
Date: Fri, 25 Jul 2025 15:29:17 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: tglx@linutronix.de, shane.chien@mediatek.com,
	dri-devel@lists.freedesktop.org, daniel.lezcano@linaro.org,
	mathieu.poirier@linaro.org, linux-remoteproc@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-gpio@vger.kernel.org,
	kishon@kernel.org, sam.shih@mediatek.com,
	devicetree@vger.kernel.org, sean.wang@kernel.org,
	krzk+dt@kernel.org, simona@ffwll.ch, atenart@kernel.org,
	linux-media@vger.kernel.org, tzimmermann@suse.de,
	jiaxin.yu@mediatek.com, granquet@baylibre.com, fparent@baylibre.com,
	vkoul@kernel.org, kyrie.wu@mediatek.corp-partner.google.com,
	chunfeng.yun@mediatek.com, eugen.hristev@linaro.org,
	maarten.lankhorst@linux.intel.com, broonie@kernel.org,
	jassisinghbrar@gmail.com, houlong.wei@mediatek.com,
	andersson@kernel.org, olivia.wen@mediatek.com, mwalle@kernel.org,
	andy.teng@mediatek.com, chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de, herbert@gondor.apana.org.au,
	davem@davemloft.net, linux-sound@vger.kernel.org,
	mripard@kernel.org, airlied@gmail.com, frank-w@public-files.de,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	jieyy.yang@mediatek.com, matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org, lgirdwood@gmail.com,
	mchehab@kernel.org, tinghan.shen@mediatek.com,
	jitao.shi@mediatek.com, linux-phy@lists.infradead.org,
	conor+dt@kernel.org, ck.hu@mediatek.com, arnd@arndb.de,
	linus.walleij@linaro.org
Subject: Re: [PATCH 07/38] dt-bindings: pinctrl: mediatek,mt7622-pinctrl: Add
 missing pwm_ch7_2
Message-ID: <175347535659.1836862.13811953768761711580.robh@kernel.org>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-8-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724083914.61351-8-angelogioacchino.delregno@collabora.com>


On Thu, 24 Jul 2025 10:38:43 +0200, AngeloGioacchino Del Regno wrote:
> The MT7622 SoC has a PWM channel 7-2 group for the pwm7 IP: add
> the missing pwm_ch7_2 group.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


