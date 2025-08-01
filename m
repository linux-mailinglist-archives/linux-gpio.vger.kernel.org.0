Return-Path: <linux-gpio+bounces-23964-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A05B18683
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Aug 2025 19:21:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 849675863EC
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Aug 2025 17:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C153424EA80;
	Fri,  1 Aug 2025 17:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V1a0kIiU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748FB1D5CC6;
	Fri,  1 Aug 2025 17:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754068899; cv=none; b=frBFRICC1G89mtDqKTTEb08R8cKuW6ukmTT0pJ4Z6qO0zAeEjU6ybPn5ZvAUNdRKt2EIpNQkVs/cv+ZzZ5W7+OjGAJ/j3pmxbrXR7IEaVqP3azIAuxUE0h+aUZSmxVHijYyAohTCI0rB5wBQ2i4pWCIZco5VVa9rI7/ndvZaZXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754068899; c=relaxed/simple;
	bh=fNJ9IqGIVZcofYnTe+OXzIj73v49xFAqmgYIqn1aoB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UqLkkDeN9YjGreJjeLy5P8KCN825iM3Ojmefc02JYb6yG/yt1qQSP2kWUjHaSzMPNTM5RJ+pNjAk7fDIVElxTofZ6HVh5P/wmyzVJpKZSpCawtFdV9JzzsmgGfqsGntn3HocTqvIsMB++yABaFkQrbqHY/QyO4pnSEH1qgOuWYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V1a0kIiU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C06DCC4CEE7;
	Fri,  1 Aug 2025 17:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754068896;
	bh=fNJ9IqGIVZcofYnTe+OXzIj73v49xFAqmgYIqn1aoB0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V1a0kIiUIUoi+VYvflOJmovtMyhtpl3Ck/DkRhUHGvEeL5j6IOmwUl0ZrQwdHSkgy
	 HNSdfuE9pYsWf6FW4QuLQyxdMF7j/QLmPdhVbbtfYLHErhI4NWmnpxGvfGHhHu5Wyh
	 7Ml+su6GI0icxhm3Quv9kdrc+VDfQdmybHY5LxTOeattzicKnGqhoH4ZY9w/xbxMzo
	 NDjsstw3o366u3bpGp7jThuPLJGZesKF5Q2IUje5WIWkIzE27sFUZiZuA+1uUN9Prj
	 RWKebSRNAPJ5wIdTqvbaq6Hl02YLKzJM1oJSl5otVG17tIKJAAWbj12tDj2VJ70Tnk
	 bpLw151sbcPiA==
Date: Fri, 1 Aug 2025 12:21:36 -0500
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
Subject: Re: [PATCH 2/9] dt-bindings: arm: mediatek: Support mt8183-audiosys
 binding variant
Message-ID: <20250801172136.GA3104927-robh@kernel.org>
References: <20250801-mtk-dtb-warnings-v1-0-6ba4e432427b@collabora.com>
 <20250801-mtk-dtb-warnings-v1-2-6ba4e432427b@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250801-mtk-dtb-warnings-v1-2-6ba4e432427b@collabora.com>

On Fri, Aug 01, 2025 at 01:18:04PM +0200, Julien Massot wrote:
> Update the mediatek,audsys binding to support the mt8183-audiosys
> compatible, which uses a different audio controller binding
> (mt8183-afe-pcm.yaml) compared to the legacy mt2701-audio controller.

Looks like this one needs 'memory-region' added?

> 
> Signed-off-by: Julien Massot <julien.massot@collabora.com>
> ---
>  .../bindings/arm/mediatek/mediatek,audsys.yaml          | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml
> index 45d4a6620041b11cf6e943de49a42f3fcd91e1b9..5d9d91f9c5802240ac7d411c5632ae6663d15f29 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml
> @@ -23,6 +23,7 @@ properties:
>                - mediatek,mt7622-audsys
>                - mediatek,mt8167-audsys
>                - mediatek,mt8173-audsys
> +              - mediatek,mt8183-audiosys
>                - mediatek,mt8183-audsys
>                - mediatek,mt8186-audsys
>                - mediatek,mt8192-audsys
> @@ -41,7 +42,6 @@ properties:
>      const: 1
>  
>    audio-controller:
> -    $ref: /schemas/sound/mediatek,mt2701-audio.yaml#
>      type: object
>  
>  required:
> @@ -50,6 +50,21 @@ required:
>  
>  additionalProperties: false
>  
> +allOf:
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
>  examples:
>    - |
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
> 
> -- 
> 2.50.1
> 

