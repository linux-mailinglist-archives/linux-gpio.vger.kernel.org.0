Return-Path: <linux-gpio+bounces-24706-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84626B2EE76
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 08:44:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36CD4A07708
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 06:43:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB0182E888A;
	Thu, 21 Aug 2025 06:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RlbxLLph"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683342110;
	Thu, 21 Aug 2025 06:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755758613; cv=none; b=oJ4EIHlPtdiW6tDA9F2xKRjWGWpU2zkcruZeK2pM5iRIwl7QHRMxXQDjFPKkJXyG4V9LiRvft90/womBB8yBIHaqpaW2rIGPeYWQYqOh5NXJ9ZqrtrwFxGBp6sbhP3aakkwg7/nK+8mKEmXRDryqC40r3gVGF4+nMPUsjFn+mNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755758613; c=relaxed/simple;
	bh=zaVWerZTZLJ8YGpnqDKef0xiQVpqgGGNlE3XojBrVrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aIGASKiuxLd0LIsNq6/0QArWbZcerbbNxVD2jHL5UsBpQCdPRwumraQubyam7Hz6fyXElDQgModm3KZMLCYL45dK0O5h3OgnxwXIWSpYTvoS+oEpYWGnKJ6N5glX/P5BvzvRI2gP9ZsWLm8YSmm7IYrAcZcnGGcDcToxUF39fQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RlbxLLph; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5356EC4CEED;
	Thu, 21 Aug 2025 06:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755758612;
	bh=zaVWerZTZLJ8YGpnqDKef0xiQVpqgGGNlE3XojBrVrQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RlbxLLphD3s6EoJ5D3WCBJhkvpXfyxmkM+Qya8AKcXeBnVJLqM3Vsrc3PdaE1oGl/
	 Qo+edh7KSJ0kTQEF7CnlEohahPoHRRs2dickP/uGTguIIdLZVFlS2b52/8ecx5Nk/m
	 7T2LcSdChTzPHT3itMuL39yH6al0pQprxVmGFsBW9p+lMgWfXyVZWtte+oZjqxv2Uz
	 sksMu6TvOONzSOEaSF9B1dAWw/J39W6ARtM4nHVYp3KwZbqb9VuE1HT0enMMEDhCZW
	 i8kxRu1EZ2sYpSQHNpCitTBsBoN1OR7Lkjq536twpmdXapSiVtjLmM2GbVlIRiytW9
	 +hYeRC8retWSA==
Date: Thu, 21 Aug 2025 08:43:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch, 
	andrew-ct.chen@mediatek.com, angelogioacchino.delregno@collabora.com, broonie@kernel.org, 
	chunkuang.hu@kernel.org, ck.hu@mediatek.com, conor+dt@kernel.org, davem@davemloft.net, 
	dmitry.torokhov@gmail.com, edumazet@google.com, flora.fu@mediatek.com, 
	houlong.wei@mediatek.com, jeesw@melfas.com, jmassot@collabora.com, kernel@collabora.com, 
	krzk+dt@kernel.org, kuba@kernel.org, kyrie.wu@mediatek.corp-partner.google.com, 
	lgirdwood@gmail.com, linus.walleij@linaro.org, louisalexis.eyraud@collabora.com, 
	maarten.lankhorst@linux.intel.com, matthias.bgg@gmail.com, mchehab@kernel.org, 
	minghsiu.tsai@mediatek.com, mripard@kernel.org, p.zabel@pengutronix.de, pabeni@redhat.com, 
	robh@kernel.org, sean.wang@kernel.org, simona@ffwll.ch, 
	support.opensource@diasemi.com, tiffany.lin@mediatek.com, tzimmermann@suse.de, 
	yunfei.dong@mediatek.com, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v1 03/14] dt-bindings: arm: mediatek: mmsys: Add
 assigned-clocks/rates properties
Message-ID: <20250821-electric-kestrel-of-awe-cb89dc@kuoka>
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
 <20250820171302.324142-4-ariel.dalessandro@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250820171302.324142-4-ariel.dalessandro@collabora.com>

On Wed, Aug 20, 2025 at 02:12:51PM -0300, Ariel D'Alessandro wrote:
> Current, the DT bindings for MediaTek mmsys controller is missing the
> assigned-clocks and assigned-clocks-rates properties. Add these and

No, they do not miss them. I don't understand why you are adding these.

> update the example as well.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> ---
>  .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> index 3f4262e93c789..d045d366eb8e2 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> @@ -68,6 +68,12 @@ properties:
>        of the power controller specified by phandle. See
>        Documentation/devicetree/bindings/power/power-domain.yaml for details.
>  
> +  assigned-clocks:
> +    maxItems: 1
> +
> +  assigned-clock-rates:
> +    maxItems: 1
> +

Drop both, completely redundant and not actually in the scope of the binding.

Best regards,
Krzysztof


