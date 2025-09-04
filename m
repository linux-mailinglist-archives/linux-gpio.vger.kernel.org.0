Return-Path: <linux-gpio+bounces-25611-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E82B44605
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 21:00:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 199C53B6120
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 19:00:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0051F26CE2A;
	Thu,  4 Sep 2025 19:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WUGg1ODx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE8C26B2A5;
	Thu,  4 Sep 2025 19:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757012406; cv=none; b=RjJuh0QweRPUOoWKYUKvCvKmZ4mtwIPcNnJF71+JHM/dkGsCUQCghDylagZ7ZHtFj3C4HIFbyWTbnBTSiCDpjBFDpB0bA0hmfS9BLMHC6qxdlu4BWgFU5KV5qTyHzjQ48mQXNxOECqzOXIwOkIxBsOhwEXP7UnRG1I2619bet0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757012406; c=relaxed/simple;
	bh=GGNzgggiwqfI3Drgy4V1N79jaY0m+XWuKRb9blp6bKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k4MGt+qsM8Z0iM4kXHXL2XXi7KatORhZc/Cg5SwDRkG2LRSflobVPCrCvP+aQIfqi94rwtB1Hc5Z1OWC1OIFuXcFB9mZiHgookAe+F/PgcwtNjJezCqpJpvfGfWDCAT1E2rX3o3dStvNm8uvioyd52w/01j4OYFi42zTV0x5I+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WUGg1ODx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBBA8C4CEF0;
	Thu,  4 Sep 2025 19:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757012406;
	bh=GGNzgggiwqfI3Drgy4V1N79jaY0m+XWuKRb9blp6bKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WUGg1ODx0wmrOlaMSpYAGSjxmkV4hRMETLkDU1ck8RQRFxf1+zVXptsIYoL8cwYbT
	 2ujiGiRWHCKCq2UdtUvsb7h2AwXXAThnfpLTFabx/M66svYHZh+REAMLddu2nZ9AG5
	 3dUfFMbeaewDo4dMFlXKZ8zwXnUL2USbv3LCg/6mHK4XT2sESDdjd3vvnSb51ksZDm
	 MabejUxX+1CSi0GUH7SiRc04m/iS/2vda+kZPirq2fcAh8mGCbnPqChDw/AZwXdD2e
	 j4OmrZ65yAowpjdATltYeeGWI9To/gMk27uMkGullFXGM4Kc/PSjE92/rzi+Xv9M18
	 yY8n6k3/+hYxw==
Date: Thu, 4 Sep 2025 14:00:05 -0500
From: Rob Herring <robh@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	kernel@pengutronix.de, Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>
Subject: Re: [PATCH v6 1/2] dt-bindings: clock: add TI CDCE6214 binding
Message-ID: <20250904190005.GA19595-robh@kernel.org>
References: <20250903-clk-cdce6214-v6-0-b2cc0a6f282b@pengutronix.de>
 <20250903-clk-cdce6214-v6-1-b2cc0a6f282b@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903-clk-cdce6214-v6-1-b2cc0a6f282b@pengutronix.de>

On Wed, Sep 03, 2025 at 03:55:45PM +0200, Sascha Hauer wrote:
> Add device tree binding for the CDCE6214, an Ultra-Low Power Clock
> Generator With One PLL, Four Differential Outputs, Two Inputs, and
> Internal EEPROM.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  .../devicetree/bindings/clock/ti,cdce6214.yaml     | 198 +++++++++++++++++++++
>  include/dt-bindings/clock/ti,cdce6214.h            |  24 +++
>  2 files changed, 222 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/ti,cdce6214.yaml b/Documentation/devicetree/bindings/clock/ti,cdce6214.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..4d40b8101fd7e094bb1b79c071e1be2c1fefec23
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/ti,cdce6214.yaml
> @@ -0,0 +1,198 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/ti,cdce6214.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI CDCE6214 programmable clock generator with PLL
> +
> +maintainers:
> +  - Sascha Hauer <s.hauer@pengutronix.de>
> +
> +description: >
> +  Ultra-Low Power Clock Generator With One PLL, Four Differential Outputs,
> +  Two Inputs, and Internal EEPROM
> +
> +  - CDCE6214: https://www.ti.com/product/CDCE6214
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,cdce6214
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 2
> +
> +  clock-names:
> +    minItems: 1
> +    items:
> +      - enum: [ priref, secref ]
> +      - const: secref
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0

No child nodes with 'reg', so drop #address/size-cells.

> +
> +  '#clock-cells':
> +    const: 1
> +
> +patternProperties:
> +  '-pins$':
> +    type: object
> +    additionalProperties: false

blank line

> +    patternProperties:
> +      '^conf':
> +        type: object
> +        additionalProperties: false
> +        $ref: /schemas/pinctrl/pincfg-node.yaml#
> +
> +        properties:
> +          pins:
> +            items:
> +              enum: [priref, secref, out0, out1, out2, out3, out4 ]
> +          io-standard:

Needs a vendor prefix.

> +            description: |
> +              1: CMOS
> +              2: LVDS
> +              3: Low-Power HCSL
> +              4: XTAL mode
> +              5: differential
> +            enum: [1, 2, 3, 4, 5]
> +            $ref: /schemas/types.yaml#/definitions/uint32

blank line between properties

> +          xo-cload-femtofarad:

Needs a vendor prefix

Use standard unit suffixes. It's "-femtofarads".

> +            description: >

Don't need '>'.

> +              Load capacity for XO in Femtofarad
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +          xo-bias-microampere:

vendor prefix and unit suffix.

> +            description: |

Don't need '|'.

> +              Bias current setting of the XO
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +          cmosp-mode:

Vendor prefix

And so on...

> +            description: |
> +              Driving mode for CMOSN output:
> +              1: Low Polarity
> +              2: High Polrity
> +              3: Disable
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            maximum: 3
> +          cmosn-mode:
> +            description: |
> +              Driving mode for CMOSN output:
> +              1: Low Polarity
> +              2: High Polrity
> +              3: Disable
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            maximum: 3
> +
> +        allOf:
> +          - if:
> +              properties:
> +                pins:
> +                  contains:
> +                    const: priref
> +            then:
> +              properties:
> +                io-standard:
> +                  enum: [ 1, 5 ]
> +
> +          - if:
> +              properties:
> +                pins:
> +                  contains:
> +                    const: secref
> +            then:
> +              properties:
> +                io-standard:
> +                  enum: [ 1, 4, 5 ]
> +
> +          - if:
> +              properties:
> +                pins:
> +                  contains:
> +                    const: out0
> +            then:
> +              properties:
> +                io-standard:
> +                  enum: [ 1 ]
> +
> +          - if:
> +              properties:
> +                pins:
> +                  contains:
> +                    enum:
> +                      - out1
> +                      - out4
> +            then:
> +              properties:
> +                io-standard:
> +                  enum: [ 1, 2, 3 ]
> +
> +          - if:
> +              properties:
> +                pins:
> +                  contains:
> +                    enum:
> +                      - out2
> +                      - out3
> +            then:
> +              properties:
> +                io-standard:
> +                  enum: [ 2, 3 ]
> +
> +        required:
> +          - pins
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - '#clock-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/ti,cdce6214.h>
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        clock-generator@67 {
> +            compatible = "ti,cdce6214";
> +            reg = <0x67>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            #clock-cells = <1>;
> +            clocks = <&clock_ref25m>;
> +            clock-names = "priref";
> +
> +            cdce6214_pins: cdce6214-pins {
> +                conf1 {
> +                    pins = "secref";
> +                    io-standard = <CDCE6214_IOSTD_XTAL>;
> +                    xo-cload-femtofarad = <8100>;
> +                    xo-bias-microampere = <100>;
> +                };
> +
> +                conf2 {
> +                    pins = "out1";
> +                    io-standard = <CDCE6214_IOSTD_CMOS>;
> +                    cmosp-mode = <CDCE6214_CMOS_MODE_HIGH>;
> +                    cmosn-mode = <CDCE6214_CMOS_MODE_LOW>;
> +                };
> +
> +                conf3 {
> +                    pins = "out4";
> +                    io-standard = <CDCE6214_IOSTD_CMOS>;
> +                    cmosp-mode = <CDCE6214_CMOS_MODE_HIGH>;
> +                    cmosn-mode = <CDCE6214_CMOS_MODE_LOW>;
> +                };
> +            };
> +        };
> +    };
> diff --git a/include/dt-bindings/clock/ti,cdce6214.h b/include/dt-bindings/clock/ti,cdce6214.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..6d2cc5f01864e70a3fbccbfe20e67899e0d049e4
> --- /dev/null
> +++ b/include/dt-bindings/clock/ti,cdce6214.h
> @@ -0,0 +1,24 @@
> +#ifndef _DT_BINDINGS_CLK_TI_CDCE6214_H
> +#define _DT_BINDINGS_CLK_TI_CDCE6214_H
> +
> +/* Clock indices for the clocks provided by the CDCE6214 */
> +#define CDCE6214_CLK_OUT0	2
> +#define CDCE6214_CLK_OUT1	3
> +#define CDCE6214_CLK_OUT2	4
> +#define CDCE6214_CLK_OUT3	5
> +#define CDCE6214_CLK_OUT4	6
> +#define CDCE6214_CLK_PLL	7
> +#define CDCE6214_CLK_PSA	8
> +#define CDCE6214_CLK_PSB	9
> +
> +#define CDCE6214_IOSTD_CMOS	1
> +#define CDCE6214_IOSTD_LVDS	2
> +#define CDCE6214_IOSTD_LP_HCSL	3
> +#define CDCE6214_IOSTD_XTAL	4
> +#define CDCE6214_IOSTD_DIFF	5
> +
> +#define CDCE6214_CMOS_MODE_LOW		1
> +#define CDCE6214_CMOS_MODE_HIGH		2
> +#define CDCE6214_CMOS_MODE_DISABLED	3
> +
> +#endif /* _DT_BINDINGS_CLK_TI_CDCE6214_H */
> 
> -- 
> 2.47.2
> 

