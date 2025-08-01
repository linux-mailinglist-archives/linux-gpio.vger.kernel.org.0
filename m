Return-Path: <linux-gpio+bounces-23967-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E23B186B4
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Aug 2025 19:29:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1BC4B16CB0A
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Aug 2025 17:29:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E64D127AC35;
	Fri,  1 Aug 2025 17:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OEj/akWU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980D019C546;
	Fri,  1 Aug 2025 17:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754069368; cv=none; b=lNnwNSKjiYhG6GDX5Db75xhnjjsc+dVhblcgpfPz9Dz5f6Nb8aHj8S9mIQT9KPhTW4N0rVwBHvQXFPorqYuxHUhrF8FFueZ48RWgakpqV0vZT/QAa1tvByp8RO9kP7YL3qwSAvJk3QjNcJevYKMufDB3GOAbUDp2+erZ468TyIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754069368; c=relaxed/simple;
	bh=TBkkPKc1Q2DCv6oh7uffu650yB18FKQPULUE/jWL2k8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F5XrAXoaR7A0GC/NFwWQlsO1uZk8I7g7BbpzNguGUWrTUNxPud+Gq1oQj/8cvk6/yO50URZ8XaRVwX+X8cXf6ZXgJpmYAydD7jU+KCdKv14zQKc06ZZJx3H6ixg9eEDQb0DuqcspxSZumgIC2opni2YcZRyttVNkge3+O8sfzTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OEj/akWU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02601C4CEE7;
	Fri,  1 Aug 2025 17:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754069368;
	bh=TBkkPKc1Q2DCv6oh7uffu650yB18FKQPULUE/jWL2k8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OEj/akWUrDhhwwplQQrtiQSjgUCOd4YXvx/D2nKg5VGPrA60zvMZwECqgKQkGBxyQ
	 EfK84ciMm8GUlcaYqknaR7zEJ5OehHJa+qG3dAwcGLC84gLxkccZ2o8MTqXUKBIRwt
	 MJqpjlVNi/yrMtqXHkoU7rTBVvDLi+b8IcuqAL/AiblLRal+XjWGgbs6LJs3T8G+E4
	 cKNyng8LM7uXzjbgweO/ECWDKRR7On0BxvB0NsggwlyXvTMl1FcyPLYmfajUaBxDW5
	 gJGXjnkorqJoF6vHx4oTUqNsj0Hz3iJYFKzQyLfrWNamHY3wCgFPYdmNLfwInOF26A
	 VEnHcDQSjgs+Q==
Date: Fri, 1 Aug 2025 12:29:27 -0500
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
Subject: Re: [PATCH 6/9] ASoC: dt-binding: Convert MediaTek mt8183-mt6358
 bindings to YAML
Message-ID: <20250801172927.GA3114452-robh@kernel.org>
References: <20250801-mtk-dtb-warnings-v1-0-6ba4e432427b@collabora.com>
 <20250801-mtk-dtb-warnings-v1-6-6ba4e432427b@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250801-mtk-dtb-warnings-v1-6-6ba4e432427b@collabora.com>

On Fri, Aug 01, 2025 at 01:18:08PM +0200, Julien Massot wrote:
> Convert the existing text-based DT binding for MT8183 sound cards using
> MT6358 and various other codecs to a YAML schema.
> 
> Signed-off-by: Julien Massot <julien.massot@collabora.com>
> ---
>  .../sound/mt8183-mt6358-ts3a227-max98357.txt       | 25 ---------
>  .../devicetree/bindings/sound/mt8183-mt6358.yaml   | 59 ++++++++++++++++++++++

mediatek,mt8183_mt6358_ts3a227.yaml

>  2 files changed, 59 insertions(+), 25 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt b/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt
> deleted file mode 100644
> index ecd46ed8eb98b99d0f2cc9eeca5f6d0aef6a5ada..0000000000000000000000000000000000000000
> --- a/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -MT8183 with MT6358, TS3A227, MAX98357, and RT1015 CODECS
> -
> -Required properties:
> -- compatible : "mediatek,mt8183_mt6358_ts3a227_max98357" for MAX98357A codec
> -               "mediatek,mt8183_mt6358_ts3a227_max98357b" for MAX98357B codec
> -               "mediatek,mt8183_mt6358_ts3a227_rt1015" for RT1015 codec
> -               "mediatek,mt8183_mt6358_ts3a227_rt1015p" for RT1015P codec
> -- mediatek,platform: the phandle of MT8183 ASoC platform
> -
> -Optional properties:
> -- mediatek,headset-codec: the phandles of ts3a227 codecs
> -- mediatek,ec-codec: the phandle of EC codecs.
> -                     See google,cros-ec-codec.txt for more details.
> -- mediatek,hdmi-codec: the phandles of HDMI codec
> -
> -Example:
> -
> -	sound {
> -		compatible = "mediatek,mt8183_mt6358_ts3a227_max98357";
> -		mediatek,headset-codec = <&ts3a227>;
> -		mediatek,ec-codec = <&ec_codec>;
> -		mediatek,hdmi-codec = <&it6505dptx>;
> -		mediatek,platform = <&afe>;
> -	};
> -
> diff --git a/Documentation/devicetree/bindings/sound/mt8183-mt6358.yaml b/Documentation/devicetree/bindings/sound/mt8183-mt6358.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..a50dc109e8f307cfb08504a9143a178e880266c9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/mt8183-mt6358.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/mt8183-mt6358.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT8183 sound card with MT6358, TS3A227, and MAX98357/RT1015 codecs
> +
> +maintainers:
> +  - Julien Massot <julien.massot@collabora.com>
> +
> +description:
> +  Binding for MediaTek MT8183 SoC-based sound cards using the MT6358 codec,
> +  with optional TS3A227 headset codec, EC codec (via Chrome EC), and HDMI audio.
> +  Speaker amplifier can be one of MAX98357A/B, RT1015, or RT1015P.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8183_mt6358_ts3a227_max98357
> +      - mediatek,mt8183_mt6358_ts3a227_max98357b
> +      - mediatek,mt8183_mt6358_ts3a227_rt1015
> +      - mediatek,mt8183_mt6358_ts3a227_rt1015p
> +
> +  mediatek,platform:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Phandle to the MT8183 ASoC platform node (e.g., AFE).
> +
> +  mediatek,headset-codec:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Phandle to the TS3A227 headset codec.
> +
> +  mediatek,ec-codec:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |
> +      Optional phandle to a ChromeOS EC codec node.
> +      See bindings in google,cros-ec-codec.yaml.
> +
> +  mediatek,hdmi-codec:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Optional phandle to an HDMI audio codec node.
> +
> +required:
> +  - compatible
> +  - mediatek,platform
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    sound {
> +        compatible = "mediatek,mt8183_mt6358_ts3a227_max98357";
> +        mediatek,headset-codec = <&ts3a227>;
> +        mediatek,ec-codec = <&ec_codec>;
> +        mediatek,hdmi-codec = <&it6505dptx>;
> +        mediatek,platform = <&afe>;
> +    };
> +
> +...
> 
> -- 
> 2.50.1
> 

