Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3128A6E6D87
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Apr 2023 22:37:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229813AbjDRUhh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Apr 2023 16:37:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229598AbjDRUhh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Apr 2023 16:37:37 -0400
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E8819750;
        Tue, 18 Apr 2023 13:37:35 -0700 (PDT)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-187b70ab997so6038820fac.0;
        Tue, 18 Apr 2023 13:37:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681850254; x=1684442254;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7o5+N3VS1qDPO/Zinw5mZUfsFpj4R1h4uEgY0MH+7Dk=;
        b=b+IAvQBDUHTy80gx09YKw8kPZwijD8VlnkOx3fWYN6+JMWHxaRskjel5WX8s8G5LVV
         jmhWO5U5PChqGH+3AljKDlbvTzZQqLlwYhyBs0P+0EJnLeCffIFwnGkzzs0GTTcjyac0
         4Cn0BwG2YdQYdV/FqT/q+lc+gF9SD53k4LPBiL0ccwOfcXLf1wIXyxZZ5/8JuTltm9vc
         FSJvBsKMrZ7f3zctG05ga5rhxwuRavcUI5oM0Jp5wPVEpgTPRP2RU0AfPNx5QvLPc6L4
         LDfrPjReGcrZvI16lb8tMjlGkc2vT0QleSrJTkG5vwRcywr2qux7Jqpf/2Nwa8Na1stV
         4uZw==
X-Gm-Message-State: AAQBX9fcn4EhfP8JrwBiHFtvLYYh39LWulJG9T3JsekPt6QSgy7AM44a
        Cdt1Md4mGIJfAYQskXcWlQ==
X-Google-Smtp-Source: AKy350aZLI017yqSUkhnZhkBxYDsjknuM4p3cQeAY3E4Q5qQfI6Lee06CNzMPbw6G/bjNY9+oYKk3g==
X-Received: by 2002:aca:d7c4:0:b0:38a:63c8:800e with SMTP id o187-20020acad7c4000000b0038a63c8800emr80477oig.7.1681850254248;
        Tue, 18 Apr 2023 13:37:34 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 125-20020a4a0d83000000b005251e3f92ecsm6297501oob.47.2023.04.18.13.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 13:37:33 -0700 (PDT)
Received: (nullmailer pid 2297135 invoked by uid 1000);
        Tue, 18 Apr 2023 20:37:32 -0000
Date:   Tue, 18 Apr 2023 15:37:32 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sean Anderson <sean.anderson@seco.com>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-phy@lists.infradead.org,
        Madalin Bucur <madalin.bucur@nxp.com>,
        linux-arm-kernel@lists.infradead.org,
        Camelia Alexandra Groza <camelia.groza@nxp.com>,
        devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Ioana Ciornei <ioana.ciornei@nxp.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        =?iso-8859-1?Q?Fern=E1ndez?= Rojas <noltari@gmail.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v14 03/15] dt-bindings: Convert gpio-mmio to yaml
Message-ID: <20230418203732.GA2262819-robh@kernel.org>
References: <20230413160607.4128315-1-sean.anderson@seco.com>
 <20230413160607.4128315-4-sean.anderson@seco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230413160607.4128315-4-sean.anderson@seco.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 13, 2023 at 12:05:55PM -0400, Sean Anderson wrote:
> This is a generic binding for simple MMIO GPIO controllers. Although we
> have a single driver for these controllers, they were previously spread
> over several files. Consolidate them. The register descriptions are
> adapted from the comments in the source. There is no set order for the
> registers, and some registers may be omitted. Because of this, reg-names
> is mandatory, and no order is specified.
> 
> Rename brcm,bcm6345-gpio to brcm,bcm63xx-gpio to reflect that bcm6345
> has moved.
> 
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Linus or Bartosz, feel free to pick this up as the rest of this series
> may not be merged any time soon.
> 
> Changes in v14:
> - Fix incorrect $id
> 
> Changes in v13:
> - Fix references to brcm,bcm63xx-gpio.yaml (neé brcm,bcm6345-gpio)
> 
> Changes in v12:
> - Put compatible first
> - Keep gpio-controller to one line
> - Add little-endian property
> - Alphabetize compatibles
> - Remove some comments
> - Remove some examples with insufficient novelty
> 
> Changes in v11:
> - Keep empty (or almost-empty) properties on a single line
> - Don't use | unnecessarily
> - Use gpio as the node name for examples
> - Rename brcm,bcm6345-gpio.yaml to brcm,bcm63xx-gpio.yaml
> 
> Changes in v10:
> - New
> 
>  ...m6345-gpio.yaml => brcm,bcm63xx-gpio.yaml} |  18 +--
>  .../devicetree/bindings/gpio/gpio-mmio.yaml   | 117 ++++++++++++++++++
>  .../bindings/gpio/ni,169445-nand-gpio.txt     |  38 ------
>  .../devicetree/bindings/gpio/wd,mbl-gpio.txt  |  38 ------
>  .../mfd/brcm,bcm6318-gpio-sysctl.yaml         |   4 +-
>  .../mfd/brcm,bcm63268-gpio-sysctl.yaml        |   4 +-
>  .../mfd/brcm,bcm6328-gpio-sysctl.yaml         |   4 +-
>  .../mfd/brcm,bcm6358-gpio-sysctl.yaml         |   4 +-
>  .../mfd/brcm,bcm6362-gpio-sysctl.yaml         |   4 +-
>  .../mfd/brcm,bcm6368-gpio-sysctl.yaml         |   4 +-
>  10 files changed, 131 insertions(+), 104 deletions(-)
>  rename Documentation/devicetree/bindings/gpio/{brcm,bcm6345-gpio.yaml => brcm,bcm63xx-gpio.yaml} (75%)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
>  delete mode 100644 Documentation/devicetree/bindings/gpio/ni,169445-nand-gpio.txt
>  delete mode 100644 Documentation/devicetree/bindings/gpio/wd,mbl-gpio.txt
> 
> diff --git a/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml b/Documentation/devicetree/bindings/gpio/brcm,bcm63xx-gpio.yaml
> similarity index 75%
> rename from Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
> rename to Documentation/devicetree/bindings/gpio/brcm,bcm63xx-gpio.yaml
> index 4d69f79df859..62fcc2bd5d80 100644
> --- a/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/brcm,bcm63xx-gpio.yaml
> @@ -1,10 +1,10 @@
>  # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>  %YAML 1.2
>  ---
> -$id: http://devicetree.org/schemas/gpio/brcm,bcm6345-gpio.yaml#
> +$id: http://devicetree.org/schemas/gpio/brcm,bcm63xx-gpio.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Broadcom BCM6345 GPIO controller
> +title: Broadcom BCM63xx GPIO controller
>  
>  maintainers:
>    - Álvaro Fernández Rojas <noltari@gmail.com>
> @@ -18,8 +18,6 @@ description: |+
>  
>    BCM6338 have 8-bit data and dirout registers, where GPIO state can be read
>    and/or written, and the direction changed from input to output.
> -  BCM6345 have 16-bit data and dirout registers, where GPIO state can be read
> -  and/or written, and the direction changed from input to output.
>    BCM6318, BCM6328, BCM6358, BCM6362, BCM6368 and BCM63268 have 32-bit data
>    and dirout registers, where GPIO state can be read and/or written, and the
>    direction changed from input to output.
> @@ -29,7 +27,6 @@ properties:
>      enum:
>        - brcm,bcm6318-gpio
>        - brcm,bcm6328-gpio
> -      - brcm,bcm6345-gpio
>        - brcm,bcm6358-gpio
>        - brcm,bcm6362-gpio
>        - brcm,bcm6368-gpio
> @@ -63,17 +60,6 @@ required:
>  additionalProperties: false
>  
>  examples:
> -  - |
> -    gpio@fffe0406 {
> -      compatible = "brcm,bcm6345-gpio";
> -      reg-names = "dirout", "dat";
> -      reg = <0xfffe0406 2>, <0xfffe040a 2>;
> -      native-endian;
> -
> -      gpio-controller;
> -      #gpio-cells = <2>;
> -    };
> -
>    - |
>      gpio@0 {
>        compatible = "brcm,bcm63268-gpio";
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml b/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
> new file mode 100644
> index 000000000000..b394e058256e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
> @@ -0,0 +1,117 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/gpio-mmio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic MMIO GPIO
> +
> +maintainers:
> +  - Linus Walleij <linus.walleij@linaro.org>
> +  - Bartosz Golaszewski <brgl@bgdev.pl>
> +
> +description:
> +  Some simple GPIO controllers may consist of a single data register or a pair
> +  of set/clear-bit registers. Such controllers are common for glue logic in
> +  FPGAs or ASICs. Commonly, these controllers are accessed over memory-mapped
> +  NAND-style parallel busses.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - brcm,bcm6345-gpio
> +      - ni,169445-nand-gpio
> +      - wd,mbl-gpio # Western Digital MyBook Live memory-mapped GPIO controller
> +
> +  big-endian: true
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +  gpio-controller: true
> +
> +  little-endian: true
> +
> +  reg:
> +    minItems: 1
> +    description:
> +      A list of registers in the controller. The width of each register is
> +      determined by its size. All registers must have the same width. The number
> +      of GPIOs is set by the width, with bit 0 corresponding to GPIO 0.
> +    items:
> +      - description:
> +          Register to READ the value of the GPIO lines. If GPIO line is high,
> +          the bit will be set. If the GPIO line is low, the bit will be cleared.
> +          This register may also be used to drive GPIOs if the SET register is
> +          omitted.
> +      - description:
> +          Register to SET the value of the GPIO lines. Setting a bit in this
> +          register will drive the GPIO line high.
> +      - description:
> +          Register to CLEAR the value of the GPIO lines. Setting a bit in this
> +          register will drive the GPIO line low. If this register is omitted,
> +          the SET register will be used to clear the GPIO lines as well, by
> +          actively writing the line with 0.
> +      - description:
> +          Register to set the line as OUTPUT. Setting a bit in this register
> +          will turn that line into an output line. Conversely, clearing a bit
> +          will turn that line into an input.
> +      - description:
> +          Register to set this line as INPUT. Setting a bit in this register
> +          will turn that line into an input line. Conversely, clearing a bit
> +          will turn that line into an output.
> +
> +  reg-names:
> +    minItems: 1
> +    maxItems: 5
> +    items:
> +      enum:
> +        - dat
> +        - set
> +        - clr
> +        - dirout
> +        - dirin
> +
> +  native-endian: true
> +
> +  no-output:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      If this property is present, the controller cannot drive the GPIO lines.
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - '#gpio-cells'
> +  - gpio-controller
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    gpio@1f300010 {
> +      compatible = "ni,169445-nand-gpio";
> +      reg = <0x1f300010 0x4>;
> +      reg-names = "dat";
> +      gpio-controller;
> +      #gpio-cells = <2>;
> +    };
> +
> +    gpio@e0100000 {
> +      compatible = "wd,mbl-gpio";
> +      reg-names = "dat";
> +      reg = <0xe0100000 0x1>;
> +      #gpio-cells = <2>;
> +      gpio-controller;
> +      no-output;
> +    };
> +
> +    gpio@fffe0406 {
> +      compatible = "brcm,bcm6345-gpio";
> +      reg-names = "dirout", "dat";
> +      reg = <0xfffe0406 2>, <0xfffe040a 2>;
> +      native-endian;
> +      gpio-controller;
> +      #gpio-cells = <2>;
> +    };
> diff --git a/Documentation/devicetree/bindings/gpio/ni,169445-nand-gpio.txt b/Documentation/devicetree/bindings/gpio/ni,169445-nand-gpio.txt
> deleted file mode 100644
> index ca2f8c745a27..000000000000
> --- a/Documentation/devicetree/bindings/gpio/ni,169445-nand-gpio.txt
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -Bindings for the National Instruments 169445 GPIO NAND controller
> -
> -The 169445 GPIO NAND controller has two memory mapped GPIO registers, one
> -for input (the ready signal) and one for output (control signals).  It is
> -intended to be used with the GPIO NAND driver.
> -
> -Required properties:
> -	- compatible: should be "ni,169445-nand-gpio"
> -	- reg-names: must contain
> -		"dat" - data register
> -	- reg: address + size pairs describing the GPIO register sets;
> -		order must correspond with the order of entries in reg-names
> -	- #gpio-cells: must be set to 2. The first cell is the pin number and
> -			the second cell is used to specify the gpio polarity:
> -			0 = active high
> -			1 = active low
> -	- gpio-controller: Marks the device node as a gpio controller.
> -
> -Optional properties:
> -	- no-output: disables driving output on the pins
> -
> -Examples:
> -	gpio1: nand-gpio-out@1f300010 {
> -		compatible = "ni,169445-nand-gpio";
> -		reg = <0x1f300010 0x4>;
> -		reg-names = "dat";
> -		gpio-controller;
> -		#gpio-cells = <2>;
> -	};
> -
> -	gpio2: nand-gpio-in@1f300014 {
> -		compatible = "ni,169445-nand-gpio";
> -		reg = <0x1f300014 0x4>;
> -		reg-names = "dat";
> -		gpio-controller;
> -		#gpio-cells = <2>;
> -		no-output;
> -	};
> diff --git a/Documentation/devicetree/bindings/gpio/wd,mbl-gpio.txt b/Documentation/devicetree/bindings/gpio/wd,mbl-gpio.txt
> deleted file mode 100644
> index 038c3a6a1f4d..000000000000
> --- a/Documentation/devicetree/bindings/gpio/wd,mbl-gpio.txt
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -Bindings for the Western Digital's MyBook Live memory-mapped GPIO controllers.
> -
> -The Western Digital MyBook Live has two memory-mapped GPIO controllers.
> -Both GPIO controller only have a single 8-bit data register, where GPIO
> -state can be read and/or written.
> -
> -Required properties:
> -	- compatible: should be "wd,mbl-gpio"
> -	- reg-names: must contain
> -		"dat" - data register
> -	- reg: address + size pairs describing the GPIO register sets;
> -		order must correspond with the order of entries in reg-names
> -	- #gpio-cells: must be set to 2. The first cell is the pin number and
> -			the second cell is used to specify the gpio polarity:
> -			0 = active high
> -			1 = active low
> -	- gpio-controller: Marks the device node as a gpio controller.
> -
> -Optional properties:
> -	- no-output: GPIOs are read-only.
> -
> -Examples:
> -	gpio0: gpio0@e0000000 {
> -		compatible = "wd,mbl-gpio";
> -		reg-names = "dat";
> -		reg = <0xe0000000 0x1>;
> -		#gpio-cells = <2>;
> -		gpio-controller;
> -	};
> -
> -	gpio1: gpio1@e0100000 {
> -		compatible = "wd,mbl-gpio";
> -		reg-names = "dat";
> -		reg = <0xe0100000 0x1>;
> -		#gpio-cells = <2>;
> -		gpio-controller;
> -		no-output;
> -	};
> diff --git a/Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml b/Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml
> index 148f1da47603..9f9a14af875e 100644
> --- a/Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml
> +++ b/Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml
> @@ -35,11 +35,11 @@ patternProperties:
>    "^gpio@[0-9a-f]+$":
>      # Child node
>      type: object
> -    $ref: "../gpio/brcm,bcm6345-gpio.yaml"
> +    $ref: "../gpio/brcm,bcm63xx-gpio.yaml"

If you respin, please drop the quotes here and the other spots.

Reviewed-by: Rob Herring <robh@kernel.org>

Rob
