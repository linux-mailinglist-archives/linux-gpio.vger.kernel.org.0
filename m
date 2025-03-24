Return-Path: <linux-gpio+bounces-17899-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 545C8A6D5BD
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 09:03:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C56D816A09B
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 08:03:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2074725C6FB;
	Mon, 24 Mar 2025 08:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qAgI3rwZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BC818B470;
	Mon, 24 Mar 2025 08:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742803390; cv=none; b=ZPFW72mIPXprBbSGQN/PzNR77Nq8aBWYoCE2eXX+8bKU4I092aT49tsu2upoke3yKfZTuhnB6DJ05GXIUqreQ1sGfO11gAAdccocJ05EiUNgt3YYM9wzYW/2of89iOICEgtMge4Mn9tXmGgBXMnJHv49Xy+gA9/Z/u+niZ3PmL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742803390; c=relaxed/simple;
	bh=V6gXN+lnnN9Zem1lt+OB0BhDkOVQosdaVMCSxBi43NE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ddsf0qkR8OPHwbmnYC+lvWRl77hwaXtzf2+Uz+rF6G27mv5grLiAckEWiPtOyNeUQYuwYDBDpsb4lkO17ooCK3zz1eYmkDDxGG7UAzqyh9Rd4DyLlTwK+91+VThdyVjNdBvpeHJT2Vs38xXGYo4P9LXu0nR2gFqVFmiPc/cB9j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qAgI3rwZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 373B9C4CEDD;
	Mon, 24 Mar 2025 08:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742803390;
	bh=V6gXN+lnnN9Zem1lt+OB0BhDkOVQosdaVMCSxBi43NE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qAgI3rwZ9umV8rO/biDGWse0Ey26PHU4tmpjYoo6Hj/VdUEZb7Vsq64Wcia91FUb7
	 NqQZpqxs6gBD0GGj6pkrbPqCrnpoHmXkmAIHOtCSdZUd28j1NHWvBSkAJbC0RsNbiR
	 wGLENGNrVmSjOUzOujZL/8qZcD6E4ROlnkcGrtMwsFGv1pJuNH2bvqMeqQEXYOyBGD
	 v+YQq6YdddTwg7hRMP3uolKmuVDC/QQi48K3Sg6O4qYfiTRU+xwgHVds8PDpoOeAxw
	 jDFro4Lp8eJNrITUkeAVr/vavtsclDRp51rL7a4um1oW8ljovwgpV5sYOZDZ2reuyQ
	 GFCVQow/PD3ZA==
Date: Mon, 24 Mar 2025 09:03:06 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Cathy Xu <ot_cathy.xu@mediatek.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>, Lei Xue <lei.xue@mediatek.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, yong.mao@mediatek.com, 
	Axe.Yang@mediatek.com, Jimin.Wang@mediatek.com, Wenbin.Mei@mediatek.com, 
	Guodong Liu <guodong.liu@mediatek.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: pinctrl: mediatek: Add support for
 mt8196
Message-ID: <20250324-sly-smart-impala-9fb09e@krzk-bin>
References: <20250321084142.18563-1-ot_cathy.xu@mediatek.com>
 <20250321084142.18563-2-ot_cathy.xu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250321084142.18563-2-ot_cathy.xu@mediatek.com>

On Fri, Mar 21, 2025 at 04:39:12PM +0800, Cathy Xu wrote:
> +  reg:
> +    items:
> +      - description: gpio registers base address
> +      - description: rt group io configuration registers base address

s/io configuration registers base address/IO/
?

Why repeating so much of redundant information?

> +      - description: rm1 group io configuration registers base address
> +      - description: rm2 group io configuration registers base address
> +      - description: rb group io configuration registers base address
> +      - description: bm1 group io configuration registers base address
> +      - description: bm2 group io configuration registers base address
> +      - description: bm3 group io configuration registers base address
> +      - description: lt group io configuration registers base address
> +      - description: lm1 group io configuration registers base address
> +      - description: lm2 group io configuration registers base address
> +      - description: lb1 group io configuration registers base address
> +      - description: lb2 group io configuration registers base address
> +      - description: tm1 group io configuration registers base address
> +      - description: tm2 group io configuration registers base address
> +      - description: tm3 group io configuration registers base address
> +
> +  reg-names:
> +    items:
> +      - const: iocfg0
> +      - const: iocfg_rt
> +      - const: iocfg_rm1
> +      - const: iocfg_rm2
> +      - const: iocfg_rb
> +      - const: iocfg_bm1
> +      - const: iocfg_bm2
> +      - const: iocfg_bm3
> +      - const: iocfg_lt
> +      - const: iocfg_lm1
> +      - const: iocfg_lm2
> +      - const: iocfg_lb1
> +      - const: iocfg_lb2
> +      - const: iocfg_tm1
> +      - const: iocfg_tm2
> +      - const: iocfg_tm3

Same here, drop iocfg_ prefix everywhere. The first entry becames then
"base" or whatever else meaningful ("0" is not meaningful).


> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 2
> +
> +  interrupts:
> +    description: The interrupt outputs to sysirq.
> +    maxItems: 1
> +
> +# PIN CONFIGURATION NODES
> +patternProperties:
> +  '-pins$':
> +    type: object
> +    additionalProperties: false
> +
> +    patternProperties:
> +      '^pins':
> +        type: object
> +        $ref: /schemas/pinctrl/pincfg-node.yaml
> +        additionalProperties: false
> +        description:
> +          A pinctrl node should contain at least one subnode representing the
> +          pinctrl groups available on the machine. Each subnode will list the
> +          pins it needs, and how they should be configured, with regard to muxer
> +          configuration, pullups, drive strength, input enable/disable and input
> +          schmitt.
> +
> +        properties:
> +          pinmux:
> +            description:
> +              Integer array, represents gpio pin number and mux setting.
> +              Supported pin number and mux varies for different SoCs, and are
> +              defined as macros in arch/arm64/boot/dts/mediatek/mt8196-pinfunc.h
> +              directly, for this SoC.
> +
> +          drive-strength:
> +            enum: [2, 4, 6, 8, 10, 12, 14, 16]
> +
> +          bias-pull-down:
> +            oneOf:
> +              - type: boolean
> +              - enum: [100, 101, 102, 103]
> +                description: mt8196 pull down PUPD/R0/R1 type define value.
> +              - enum: [75000, 5000]
> +                description: mt8196 pull down RSEL type si unit value(ohm).
> +            description: |
> +              For pull down type is normal, it doesn't need add R1R0 define
> +              and resistance value.
> +              For pull down type is PUPD/R0/R1 type, it can add R1R0 define to
> +              set different resistance. It can support "MTK_PUPD_SET_R1R0_00" &
> +              "MTK_PUPD_SET_R1R0_01" & "MTK_PUPD_SET_R1R0_10" &
> +              "MTK_PUPD_SET_R1R0_11" define in mt8196.
> +              For pull down type is PD/RSEL, it can add resistance value(ohm)
> +              to set different resistance by identifying property
> +              "mediatek,rsel-resistance-in-si-unit". It can support resistance
> +              value(ohm) "75000" & "5000" in mt8196.
> +
> +          bias-pull-up:
> +            oneOf:
> +              - type: boolean
> +              - enum: [100, 101, 102, 103]
> +                description: mt8196 pull up PUPD/R0/R1 type define value.
> +              - enum: [1000, 1500, 2000, 3000, 4000, 5000, 75000]
> +                description: mt8196 pull up RSEL type si unit value(ohm).
> +            description: |
> +              For pull up type is normal, it don't need add R1R0 define
> +              and resistance value.
> +              For pull up type is PUPD/R0/R1 type, it can add R1R0 define to
> +              set different resistance. It can support "MTK_PUPD_SET_R1R0_00" &
> +              "MTK_PUPD_SET_R1R0_01" & "MTK_PUPD_SET_R1R0_10" &
> +              "MTK_PUPD_SET_R1R0_11" define in mt8196.
> +              For pull up type is PU/RSEL, it can add resistance value(ohm)
> +              to set different resistance by identifying property
> +              "mediatek,rsel-resistance-in-si-unit". It can support resistance
> +              value(ohm) "1000" & "1500" & "2000" & "3000" & "4000" & "5000" &
> +              "75000" in mt8196.
> +
> +          bias-disable: true
> +
> +          output-high: true
> +
> +          output-low: true
> +
> +          input-enable: true
> +
> +          input-disable: true
> +
> +          input-schmitt-enable: true
> +
> +          input-schmitt-disable: true
> +
> +        required:
> +          - pinmux
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-controller
> +  - '#interrupt-cells'
> +  - gpio-controller
> +  - '#gpio-cells'
> +  - gpio-ranges

Same order as in properties list. The order here looks correct, so the
properties needs to be fixed.


Best regards,
Krzysztof


