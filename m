Return-Path: <linux-gpio+bounces-22942-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF75AFD7AE
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Jul 2025 21:55:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD845176007
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Jul 2025 19:55:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5807923C4FF;
	Tue,  8 Jul 2025 19:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ez6qp2MK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09893204096;
	Tue,  8 Jul 2025 19:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752004527; cv=none; b=BCkHEbDRFtYXA8kHfuswobyFW4G471Gt1zSF5NSWD9FjavATr1433wHNnkutdi7FF8/TSnZ1C+YY1VQE5cOxWvwBbCwV39i7Vuw8htcVQLi1qY8y9rdaa6Le39Qq56NQpSoTOsCwsVvZC/anGE/XpBOIzuRbsw0Mr/7UkwWWsac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752004527; c=relaxed/simple;
	bh=THklj9+DZKasC/I7ZV05zBVQQT7G6vPIipQ3X2d3as4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q2hFneQss9wk5RplpJ3vq0Saj3+85q5WMy0uqzYyKIrZiHrNJ2FZcYVu7aJg2iP9gkFrff2Ut/4MY/g4oGIPldm1SB5EU3AT9e4Q8Mn40ltlKewWo7k7Xl1I8ldwo2TboNq04OXp4aD81gn6qiQN2rhbEmjOxrm5WeCijRC+KIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ez6qp2MK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 545BFC4CEED;
	Tue,  8 Jul 2025 19:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752004526;
	bh=THklj9+DZKasC/I7ZV05zBVQQT7G6vPIipQ3X2d3as4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ez6qp2MKiHw0jYLyulx5FcTB2KGMIkMOc+KyNt7zGek54/NNNY9XcQ/Mwy5ZkbwYh
	 ab4XJErcOSeGzYy4hISXxqRGqm9gk4V58pm6WNv5N9BVhOR35WrMfmjp4/r0UeRRxu
	 mIT9z60lYc5qAcdliYfKtOg87mXryl5QTqhypXdK4WkWpoBrBTJS1EshmKwGDo8ZF0
	 obxCyvvCbIJZWhfK2rYSSLHtUyQN6lNt6K5F2GtNpFc1XICGbiPdcF7MhXvgnVRU5Y
	 UQwmjZUkf5IWwozadjr2j/syFxtGjOQEP6Fd5PXBQ6Ocr9ulQHobU3vhlRJrqBKpve
	 B702aNdAMfLKA==
Date: Tue, 8 Jul 2025 14:55:25 -0500
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
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: pinctrl: renesas: document RZ/T2H
 and RZ/N2H SoCs
Message-ID: <20250708195525.GA837365-robh@kernel.org>
References: <20250707141848.279528-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250707141848.279528-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250707141848.279528-2-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Mon, Jul 07, 2025 at 03:18:46PM +0100, Prabhakar wrote:
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
> v2->v3:
> - Dropped refference to gpio.txt instead pointed to
>   in include/dt-bindings/gpio/gpio.h.
> 
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
> index 000000000000..ead5ab7e7ebb
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
> +      flag. Use the macros defined in include/dt-bindings/gpio/gpio.h.
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

Again, please define some common suffix or prefix for the node names. 
Any name is for existing bindings *only*.

patternProperties:
  '-pins$':
     type: object
     ...

  '-state$':
     type: object
     additionalProperties:
       $ref: '#/patternProperties/-pins$'

I don't care what prefixes you use here...

(Note some regex's don't work as JSON pointers and then you would have 
to use a $defs section.)

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

This is exactly why no name pattern is a problem. Nothing in the schema 
says you even have hog nodes which are a totally different kind of node. 
It only passes because you have 0 required properties (probably an 
error because an empty node shouldn't be valid).

This node does happen to get validated only because we match on nodes 
with 'gpio-hog' property which is an unusual pattern and may likely change.

Rob

> +            gpio-hog;
> +            gpios = <RZT2H_GPIO(39, 2) 0>;
> +            output-high;
> +            line-name = "sd1_pwr_en";
> +         };
> +    };

