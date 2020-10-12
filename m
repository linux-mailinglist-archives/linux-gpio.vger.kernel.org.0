Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A601A28C015
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Oct 2020 20:55:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726863AbgJLSzl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Oct 2020 14:55:41 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:45822 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727115AbgJLSzk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Oct 2020 14:55:40 -0400
Received: by mail-ot1-f65.google.com with SMTP id f37so16707920otf.12;
        Mon, 12 Oct 2020 11:55:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5fVAIseMnsnT90XiyJbBgJRxx/Jq3jfkvLK/AZmt1dA=;
        b=KHyMCiFYwBeALZdmJtVGrOwR5U3I8xhmLFSUQ9ghA+qoZHiKqocz6YMj5ktUKly4Wa
         o4bMm+EsNkzRUg5k1oc4PWyARqdA3+0QuY4uEnRKnXmfppmjRQl2u5VfqRH3KI+JUeo8
         kUvs/GzofI8ikDnJZl6rQPhTcdni0ORN1xMRDp0Cv26wNwUD6I755O44GGjYdL2Azddd
         JJCrRTQoPkL0/ORg+1yvUztphTk4zlkn0Ox19zydt+A3w2cz6DpXv2IsImOVCWqlF6jq
         ylBN6Th7QJu8bIA6XcXiz3KulOSMK2x+VJLxT89Wj5EgektYrUZlo8wfgx2J9jdapAWK
         4QAA==
X-Gm-Message-State: AOAM532I9J4gitktkrWh6xiM2+ZSekYt3hy0ZfJiaynaUINCflYbbG46
        I258ENHO5QiYHNQQL0oTgw==
X-Google-Smtp-Source: ABdhPJzXa+bi5zHTxRpC5b5rVaVCpYGUmlSihkflVQ6s/QzKOgruDIXUaHqEfwygdXx8vVrJr2nTdA==
X-Received: by 2002:a05:6830:2092:: with SMTP id y18mr18910537otq.19.1602528939283;
        Mon, 12 Oct 2020 11:55:39 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y194sm9979533oie.22.2020.10.12.11.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2020 11:55:38 -0700 (PDT)
Received: (nullmailer pid 1905660 invoked by uid 1000);
        Mon, 12 Oct 2020 18:55:37 -0000
Date:   Mon, 12 Oct 2020 13:55:37 -0500
From:   Rob Herring <robh@kernel.org>
To:     Lars Povlsen <lars.povlsen@microchip.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: pinctrl: Add bindings for
 pinctrl-microchip-sgpio driver
Message-ID: <20201012185537.GA1898766@bogus>
References: <20201008130515.2385825-1-lars.povlsen@microchip.com>
 <20201008130515.2385825-2-lars.povlsen@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201008130515.2385825-2-lars.povlsen@microchip.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 08, 2020 at 03:05:13PM +0200, Lars Povlsen wrote:
> This adds DT bindings for the Microsemi/Microchip SGPIO controller,
> bindings microchip,sparx5-sgpio, mscc,ocelot-sgpio and
> mscc,luton-sgpio.
> 
> Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
> ---
>  .../pinctrl/microchip,sparx5-sgpio.yaml       | 140 ++++++++++++++++++
>  1 file changed, 140 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml b/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
> new file mode 100644
> index 000000000000..fc41495800ed
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
> @@ -0,0 +1,140 @@
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
> +      inclusive.
> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +    items:
> +      items:
> +        - description: |
> +            "low" indicates start bit number of range
> +          minimum: 0
> +          maximum: 31
> +        - description: |
> +            "high" indicates end bit number of range
> +          minimum: 0
> +          maximum: 31
> +    minItems: 1
> +    maxItems: 32
> +
> +  microchip,sgpio-frequency:
> +    description: The sgpio controller frequency (Hz). This dictates
> +      the serial bitstream speed, which again affects the latency in
> +      getting control signals back and forth between external shift
> +      registers. The speed must be no larger than half the system
> +      clock, and larger than zero.
> +    $ref: /schemas/types.yaml#/definitions/uint32

Perhaps use 'bus-frequency' here. If not, needs unit suffix. Either way, 
you can drop the type in those cases. 

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

> +    minimum: 1
> +    default: 12500000
> +
> +patternProperties:
> +  "^gpio@[0-1]$":
> +    type: object
> +    properties:
> +      compatible:
> +        const: microchip,sparx5-sgpio-bank
> +
> +      reg:
> +        description: |
> +          The GPIO bank number. "0" is designates the input pin bank,
> +          "1" the output bank.
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
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      compatible = "microchip,sparx5-sgpio";
> +      clocks = <&sys_clk>;
> +      pinctrl-0 = <&sgpio2_pins>;
> +      pinctrl-names = "default";
> +      reg = <0x1101059c 0x100>;
> +      microchip,sgpio-port-ranges = <0 0>, <16 18>, <28 31>;
> +      microchip,sgpio-frequency = <25000000>;
> +      sgpio_in2: gpio@0 {
> +        reg = <0>;
> +        compatible = "microchip,sparx5-sgpio-bank";
> +        gpio-controller;
> +        #gpio-cells = <3>;
> +        ngpios = <96>;
> +      };
> +      sgpio_out2: gpio@1 {
> +        compatible = "microchip,sparx5-sgpio-bank";
> +        reg = <1>;
> +        gpio-controller;
> +        #gpio-cells = <3>;
> +        ngpios = <96>;
> +      };
> +    };
> --
> 2.25.1
