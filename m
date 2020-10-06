Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F36202854AC
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Oct 2020 00:38:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726832AbgJFWiA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Oct 2020 18:38:00 -0400
Received: from mail-oo1-f65.google.com ([209.85.161.65]:35454 "EHLO
        mail-oo1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726645AbgJFWiA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Oct 2020 18:38:00 -0400
Received: by mail-oo1-f65.google.com with SMTP id k13so138467oor.2;
        Tue, 06 Oct 2020 15:37:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=teDZeOsp7WwkIGP3iKjSqIVPmef0PWUnW8Mmkmzz9o4=;
        b=XAMQE4xhXXVM5NyAH5OcuU88lyoSpBDU1ZehENUTn5NtoVAIYMQKSPZ6jq4XHeM36R
         eSm3ijg5HpvdxNe1g/RM5laM79Sqcgj0dx7yK+nHk2/u0hvn/jb22NUwlFBRYVOLpxGe
         e+dXUiAAyfTdFcaxm5i4z5W4jJVGuffXe8FUUrn6klCF7givNLWdzo4Dd4YUQJUb19fl
         1MCzlXgLKHc0kayVwASeZ87tGc2/frPW2b5CgW+q8P6U8Ko9j25PMbG73R8ziECGWqdB
         SZhDFbjArX79au08PImfyeJXEd+e4/ChvOZo+gxwgEvkawcFlO9Ijed3ndWgbmtGc5on
         XEUA==
X-Gm-Message-State: AOAM530LGInNwwYZY/W00aOYvrAEk/fB4NMF0Ybap+2tHegk6EhIiQ30
        +ltpgoFV4fOd5kejT40IaQ==
X-Google-Smtp-Source: ABdhPJyFpedQuPVN9kB8Ly3qoE/JkVHh9qcZcyRHaLsHdHVOwSodwrpZmzUghXbXSpJnhqnVarjWcg==
X-Received: by 2002:a4a:3b91:: with SMTP id s139mr224493oos.34.1602023878541;
        Tue, 06 Oct 2020 15:37:58 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k51sm102833otc.46.2020.10.06.15.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2020 15:37:57 -0700 (PDT)
Received: (nullmailer pid 2985599 invoked by uid 1000);
        Tue, 06 Oct 2020 22:37:56 -0000
Date:   Tue, 6 Oct 2020 17:37:56 -0500
From:   Rob Herring <robh@kernel.org>
To:     Lars Povlsen <lars.povlsen@microchip.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [RESEND PATCH v3 1/3] dt-bindings: pinctrl: Add bindings for
 pinctrl-mchp-sgpio driver
Message-ID: <20201006223756.GA2976904@bogus>
References: <20201006142532.2247515-1-lars.povlsen@microchip.com>
 <20201006142532.2247515-2-lars.povlsen@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201006142532.2247515-2-lars.povlsen@microchip.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 06, 2020 at 04:25:30PM +0200, Lars Povlsen wrote:
> This adds DT bindings for the Microsemi/Microchip SGPIO controller,
> bindings microchip,sparx5-sgpio, mscc,ocelot-sgpio and
> mscc,luton-sgpio.
> 
> Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
> ---
>  .../pinctrl/microchip,sparx5-sgpio.yaml       | 127 ++++++++++++++++++
>  1 file changed, 127 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml b/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
> new file mode 100644
> index 000000000000..e3618ed28165
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
> @@ -0,0 +1,127 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/microchip,sparx5-sgpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microsemi/Microchip Serial GPIO controller
> +
> +maintainers:
> +  - Lars Povlsen <lars.povlsen@microchip.com>
> +
> +description: |
> +  By using a serial interface, the SIO controller significantly extend
> +  the number of available GPIOs with a minimum number of additional
> +  pins on the device. The primary purpose of the SIO controllers is to
> +  connect control signals from SFP modules and to act as an LED
> +  controller.
> +
> +properties:
> +  $nodename:
> +    pattern: "^gpio@[0-9a-f]+$"
> +
> +  compatible:
> +    enum:
> +      - microchip,sparx5-sgpio
> +      - mscc,ocelot-sgpio
> +      - mscc,luton-sgpio
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  microchip,sgpio-port-ranges:
> +    description: This is a sequence of tuples, defining intervals of
> +      enabled ports in the serial input stream. The enabled ports must
> +      match the hardware configuration in order for signals to be
> +      properly written/read to/from the controller holding
> +      registers. Being tuples, then number of arguments must be
> +      even. The tuples mast be ordered (low, high) and are
> +      inclusive. Arguments must be between 0 and 31.
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 2
> +    maxItems: 64
> +
> +  microchip,sgpio-frequency:
> +    description: The sgpio controller frequency (Hz). This dictates
> +      the serial bitstream speed, which again affects the latency in
> +      getting control signals back and forth between external shift
> +      registers. The speed must be no larger than half the system
> +      clock, and larger than zero.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 1
> +    default: 12500000
> +
> +patternProperties:
> +  "^gpio-(port|controller)@[01]$":

gpio@... is correct here as the node is a gpio-controller (no, we're 
not consistent).

> +    type: object
> +    properties:
> +      compatible:
> +        const: microchip,sparx5-sgpio-bank
> +
> +      reg:
> +        maxItems: 1
> +
> +      gpio-controller: true
> +
> +      '#gpio-cells':
> +        const: 3
> +
> +      ngpios:
> +        minimum: 1
> +        maximum: 128
> +
> +    required:
> +      - compatible
> +      - reg
> +      - gpio-controller
> +      - '#gpio-cells'
> +      - ngpios
> +
> +    additionalProperties: false
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - microchip,sgpio-port-ranges
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +examples:
> +  - |
> +    sgpio2: gpio@1101059c {
> +    	#address-cells = <1>;
> +    	#size-cells = <0>;
> +    	compatible = "microchip,sparx5-sgpio";
> +    	clocks = <&sys_clk>;
> +    	pinctrl-0 = <&sgpio2_pins>;
> +    	pinctrl-names = "default";
> +    	reg = <0x1101059c 0x100>;
> +        microchip,sgpio-port-ranges = <0 0 16 18 28 31>;

Since it's tuples, do:

<0 0>, <16 18>, <28 31>

> +        microchip,sgpio-frequency = <25000000>;

Some whitespace issues here.


> +    	sgpio_in2: gpio-controller@0 {
> +            reg = <0>;
> +            compatible = "microchip,sparx5-sgpio-bank";
> +            gpio-controller;
> +            #gpio-cells = <3>;
> +            ngpios = <96>;
> +    	};
> +    	sgpio_out2: gpio-controller@1 {
> +            compatible = "microchip,sparx5-sgpio-bank";
> +            reg = <1>;
> +            gpio-controller;
> +            #gpio-cells = <3>;
> +            ngpios = <96>;
> +    	};
> +    };
> --
> 2.25.1
