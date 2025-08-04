Return-Path: <linux-gpio+bounces-24007-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A8CB19D24
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Aug 2025 10:00:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15A8C18933EC
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Aug 2025 08:01:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54B30244673;
	Mon,  4 Aug 2025 07:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="EFrS3RMc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B6423C8AE;
	Mon,  4 Aug 2025 07:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754294382; cv=none; b=R6Ly6WMSFtSdPtP/KnnebXtKSH86GTuqvBW/TVhIxP6b28dXe+6+45TFhnBwtqGkGziwO81bGCz3mYdQg9zchNSjzPs2cTq7P3np0/rUaDnp304Zd5hwl0yKOhtFnvlR/XpzVEDkzAF76C64nXUX5St5uAbBi8eOAb0N6rc8/yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754294382; c=relaxed/simple;
	bh=qKi0eXDo0OTD7u8dxVvtJEkp/wS/GQKLGnSmOfqNspM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PyZPLXG+N7HSdy4a5RTEEUOtfnmwyWTE32WGd3OOrQ+xvYYj5Ixgpdt2GBs1eABhAtr8ZqIYZKIEmdHmCr1njlmvkqJthY4ca9USU32s5i6o8G3lzX5trLjbEEfiEmS8rvTZStLu8gL9Npkizq3GbEXTbF0LbVqXSh0pjp443K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=EFrS3RMc; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754294378;
	bh=qKi0eXDo0OTD7u8dxVvtJEkp/wS/GQKLGnSmOfqNspM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EFrS3RMc58FRonFJy7TsjmETlRNBbZEBME9CIkLnprbTk12RIUIyCwDGo/ncIyos/
	 swC6vWL868wuIAX6eFUzsQTvqDoam8Pvg6sapx+Rv5DM5eGKlYaM7B9pBny+29j1Ku
	 DSr8nOco/T+L9lUa3OG0TlYUMbNWB8Qd7htQ6Ds/HYkHQTtHUVJI3G6JQsRDSPILfX
	 UTHfROGPVTS3Ys2EuTDd6zLseSM0vGWsWFOfiaVDOCLCVM0NqOnsfLHRjnTXcEfUKF
	 GuzbBHnW0nCdiLa6BtiqoiBJzZyxO+LecxryY46q4fBLcf5k3q8yx8BP2WD7QKaLlM
	 9J+jFZtgPc7PA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A86B317E046C;
	Mon,  4 Aug 2025 09:59:37 +0200 (CEST)
Message-ID: <7c0433be-1008-4d6e-9672-b1908383e162@collabora.com>
Date: Mon, 4 Aug 2025 09:59:37 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] dt-bindings: arm: mediatek: Support mt8183-audiosys
 binding variant
To: Julien Massot <julien.massot@collabora.com>, kernel@collabora.com,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Ikjoon Jang <ikjn@chromium.org>,
 Enric Balletbo i Serra <eballetbo@kernel.org>,
 Chen-Yu Tsai <wenst@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>,
 Eugen Hristev <eugen.hristev@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Julien Massot <jmassot@collabora.com>, Sean Wang <sean.wang@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <20250801-mtk-dtb-warnings-v1-0-6ba4e432427b@collabora.com>
 <20250801-mtk-dtb-warnings-v1-2-6ba4e432427b@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250801-mtk-dtb-warnings-v1-2-6ba4e432427b@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 01/08/25 13:18, Julien Massot ha scritto:
> Update the mediatek,audsys binding to support the mt8183-audiosys
> compatible, which uses a different audio controller binding
> (mt8183-afe-pcm.yaml) compared to the legacy mt2701-audio controller.
> 
> Signed-off-by: Julien Massot <julien.massot@collabora.com>
> ---
>   .../bindings/arm/mediatek/mediatek,audsys.yaml          | 17 ++++++++++++++++-
>   1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml
> index 45d4a6620041b11cf6e943de49a42f3fcd91e1b9..5d9d91f9c5802240ac7d411c5632ae6663d15f29 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml
> @@ -23,6 +23,7 @@ properties:
>                 - mediatek,mt7622-audsys
>                 - mediatek,mt8167-audsys
>                 - mediatek,mt8173-audsys
> +              - mediatek,mt8183-audiosys
>                 - mediatek,mt8183-audsys
>                 - mediatek,mt8186-audsys
>                 - mediatek,mt8192-audsys
> @@ -41,7 +42,6 @@ properties:
>       const: 1
>   
>     audio-controller:
> -    $ref: /schemas/sound/mediatek,mt2701-audio.yaml#
>       type: object
>   
>   required:
> @@ -50,6 +50,21 @@ required:
>   
>   additionalProperties: false
>   
> +allOf:

I think you can do it without the allOf here as well.

if:
   properties:
     compatible:
       contains...
then:
   properties
     ...
else:
  ... etc

after which

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt8183-audiosys
> +    then:
> +      properties:
> +        audio-controller:
> +          $ref: /schemas/sound/mt8183-afe-pcm.yaml#
> +    else:
> +      properties:
> +        audio-controller:
> +          $ref: /schemas/sound/mediatek,mt2701-audio.yaml#
> +
>   examples:
>     - |
>       #include <dt-bindings/interrupt-controller/arm-gic.h>
> 



