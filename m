Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B60120C908
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jun 2020 18:39:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726395AbgF1QjG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 28 Jun 2020 12:39:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726059AbgF1QjF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 28 Jun 2020 12:39:05 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 509E9C03E97A
        for <linux-gpio@vger.kernel.org>; Sun, 28 Jun 2020 09:39:05 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id s16so2330281lfp.12
        for <linux-gpio@vger.kernel.org>; Sun, 28 Jun 2020 09:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=44jYHq4vsT34apIFOBTKIM6GNTAQfLucICyAOjYoaHI=;
        b=xv5roH2MW70tL4MGfmDBsFBeMTFdN8HNMhSdntgUB8K6FBEY94yiMfdU5C8R+2Itif
         Q2uET52Mhl6EtTC9yvqAKxK2SC6ri8KaAnJqUlrtUib8JviVdboxI0VYNAIlJDOHB89X
         CpDjkZKhLrykUkPIfKwtkeqN0Z2Z0Fz4eVehJuHLOQtm/HsRzmZyOuRIwFPxxQLoI0Zo
         cQgYzTe8RkQtMmyaDhUPjJ1mUpPKEMnx6wcYU+5LSWcMAqJup6/xgxA6rvYPqtndi+E5
         I6eLaCHaCz4+iI9Iyu0u7vt2kfzr4AMb14WKl18mxiOwJ81sxOa8WoqH8EM2EK6GmVwY
         EYGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=44jYHq4vsT34apIFOBTKIM6GNTAQfLucICyAOjYoaHI=;
        b=PsutY7yHeOFR35LGAUzSmOHU1q4X+QnMG2+vP1saY5mRThhQ+KAGWgMq7HO8wiSgo6
         n5e7M2jqNhOkljYxFi0WE/Wh7J0QL4B9xDuxo9Br/2yR7aCqd3BT6ggO4ei6/q0+KYMC
         LtuvcqaWm0NPkO6WZlFBxrz9lDkNPbuCyvKDK8qvLa5dFrqBduQGX8BnhhrmYsd3rCAb
         4ANTF+dfly62CnUCtm/7B7BboPut1by8Tmguuu4/rHELKo95fH1Ib5Fc7ANxTIcGxMoq
         TVKu9Jku3WRTwSghDaddqha+M4+68Qz7zPT3f4VjgdJhMP+Panqj7x/4uS1BlUlLA9Wx
         1I/g==
X-Gm-Message-State: AOAM530aHNtRjk+mpY8l4Xn6cPg7+krL0v+zddrk9aGw5pMANBGWcn+0
        P0wJRfVqsfeHGJjfpK2+H4ZSmA==
X-Google-Smtp-Source: ABdhPJwYFpUzHoFTLqaCGCMebyfNZi6L+IyBYJ6JYAp5+Z0/nV2LtvHVREUDHQBCfrnQ0V+l7CWZ1g==
X-Received: by 2002:a19:4805:: with SMTP id v5mr7212954lfa.75.1593362343618;
        Sun, 28 Jun 2020 09:39:03 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id j22sm10354676lfe.63.2020.06.28.09.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2020 09:39:03 -0700 (PDT)
Date:   Sun, 28 Jun 2020 18:39:02 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: renesas,rza2-pinctrl: Convert to
 json-schema
Message-ID: <20200628163902.GI1105424@oden.dyn.berto.se>
References: <20200626143638.16512-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200626143638.16512-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2020-06-26 16:36:38 +0200, Geert Uytterhoeven wrote:
> Convert the Renesas RZ/A2 combined Pin and GPIO controller Device Tree
> binding documentation to json-schema.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../bindings/pinctrl/renesas,rza2-pinctrl.txt |  87 ---------------
>  .../pinctrl/renesas,rza2-pinctrl.yaml         | 100 ++++++++++++++++++
>  2 files changed, 100 insertions(+), 87 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.txt
> deleted file mode 100644
> index a63ccd476cdaf919..0000000000000000
> --- a/Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.txt
> +++ /dev/null
> @@ -1,87 +0,0 @@
> -Renesas RZ/A2 combined Pin and GPIO controller
> -
> -The Renesas SoCs of the RZ/A2 series feature a combined Pin and GPIO controller.
> -Pin multiplexing and GPIO configuration is performed on a per-pin basis.
> -Each port features up to 8 pins, each of them configurable for GPIO
> -function (port mode) or in alternate function mode.
> -Up to 8 different alternate function modes exist for each single pin.
> -
> -Pin controller node
> --------------------
> -
> -Required properties:
> -  - compatible: shall be:
> -    - "renesas,r7s9210-pinctrl": for RZ/A2M
> -  - reg
> -    Address base and length of the memory area where the pin controller
> -    hardware is mapped to.
> -  - gpio-controller
> -    This pin controller also controls pins as GPIO
> -  - #gpio-cells
> -    Must be 2
> -  - gpio-ranges
> -    Expresses the total number of GPIO ports/pins in this SoC
> -
> -Example: Pin controller node for RZ/A2M SoC (r7s9210)
> -
> -	pinctrl: pin-controller@fcffe000 {
> -		compatible = "renesas,r7s9210-pinctrl";
> -		reg = <0xfcffe000 0x1000>;
> -
> -		gpio-controller;
> -		#gpio-cells = <2>;
> -		gpio-ranges = <&pinctrl 0 0 176>;
> -	};
> -
> -Sub-nodes
> ----------
> -
> -The child nodes of the pin controller designate pins to be used for
> -specific peripheral functions or as GPIO.
> -
> -- Pin multiplexing sub-nodes:
> -  A pin multiplexing sub-node describes how to configure a set of
> -  (or a single) pin in some desired alternate function mode.
> -  The values for the pinmux properties are a combination of port name, pin
> -  number and the desired function index. Use the RZA2_PINMUX macro located
> -  in include/dt-bindings/pinctrl/r7s9210-pinctrl.h to easily define these.
> -  For assigning GPIO pins, use the macro RZA2_PIN also in r7s9210-pinctrl.h
> -  to express the desired port pin.
> -
> -  Required properties:
> -    - pinmux:
> -      integer array representing pin number and pin multiplexing configuration.
> -      When a pin has to be configured in alternate function mode, use this
> -      property to identify the pin by its global index, and provide its
> -      alternate function configuration number along with it.
> -      When multiple pins are required to be configured as part of the same
> -      alternate function they shall be specified as members of the same
> -      argument list of a single "pinmux" property.
> -      Helper macros to ease assembling the pin index from its position
> -      (port where it sits on and pin number) and alternate function identifier
> -      are provided by the pin controller header file at:
> -      <dt-bindings/pinctrl/r7s9210-pinctrl.h>
> -      Integers values in "pinmux" argument list are assembled as:
> -      ((PORT * 8 + PIN) | MUX_FUNC << 16)
> -
> -  Example: Board specific pins configuration
> -
> -	&pinctrl {
> -		/* Serial Console */
> -		scif4_pins: serial4 {
> -			pinmux = <RZA2_PINMUX(PORT9, 0, 4)>,	/* TxD4 */
> -				 <RZA2_PINMUX(PORT9, 1, 4)>;	/* RxD4 */
> -		};
> -	};
> -
> -  Example: Assigning a GPIO:
> -
> -	leds {
> -		status = "okay";
> -		compatible = "gpio-leds";
> -
> -		led0 {
> -			/* P6_0 */
> -			gpios = <&pinctrl RZA2_PIN(PORT6, 0) GPIO_ACTIVE_HIGH>;
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.yaml
> new file mode 100644
> index 0000000000000000..b7911a994f3a9f12
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.yaml
> @@ -0,0 +1,100 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/renesas,rza2-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/A2 combined Pin and GPIO controller
> +
> +maintainers:
> +  - Chris Brandt <chris.brandt@renesas.com>
> +  - Geert Uytterhoeven <geert+renesas@glider.be>
> +
> +description:
> +  The Renesas SoCs of the RZ/A2 series feature a combined Pin and GPIO
> +  controller.
> +  Pin multiplexing and GPIO configuration is performed on a per-pin basis.
> +  Each port features up to 8 pins, each of them configurable for GPIO function
> +  (port mode) or in alternate function mode.
> +  Up to 8 different alternate function modes exist for each single pin.

This paragraph formatting looks odd, but I'm not sure it's intentional 
or not :-) In either case with or without this changed,

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> +
> +properties:
> +  compatible:
> +    const: "renesas,r7s9210-pinctrl" # RZ/A2M
> +
> +  reg:
> +    maxItems: 1
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 2
> +    description:
> +      The first cell contains the global GPIO port index, constructed using the
> +      RZA2_PIN() helper macro in r7s9210-pinctrl.h.
> +      E.g. "RZA2_PIN(PORT6, 0)" for P6_0.
> +
> +  gpio-ranges:
> +    maxItems: 1
> +
> +patternProperties:
> +  "^.*$":
> +    if:
> +      type: object
> +    then:
> +      allOf:
> +        - $ref: pincfg-node.yaml#
> +        - $ref: pinmux-node.yaml#
> +      description:
> +        The child nodes of the pin controller designate pins to be used for
> +        specific peripheral functions or as GPIO.
> +
> +        A pin multiplexing sub-node describes how to configure a set of
> +        (or a single) pin in some desired alternate function mode.
> +        The values for the pinmux properties are a combination of port name,
> +        pin number and the desired function index. Use the RZA2_PINMUX macro
> +        located in include/dt-bindings/pinctrl/r7s9210-pinctrl.h to easily
> +        define these.
> +        For assigning GPIO pins, use the macro RZA2_PIN also in
> +        to express the desired port pin.
> +
> +      properties:
> +        phandle: true
> +
> +        pinmux:
> +          description:
> +            Values are constructed from GPIO port number, pin number, and
> +            alternate function configuration number using the RZA2_PINMUX()
> +            helper macro in r7s9210-pinctrl.h.
> +
> +      required:
> +        - pinmux
> +
> +      additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - gpio-controller
> +  - '#gpio-cells'
> +  - gpio-ranges
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/pinctrl/r7s9210-pinctrl.h>
> +    pinctrl: pin-controller@fcffe000 {
> +            compatible = "renesas,r7s9210-pinctrl";
> +            reg = <0xfcffe000 0x1000>;
> +
> +            gpio-controller;
> +            #gpio-cells = <2>;
> +            gpio-ranges = <&pinctrl 0 0 176>;
> +
> +            /* Serial Console */
> +            scif4_pins: serial4 {
> +                    pinmux = <RZA2_PINMUX(PORT9, 0, 4)>, /* TxD4 */
> +                             <RZA2_PINMUX(PORT9, 1, 4)>; /* RxD4 */
> +            };
> +    };
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
