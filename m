Return-Path: <linux-gpio+bounces-22372-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D06AEC1B2
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jun 2025 23:05:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 363401C40B63
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jun 2025 21:05:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9EA22EE267;
	Fri, 27 Jun 2025 21:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GN7bEPmq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96856296150;
	Fri, 27 Jun 2025 21:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751058327; cv=none; b=pG3DCAyfsnQrD0oPrm4MWbU8yTWcnAOSbDGNMRF8C+zdZSTshTDX3La36f9kWmbr/d2LdMM8bkeV5ktr2FSuChOLXNFxWPr56tGPvd8qi/yYIVpI816+xTaztDJU6WokrO7AakJ5ke7U0isqvmE2DpnGSYjbUJvMJjxtQ2xtSpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751058327; c=relaxed/simple;
	bh=cR0tx2/QUoO//X9xT2pUdVDrDosFwq7E9WIYzcFoeO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M68QwNhBuzjmvFEwykcy17oRdVYtkCZqlpYz4xiN2XbQVIfJuxjaGqyx4gwfVKw2Og3hMPC+NCg6SU1wTiZpbXmn74IUcZM+7qnLQyArY8fa8rufo7ljECdkM0E90GtLZw1jhXezRc4DgoLU2DbCXJu0oUxEb1Z2wHzksh6TPME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GN7bEPmq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03572C4CEE3;
	Fri, 27 Jun 2025 21:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751058327;
	bh=cR0tx2/QUoO//X9xT2pUdVDrDosFwq7E9WIYzcFoeO0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GN7bEPmq2XwGpEuzcne3OJuXopYSjBGVdHmM+XzBL3JnYn2E0Wd57MgwrXSjQJYbP
	 Dwhqr7H5e5J5TGdn8FhN5rj+zrizwNlTLwYalngQr3GpFOu2u6rzvWSs02PD4IeTQ1
	 kPlgg+DdxNpdBBtkhS+AxKqaWJUdSBGBXM2QR9d45nhjuu1ggbqBig5n0DxdDAMD+S
	 0yIIPeMG8Dwe2LyGHkF2YIe/tv6bIgj4rIdeSfAk5ZYqrgUtkEDqv3CQ+DinLmdCwa
	 /JK098ygdxr8fjcxi32cUOYaV3kjIWjVbAhht52pELbUojkY2vKBOC8g7ZAxJ83T/1
	 UEwQnmrzagXFg==
Date: Fri, 27 Jun 2025 16:05:26 -0500
From: Rob Herring <robh@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: renesas: document RZ/T2H
 and RZ/N2H SoCs
Message-ID: <20250627210526.GA128966-robh@kernel.org>
References: <20250625130712.140778-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250625130712.140778-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625130712.140778-2-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Wed, Jun 25, 2025 at 02:07:10PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Document the pin and GPIO controller IP for the Renesas RZ/T2H
> (R9A09G077) and RZ/N2H (R9A09G087) SoCs, and add the shared DTSI
> header file used by both the bindings and the driver.
> 
> The RZ/T2H SoC supports 729 pins, while the RZ/N2H supports 576 pins.
> Both share the same controller architecture; separate compatible
> strings are added for each SoC to distinguish them.
> 
> Co-developed-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - Added a new DT binding file
> ---
>  .../pinctrl/renesas,rzt2h-pinctrl.yaml        | 132 ++++++++++++++++++
>  .../pinctrl/renesas,r9a09g077-pinctrl.h       |  22 +++
>  2 files changed, 154 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rzt2h-pinctrl.yaml
>  create mode 100644 include/dt-bindings/pinctrl/renesas,r9a09g077-pinctrl.h
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rzt2h-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,rzt2h-pinctrl.yaml
> new file mode 100644
> index 000000000000..d3886eab93fe
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzt2h-pinctrl.yaml
> @@ -0,0 +1,132 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/renesas,rzt2h-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/T2H Pin and GPIO controller
> +
> +maintainers:
> +  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> +
> +description:
> +  The Renesas RZ/T2H SoC features a combined Pin and GPIO controller.
> +  Pin multiplexing and GPIO configuration is performed on a per-pin basis.
> +  Each port features up to 8 pins, each of them configurable for GPIO function
> +  (port mode) or in alternate function mode.
> +  Up to 8 different alternate function modes exist for each single pin.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - renesas,r9a09g077-pinctrl # RZ/T2H
> +      - renesas,r9a09g087-pinctrl # RZ/N2H
> +
> +  reg:
> +    minItems: 1
> +    items:
> +      - description: Non-safety I/O Port base
> +      - description: Safety I/O Port safety region base
> +      - description: Safety I/O Port Non-safety region base
> +
> +  reg-names:
> +    minItems: 1
> +    items:
> +      - const: nsr
> +      - const: srs
> +      - const: srn
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 2
> +    description:
> +      The first cell contains the global GPIO port index, constructed using the
> +      RZT2H_GPIO() helper macro from <dt-bindings/pinctrl/renesas,r9a09g077-pinctrl.h>
> +      (e.g. "RZT2H_GPIO(3, 0)" for P03_0). The second cell represents the consumer
> +      flag, as mentioned in ../gpio/gpio.txt.

Don't reference legacy docs.

> +
> +  gpio-ranges:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +additionalProperties:

This style was for existing bindings which had no node name pattern. 
Define a pattern for node names.

> +  anyOf:
> +    - type: object
> +      additionalProperties: false
> +      allOf:
> +        - $ref: pincfg-node.yaml#
> +        - $ref: pinmux-node.yaml#
> +
> +      description:
> +        Pin controller client devices use pin configuration subnodes (children
> +        and grandchildren) for desired pin configuration.
> +        Client device subnodes use the below standard properties.
> +
> +      properties:
> +        pinmux:
> +          description:
> +            Values are constructed from GPIO port number, pin number, and
> +            alternate function configuration number using the RZT2H_PORT_PINMUX()
> +            helper macro from <dt-bindings/pinctrl/renesas,r9a09g077-pinctrl.h>.
> +        pins: true
> +        gpio-hog: true
> +        gpios: true
> +        input: true
> +        input-enable: true
> +        output-enable: true
> +        output-high: true
> +        output-low: true
> +        line-name: true
> +
> +    - type: object
> +      additionalProperties:
> +        $ref: "#/additionalProperties/anyOf/0"

Do you really need both 1 OR 2 levels of nodes? Can't you decide on one 
way?

> +
> +allOf:
> +  - $ref: pinctrl.yaml#
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - gpio-controller
> +  - '#gpio-cells'
> +  - gpio-ranges
> +  - clocks
> +  - power-domains
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h>
> +    #include <dt-bindings/pinctrl/renesas,r9a09g077-pinctrl.h>
> +
> +    pinctrl@802c0000 {
> +        compatible = "renesas,r9a09g077-pinctrl";
> +        reg = <0x802c0000 0x2000>,
> +              <0x812c0000 0x2000>,
> +              <0x802b0000 0x2000>;
> +        reg-names = "nsr", "srs", "srn";
> +        clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKM>;
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        gpio-ranges = <&pinctrl 0 0 288>;
> +        power-domains = <&cpg>;
> +
> +        sci_pins: serial0 {
> +            pinmux = <RZT2H_PORT_PINMUX(38, 0, 1)>, /* Tx */
> +                     <RZT2H_PORT_PINMUX(38, 1, 1)>; /* Rx */
> +        };
> +
> +        sd1-pwr-en-hog {
> +            gpio-hog;
> +            gpios = <RZT2H_GPIO(39, 2) 0>;
> +            output-high;
> +            line-name = "sd1_pwr_en";
> +         };
> +    };
> diff --git a/include/dt-bindings/pinctrl/renesas,r9a09g077-pinctrl.h b/include/dt-bindings/pinctrl/renesas,r9a09g077-pinctrl.h
> new file mode 100644
> index 000000000000..c73a7f25ef5c
> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/renesas,r9a09g077-pinctrl.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * This header provides constants for Renesas RZ/T2H family pinctrl bindings.
> + *
> + * Copyright (C) 2025 Renesas Electronics Corp.
> + */
> +
> +#ifndef __DT_BINDINGS_PINCTRL_RENESAS_R9A09G077_PINCTRL_H__
> +#define __DT_BINDINGS_PINCTRL_RENESAS_R9A09G077_PINCTRL_H__
> +
> +#define RZT2H_PINS_PER_PORT	8
> +
> +/*
> + * Create the pin index from its bank and position numbers and store in
> + * the upper 16 bits the alternate function identifier
> + */
> +#define RZT2H_PORT_PINMUX(b, p, f)	((b) * RZT2H_PINS_PER_PORT + (p) | ((f) << 16))
> +
> +/* Convert a port and pin label to its global pin index */
> +#define RZT2H_GPIO(port, pin)	((port) * RZT2H_PINS_PER_PORT + (pin))
> +
> +#endif /* __DT_BINDINGS_PINCTRL_RENESAS_R9A09G057_PINCTRL_H__ */
> -- 
> 2.49.0
> 

