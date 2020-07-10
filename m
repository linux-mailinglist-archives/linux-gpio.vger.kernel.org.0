Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57DB321BB25
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2020 18:39:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727065AbgGJQjJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Jul 2020 12:39:09 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:38067 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726942AbgGJQjJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Jul 2020 12:39:09 -0400
Received: by mail-il1-f194.google.com with SMTP id s21so5597632ilk.5;
        Fri, 10 Jul 2020 09:39:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RDEiKXkfuo1LcvNVgxR5JlTZIhsrn+C+Okx9e1+bqZ4=;
        b=saOGHK6ePcEtWiPDOLtNtdnjg/2nnJj61cNnhejzN3MUHDgNVBMyrGoYTZXrKmWqqo
         +CCr0xyjQJMlyTcDXBlSGhIYapCqJOh9p/8mbJCVTX/yJUALX/wFZBR0+i6azcw5c6lZ
         6ERaPuN51phFFg1SKqO0Is69oeoM+n1IZT4eNwM+5SsMjkdqXWWJR4adZ2yIGZ6jfXDW
         L4OI3k7ILbD3Zjdt+l800X/lRFXMsJV4eJWv6jh8a63NCldFE4TMyBg8IH0Bnft9W0uq
         ywwK2UlMpkKSSoAB7r9jW8KSiwfAm5VMOvNd8YdXjmFYjAtnjQ4oqXjaWtolKyjT7Mos
         Bk7w==
X-Gm-Message-State: AOAM5336JHOR/MP8TZaZLUt9VM9tjOqU6k5zdqSe2E82npmZLh1OMaUJ
        KbMI8IMHlKKq8MwAzdD4Ng==
X-Google-Smtp-Source: ABdhPJzLFaHStBCrMtyNEUyaEU9MNoIRNK7UH30HjnsBYGguV8MEdpVyBF9INgKlpdURHNTbgPM9bw==
X-Received: by 2002:a92:5bdd:: with SMTP id c90mr47581679ilg.154.1594399147560;
        Fri, 10 Jul 2020 09:39:07 -0700 (PDT)
Received: from xps15 ([64.188.179.254])
        by smtp.gmail.com with ESMTPSA id y12sm3670759ilm.38.2020.07.10.09.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2020 09:39:07 -0700 (PDT)
Received: (nullmailer pid 2774475 invoked by uid 1000);
        Fri, 10 Jul 2020 16:39:05 -0000
Date:   Fri, 10 Jul 2020 10:39:05 -0600
From:   Rob Herring <robh@kernel.org>
To:     Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc:     linus.walleij@linaro.org, mark.rutland@arm.com,
        matthias.bgg@gmail.com, sean.wang@kernel.org,
        srv_heupstream@mediatek.com, hui.liu@mediatek.com,
        eddie.huang@mediatek.com, chuanjia.liu@mediatek.com,
        biao.huang@mediatek.com, hongzhou.yang@mediatek.com,
        erin.lo@mediatek.com, sean.wang@mediatek.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: pinctrl: mt8192: add binding document
Message-ID: <20200710163905.GA2761779@bogus>
References: <20200710072717.3056-1-zhiyong.tao@mediatek.com>
 <20200710072717.3056-3-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200710072717.3056-3-zhiyong.tao@mediatek.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 10, 2020 at 03:27:16PM +0800, Zhiyong Tao wrote:
> The commit adds mt8192 compatible node in binding document.
> 
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> ---
>  .../bindings/pinctrl/pinctrl-mt8192.yaml      | 170 ++++++++++++++++++
>  1 file changed, 170 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
> new file mode 100644
> index 000000000000..c698b7f65950
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
> @@ -0,0 +1,170 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/pinctrl-mt8192.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek MT8192 Pin Controller
> +
> +maintainers:
> +  - Linus Walleij <linus.walleij@linaro.org>

Should be someone who knows the h/w (Mediatek).

> +
> +description: |
> +  The Mediatek's Pin controller is used to control SoC pins.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8192-pinctrl
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    description:
> +      Number of cells in GPIO specifier. Since the generic GPIO binding is used,
> +      the amount of cells must be specified as 2. See the below
> +      mentioned gpio binding representation for description of particular cells.
> +    const: 2
> +
> +  gpio-ranges:
> +    description: gpio valid number range.
> +    maxItems: 1
> +
> +  reg:
> +    description:
> +      Physical address base for gpio base registers. There are 11 GPIO
> +      physical address base in mt8192.
> +    maxItems: 11
> +
> +  reg-names:
> +    description:
> +      Gpio base register names. There are 11 gpio base register names in mt8192.
> +      They are "iocfg0", "iocfg_rm", "iocfg_bm", "iocfg_bl", "iocfg_br",
> +      "iocfg_lm", "iocfg_lb", "iocfg_rt", "iocfg_lt", "iocfg_tl", "eint".

Should be a schema.

> +    maxItems: 11
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 2
> +
> +  interrupts:
> +    description: The interrupt outputs to sysirq.
> +    maxItems: 1
> +
> +#PIN CONFIGURATION NODES
> +patternProperties:
> +  subnode format:

The child node name is 'subnode format'?

> +    description:
> +      A pinctrl node should contain at least one subnodes representing the
> +      pinctrl groups available on the machine. Each subnode will list the
> +      pins it needs, and how they should be configured, with regard to muxer
> +      configuration, pullups, drive strength, input enable/disable and
> +      input schmitt.
> +
> +      node {
> +        pinmux = <PIN_NUMBER_PINMUX>;
> +        GENERIC_PINCONFIG;
> +      };

If you want to preserve formatting, description needs a literal block 
notation on the end ('|').

> +  '-pinmux$':
> +    description:
> +      Integer array, represents gpio pin number and mux setting.
> +      Supported pin number and mux varies for different SoCs, and are defined
> +      as macros in dt-bindings/pinctrl/<soc>-pinfunc.h directly.
> +    $ref: "/schemas/pinctrl/pincfg-node.yaml"
> +
> +  GENERIC_PINCONFIG:

You just defined a property called 'GENERIC_PINCONFIG'...

> +    description:
> +      It is the generic pinconfig options to use, bias-disable,
> +      bias-pull-down, bias-pull-up, input-enable, input-disable, output-low,
> +      output-high, input-schmitt-enable, input-schmitt-disable
> +      and drive-strength are valid.
> +
> +      Some special pins have extra pull up strength, there are R0 and R1 pull-up
> +      resistors available, but for user, it's only need to set R1R0 as 00, 01,
> +      10 or 11. So It needs config "mediatek,pull-up-adv" or
> +      "mediatek,pull-down-adv" to support arguments for those special pins.
> +      Valid arguments are from 0 to 3.
> +
> +      We can use "mediatek,tdsel" which is an integer describing the steps for
> +      output level shifter duty cycle when asserted (high pulse width adjustment).
> +      Valid arguments  are from 0 to 15.
> +      We can use "mediatek,rdsel" which is an integer describing the steps for
> +      input level shifter duty cycle when asserted (high pulse width adjustment).
> +      Valid arguments are from 0 to 63.
> +
> +      When config drive-strength, it can support some arguments, such as
> +      MTK_DRIVE_4mA, MTK_DRIVE_6mA, etc. See dt-bindings/pinctrl/mt65xx.h.
> +      It can only support 2/4/6/8/10/12/14/16mA in mt8192.
> +      For I2C pins, there are existing generic driving setup and the specific
> +      driving setup. I2C pins can only support 2/4/6/8/10/12/14/16mA driving
> +      adjustment in generic driving setup. But in specific driving setup,
> +      they can support 0.125/0.25/0.5/1mA adjustment. If we enable specific
> +      driving setup for I2C pins, the existing generic driving setup will be
> +      disabled. For some special features, we need the I2C pins specific
> +      driving setup. The specific driving setup is controlled by E1E0EN.
> +      So we need add extra vendor driving preperty instead of
> +      the generic driving property.
> +      We can add "mediatek,drive-strength-adv = <XXX>;" to describe the specific
> +      driving setup property. "XXX" means the value of E1E0EN. EN is 0 or 1.
> +      It is used to enable or disable the specific driving setup.
> +      E1E0 is used to describe the detail strength specification of the I2C pin.
> +      When E1=0/E0=0, the strength is 0.125mA.
> +      When E1=0/E0=1, the strength is 0.25mA.
> +      When E1=1/E0=0, the strength is 0.5mA.
> +      When E1=1/E0=1, the strength is 1mA.
> +      So the valid arguments of "mediatek,drive-strength-adv" are from 0 to 7.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-controller
> +  - '#interrupt-cells'
> +  - gpio-controller
> +  - '#gpio-cells'
> +  - gpio-ranges
> +
> +examples:
> +  - |
> +            #include <dt-bindings/pinctrl/mt8192-pinfunc.h>
> +            #include <dt-bindings/interrupt-controller/arm-gic.h>
> +            pio: pinctrl@10005000 {

Drop unused labels.

> +                    compatible = "mediatek,mt8192-pinctrl";
> +                    reg = <0 0x10005000 0 0x1000>,
> +                          <0 0x11c20000 0 0x1000>,
> +                          <0 0x11d10000 0 0x1000>,
> +                          <0 0x11d30000 0 0x1000>,
> +                          <0 0x11d40000 0 0x1000>,
> +                          <0 0x11e20000 0 0x1000>,
> +                          <0 0x11e70000 0 0x1000>,
> +                          <0 0x11ea0000 0 0x1000>,
> +                          <0 0x11f20000 0 0x1000>,
> +                          <0 0x11f30000 0 0x1000>,
> +                          <0 0x1000b000 0 0x1000>;
> +                    reg-names = "iocfg0", "iocfg_rm", "iocfg_bm",
> +                          "iocfg_bl", "iocfg_br", "iocfg_lm",
> +                          "iocfg_lb", "iocfg_rt", "iocfg_lt",
> +                          "iocfg_tl", "eint";
> +                    gpio-controller;
> +                    #gpio-cells = <2>;
> +                    gpio-ranges = <&pio 0 0 220>;
> +                    interrupt-controller;
> +                    interrupts = <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH 0>;
> +                    #interrupt-cells = <2>;
> +                    i2c0_pins_a: i2c0 {

Doesn't match the schema.

> +                        pins {

Doesn't match the schema. Why do you need 2 levels of nodes here?

> +                                pinmux = <PINMUX_GPIO118__FUNC_SCL1>,
> +                                         <PINMUX_GPIO119__FUNC_SDA1>;
> +                                mediatek,pull-up-adv = <3>;
> +                                mediatek,drive-strength-adv = <7>;
> +                        };
> +                    };
> +                    i2c1_pins_a: i2c1 {
> +                        pins {
> +                                pinmux = <PINMUX_GPIO141__FUNC_SCL2>,
> +                                         <PINMUX_GPIO142__FUNC_SDA2>;
> +                                mediatek,pull-down-adv = <2>;
> +                                mediatek,drive-strength-adv = <4>;
> +                       };
> +                   };
> +            };
> -- 
> 2.18.0
