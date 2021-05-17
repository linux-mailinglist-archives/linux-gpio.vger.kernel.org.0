Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 153A6386CCD
	for <lists+linux-gpio@lfdr.de>; Tue, 18 May 2021 00:15:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240345AbhEQWQd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 May 2021 18:16:33 -0400
Received: from mail-ot1-f43.google.com ([209.85.210.43]:43744 "EHLO
        mail-ot1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235143AbhEQWQd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 May 2021 18:16:33 -0400
Received: by mail-ot1-f43.google.com with SMTP id u19-20020a0568302493b02902d61b0d29adso6919310ots.10;
        Mon, 17 May 2021 15:15:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mfdDty9dpgWriaBYtF6y0nD3N9zmNmSV9geJbjwigpo=;
        b=PLZP7Q9r2zLDQGC2dRBzcW0g5X8Prw/S3mEqEdybbVgUZVr21qI6LZR0il+9BZoG9l
         /KhU2BwGNLXi1qZUFJxhO0+lF/3e3Ar8JmB9q8lLaFwC6qvpVzzJ167nAW+xNDlz1R4Z
         wff6OIf3Gy/gs34+m/mM6Qr4YYVdyQdDjngjsmxGI+qx0QfjuQ6HynXpgSRIYbtMFyOs
         UkVHFl8Ri5MQxibpafOHOsYcW6oiclnMuIisYE5WHXu9nfsS+p3P+OVctSsX2eV0CDun
         CbTDwFFzRu+7cq2+JBsWoW4XLJzZCR84xssie4ptcQKhs1fcUHfNfdPnKgEFL7C22opM
         QtSg==
X-Gm-Message-State: AOAM530hbLsbdJ5dNxT/ra0utHMVviBgmD3KCpvFDP4Ntpmjqa/hMCUt
        A4nQ7wDUo6TvQkq1gdTkfw==
X-Google-Smtp-Source: ABdhPJxef3xwEbj2XJe+EMhOygaoOS31nUpBQ8+d3/FStR15ARsekRr6n4UFbC816vwD429WDoCLIg==
X-Received: by 2002:a05:6830:1256:: with SMTP id s22mr1371128otp.333.1621289715966;
        Mon, 17 May 2021 15:15:15 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w20sm3367314otk.33.2021.05.17.15.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 15:15:15 -0700 (PDT)
Received: (nullmailer pid 3302301 invoked by uid 1000);
        Mon, 17 May 2021 22:15:13 -0000
Date:   Mon, 17 May 2021 17:15:13 -0500
From:   Rob Herring <robh@kernel.org>
To:     Aswath Govindraju <a-govindraju@ti.com>
Cc:     Vignesh Raghavendra <vigneshr@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Keerthy <j-keerthy@ti.com>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: gpio: gpio-davinci: Convert to json-schema
Message-ID: <20210517221513.GA3263368@robh.at.kernel.org>
References: <20210511090122.6995-1-a-govindraju@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210511090122.6995-1-a-govindraju@ti.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 11, 2021 at 02:31:20PM +0530, Aswath Govindraju wrote:
> Convert gpio-davinci dt-binding documentation from txt to yaml format.
> 
> Signed-off-by: Aswath Govindraju <a-govindraju@ti.com>
> ---
>  .../devicetree/bindings/gpio/gpio-davinci.txt | 167 ---------------
>  .../bindings/gpio/gpio-davinci.yaml           | 193 ++++++++++++++++++
>  MAINTAINERS                                   |   2 +-
>  3 files changed, 194 insertions(+), 168 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-davinci.txt
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-davinci.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-davinci.txt b/Documentation/devicetree/bindings/gpio/gpio-davinci.txt
> deleted file mode 100644
> index 696ea46227d1..000000000000
> --- a/Documentation/devicetree/bindings/gpio/gpio-davinci.txt
> +++ /dev/null
> @@ -1,167 +0,0 @@
> -Davinci/Keystone GPIO controller bindings
> -
> -Required Properties:
> -- compatible: should be "ti,dm6441-gpio": for Davinci da850 SoCs
> -			"ti,keystone-gpio": for Keystone 2 66AK2H/K, 66AK2L,
> -						66AK2E SoCs
> -			"ti,k2g-gpio", "ti,keystone-gpio": for 66AK2G
> -			"ti,am654-gpio", "ti,keystone-gpio": for TI K3 AM654
> -			"ti,j721e-gpio", "ti,keystone-gpio": for J721E SoCs
> -			"ti,am64-gpio", "ti,keystone-gpio": for AM64 SoCs
> -
> -- reg: Physical base address of the controller and the size of memory mapped
> -       registers.
> -
> -- gpio-controller : Marks the device node as a gpio controller.
> -
> -- #gpio-cells : Should be two.
> -  - first cell is the pin number
> -  - second cell is used to specify optional parameters (unused)
> -
> -- interrupts: Array of GPIO interrupt number. Only banked or unbanked IRQs are
> -	      supported at a time.
> -
> -- ti,ngpio: The number of GPIO pins supported.
> -
> -- ti,davinci-gpio-unbanked: The number of GPIOs that have an individual interrupt
> -		            line to processor.
> -
> -- clocks: Should contain the device's input clock, and should be defined as per
> -          the appropriate clock bindings consumer usage in,
> -
> -          Documentation/devicetree/bindings/clock/keystone-gate.txt
> -                            for 66AK2HK/66AK2L/66AK2E SoCs or,
> -
> -          Documentation/devicetree/bindings/clock/ti,sci-clk.txt
> -                            for 66AK2G SoCs
> -
> -- clock-names: Name should be "gpio";
> -
> -Currently clock-names and clocks are needed for all keystone 2 platforms
> -Davinci platforms do not have DT clocks as of now.
> -
> -The GPIO controller also acts as an interrupt controller. It uses the default
> -two cells specifier as described in Documentation/devicetree/bindings/
> -interrupt-controller/interrupts.txt.
> -
> -Example:
> -
> -gpio: gpio@1e26000 {
> -	compatible = "ti,dm6441-gpio";
> -	gpio-controller;
> -	#gpio-cells = <2>;
> -	reg = <0x226000 0x1000>;
> -	interrupt-parent = <&intc>;
> -	interrupts = <42 IRQ_TYPE_EDGE_BOTH 43 IRQ_TYPE_EDGE_BOTH
> -		44 IRQ_TYPE_EDGE_BOTH 45 IRQ_TYPE_EDGE_BOTH
> -		46 IRQ_TYPE_EDGE_BOTH 47 IRQ_TYPE_EDGE_BOTH
> -		48 IRQ_TYPE_EDGE_BOTH 49 IRQ_TYPE_EDGE_BOTH
> -		50 IRQ_TYPE_EDGE_BOTH>;
> -	ti,ngpio = <144>;
> -	ti,davinci-gpio-unbanked = <0>;
> -	interrupt-controller;
> -	#interrupt-cells = <2>;
> -};
> -
> -leds {
> -	compatible = "gpio-leds";
> -
> -	led1 {
> -		label = "davinci:green:usr1";
> -		gpios = <&gpio 10 GPIO_ACTIVE_HIGH>;
> -		...
> -	};
> -
> -	led2 {
> -		label = "davinci:red:debug1";
> -		gpios = <&gpio 11 GPIO_ACTIVE_HIGH>;
> -		...
> -	};
> -};
> -
> -Example for 66AK2G:
> -
> -gpio0: gpio@2603000 {
> -	compatible = "ti,k2g-gpio", "ti,keystone-gpio";
> -	reg = <0x02603000 0x100>;
> -	gpio-controller;
> -	#gpio-cells = <2>;
> -	interrupts = <GIC_SPI 432 IRQ_TYPE_EDGE_RISING>,
> -			<GIC_SPI 433 IRQ_TYPE_EDGE_RISING>,
> -			<GIC_SPI 434 IRQ_TYPE_EDGE_RISING>,
> -			<GIC_SPI 435 IRQ_TYPE_EDGE_RISING>,
> -			<GIC_SPI 436 IRQ_TYPE_EDGE_RISING>,
> -			<GIC_SPI 437 IRQ_TYPE_EDGE_RISING>,
> -			<GIC_SPI 438 IRQ_TYPE_EDGE_RISING>,
> -			<GIC_SPI 439 IRQ_TYPE_EDGE_RISING>,
> -			<GIC_SPI 440 IRQ_TYPE_EDGE_RISING>;
> -	interrupt-controller;
> -	#interrupt-cells = <2>;
> -	ti,ngpio = <144>;
> -	ti,davinci-gpio-unbanked = <0>;
> -	clocks = <&k2g_clks 0x001b 0x0>;
> -	clock-names = "gpio";
> -};
> -
> -Example for 66AK2HK/66AK2L/66AK2E:
> -
> -gpio0: gpio@260bf00 {
> -	compatible = "ti,keystone-gpio";
> -	reg = <0x0260bf00 0x100>;
> -	gpio-controller;
> -	#gpio-cells = <2>;
> -	/* HW Interrupts mapped to GPIO pins */
> -	interrupts = <GIC_SPI 120 IRQ_TYPE_EDGE_RISING>,
> -			<GIC_SPI 121 IRQ_TYPE_EDGE_RISING>,
> -			<GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
> -			<GIC_SPI 123 IRQ_TYPE_EDGE_RISING>,
> -			<GIC_SPI 124 IRQ_TYPE_EDGE_RISING>,
> -			<GIC_SPI 125 IRQ_TYPE_EDGE_RISING>,
> -			<GIC_SPI 126 IRQ_TYPE_EDGE_RISING>,
> -			<GIC_SPI 127 IRQ_TYPE_EDGE_RISING>,
> -			<GIC_SPI 128 IRQ_TYPE_EDGE_RISING>,
> -			<GIC_SPI 129 IRQ_TYPE_EDGE_RISING>,
> -			<GIC_SPI 130 IRQ_TYPE_EDGE_RISING>,
> -			<GIC_SPI 131 IRQ_TYPE_EDGE_RISING>,
> -			<GIC_SPI 132 IRQ_TYPE_EDGE_RISING>,
> -			<GIC_SPI 133 IRQ_TYPE_EDGE_RISING>,
> -			<GIC_SPI 134 IRQ_TYPE_EDGE_RISING>,
> -			<GIC_SPI 135 IRQ_TYPE_EDGE_RISING>,
> -			<GIC_SPI 136 IRQ_TYPE_EDGE_RISING>,
> -			<GIC_SPI 137 IRQ_TYPE_EDGE_RISING>,
> -			<GIC_SPI 138 IRQ_TYPE_EDGE_RISING>,
> -			<GIC_SPI 139 IRQ_TYPE_EDGE_RISING>,
> -			<GIC_SPI 140 IRQ_TYPE_EDGE_RISING>,
> -			<GIC_SPI 141 IRQ_TYPE_EDGE_RISING>,
> -			<GIC_SPI 142 IRQ_TYPE_EDGE_RISING>,
> -			<GIC_SPI 143 IRQ_TYPE_EDGE_RISING>,
> -			<GIC_SPI 144 IRQ_TYPE_EDGE_RISING>,
> -			<GIC_SPI 145 IRQ_TYPE_EDGE_RISING>,
> -			<GIC_SPI 146 IRQ_TYPE_EDGE_RISING>,
> -			<GIC_SPI 147 IRQ_TYPE_EDGE_RISING>,
> -			<GIC_SPI 148 IRQ_TYPE_EDGE_RISING>,
> -			<GIC_SPI 149 IRQ_TYPE_EDGE_RISING>,
> -			<GIC_SPI 150 IRQ_TYPE_EDGE_RISING>,
> -			<GIC_SPI 151 IRQ_TYPE_EDGE_RISING>;
> -			clocks = <&clkgpio>;
> -	clock-names = "gpio";
> -	ti,ngpio = <32>;
> -	ti,davinci-gpio-unbanked = <32>;
> -};
> -
> -Example for K3 AM654:
> -
> -wkup_gpio0: wkup_gpio0@42110000 {
> -	compatible = "ti,am654-gpio", "ti,keystone-gpio";
> -	reg = <0x42110000 0x100>;
> -	gpio-controller;
> -	#gpio-cells = <2>;
> -	interrupt-parent = <&intr_wkup_gpio>;
> -	interrupts = <59 128>, <59 129>, <59 130>, <59 131>;
> -	interrupt-controller;
> -	#interrupt-cells = <2>;
> -	ti,ngpio = <56>;
> -	ti,davinci-gpio-unbanked = <0>;
> -	clocks = <&k3_clks 59 0>;
> -	clock-names = "gpio";
> -};
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-davinci.yaml b/Documentation/devicetree/bindings/gpio/gpio-davinci.yaml
> new file mode 100644
> index 000000000000..1e16172669c7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-davinci.yaml
> @@ -0,0 +1,193 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/gpio-davinci.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: GPIO controller for Davinci and keystone devices
> +
> +maintainers:
> +  - Keerthy <j-keerthy@ti.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - ti,k2g-gpio
> +              - ti,am654-gpio
> +              - ti,j721e-gpio
> +              - ti,am64-gpio
> +          - const: ti,keystone-gpio
> +
> +      - items:
> +          - const: ti,dm6441-gpio
> +      - items:
> +          - const: ti,keystone-gpio

These 2 can be expressed as an 'enum'.

> +
> +  reg:
> +    maxItems: 1
> +    description:
> +      Physical base address of the controller and the size of memory mapped registers.

Drop. That's every 'reg' property.

> +
> +  gpio-controller: true
> +
> +  gpio-ranges: true
> +
> +  gpio-line-names:
> +    description: strings describing the names of each gpio line.

Any constraints like min/max number of lines? 

> +
> +  "#gpio-cells":
> +    const: 2
> +    description:
> +      first cell is the pin number and second cell is used to specify optional parameters (unused).
> +
> +  interrupts:
> +    description:
> +      Array of GPIO interrupt number. Only banked or unbanked IRQs are supported at a time.

Needs constraints. How many items and what are they?

> +
> +  ti,ngpio:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: The number of GPIO pins supported consecutively.
> +    minimum: 1
> +
> +  ti,davinci-gpio-unbanked:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: The number of GPIOs that have an individual interrupt line to processor.
> +    minimum: 0
> +
> +  clocks:
> +    maxItems: 1
> +    description:
> +      clock-specifier to represent input to the GPIO controller.

Drop description.

> +
> +  clock-names:
> +    const: gpio
> +
> +  interrupt-controller: true
> +
> +  power-domains:
> +    maxItems: 1
> +    description:
> +      Phandle to the power domain provider node.

Drop.

> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +patternProperties:
> +  "-hog$":
> +    type: object
> +    properties:
> +      gpios: true
> +      gpio-hog: true
> +      input: true
> +      output-high: true
> +      output-low: true
> +      line-name: true
> +
> +    required:
> +      - gpio-hog
> +      - gpios
> +
> +required:
> +  - compatible
> +  - reg
> +  - gpio-controller
> +  - "#gpio-cells"
> +  - interrupts
> +  - ti,ngpio
> +  - ti,davinci-gpio-unbanked
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include<dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    gpio0: gpio@2603000 {
> +      compatible = "ti,k2g-gpio", "ti,keystone-gpio";
> +      reg = <0x02603000 0x100>;
> +      gpio-controller;
> +      #gpio-cells = <2>;
> +      interrupts = <GIC_SPI 432 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 433 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 434 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 435 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 436 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 437 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 438 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 439 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 440 IRQ_TYPE_EDGE_RISING>;
> +      interrupt-controller;
> +      #interrupt-cells = <2>;
> +      ti,ngpio = <144>;
> +      ti,davinci-gpio-unbanked = <0>;
> +      clocks = <&k2g_clks 0x001b 0x0>;
> +      clock-names = "gpio";
> +    };
> +
> +  - |
> +    #include<dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    gpio1: gpio@260bf00 {
> +      compatible = "ti,keystone-gpio";
> +      reg = <0x0260bf00 0x100>;
> +      gpio-controller;
> +      #gpio-cells = <2>;
> +      /* HW Interrupts mapped to GPIO pins */
> +      interrupts = <GIC_SPI 120 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 121 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 123 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 124 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 125 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 126 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 127 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 128 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 129 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 130 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 131 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 132 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 133 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 134 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 135 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 136 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 137 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 138 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 139 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 140 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 141 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 142 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 143 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 144 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 145 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 146 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 147 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 148 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 149 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 150 IRQ_TYPE_EDGE_RISING>,
> +                   <GIC_SPI 151 IRQ_TYPE_EDGE_RISING>;
> +      clocks = <&clkgpio>;
> +      clock-names = "gpio";
> +      ti,ngpio = <32>;
> +      ti,davinci-gpio-unbanked = <32>;
> +    };
> +
> +  - |
> +    wkup_gpio0: wkup_gpio0@42110000 {

gpio@...

> +      compatible = "ti,am654-gpio", "ti,keystone-gpio";
> +      reg = <0x42110000 0x100>;
> +      gpio-controller;
> +      #gpio-cells = <2>;
> +      interrupt-parent = <&intr_wkup_gpio>;
> +      interrupts = <60>, <61>, <62>, <63>;
> +      interrupt-controller;
> +      #interrupt-cells = <2>;
> +      ti,ngpio = <56>;
> +      ti,davinci-gpio-unbanked = <0>;
> +      clocks = <&k3_clks 59 0>;
> +      clock-names = "gpio";
> +    };
> +
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6e183abbbd2e..6b3519db8085 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18269,7 +18269,7 @@ TI DAVINCI SERIES GPIO DRIVER
>  M:	Keerthy <j-keerthy@ti.com>
>  L:	linux-gpio@vger.kernel.org
>  S:	Maintained
> -F:	Documentation/devicetree/bindings/gpio/gpio-davinci.txt
> +F:	Documentation/devicetree/bindings/gpio/gpio-davinci.yaml
>  F:	drivers/gpio/gpio-davinci.c
>  
>  TI DAVINCI SERIES MEDIA DRIVER
> -- 
> 2.17.1
> 
