Return-Path: <linux-gpio+bounces-24818-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E26E9B31CB2
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 16:51:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 69D2F18884EB
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 14:47:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BCB530E834;
	Fri, 22 Aug 2025 14:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gIuN8hF9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1F72BDC33;
	Fri, 22 Aug 2025 14:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755874013; cv=none; b=enDqJTFQaHmVn90w//9fVyYjNtMWBORBr/UpDCMzvOMrKtrm2HmXoZsqHK/rhhhRcl3rquNah79UYjLFSyGwpu1PsG5gTAuTDoP1i4VIgdG5ZAgpb6WsvjoZrMY5z3jkTXRQmr45KCtUnS+R+v0Xsn4sw4JEL57OlEHxfA6LK3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755874013; c=relaxed/simple;
	bh=+LMAKVwOGszxRowkPXPHA9+jKYN9k/xShb+3HOShYDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XoSQwRR7YtTH3vag+yQw6+sjZeeSZKZw8xtkhLDRwKgA3T0AZjclNFG1DRKcJTcQ6Yz+EZqHZ8Y9s9yYeD4nQQiKGhiQRRoK2stitP4/8ofwPuHpOM0fApSTvdvMq6cN99IHyjZ9CG0Bqe/6VJAcdkMo26JqR3bMKE7umjrRTCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gIuN8hF9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86587C4CEED;
	Fri, 22 Aug 2025 14:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755874013;
	bh=+LMAKVwOGszxRowkPXPHA9+jKYN9k/xShb+3HOShYDk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gIuN8hF9wWDGShDvUOB2QK4Nd/qYdV1baMD1PWWrn0lgPIxFWci5eGIbdnbvjUyz8
	 JCPZE8w7epY/TRHm9LS14Tmux3Pm7TvbCBbPxMskuHdpgKGBiENdgd9l271qVLiuIE
	 lUJK25RtwR4AJPaYuhGy/tSFK7YbGAFnsKlDjrqAfWXnFwHMF8javBuwrQfC2E56MY
	 RVQ4OytbvrMwrKfxwLiIDqvolz2QfoR68/ju5eqQ3YEUMRsM0dEGu/CpaOq9hoH7hK
	 wqzkaTsIqJIdo6xQtm0bziemWvZIE7aDFGOznqFsW/nffenMl8Fz+cRLk6qXCLD4QA
	 q2Ip/9UEuZ3oQ==
Date: Fri, 22 Aug 2025 09:46:52 -0500
From: Rob Herring <robh@kernel.org>
To: Julien Massot <julien.massot@collabora.com>
Cc: kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ikjoon Jang <ikjn@chromium.org>,
	Enric Balletbo i Serra <eballetbo@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Julien Massot <jmassot@collabora.com>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 6/6] ASoC: dt-binding: Convert MediaTek mt8183-mt6358
 bindings to YAML
Message-ID: <20250822144652.GA3763665-robh@kernel.org>
References: <20250820-mtk-dtb-warnings-v2-0-cf4721e58f4e@collabora.com>
 <20250820-mtk-dtb-warnings-v2-6-cf4721e58f4e@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-mtk-dtb-warnings-v2-6-cf4721e58f4e@collabora.com>

On Wed, Aug 20, 2025 at 03:44:57PM +0200, Julien Massot wrote:
> Convert the existing text-based DT binding for MT8183 sound cards using
> MT6358 and various other codecs to a YAML schema.

In the subject (on all the patches), avoid saying 'binding' twice and I 
prefer 'DT schema' over YAML. Lot's of things are YAML, but only one 
thing is DT schema.

> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Julien Massot <julien.massot@collabora.com>
> ---
>  .../sound/mediatek,mt8183_mt6358_ts3a227.yaml      | 59 ++++++++++++++++++++++
>  .../sound/mt8183-mt6358-ts3a227-max98357.txt       | 25 ---------
>  2 files changed, 59 insertions(+), 25 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8183_mt6358_ts3a227.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8183_mt6358_ts3a227.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..048fe62715d67d44daa08e75a63c782238815689
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/mediatek,mt8183_mt6358_ts3a227.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/mediatek,mt8183_mt6358_ts3a227.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT8183 sound card with MT6358, TS3A227, and MAX98357/RT1015 codecs
> +
> +maintainers:
> +  - Julien Massot <julien.massot@collabora.com>
> +
> +description:
> +  Binding for MediaTek MT8183 SoC-based sound cards using the MT6358 codec,

Drop 'Binding for '.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

And thank you for jumping on all these Mediatek bindings.

Rob

