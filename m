Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD7F2721E9D
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jun 2023 08:59:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229645AbjFEG7b (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Jun 2023 02:59:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjFEG7a (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Jun 2023 02:59:30 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5DCB9F
        for <linux-gpio@vger.kernel.org>; Sun,  4 Jun 2023 23:59:28 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-514924ca903so6415609a12.2
        for <linux-gpio@vger.kernel.org>; Sun, 04 Jun 2023 23:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685948367; x=1688540367;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b3gf39J0e6Ug9xwuUlT/0gU+hrC/12pzramCbbQjL4A=;
        b=mW8GZA+Rq9gwuGiJ7l2Yb5V80S2yfzyuh6nK4EWOKRupfjPPHyNDnyqkR0dwHq/k5N
         iXODZH/q07+nwXtrznbS9anb5dS3YIMEhAzhSYIqGotN8rj2Z9EYwAFXDTCH9OAWO3NW
         dOVbnS0derytPK206OQnEvrNc99hO5vsoftQI3TInD10V9bibtst8nFxGujnWdcZg5a/
         fdIMnVD48tuh2YmSHW3PnOEosdAWBU+CHDcYBkaAhyyZ+5b16hit9OxsDGuHFkEphxuB
         C8iZlXL1KXTvGU3ON8o7Oi/ACNjCHctgUxuYwZ2y65UStqAPmfeTgtbJM+76nywbVEOE
         Hi2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685948367; x=1688540367;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b3gf39J0e6Ug9xwuUlT/0gU+hrC/12pzramCbbQjL4A=;
        b=kxSF4XeZpW7uUuqWgqZR/uSrkOJtfyLJ33OkIygSw78yr19qMNOP31gpXN1pWjOjdG
         qZevtJmoFiiU0dCGxtTP3ZZENXIPq9PspzzNa/mogc63Qo6n3jcUWkOq4gDg4z/LVNUi
         IlEL4DyUCApPwST7slprz51pGVJqZxqTAu57XbWYmz61B4e4J4jLzoTyUZQaIdUbB1nX
         Y/zTaDX4p9HFS0bL08vZy/oQrFbpQLpf0h+dxCg0hwu0SuvKvAXpmV/Vdcc+ZgP9925A
         Sj+ahlLi64wwlI9RDuhhY9wmLXyg6S0ak123cESI2hvg8EbeFN027F1SgJBQZSiAgB3E
         TZIA==
X-Gm-Message-State: AC+VfDxhjEnCdRMUcKD+p2WLNNKUoZ0r4Xlq9QgT3/BZH35a9XNchnpc
        Zc4wTSthypukitbsG97FUKSJ4Q==
X-Google-Smtp-Source: ACHHUZ62BEmn8WrMHA3fsRSPnPX/q78d2QO6HDOam1Lb/CZYXyD8ch0G6LozIIUyy+8egmqzEdKcKw==
X-Received: by 2002:a05:6402:54e:b0:514:8e4a:7e8f with SMTP id i14-20020a056402054e00b005148e4a7e8fmr6426564edx.32.1685948367246;
        Sun, 04 Jun 2023 23:59:27 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id l9-20020aa7c3c9000000b005105f002fd1sm3509006edr.66.2023.06.04.23.59.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Jun 2023 23:59:26 -0700 (PDT)
Message-ID: <b9baf188-6ee3-40ed-27e9-66a08c8de7f6@linaro.org>
Date:   Mon, 5 Jun 2023 08:59:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v5 1/1] dt-bindings: pinctrl: Update pinctrl-single to use
 yaml
Content-Language: en-US
To:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20230523092038.55677-1-tony@atomide.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230523092038.55677-1-tony@atomide.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 23/05/2023 11:20, Tony Lindgren wrote:
> Update binding for yaml and remove the old related txt bindings. Note that
> we are also adding the undocumented pinctrl-single,slew-rate property. And
> we only use the first example from the old binding.
> 
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Nishanth Menon <nm@ti.com>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>


Thank you for your patch. There is something to discuss/improve.


> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
> @@ -0,0 +1,201 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: One-register-per-pin type device tree based pinctrl driver

Drop "device tree based pinctrl driver" and describe the hardware.

> +
> +maintainers:
> +  - Tony Lindgren <tony@atomide.com>
> +
> +description:
> +  This binding describes pinctrl devices that use one hardware register to
> +  configure each pin.

Drop "This binding describes" and just say what is the hardware here.

> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:

Drop items, you have just an enum.

> +          - enum:
> +              - pinctrl-single
> +              - pinconf-single
> +      - items:
> +          - enum:
> +              - ti,am437-padconf
> +              - ti,dra7-padconf
> +              - ti,omap2420-padconf
> +              - ti,omap2430-padconf
> +              - ti,omap3-padconf
> +              - ti,omap4-padconf
> +              - ti,omap5-padconf
> +          - const: pinctrl-single
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 1
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +  '#pinctrl-cells':
> +    enum: [ 1, 2 ]

Describe in description what are the arguments. Old binding had it.

> +
> +  pinctrl-single,bit-per-mux:
> +    description: Optional flag to indicate register controls more than one pin
> +    type: boolean
> +
> +  pinctrl-single,function-mask:
> +    description: Mask of the allowed register bits
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  pinctrl-single,function-off:
> +    description: Optional function off mode for disabled state
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  pinctrl-single,register-width:
> +    description: Width of pin specific bits in the register
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [ 8, 16, 32 ]
> +
> +  pinctrl-single,gpio-range:
> +    description: Optional list of pin base, nr pins & gpio function
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: phandle of a gpio-range node
> +          - description: pin base
> +          - description: number of pins
> +          - description: gpio function
> +
> +  '#gpio-range-cells':
> +    description: No longer needed, may exist in older files for gpio-ranges
> +    deprecated: true
> +    const: 3
> +
> +  gpio-range:
> +    description: Optional node for gpio range cells
> +    type: object

On this level of indentation:
additionalProperties: false

> +    properties:
> +      '#pinctrl-single,gpio-range-cells':
> +        description: Number of gpio range cells
> +        const: 3
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +
> +patternProperties:
> +  '-pins((.*)?)$|-pin':

Why do you need outer ()?
-pin$

> +    description: Pin group node name using pins or pin naming
> +    type: object
> +    $ref: pinmux-node.yaml#

You don't use anything from this ref. Drop it, unless you plan to
deprecate old properties and use generic from pinmux-node.

> +
> +    additionalProperties: false
> +
> +    properties:
> +      pinctrl-single,pins:
> +        description:
> +          Array of pins as described in pinmux-node.yaml for pinctrl-pin-array
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +
> +      pinctrl-single,bits:
> +        description: Register bit configuration for pinctrl-single,bit-per-mux
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        items:
> +          - description: register offset
> +          - description: value
> +          - description: pin bitmask in the register
> +
> +      pinctrl-single,bias-pullup:
> +        description: Optional bias pull up configuration
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        items:
> +          - description: input
> +          - description: enabled pull up bits
> +          - description: disabled pull up bits
> +          - description: bias pull up mask
> +
> +      pinctrl-single,bias-pulldown:
> +        description: Optional bias pull down configuration
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        items:
> +          - description: input
> +          - description: enabled pull down bits
> +          - description: disabled pull down bits
> +          - description: bias pull down mask
> +
> +      pinctrl-single,drive-strength:
> +        description: Optional drive strength configuration
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        items:
> +          - description: drive strength current
> +          - description: drive strength mask
> +
> +      pinctrl-single,input-schmitt:
> +        description: Optional input schmitt configuration
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        items:
> +          - description: input
> +          - description: enable bits
> +          - description: disable bits
> +          - description: input schmitt mask
> +
> +      pinctrl-single,low-power-mode:
> +        description: Optional low power mode configuration
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        items:
> +          - description: low power mode value
> +          - description: low power mode mask
> +
> +      pinctrl-single,slew-rate:
> +        description: Optional slew rate configuration
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        items:
> +          - description: slew rate
> +          - description: slew rate mask
> +
> +allOf:
> +  - $ref: pinctrl.yaml#
> +
> +required:
> +  - compatible
> +  - reg
> +  - pinctrl-single,register-width
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    soc {
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +
> +        pinmux@4a100040 {

Mixed up indentation.

> +          compatible = "pinctrl-single";
> +          reg = <0x4a100040 0x0196>;
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +          #pinctrl-cells = <2>;
> +          #interrupt-cells = <1>;
> +          interrupt-controller;
> +          pinctrl-single,register-width = <16>;
> +          pinctrl-single,function-mask = <0xffff>;
> +          pinctrl-single,gpio-range = <&range 0 3 0>;
> +          range: gpio-range {
> +            #pinctrl-single,gpio-range-cells = <3>;
> +          };
> +
> +          uart2-pins {


Best regards,
Krzysztof

