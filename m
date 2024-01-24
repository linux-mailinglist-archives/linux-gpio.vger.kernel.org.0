Return-Path: <linux-gpio+bounces-2510-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8646883ACF5
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jan 2024 16:15:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 403BF28B76F
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jan 2024 15:15:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A2A07C08E;
	Wed, 24 Jan 2024 15:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BSbIBw3k"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B537C084;
	Wed, 24 Jan 2024 15:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706109248; cv=none; b=k8a0RjLgtmxsSPp8dA1v/wBfHVQYsuHSMbptWXYtuuTybstNCoJ3of09BjGu7kqcyC+58KHTSGQDDsNJojE8sATHEMT3btMsNHgT1D6TxzDY8WE+RByZKIwDY+CRmgqcaDSwqu0h+O39JhwUTpPtWYOHe15yeMCbzCTSJZ7e2nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706109248; c=relaxed/simple;
	bh=lvaCYClRxgNlHDnQz/s2U/iDr+6UL1dxY0a0fQAXT9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ruty46cPGCqtzm7E1J+mfaAsJSjLUdVIDr0HF5ICcQUfrhSmcjR9JBeN/DATREaeKRK7tAQkaK7zh7Bd8wdFaui4YzlLEDswNFvohM4bbVsbkDsTGgzGEAq2WgixK12G3XGBiDh+MMrFKvrC/y1N32d0LqJyhj3RPO0d5VIGIvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BSbIBw3k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA801C433F1;
	Wed, 24 Jan 2024 15:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706109247;
	bh=lvaCYClRxgNlHDnQz/s2U/iDr+6UL1dxY0a0fQAXT9Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BSbIBw3kzo6Z8y3CldCjPlFmJVXs4DfMbWMk3BxWhtiC21cqBvVecnukro17HgBrs
	 e36bl6Zfrb4/KDy2qO2+Jx66ggkv3gYrOPH41fzQy3mI6pB1wPvoUby1N8qtQ2R8p0
	 vnVIITD7LaLjGqEB0vYBBWgYM/yWh8SlBpNemWv0R5FgMtEZVyJy02ZlkVbCz3OciX
	 nXiNbMAOchaWY3hZa2GKgHqhJ9cki/IAjjSHiZ3ikM5Z4DFDp/7Gi7X+wJQKx2r4iX
	 COSSi8LHQIxBiP6s+3ug52+TnzlabTiuj7oArgdMpgKWgRtINniqN8+5UvzZhFKvA9
	 StXpbBIN+R/9Q==
Date: Wed, 24 Jan 2024 09:14:05 -0600
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	linux-mips@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 04/17] dt-bindings: soc: mobileye: add EyeQ5 OLB
 system controller
Message-ID: <20240124151405.GA930997-robh@kernel.org>
References: <20240123-mbly-clk-v3-0-392b010b8281@bootlin.com>
 <20240123-mbly-clk-v3-4-392b010b8281@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240123-mbly-clk-v3-4-392b010b8281@bootlin.com>

On Tue, Jan 23, 2024 at 07:46:49PM +0100, Th�o Lebrun wrote:
> Add documentation to describe the "Other Logic Block" syscon.
> 
> Signed-off-by: Th�o Lebrun <theo.lebrun@bootlin.com>
> ---
>  .../bindings/soc/mobileye/mobileye,eyeq5-olb.yaml  | 77 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 78 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/mobileye/mobileye,eyeq5-olb.yaml b/Documentation/devicetree/bindings/soc/mobileye/mobileye,eyeq5-olb.yaml
> new file mode 100644
> index 000000000000..031ef6a532c1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/mobileye/mobileye,eyeq5-olb.yaml
> @@ -0,0 +1,77 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/mobileye/mobileye,eyeq5-olb.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mobileye EyeQ5 SoC system controller
> +
> +maintainers:
> +  - Gr�gory Clement <gregory.clement@bootlin.com>
> +  - Th�o Lebrun <theo.lebrun@bootlin.com>
> +  - Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
> +
> +description:
> +  OLB ("Other Logic Block") is a hardware block grouping smaller blocks. Clocks,
> +  resets, pinctrl are being handled from here.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: mobileye,eyeq5-olb
> +      - const: syscon
> +      - const: simple-mfd
> +
> +  reg:
> +    maxItems: 1
> +
> +  clock-controller:
> +    $ref: /schemas/clock/mobileye,eyeq5-clk.yaml#
> +    type: object
> +
> +  reset-controller:
> +    $ref: /schemas/reset/mobileye,eyeq5-reset.yaml#
> +    type: object
> +
> +  pinctrl-a:
> +    $ref: /schemas/pinctrl/mobileye,eyeq5-pinctrl.yaml#
> +    type: object
> +
> +  pinctrl-b:
> +    $ref: /schemas/pinctrl/mobileye,eyeq5-pinctrl.yaml#
> +    type: object
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    system-controller@e00000 {
> +      compatible = "mobileye,eyeq5-olb", "syscon", "simple-mfd";
> +      reg = <0xe00000 0x400>;
> +
> +      clock-controller {
> +        compatible = "mobileye,eyeq5-clk";
> +        #clock-cells = <1>;
> +        clocks = <&xtal>;
> +        clock-names = "ref";
> +      };
> +
> +      reset-controller {
> +        compatible = "mobileye,eyeq5-reset";
> +        #reset-cells = <2>;
> +      };
> +
> +      pinctrl-a {
> +        compatible = "mobileye,eyeq5-a-pinctrl";
> +        #pinctrl-cells = <1>;

Sure you need this? Generally only pinctrl-single uses this.

> +      };
> +
> +      pinctrl-b {
> +        compatible = "mobileye,eyeq5-b-pinctrl";
> +        #pinctrl-cells = <1>;
> +      };
> +    };

This can all be simplified to:

system-controller@e00000 {
    compatible = "mobileye,eyeq5-olb", "syscon";
    reg = <0xe00000 0x400>;
    #reset-cells = <2>;
    #clock-cells = <1>;
    clocks = <&xtal>;
    clock-names = "ref";

    pins { ... };
};

There is no need for sub nodes unless you have reusable blocks or each 
block has its own resources in DT.

Rob

