Return-Path: <linux-gpio+bounces-12879-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE329C5C0A
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 16:38:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 44C391F22B21
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 15:38:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DFA420125A;
	Tue, 12 Nov 2024 15:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pyL1R2OC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113FE201108;
	Tue, 12 Nov 2024 15:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731425888; cv=none; b=WtN+eN+NULaYk8ePLL7euYxz31kGJXsOq7LFVLE/qP95IpGLFAXVdAVB/j2YGdYOMgEwQwxb3hcFtzJV65RsRIs2K8JmP7NLk1prHVHA4CRitdwpp0Cq+P/iW1aL4phSkPRM6QHUWqRiVE6sgH8a1ClNayVMulLyZf42UmBIXaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731425888; c=relaxed/simple;
	bh=LderstpxSgPN9AQQ54sK0KMm1/rECKfSC1bhnvoipzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MRYc/SAY6amwvnnxoQTXvpo7JLUXytmhRO11L9RFL0Z4BQ4m7K2YwgBghlqz/3zoHEv/q7XnCn2++SYnFW4vJwAngiAz55CM/SxB5vnkkbMYl/hnpwazyq/dnC+3LzWojBRZAtpnXAhOVt3fwp6r4Ba+5Vm0nkLw9knKcK3+EYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pyL1R2OC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9CF6C4CECD;
	Tue, 12 Nov 2024 15:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731425887;
	bh=LderstpxSgPN9AQQ54sK0KMm1/rECKfSC1bhnvoipzk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pyL1R2OC1CdLh5fRnZtEhAqE73rSUIgeErdt0pem3+OmQ4sP3kOT/j8t+zFD7IMua
	 8LOBDP1nvwEm/jr5R8b/QlNtj+Cwi956Ji9wlBEW9dVK+EzFli7zNKSKEr2sttprt8
	 YdEH8MYvgChVfaZJ+MQX9wCxKufrklILzBDu5YA8C5vpS8R27Td4vdOWcWOI7G48vO
	 xeO3dF/oyqLtNRljmTR3vyKoYam6IepSKCQeFHCf89+FN1r+t37hQIAXs9UqAKYhWA
	 1cSx/LSHIEtFy+rK7DvFWIp31DCc57XBto3VyZYXt4vGsMsUWIGgw7Zg6y0x5D65br
	 Gcls+pD7pj40g==
Date: Tue, 12 Nov 2024 09:38:05 -0600
From: Rob Herring <robh@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] dt-bindings: pinctrl: add compatible for Allwinner
 A523/T527
Message-ID: <20241112153805.GA951271-robh@kernel.org>
References: <20241111005750.13071-1-andre.przywara@arm.com>
 <20241111005750.13071-6-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241111005750.13071-6-andre.przywara@arm.com>

On Mon, Nov 11, 2024 at 12:57:48AM +0000, Andre Przywara wrote:
> The A523 contains a pin controller similar to previous SoCs, although
> using 10 GPIO banks (PortB-PortK), all of them being IRQ capable.
> This introduces a new style of binding, where the pinmux values for each
> pin group is stored in the new "allwinner,pinmux" property in the DT
> node, instead of requiring every driver to store a mapping between the
> function names and the required pinmux.
> 
> Add the new name to the list of compatible strings, and required it to
> have 10 interrupts described. Also add the new pinmux property.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml  | 23 +++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
> index 4502405703145..6fc18e92e1e94 100644
> --- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
> @@ -56,6 +56,8 @@ properties:
>        - allwinner,sun50i-h6-r-pinctrl
>        - allwinner,sun50i-h616-pinctrl
>        - allwinner,sun50i-h616-r-pinctrl
> +      - allwinner,sun55i-a523-pinctrl
> +      - allwinner,sun55i-a523-r-pinctrl
>        - allwinner,suniv-f1c100s-pinctrl
>        - nextthing,gr8-pinctrl
>  
> @@ -64,7 +66,7 @@ properties:
>  
>    interrupts:
>      minItems: 1
> -    maxItems: 8
> +    maxItems: 10
>      description:
>        One interrupt per external interrupt bank supported on the
>        controller, sorted by bank number ascending order.
> @@ -119,13 +121,17 @@ patternProperties:
>          $ref: /schemas/types.yaml#/definitions/uint32
>          enum: [10, 20, 30, 40]
>  
> +      allwinner,pinmux:
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        description: pinmux selector for each pin

Please add some constraints and/or description about what goes in the 
array.

> +
>      required:
>        - pins
>        - function
>  
>      additionalProperties: false
>  
> -  "^vcc-p[a-ilm]-supply$":
> +  "^vcc-p[a-klm]-supply$":
>      description:
>        Power supplies for pin banks.
>  
> @@ -156,6 +162,17 @@ allOf:
>          - interrupts
>          - interrupt-controller
>  
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - allwinner,sun55i-a523-pinctrl
> +
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 10
> +
>    - if:
>        properties:
>          compatible:
> @@ -166,6 +183,7 @@ allOf:
>        properties:
>          interrupts:
>            minItems: 8
> +          maxItems: 8
>  
>    - if:
>        properties:
> @@ -244,6 +262,7 @@ allOf:
>              - allwinner,sun8i-v3s-pinctrl
>              - allwinner,sun9i-a80-r-pinctrl
>              - allwinner,sun50i-h6-r-pinctrl
> +            - allwinner,sun55i-a523-r-pinctrl
>  
>      then:
>        properties:
> -- 
> 2.46.2
> 

