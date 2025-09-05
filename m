Return-Path: <linux-gpio+bounces-25656-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D62B45116
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 10:16:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 490593B442C
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 08:16:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BA9B26F2BC;
	Fri,  5 Sep 2025 08:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D8bJ3+yk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FAF1C84B9;
	Fri,  5 Sep 2025 08:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757060198; cv=none; b=uvcpJFwNm1E1mBnrIRsbSWJBnSwTv1CCjN+eyWzevnGb5P5/RKLixbpKLQl1Ou795tJjVE9VVFj1fQOaFKdinWkm4XYauEcN6N37PBmMS99azG1qIfRuDC+CAOPffIoI+a8gjNZ7dmHUcVQcDG+SDs8Re5PkEkT13ZA9mTUKcXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757060198; c=relaxed/simple;
	bh=0+i54Si2cMI9nBtLp8I1HNyZ8djprDv/KS3WoyWPmOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GWAIyyKbKdOfIGa2yUrhsU2BUVarObYMnJ1xY9dIlMk6vlq2Xx1lcUgaJevLoqS1KpHLI7TIX85SsNzqxn/HT6RG9qzVE8f0GLgfrTNKCEAQLwzoS5akWtn/Dpd+UGq88+rJ2Xsijd8jhtitX+66/tNlHk+X47Qqfih7Nt6Pruc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D8bJ3+yk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDA29C4CEF1;
	Fri,  5 Sep 2025 08:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757060197;
	bh=0+i54Si2cMI9nBtLp8I1HNyZ8djprDv/KS3WoyWPmOE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D8bJ3+ykwQH5VksbMEcM5VcdAdKja9Ie/6gP3kW3ShfMCYvV54eoW/lUuryOeqoZ5
	 WzObbEp5u6lQOLzmhqRwMlvOQcINIQdnrJDQmcSFacwlirQv6BzJuq2Mms9r1iR20L
	 qaOpx7kRJksiamSajB5X73CLtcajkWyOC/Fnd7U2Yb1bFWMiDFLX+lWZcNThiWpck3
	 dncnKrdemaBMYWDMdcotIGiqEnIBapC/m/MC+4BYHe+OPvKn34IlVTXj5aPuWDXz4u
	 1P1TlUMQidi+x2eKCTNhqgGY5w9BLDKRBjEsE3kq6yQz1FaoHlQ0pxIIkUjdV438xB
	 Dzsg9mNvLZfQQ==
Date: Fri, 5 Sep 2025 10:16:34 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au, 
	linus.walleij@linaro.org, brgl@bgdev.pl, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, BMC-SW@aspeedtech.com
Subject: Re: [PATCH v2 2/4] dt-bindings: pinctrl: aspeed: Add support for
 AST27xx
Message-ID: <20250905-monumental-camouflaged-butterfly-01faed@kuoka>
References: <20250904103401.88287-1-billy_tsai@aspeedtech.com>
 <20250904103401.88287-3-billy_tsai@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250904103401.88287-3-billy_tsai@aspeedtech.com>

On Thu, Sep 04, 2025 at 06:33:59PM +0800, Billy Tsai wrote:
> Add bindings for the pin controller found in the ASPEED AST27xx SoC.
> The ASPEED AST2700 SoC contains two separate pin controllers, each
> managed by a distinct System Control Unit (SCU).
> Because these two controllers have different register maps, control
> different sets of pins, support different pin configuration options, and
> implement different multi-function switch logic, they are not compatible.
> Therefore, two separate device tree bindings,'aspeed,ast2700-soc0-pinctrl'
> and 'aspeed,ast2700-soc1-pinctrl', are introduced.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  .../pinctrl/aspeed,ast2700-soc0-pinctrl.yaml  | 115 +++++
>  .../pinctrl/aspeed,ast2700-soc1-pinctrl.yaml  | 435 ++++++++++++++++++
>  2 files changed, 550 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc1-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml
> new file mode 100644
> index 000000000000..0fee62259250
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml
> @@ -0,0 +1,115 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ASPEED AST2700 SoC0 Pin Controller
> +
> +maintainers:
> +  - Billy Tsai <billy_tsai@aspeedtech.com>
> +
> +description: |

Drop |

> +  Bindings for the ASPEED AST2700 SoC0 Pin Controller.

You should explain here hardware, not say what bindings are (we know
what bindings are) or copy title, either.

> +
> +properties:
> +  compatible:
> +    const: aspeed,ast2700-soc0-pinctrl
> +
> +additionalProperties:

You should restrict nodes with pattern to common suffix or prefix, e.g.
group, state, pins. See other pinctrl bindings for examples.


> +  $ref: pinmux-node.yaml#
> +  additionalProperties: false
> +
> +  properties:
> +    function:
> +      enum:
> +        - EMMC
> +        - VGADDC
> +        - USB3A
> +        - USB2A
> +        - USB3B
> +        - USB2B
> +        - JTAG0
> +        - PCIERC
> +
> +    groups:
> +      enum:
> +        - EMMCG1
> +        - EMMCG4
> +        - EMMCG8
> +        - EMMCWPN
> +        - EMMCCDN
> +        - VGADDC
> +        - USB3AXHD
> +        - USB3AXHPD
> +        - USB3AXH
> +        - USB3AXHP
> +        - USB3AXH2B
> +        - USB3AXHP2B
> +        - USB2AXHD1
> +        - USB2AXHPD1
> +        - USB2AD1
> +        - USB2AXH
> +        - USB2AXHP
> +        - USB2AXH2B
> +        - USB2AXHP2B
> +        - USB2AHPD0
> +        - USB2AD0
> +        - USB2AH
> +        - USB2AHP
> +        - USB3BXHD
> +        - USB3BXHPD
> +        - USB3BXH
> +        - USB3BXHP
> +        - USB3BXH2A
> +        - USB3BXHP2A
> +        - USB2BXHD1
> +        - USB2BXHPD1
> +        - USB2BD1
> +        - USB2BXH
> +        - USB2BXHP
> +        - USB2BXH2A
> +        - USB2BXHP2A
> +        - USB2BHPD0
> +        - USB2BD0
> +        - USB2BH
> +        - USB2BHP
> +        - JTAGM0
> +        - PSP
> +        - SSP
> +        - TSP
> +        - DDR
> +        - USB3A
> +        - USB3B
> +        - PCIEA
> +        - PCIEB
> +        - PCIERC0PERST
> +        - PCIERC1PERST
> +
> +    pins:
> +      $ref: /schemas/types.yaml#/definitions/string-array
> +    drive-strength:
> +      minimum: 0
> +      maximum: 15
> +
> +allOf:
> +  - $ref: pinctrl.yaml#
> +
> +required:
> +  - compatible
> +
> +examples:
> +  - |
> +    pinctrl0: pinctrl{

DTS coding style - missing space.

Unused label.

And you did not implement Rob's comment.


Best regards,
Krzysztof


