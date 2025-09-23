Return-Path: <linux-gpio+bounces-26531-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 947B2B97962
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Sep 2025 23:37:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C43201B23181
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Sep 2025 21:37:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C7DF30C622;
	Tue, 23 Sep 2025 21:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a55I2Dre"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D9578F58;
	Tue, 23 Sep 2025 21:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758663443; cv=none; b=hWaQILhlsNLMI/aSUs7rgYf5LeeOUdCgygitarhcwgC+fMUdA11wBXIiUVKc7iEQlg2fdPcGQflYHCgFwSLZOqoPHsv+Bet4OBpROKLAeqPpI5qEoz67SIUtmz0u2x7WOxt8WfpoRkJImHyEYS1tQ/W0XRG42xe7LqjMik1KW0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758663443; c=relaxed/simple;
	bh=AmT7pTT/bQK4h7VloFIIhchliPgyZojTf54MF0QHREo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DigyDuCykUZUYuYfeuzzwtc5v4QSCTd1qLSLUqhXnzEb8fr460UozrZD93NDsb0+MV9eaTDc0ptjoyGD7tncUBCz52g92l26QKenYgiqUY/0/JhQORtsKCcb1vrMj/2XowCnxGPHJGTY/TbFuc0/nFBpYC7UKilW/qr34WUH2gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a55I2Dre; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EE44C4CEF5;
	Tue, 23 Sep 2025 21:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758663443;
	bh=AmT7pTT/bQK4h7VloFIIhchliPgyZojTf54MF0QHREo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a55I2Drexre9bmk9zOM6IHzQLXlQLZh5HwWP9Px8aa/1hUS7J58IX7JJ3YDzCuSEM
	 PAS3UJCrtAIueVROmkX4i4/LE8CnJ4xggv/HzM6XkXuZUCxXuwrOA/v6g8Y2f0uku/
	 f0ijwgCPwX5/BC3M3TGHhGSBZsK1PD0rxU7lsZr5CX9FWDXzMlOrlUQMTXiYaxcO0D
	 skyJYWG9BJlwnI2a0btE2FNr6ra9N0dWRB6zll1TTr5tpxaUDyhp6C6gLAYOk8Mmtl
	 jxKtO5V+Vycuwt7yWcI4UnHje3zc3L22NfIckDsJKK8yanMDnkXkmCavEDVeL+Tcsl
	 68jmOmlZAVZmQ==
Date: Tue, 23 Sep 2025 16:37:21 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, herbert@gondor.apana.org.au,
	davem@davemloft.net, krzk+dt@kernel.org, conor+dt@kernel.org,
	chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, jassisinghbrar@gmail.com,
	mchehab@kernel.org, matthias.bgg@gmail.com,
	chunfeng.yun@mediatek.com, vkoul@kernel.org, kishon@kernel.org,
	sean.wang@kernel.org, linus.walleij@linaro.org, lgirdwood@gmail.com,
	broonie@kernel.org, andersson@kernel.org,
	mathieu.poirier@linaro.org, daniel.lezcano@linaro.org,
	tglx@linutronix.de, atenart@kernel.org, jitao.shi@mediatek.com,
	ck.hu@mediatek.com, houlong.wei@mediatek.com,
	kyrie.wu@mediatek.corp-partner.google.com, andy.teng@mediatek.com,
	tinghan.shen@mediatek.com, jiaxin.yu@mediatek.com,
	shane.chien@mediatek.com, olivia.wen@mediatek.com,
	granquet@baylibre.com, eugen.hristev@linaro.org, arnd@arndb.de,
	sam.shih@mediatek.com, jieyy.yang@mediatek.com,
	frank-w@public-files.de, mwalle@kernel.org, fparent@baylibre.com,
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 00/38] MediaTek devicetree/bindings warnings sanitization
Message-ID: <20250923213721.GA91441-robh@kernel.org>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>

On Thu, Jul 24, 2025 at 10:38:36AM +0200, AngeloGioacchino Del Regno wrote:
> As Rob pointed out, MediaTek devicetrees are *poor* in the dtbs_check
> tests, and got an infinite load of warnings.
> 
> This series starts attacking this situation.
> 
> I didn't really count how many warnings I have resolved - it's a lot
> of them anyway - and I think that this is a good start in any case.
> 
> More will come, but I'll be on a long holiday soon, so not from me
> (or anyway not before I come back anyway), but most probably from
> someone else (in August...!).
> 
> Cheers!
> Angelo
> 
> AngeloGioacchino Del Regno (38):
>   dt-bindings: display: mediatek: dpi: Allow specifying resets
>   dt-bindings: display: mediatek,dp: Allow DisplayPort AUX bus
>   dt-bindings: mailbox: mediatek,gce-mailbox: Make clock-names optional
>   ASoC: dt-bindings: mt8192-afe-pcm: Fix clocks and clock-names
>   dt-bindings: crypto: inside-secure,safexcel: Mandate only ring IRQs
>   dt-bindings: timer: mediatek: Add compatible for MT6795 GP Timer
>   dt-bindings: pinctrl: mediatek,mt7622-pinctrl: Add missing pwm_ch7_2
>   dt-bindings: pinctrl: mediatek,mt7622-pinctrl: Add missing base reg
>   dt-bindings: pinctrl: mt6779: Allow common MediaTek pinctrl node names
>   dt-bindings: regulator: mediatek,mt6332-regulator: Add missing
>     compatible
>   dt-bindings: regulator: mediatek,mt6331: Fix various regulator names
>   dt-bindings: regulator: mediatek,mt6331: Add missing compatible
>   dt-bindings: remoteproc: mediatek: Remove l1tcm MMIO from MT8188 dual
>   dt-bindings: media: mediatek,mt8195-jpeg: Allow range number in node
>     address
>   dt-bindings: phy: mediatek,hdmi-phy: Fix clock output names for MT8195

As we are close to the merge window, I applied patches 1, 3, 6, 7, 8, 
10, 11, 12 and 14.

Rob

