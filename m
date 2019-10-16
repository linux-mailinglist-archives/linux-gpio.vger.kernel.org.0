Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB796D9401
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2019 16:37:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404558AbfJPOhS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Oct 2019 10:37:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:58784 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404554AbfJPOhS (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 16 Oct 2019 10:37:18 -0400
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7ED7E21928;
        Wed, 16 Oct 2019 14:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571236636;
        bh=X2GehGlKpD9lRul9sZZxg3YDBY4r/SNmAqq/G02/MsQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=J1zh27+Wuj86qP5t/cSHiHmrE5j+2/EKO8vshMsJZPdM/ziHaE3jaCnTRaDXBhvkZ
         MB1rQEJqznAMIe9l86vXn5MIpatne/SAGyhuQnQtZwZqWIrrmbVp12PHPGTO2V041B
         5uOJdPxU7yc9pA3whm6AzKqbq1228ocbP10nCV3c=
Received: by mail-qt1-f173.google.com with SMTP id n17so17049740qtr.4;
        Wed, 16 Oct 2019 07:37:16 -0700 (PDT)
X-Gm-Message-State: APjAAAV1S9olT1mspC3R4sOGsgspc5E6FX//ssg+fgUkyNEEujwQGQSU
        5KCgXHi4GOJq79fDkxAjVzTaID2mPbIFd8+P4w==
X-Google-Smtp-Source: APXvYqzhDBYQpZpTKTkGucI5uSlDTKGSsILvDTFcMjUBxyh7iwqlJescRQev3Ye7KywOInTZhaOJbRKBkZidndcMh9k=
X-Received: by 2002:ac8:6782:: with SMTP id b2mr45137956qtp.143.1571236635546;
 Wed, 16 Oct 2019 07:37:15 -0700 (PDT)
MIME-Version: 1.0
References: <20191016141644.81210-1-mripard@kernel.org>
In-Reply-To: <20191016141644.81210-1-mripard@kernel.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 16 Oct 2019 09:37:03 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLXDp_fHH9yL0KO-C1YsmNvxb6nOSJ3fcW-KM3zTW1WYQ@mail.gmail.com>
Message-ID: <CAL_JsqLXDp_fHH9yL0KO-C1YsmNvxb6nOSJ3fcW-KM3zTW1WYQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: Convert Allwinner Pin Controller to
 a schema
To:     Maxime Ripard <mripard@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 16, 2019 at 9:16 AM Maxime Ripard <mripard@kernel.org> wrote:
>
> The Allwinner SoCs have a pin controller supported in Linux, with a
> matching Device Tree binding.
>
> Now that we have the DT validation in place, let's convert the device tree
> bindings for that controller over to a YAML schemas.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml  | 239 ++++++++++++++++++
>  .../pinctrl/allwinner,sunxi-pinctrl.txt       | 164 ------------
>  2 files changed, 239 insertions(+), 164 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
> new file mode 100644
> index 000000000000..11edbbc5c1d2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
> @@ -0,0 +1,239 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/allwinner,sun4i-a10-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Allwinner A10 Pin Controller Device Tree Bindings
> +
> +maintainers:
> +  - Chen-Yu Tsai <wens@csie.org>
> +  - Maxime Ripard <maxime.ripard@bootlin.com>
> +
> +properties:
> +  "#gpio-cells":
> +    const: 3
> +    description:
> +      GPIO consumers must use three arguments, first the number of the
> +      bank, then the pin number inside that bank, and finally the GPIO
> +      flags.
> +
> +  "#interrupt-cells":
> +    const: 3
> +    description:
> +      Interrupts consumers must use three arguments, first the number
> +      of the bank, then the pin number inside that bank, and finally
> +      the interrupts flags.
> +
> +  compatible:
> +    enum:
> +      - allwinner,sun4i-a10-pinctrl
> +      - allwinner,sun5i-a10s-pinctrl
> +      - allwinner,sun5i-a13-pinctrl
> +      - allwinner,sun6i-a31-pinctrl
> +      - allwinner,sun6i-a31-r-pinctrl
> +      - allwinner,sun6i-a31s-pinctrl
> +      - allwinner,sun7i-a20-pinctrl
> +      - allwinner,sun8i-a23-pinctrl
> +      - allwinner,sun8i-a23-r-pinctrl
> +      - allwinner,sun8i-a33-pinctrl
> +      - allwinner,sun8i-a83t-pinctrl
> +      - allwinner,sun8i-a83t-r-pinctrl
> +      - allwinner,sun8i-h3-pinctrl
> +      - allwinner,sun8i-h3-r-pinctrl
> +      - allwinner,sun8i-r40-pinctrl
> +      - allwinner,sun8i-v3-pinctrl
> +      - allwinner,sun8i-v3s-pinctrl
> +      - allwinner,sun9i-a80-pinctrl
> +      - allwinner,sun9i-a80-r-pinctrl
> +      - allwinner,sun50i-a64-pinctrl
> +      - allwinner,sun50i-a64-r-pinctrl
> +      - allwinner,sun50i-h5-pinctrl
> +      - allwinner,sun50i-h6-pinctrl
> +      - allwinner,sun50i-h6-r-pinctrl
> +      - allwinner,suniv-f1c100s-pinctrl
> +      - nextthing,gr8-pinctrl
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    minItems: 1
> +    maxItems: 5

This probably warrants a description.

> +
> +  clocks:
> +    items:
> +      - description: Bus Clock
> +      - description: High Frequency Oscillator
> +      - description: Low Frequency Oscillator
> +
> +  clock-names:
> +    items:
> +      - const: apb
> +      - const: hosc
> +      - const: losc
> +
> +  resets:
> +    maxItems: 1
> +
> +  gpio-controller: true
> +  interrupt-controller: true
> +  gpio-line-names: true
> +
> +  input-debounce:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description:
> +      Debouncing periods in microseconds, one period per interrupt
> +      bank found in the controller

Don't you know the max # of interrupt banks?

> +
> +patternProperties:
> +  # It's pretty scary, but the basic idea is that:
> +  #   - One node name can start with either s- or r- for PRCM nodes,
> +  #   - Then, the name itself can be any repetition of <string>- (to
> +  #     accomodate with nodes like uart4-rts-cts-pins), where each
> +  #     string can be either starting with 'p' but in a string longer
> +  #     than 3, or something that doesn't start with 'p',
> +  #   - Then, the bank name is optional and will be between pa and pg,
> +  #     pl or pm. Some pins groups that have several options will have
> +  #     the pin numbers then,
> +  #   - Finally, the name will end with either -pin or pins.
> +
> +  "^([rs]-)?(([a-z0-9]{3,}|[a-oq-z][a-z0-9]*?)?-)+?(p[a-ilm][0-9]*?-)??pins?$":
> +    type: object
> +
> +    properties:
> +      pins: true
> +      function: true
> +      bias-disable: true
> +      bias-pull-up: true
> +      bias-pull-down: true
> +
> +      drive-strength:
> +        allOf:
> +          - $ref: /schemas/types.yaml#/definitions/uint32
> +          - enum: [ 10, 20, 30, 40 ]
> +
> +    required:
> +      - pins
> +      - function
> +
> +    additionalProperties: false
> +
> +  "^vcc-p[a-hlm]-supply$":
> +    $ref: /schemas/types.yaml#/definitions/phandle

You can drop this as *-supply is defined already.

> +    description:
> +      Regulators used by the framebuffer. These should be named

framebuffer?

> +      according to the names in the device design.
> +
> +required:
> +  - "#gpio-cells"
> +  - "#interrupt-cells"
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - gpio-controller
> +  - interrupt-controller
> +
> +allOf:
> +  # FIXME: We should have the pin bank supplies here, but not a lot of
> +  # boards are defining it at the moment so it would generate a lot of
> +  # warnings.
> +
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - allwinner,sun9i-a80-pinctrl
> +
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 5
> +          maxItems: 5
> +
> +    else:
> +      if:
> +        properties:
> +          compatible:
> +            enum:
> +              - allwinner,sun6i-a31-pinctrl
> +              - allwinner,sun6i-a31s-pinctrl
> +              - allwinner,sun50i-h6-pinctrl
> +
> +      then:
> +        properties:
> +          interrupts:
> +            minItems: 4
> +            maxItems: 4
> +
> +      else:
> +        if:

json-schema needs an 'elif' to avoid this increasing indent...

> +          properties:
> +            compatible:
> +              enum:
> +                - allwinner,sun8i-a23-pinctrl
> +                - allwinner,sun8i-a83t-pinctrl
> +                - allwinner,sun50i-a64-pinctrl
> +                - allwinner,sun50i-h5-pinctrl
> +                - allwinner,suniv-f1c100s-pinctrl
> +
> +        then:
> +          properties:
> +            interrupts:
> +              minItems: 3
> +              maxItems: 3
> +
> +        else:
> +          if:
> +            properties:
> +              compatible:
> +                enum:
> +                  - allwinner,sun6i-a31-r-pinctrl
> +                  - allwinner,sun8i-a33-pinctrl
> +                  - allwinner,sun8i-h3-pinctrl
> +                  - allwinner,sun8i-v3-pinctrl
> +                  - allwinner,sun8i-v3s-pinctrl
> +                  - allwinner,sun9i-a80-r-pinctrl
> +                  - allwinner,sun50i-h6-r-pinctrl
> +
> +          then:
> +            properties:
> +              interrupts:
> +                minItems: 2
> +                maxItems: 2
> +
> +          else:
> +            properties:
> +              interrupts:
> +                minItems: 1
> +                maxItems: 1
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/sun5i-ccu.h>
> +
> +    pio: pinctrl@1c20800 {
> +        compatible = "allwinner,sun5i-a13-pinctrl";
> +        reg = <0x01c20800 0x400>;
> +        interrupts = <28>;
> +        clocks = <&ccu CLK_APB0_PIO>, <&osc24M>, <&osc32k>;
> +        clock-names = "apb", "hosc", "losc";
> +        gpio-controller;
> +        interrupt-controller;
> +        #interrupt-cells = <3>;
> +        #gpio-cells = <3>;
> +
> +        uart1_pe_pins: uart1-pe-pins {
> +            pins = "PE10", "PE11";
> +            function = "uart1";
> +        };
> +
> +        uart1_pg_pins: uart1-pg-pins {
> +            pins = "PG3", "PG4";
> +            function = "uart1";
> +        };
> +    };
