Return-Path: <linux-gpio+bounces-26186-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 79435B58608
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 22:27:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E0B08205F6E
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 20:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF054296BA2;
	Mon, 15 Sep 2025 20:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mtnh1yaB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E5B27A92A;
	Mon, 15 Sep 2025 20:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757968064; cv=none; b=NkNa9MBKSKHhgFe3wqlvBYtyOdt7tukV5f32sJIWO31GSGCDP1BdJd208t9S+YMp5vw7Ue8RcYYqUBpiALNUoAdXPLIxgC6lvHYNVDzkPFV1AEuI+8y5UyT+2IOkncKZ1kqBtAqdXRFffkQA0ybwkG4Ao/RaUPsLpzwRQXeVnhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757968064; c=relaxed/simple;
	bh=jTddj2VxHgpjo0+pwvkgqGV3AHrtWJBjMyn3LYzKe4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FQTg9kVZz4XlETat+lUItdungCFenmg75AaNo5m8ZRkmn3wja5SdJZhH7AMsf3O9+/ulqd/Tj/hu0LNwgqg7l0C2r6OOrN9B28hSQ4jHxyPJ1K/6XOG2EpKYayn0aC4zyXGiLcrbVdVLRGe/g/27NaZGQCoGSNENncgtiVQv2Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mtnh1yaB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE2A5C4CEF1;
	Mon, 15 Sep 2025 20:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757968064;
	bh=jTddj2VxHgpjo0+pwvkgqGV3AHrtWJBjMyn3LYzKe4E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mtnh1yaBelalTJawkL1m4QJ3cq/7ujv13UkSzG+whN5UzhB5qxWHQxFBdAWbexFaT
	 q+m2kmlmGE0VeiVoo1Kz8vzyQOV8GAGaXO4qOpkkMmiUaAWwQRzfo1zgnIdUPgeOmx
	 atEsw/hYYA+EPSoyATQGGd0s4HWN9PBqIiXcf+t8iAaIAZb/xIeRm/BJ28mmFg4LkO
	 vJO6L/p10PAdrCTR+91K7S/rqYSFYga4uBozSkJdSHpNpC1+Q1K8JH3l+g6cIIu1pt
	 dk0X8ryIJcWDhG3KwEPYtv6XQx0jIifKa2d3GHNwRwGGD8jlTy/7PAT28vAoqykOO7
	 7haq61p/2+3bg==
Date: Mon, 15 Sep 2025 15:27:42 -0500
From: Rob Herring <robh@kernel.org>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shawn Guo <shawnguo@kernel.org>, Michael Walle <mwalle@kernel.org>,
	Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v2 2/9] dt-bindings: fsl,fpga-qixis-i2c: extend support
 to also cover the LX2160ARDB FPGA
Message-ID: <20250915202742.GA3329659-robh@kernel.org>
References: <20250915122354.217720-1-ioana.ciornei@nxp.com>
 <20250915122354.217720-3-ioana.ciornei@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915122354.217720-3-ioana.ciornei@nxp.com>

On Mon, Sep 15, 2025 at 03:23:47PM +0300, Ioana Ciornei wrote:
> Extend the list of supported compatible strings with fsl,lx2160ardb-fpga.
> 
> Since the register map exposed by the LX2160ARDB's FPGA also contains
> two GPIO controllers, accept the necessary GPIO pattern property.
> At the same time, add the #address-cells and #size-cells properties as
> valid ones so that the child nodes of the fsl,lx2160ardb-fpga node are
> addressable.
> 
> This is needed because when defining child devices such as the GPIO
> controller described in the added example, the child device needs a the
> reg property to properly identify its register location.
> Impose this restriction for the new compatible through an if-statement.
> 
> Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> ---
> Changes in v2:
> - Enforce a unit address on the child gpios nodes (remove the ?)
> - Enforce the use of unit addresses by having #address-size and
>   #size-cells only for the newly added fsl,lx2160ardb-fpga compatible
> 
>  .../bindings/board/fsl,fpga-qixis-i2c.yaml    | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/board/fsl,fpga-qixis-i2c.yaml b/Documentation/devicetree/bindings/board/fsl,fpga-qixis-i2c.yaml
> index 28b37772fb65..da21d0defa04 100644
> --- a/Documentation/devicetree/bindings/board/fsl,fpga-qixis-i2c.yaml
> +++ b/Documentation/devicetree/bindings/board/fsl,fpga-qixis-i2c.yaml
> @@ -22,6 +22,13 @@ properties:
>                - fsl,lx2160aqds-fpga
>            - const: fsl,fpga-qixis-i2c
>            - const: simple-mfd
> +      - const: fsl,lx2160ardb-fpga
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
>  
>    interrupts:
>      maxItems: 1
> @@ -32,10 +39,26 @@ properties:
>    mux-controller:
>      $ref: /schemas/mux/reg-mux.yaml
>  
> +patternProperties:
> +  "^gpio@[0-9a-f]+$":
> +    $ref: /schemas/gpio/trivial-gpio.yaml

This results in this schema being applied twice and more 
importantly allows any compatible listed in it to be allowed here. So I 
would drop the $ref and do this instead:

       additionalProperties: true

       properties:
         compatible:
           contains:
             enum:
               - fsl,lx2160ardb-fpga-gpio-sfp
               ...


> +
>  required:
>    - compatible
>    - reg
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,lx2160ardb-fpga
> +    then:
> +      required:
> +        - "#address-cells"
> +        - "#size-cells"
> +
>  additionalProperties: false
>  
>  examples:
> @@ -68,3 +91,27 @@ examples:
>          };
>      };
>  
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        board-control@66 {
> +            compatible = "fsl,lx2160ardb-fpga";
> +            reg = <0x66>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            gpio@19 {
> +                compatible = "fsl,lx2160ardb-fpga-gpio-sfp";
> +                reg = <0x19>;
> +                gpio-controller;
> +                #gpio-cells = <2>;
> +                gpio-line-names =
> +                    "SFP2_TX_EN", "",
> +                    "", "",
> +                    "SFP2_RX_LOS", "SFP2_TX_FAULT",
> +                    "", "SFP2_MOD_ABS";
> +            };
> +        };
> +    };
> -- 
> 2.25.1
> 

