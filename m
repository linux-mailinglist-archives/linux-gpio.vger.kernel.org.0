Return-Path: <linux-gpio+bounces-24820-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4ABB31E29
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 17:20:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B87AF1CE7170
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 15:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18DFB22A807;
	Fri, 22 Aug 2025 15:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lcdvgiT3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D7F20E023;
	Fri, 22 Aug 2025 15:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755875656; cv=none; b=axRJ3pS0V/XBLf9GpGC5iZSQFba9SLvzch1jqYIqUhTXOXpEGnbcRcLFVVtpSyShlqS1bkTotLql75PCV8S8RwcxPD3PCUaQp8lRXTksL7a+V7SugIV+MvLJ1AJDNP8TrcxrbI2NZdw//s3M9Cx7WqS0nFXdoplSxH4yZWsMndk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755875656; c=relaxed/simple;
	bh=LonE3rEgRMxIVsYfDjiHDPQfYMJ4W3TyT5tCihgHym0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hzp9wth/bJnR3S+qCsdGlz9n7zLHfQbmgJ4YrABAUo05s3QTAtrXtHITn9KF10zCmfwIphXAKxYaDzL2UWUxxf0pRbI4p2MrOlSRL68OGUXufQmzBkhZn3TVdJ7CqtYP/37kvgrVfhJrbnfvH9lTKr9XB9IxK6VkrQxwJu//N9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lcdvgiT3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28AE3C4CEED;
	Fri, 22 Aug 2025 15:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755875656;
	bh=LonE3rEgRMxIVsYfDjiHDPQfYMJ4W3TyT5tCihgHym0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lcdvgiT329HDpoh0VCPKjLOr0moxcH5cK28AAxLH4+gdXwe82hWMy5dQXf+hxi+SJ
	 e5skJ6Ap3UNK0hxPe/1QnheFWVpdsPDuOEyu/CscLYWgU30HdVoKiMx0zfj5Wy/CwO
	 cSBIRzhdLMkd6X6u2lLgcYTDtvl9pespreueOrlccrxtDtXBmjc4D3yOKhl7LjVwQ5
	 WRahCkYy+4d50YdUNM+F8DB4LPVIQUwhjRHIh6Ac0h1fO7vCZVT1jWiRh9yW8JCFOw
	 AZM9juQBSX/GvY2Z50e0J5uHQ1wlVf5cHwNZOkZXtCySwR9zTYxtOWABXBHT5B2nDf
	 L8Yg2tntKVzEQ==
Date: Fri, 22 Aug 2025 10:14:15 -0500
From: Rob Herring <robh@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch,
	andrew-ct.chen@mediatek.com,
	angelogioacchino.delregno@collabora.com, broonie@kernel.org,
	chunkuang.hu@kernel.org, ck.hu@mediatek.com, conor+dt@kernel.org,
	davem@davemloft.net, dmitry.torokhov@gmail.com, edumazet@google.com,
	flora.fu@mediatek.com, houlong.wei@mediatek.com, jeesw@melfas.com,
	jmassot@collabora.com, kernel@collabora.com, krzk+dt@kernel.org,
	kuba@kernel.org, kyrie.wu@mediatek.corp-partner.google.com,
	lgirdwood@gmail.com, linus.walleij@linaro.org,
	louisalexis.eyraud@collabora.com, maarten.lankhorst@linux.intel.com,
	matthias.bgg@gmail.com, mchehab@kernel.org,
	minghsiu.tsai@mediatek.com, mripard@kernel.org,
	p.zabel@pengutronix.de, pabeni@redhat.com, sean.wang@kernel.org,
	simona@ffwll.ch, support.opensource@diasemi.com,
	tiffany.lin@mediatek.com, tzimmermann@suse.de,
	yunfei.dong@mediatek.com, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH v1 05/14] sound: dt-bindings: Convert MediaTek RT5650
 codecs bindings to YAML
Message-ID: <20250822151415.GA3819434-robh@kernel.org>
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
 <20250820171302.324142-6-ariel.dalessandro@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820171302.324142-6-ariel.dalessandro@collabora.com>

On Wed, Aug 20, 2025 at 02:12:53PM -0300, Ariel D'Alessandro wrote:
> Convert the existing text-based DT bindings for Mediatek MT8173 RT5650
> codecs to a YAML schema.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> ---
>  .../sound/mediatek,mt8173-rt5650.yaml         | 73 +++++++++++++++++++
>  .../bindings/sound/mt8173-rt5650.txt          | 31 --------
>  2 files changed, 73 insertions(+), 31 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/mt8173-rt5650.txt
> 
> diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650.yaml
> new file mode 100644
> index 0000000000000..36e4f9c4c3d62
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650.yaml
> @@ -0,0 +1,73 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/mediatek,mt8173-rt5650.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek MT8173 with RT5650 codecs and HDMI via I2S
> +
> +maintainers:
> +  - Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> +
> +properties:
> +  compatible:
> +    const: "mediatek,mt8173-rt5650"

Drop quotes.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  mediatek,audio-codec:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description:
> +      The phandles of rt5650 codecs and of the HDMI encoder node.
> +    minItems: 2
> +
> +  mediatek,platform:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      The phandle of MT8173 ASoC platform.
> +
> +  mediatek,mclk:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      The MCLK source.
> +      0: external oscillator, MCLK = 12.288M
> +      1: internal source from mt8173, MCLK = sampling rate * 256
> +
> +  codec-capture:
> +    description: Subnode of rt5650 codec capture.
> +    type: object
> +
> +    properties:
> +      sound-dai:
> +        maxItems: 1
> +        description: phandle of the CPU DAI
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - mediatek,audio-codec
> +  - mediatek,platform
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    sound: sound {

Drop unused label.

> +        compatible = "mediatek,mt8173-rt5650";
> +        mediatek,audio-codec = <&rt5650 &hdmi0>;
> +        mediatek,platform = <&afe>;
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&aud_i2s2>;
> +
> +        mediatek,mclk = <1>;
> +        codec-capture {
> +            sound-dai = <&rt5650 1>;
> +        };
> +    };
> +
> +...
> diff --git a/Documentation/devicetree/bindings/sound/mt8173-rt5650.txt b/Documentation/devicetree/bindings/sound/mt8173-rt5650.txt
> deleted file mode 100644
> index 29dce2ac8773a..0000000000000
> --- a/Documentation/devicetree/bindings/sound/mt8173-rt5650.txt
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -MT8173 with RT5650 CODECS and HDMI via I2S
> -
> -Required properties:
> -- compatible : "mediatek,mt8173-rt5650"
> -- mediatek,audio-codec: the phandles of rt5650 codecs
> -                        and of the hdmi encoder node
> -- mediatek,platform: the phandle of MT8173 ASoC platform
> -
> -Optional subnodes:
> -- codec-capture : the subnode of rt5650 codec capture
> -Required codec-capture subnode properties:
> -- sound-dai: audio codec dai name on capture path
> -  <&rt5650 0> : Default setting. Connect rt5650 I2S1 for capture. (dai_name = rt5645-aif1)
> -  <&rt5650 1> : Connect rt5650 I2S2 for capture. (dai_name = rt5645-aif2)
> -
> -- mediatek,mclk: the MCLK source
> -  0 : external oscillator, MCLK = 12.288M
> -  1 : internal source from mt8173, MCLK = sampling rate*256
> -
> -Example:
> -
> -	sound {
> -		compatible = "mediatek,mt8173-rt5650";
> -		mediatek,audio-codec = <&rt5650 &hdmi0>;
> -		mediatek,platform = <&afe>;
> -		mediatek,mclk = <0>;
> -		codec-capture {
> -			sound-dai = <&rt5650 1>;
> -		};
> -	};
> -
> -- 
> 2.50.1
> 

