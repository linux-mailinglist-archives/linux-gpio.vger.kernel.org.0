Return-Path: <linux-gpio+bounces-17918-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 939CAA6DABA
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 14:03:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD42C7A4870
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Mar 2025 13:02:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10449BA53;
	Mon, 24 Mar 2025 13:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YNF2XMoS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5AE25EFB4;
	Mon, 24 Mar 2025 13:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742821411; cv=none; b=geQH9666i2Ewgfowql8SsGXTp03KG9y1ikZuIIwNhvG8LOVX6Xy4RaCqL9+r7Fen46gEzoMtSDc50buJKvqGPiAcWZXVwKyJzOJqNdYHy3rwXujOghuknbye7qX4Q21WrMYAhFDO5GuQAGjUoYj1E/lBfayTi7eRAJYGMSlC2PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742821411; c=relaxed/simple;
	bh=eos6W+9ir6pEgCNp1c8QmUJfmmzea1hANIHnNv6ejH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=urd1oxDFOSj9diY8NYGmtU4PI5fK1uXZEY3Ejh8TcXA1mGFMg/QFwhppuC98buv5Yd5v/y5zqCoXojRps1qGAPq0Pnjmg6GSbtBBkJTuwpVo5JQ8o4RUVGuyB5AtcgpriYZYWjkU7vY7MAiBIkfk6KiUKyQ6klwAoFDKiexO+Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YNF2XMoS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D9E2D2C6;
	Mon, 24 Mar 2025 14:01:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742821301;
	bh=eos6W+9ir6pEgCNp1c8QmUJfmmzea1hANIHnNv6ejH8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YNF2XMoSxwT4Yx+jjaag38dPG2tWYfX/QmAsCY/Y+XSrA35i/zrDkOHoSF1GWER5c
	 E47luNt80TOHi67jvn/8+ApN3l7DgVXDAdgYFfO6XgpPaS1y8J2S3i0QMb8fgcex7b
	 MBqVXo3jIsy4n4PIayQXPe4WctkgqCQ1J/mXRzNs=
Date: Mon, 24 Mar 2025 15:03:05 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Manikandan Muralidharan <manikandan.m@microchip.com>,
	Maxime Ripard <mripard@kernel.org>,
	Sander Vanheule <sander@svanheule.net>,
	Bert Vermeulen <bert@biot.com>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: gpio: Correct indentation and style in DTS
 example
Message-ID: <20250324130305.GD5113@pendragon.ideasonboard.com>
References: <20250324125326.82270-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250324125326.82270-1-krzysztof.kozlowski@linaro.org>

Hi Krzysztof,

Thank you for the patch.

On Mon, Mar 24, 2025 at 01:53:26PM +0100, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.  While re-indenting, drop
> unused labels.
> 
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  .../bindings/gpio/atmel,at91rm9200-gpio.yaml  | 16 ++---
>  .../bindings/gpio/fairchild,74hc595.yaml      | 20 +++---
>  .../devicetree/bindings/gpio/gpio-mxs.yaml    | 70 +++++++++----------
>  .../devicetree/bindings/gpio/nxp,pcf8575.yaml | 24 +++----
>  .../bindings/gpio/realtek,otto-gpio.yaml      |  8 +--
>  .../bindings/gpio/renesas,em-gio.yaml         | 20 +++---
>  .../bindings/gpio/renesas,rcar-gpio.yaml      | 24 +++----
>  .../devicetree/bindings/gpio/sifive,gpio.yaml |  6 +-
>  .../bindings/gpio/toshiba,gpio-visconti.yaml  | 24 +++----
>  .../bindings/gpio/xlnx,gpio-xilinx.yaml       | 48 ++++++-------
>  10 files changed, 130 insertions(+), 130 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/atmel,at91rm9200-gpio.yaml b/Documentation/devicetree/bindings/gpio/atmel,at91rm9200-gpio.yaml
> index 3dd70933ed8e..d810043b56b6 100644
> --- a/Documentation/devicetree/bindings/gpio/atmel,at91rm9200-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/atmel,at91rm9200-gpio.yaml
> @@ -69,13 +69,13 @@ examples:
>      #include <dt-bindings/interrupt-controller/irq.h>
>  
>      gpio@fffff400 {
> -            compatible = "atmel,at91rm9200-gpio";
> -            reg = <0xfffff400 0x200>;
> -            interrupts = <2 IRQ_TYPE_LEVEL_HIGH 1>;
> -            #gpio-cells = <2>;
> -            gpio-controller;
> -            interrupt-controller;
> -            #interrupt-cells = <2>;
> -            clocks = <&pmc PMC_TYPE_PERIPHERAL 2>;
> +        compatible = "atmel,at91rm9200-gpio";
> +        reg = <0xfffff400 0x200>;
> +        interrupts = <2 IRQ_TYPE_LEVEL_HIGH 1>;
> +        #gpio-cells = <2>;
> +        gpio-controller;
> +        interrupt-controller;
> +        #interrupt-cells = <2>;
> +        clocks = <&pmc PMC_TYPE_PERIPHERAL 2>;
>      };
>  ...
> diff --git a/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml b/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
> index 0e5c22929bde..ab35bcf98101 100644
> --- a/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
> +++ b/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
> @@ -71,15 +71,15 @@ unevaluatedProperties: false
>  examples:
>    - |
>      spi {
> -            #address-cells = <1>;
> -            #size-cells = <0>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
>  
> -            gpio5: gpio5@0 {
> -                    compatible = "fairchild,74hc595";
> -                    reg = <0>;
> -                    gpio-controller;
> -                    #gpio-cells = <2>;
> -                    registers-number = <4>;
> -                    spi-max-frequency = <100000>;
> -            };
> +        gpio5@0 {
> +            compatible = "fairchild,74hc595";
> +            reg = <0>;
> +            gpio-controller;
> +            #gpio-cells = <2>;
> +            registers-number = <4>;
> +            spi-max-frequency = <100000>;
> +        };
>      };
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-mxs.yaml b/Documentation/devicetree/bindings/gpio/gpio-mxs.yaml
> index 8ff54369d16c..b58e08c8ecd8 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-mxs.yaml
> +++ b/Documentation/devicetree/bindings/gpio/gpio-mxs.yaml
> @@ -84,52 +84,52 @@ examples:
>          reg = <0x80018000 0x2000>;
>  
>          gpio@0 {
> -                compatible = "fsl,imx28-gpio";
> -                reg = <0>;
> -                interrupts = <127>;
> -                gpio-controller;
> -                #gpio-cells = <2>;
> -                interrupt-controller;
> -                #interrupt-cells = <2>;
> +            compatible = "fsl,imx28-gpio";
> +            reg = <0>;
> +            interrupts = <127>;
> +            gpio-controller;
> +            #gpio-cells = <2>;
> +            interrupt-controller;
> +            #interrupt-cells = <2>;
>          };
>  
>          gpio@1 {
> -                compatible = "fsl,imx28-gpio";
> -                reg = <1>;
> -                interrupts = <126>;
> -                gpio-controller;
> -                #gpio-cells = <2>;
> -                interrupt-controller;
> -                #interrupt-cells = <2>;
> +            compatible = "fsl,imx28-gpio";
> +            reg = <1>;
> +            interrupts = <126>;
> +            gpio-controller;
> +            #gpio-cells = <2>;
> +            interrupt-controller;
> +            #interrupt-cells = <2>;
>          };
>  
>          gpio@2 {
> -                compatible = "fsl,imx28-gpio";
> -                reg = <2>;
> -                interrupts = <125>;
> -                gpio-controller;
> -                #gpio-cells = <2>;
> -                interrupt-controller;
> -                #interrupt-cells = <2>;
> +            compatible = "fsl,imx28-gpio";
> +            reg = <2>;
> +            interrupts = <125>;
> +            gpio-controller;
> +            #gpio-cells = <2>;
> +            interrupt-controller;
> +            #interrupt-cells = <2>;
>          };
>  
>          gpio@3 {
> -                compatible = "fsl,imx28-gpio";
> -                reg = <3>;
> -                interrupts = <124>;
> -                gpio-controller;
> -                #gpio-cells = <2>;
> -                interrupt-controller;
> -                #interrupt-cells = <2>;
> +            compatible = "fsl,imx28-gpio";
> +            reg = <3>;
> +            interrupts = <124>;
> +            gpio-controller;
> +            #gpio-cells = <2>;
> +            interrupt-controller;
> +            #interrupt-cells = <2>;
>          };
>  
>          gpio@4 {
> -                compatible = "fsl,imx28-gpio";
> -                reg = <4>;
> -                interrupts = <123>;
> -                gpio-controller;
> -                #gpio-cells = <2>;
> -                interrupt-controller;
> -                #interrupt-cells = <2>;
> +            compatible = "fsl,imx28-gpio";
> +            reg = <4>;
> +            interrupts = <123>;
> +            gpio-controller;
> +            #gpio-cells = <2>;
> +            interrupt-controller;
> +            #interrupt-cells = <2>;
>          };
>      };
> diff --git a/Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml b/Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml
> index 8bca574bb66d..5a6ecaa7b44b 100644
> --- a/Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml
> +++ b/Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml
> @@ -128,17 +128,17 @@ additionalProperties: false
>  examples:
>    - |
>      i2c {
> -            #address-cells = <1>;
> -            #size-cells = <0>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
>  
> -            pcf8575: gpio@20 {
> -                    compatible = "nxp,pcf8575";
> -                    reg = <0x20>;
> -                    interrupt-parent = <&irqpin2>;
> -                    interrupts = <3 0>;
> -                    gpio-controller;
> -                    #gpio-cells = <2>;
> -                    interrupt-controller;
> -                    #interrupt-cells = <2>;
> -            };
> +        gpio@20 {
> +            compatible = "nxp,pcf8575";
> +            reg = <0x20>;
> +            interrupt-parent = <&irqpin2>;
> +            interrupts = <3 0>;
> +            gpio-controller;
> +            #gpio-cells = <2>;
> +            interrupt-controller;
> +            #interrupt-cells = <2>;
> +        };
>      };
> diff --git a/Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yaml b/Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yaml
> index 39fd959c45d2..728099c65824 100644
> --- a/Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yaml
> @@ -81,7 +81,7 @@ dependencies:
>  
>  examples:
>    - |
> -      gpio@3500 {
> +    gpio@3500 {
>          compatible = "realtek,rtl8380-gpio", "realtek,otto-gpio";
>          reg = <0x3500 0x1c>;
>          gpio-controller;
> @@ -91,9 +91,9 @@ examples:
>          #interrupt-cells = <2>;
>          interrupt-parent = <&rtlintc>;
>          interrupts = <23>;
> -      };
> +    };
>    - |
> -      gpio@3300 {
> +    gpio@3300 {
>          compatible = "realtek,rtl9300-gpio", "realtek,otto-gpio";
>          reg = <0x3300 0x1c>, <0x3338 0x8>;
>          gpio-controller;
> @@ -103,6 +103,6 @@ examples:
>          #interrupt-cells = <2>;
>          interrupt-parent = <&rtlintc>;
>          interrupts = <13>;
> -      };
> +    };
>  
>  ...
> diff --git a/Documentation/devicetree/bindings/gpio/renesas,em-gio.yaml b/Documentation/devicetree/bindings/gpio/renesas,em-gio.yaml
> index 8bdef812c87c..49fb8f613ead 100644
> --- a/Documentation/devicetree/bindings/gpio/renesas,em-gio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/renesas,em-gio.yaml
> @@ -57,14 +57,14 @@ examples:
>    - |
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>      gpio0: gpio@e0050000 {
> -            compatible = "renesas,em-gio";
> -            reg = <0xe0050000 0x2c>, <0xe0050040 0x20>;
> -            interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
> -            gpio-controller;
> -            #gpio-cells = <2>;
> -            gpio-ranges = <&pfc 0 0 32>;
> -            ngpios = <32>;
> -            interrupt-controller;
> -            #interrupt-cells = <2>;
> +        compatible = "renesas,em-gio";
> +        reg = <0xe0050000 0x2c>, <0xe0050040 0x20>;
> +        interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        gpio-ranges = <&pfc 0 0 32>;
> +        ngpios = <32>;
> +        interrupt-controller;
> +        #interrupt-cells = <2>;
>      };
> diff --git a/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml b/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
> index cc7a950a6030..d32e103a64aa 100644
> --- a/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
> @@ -138,16 +138,16 @@ examples:
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>      #include <dt-bindings/power/r8a77470-sysc.h>
>      gpio3: gpio@e6053000 {
> -            compatible = "renesas,gpio-r8a77470", "renesas,rcar-gen2-gpio";
> -            reg = <0xe6053000 0x50>;
> -            interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> -            clocks = <&cpg CPG_MOD 909>;
> -            power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
> -            resets = <&cpg 909>;
> -            gpio-controller;
> -            #gpio-cells = <2>;
> -            gpio-ranges = <&pfc 0 96 30>;
> -            gpio-reserved-ranges = <17 10>;
> -            interrupt-controller;
> -            #interrupt-cells = <2>;
> +        compatible = "renesas,gpio-r8a77470", "renesas,rcar-gen2-gpio";
> +        reg = <0xe6053000 0x50>;
> +        interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&cpg CPG_MOD 909>;
> +        power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
> +        resets = <&cpg 909>;
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        gpio-ranges = <&pfc 0 96 30>;
> +        gpio-reserved-ranges = <17 10>;
> +        interrupt-controller;
> +        #interrupt-cells = <2>;
>       };
> diff --git a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
> index fc095646adea..4bdc201b719e 100644
> --- a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
> @@ -76,8 +76,8 @@ additionalProperties: false
>  
>  examples:
>    - |
> -      #include <dt-bindings/clock/sifive-fu540-prci.h>
> -      gpio@10060000 {
> +    #include <dt-bindings/clock/sifive-fu540-prci.h>
> +    gpio@10060000 {
>          compatible = "sifive,fu540-c000-gpio", "sifive,gpio0";
>          interrupt-parent = <&plic>;
>          interrupts = <7>, <8>, <9>, <10>, <11>, <12>, <13>, <14>, <15>, <16>,
> @@ -88,6 +88,6 @@ examples:
>          #gpio-cells = <2>;
>          interrupt-controller;
>          #interrupt-cells = <2>;
> -      };
> +    };
>  
>  ...
> diff --git a/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml b/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
> index b085450b527f..712063417bc8 100644
> --- a/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
> +++ b/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
> @@ -48,22 +48,22 @@ additionalProperties: false
>  
>  examples:
>    - |
> -      #include <dt-bindings/interrupt-controller/irq.h>
> -      #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>  
> -      soc {
> +    soc {
>          #address-cells = <2>;
>          #size-cells = <2>;
>  
>          gpio: gpio@28020000 {
> -          compatible = "toshiba,gpio-tmpv7708";
> -          reg = <0 0x28020000 0 0x1000>;
> -          #gpio-cells = <0x2>;
> -          gpio-ranges = <&pmux 0 0 32>;
> -          gpio-controller;
> -          interrupt-controller;
> -          #interrupt-cells = <2>;
> -          interrupt-parent = <&gic>;
> +            compatible = "toshiba,gpio-tmpv7708";
> +            reg = <0 0x28020000 0 0x1000>;
> +            #gpio-cells = <0x2>;
> +            gpio-ranges = <&pmux 0 0 32>;
> +            gpio-controller;
> +            interrupt-controller;
> +            #interrupt-cells = <2>;
> +            interrupt-parent = <&gic>;
>          };
> -      };
> +    };
>  ...
> diff --git a/Documentation/devicetree/bindings/gpio/xlnx,gpio-xilinx.yaml b/Documentation/devicetree/bindings/gpio/xlnx,gpio-xilinx.yaml
> index d3d8a2e143ed..8fbf12ca067e 100644
> --- a/Documentation/devicetree/bindings/gpio/xlnx,gpio-xilinx.yaml
> +++ b/Documentation/devicetree/bindings/gpio/xlnx,gpio-xilinx.yaml
> @@ -126,29 +126,29 @@ examples:
>    - |
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>  
> -        gpio@a0020000 {
> -            compatible = "xlnx,xps-gpio-1.00.a";
> -            reg = <0xa0020000 0x10000>;
> -            #gpio-cells = <2>;
> -            #interrupt-cells = <0x2>;
> -            clocks = <&zynqmp_clk 71>;
> -            gpio-controller;
> -            interrupt-controller;
> -            interrupt-names = "ip2intc_irpt";
> -            interrupt-parent = <&gic>;
> -            interrupts = <0 89 4>;
> -            xlnx,all-inputs = <0x0>;
> -            xlnx,all-inputs-2 = <0x0>;
> -            xlnx,all-outputs = <0x0>;
> -            xlnx,all-outputs-2 = <0x0>;
> -            xlnx,dout-default = <0x0>;
> -            xlnx,dout-default-2 = <0x0>;
> -            xlnx,gpio-width = <0x20>;
> -            xlnx,gpio2-width = <0x20>;
> -            xlnx,interrupt-present = <0x1>;
> -            xlnx,is-dual = <0x1>;
> -            xlnx,tri-default = <0xFFFFFFFF>;
> -            xlnx,tri-default-2 = <0xFFFFFFFF>;
> -        };
> +    gpio@a0020000 {
> +        compatible = "xlnx,xps-gpio-1.00.a";
> +        reg = <0xa0020000 0x10000>;
> +        #gpio-cells = <2>;
> +        #interrupt-cells = <0x2>;
> +        clocks = <&zynqmp_clk 71>;
> +        gpio-controller;
> +        interrupt-controller;
> +        interrupt-names = "ip2intc_irpt";
> +        interrupt-parent = <&gic>;
> +        interrupts = <0 89 4>;
> +        xlnx,all-inputs = <0x0>;
> +        xlnx,all-inputs-2 = <0x0>;
> +        xlnx,all-outputs = <0x0>;
> +        xlnx,all-outputs-2 = <0x0>;
> +        xlnx,dout-default = <0x0>;
> +        xlnx,dout-default-2 = <0x0>;
> +        xlnx,gpio-width = <0x20>;
> +        xlnx,gpio2-width = <0x20>;
> +        xlnx,interrupt-present = <0x1>;
> +        xlnx,is-dual = <0x1>;
> +        xlnx,tri-default = <0xFFFFFFFF>;
> +        xlnx,tri-default-2 = <0xFFFFFFFF>;
> +    };
>  
>  ...

-- 
Regards,

Laurent Pinchart

