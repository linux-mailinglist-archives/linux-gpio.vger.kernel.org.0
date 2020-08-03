Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34EE523AFC3
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Aug 2020 23:47:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728708AbgHCVq7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Aug 2020 17:46:59 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:43675 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728038AbgHCVq7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Aug 2020 17:46:59 -0400
Received: by mail-il1-f194.google.com with SMTP id y18so24004856ilp.10;
        Mon, 03 Aug 2020 14:46:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pqP+dO+lvU2cpGzu3ZlIh3GwibVErSRm3PLKdLit8xM=;
        b=qUfL1cnu0j/j55yZ+WxOJHB4pJLnj9mFezMeNt3TLkYQl0N6T3/AacDfX2LEogCPVp
         VOYDSCkA7rZGgkH+CA7qXKwJh7KuTiNtWFlp/eoudQgMkvwvFKGLzbqVXBkCvCF2gVE6
         ruGTj/JHD9DUuikSoZLhciEqC5YP2/7Tr5I0ofNZZU5dENad41JFEHGKPP+4YRW8GFDC
         TcvHiNrZXvet7FbdXDWjtRmzR06UHtewGOv1qyqP2hhRuzsrZC2o5uadUmAk0pulIl8W
         ua07BZ13J7SGa0blJJqwRNAf0Phf81WsrA9c1XzdXCAFhlaEIhzwlNPkOo4Yd8VZbjdv
         tFFg==
X-Gm-Message-State: AOAM530LC/BMkwGIt533cLscWzYJNPyhsYFoGZgSHkbvXw7dnyEjgd6T
        NVlOAwXeplxYIB8toaAI7w==
X-Google-Smtp-Source: ABdhPJyIFlqliaMIlzgK+a5Y0a5XoSIdsh5mf4RHk11U0+xbSeeG1cJIq99uvPwTEu3X8pYVmltwfQ==
X-Received: by 2002:a92:6a07:: with SMTP id f7mr1525064ilc.271.1596491217938;
        Mon, 03 Aug 2020 14:46:57 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id q1sm10823790ioh.0.2020.08.03.14.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2020 14:46:57 -0700 (PDT)
Received: (nullmailer pid 3193370 invoked by uid 1000);
        Mon, 03 Aug 2020 21:46:55 -0000
Date:   Mon, 3 Aug 2020 15:46:55 -0600
From:   Rob Herring <robh@kernel.org>
To:     Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc:     linus.walleij@linaro.org, mark.rutland@arm.com,
        matthias.bgg@gmail.com, sean.wang@kernel.org,
        srv_heupstream@mediatek.com, hui.liu@mediatek.com,
        eddie.huang@mediatek.com, chuanjia.liu@mediatek.com,
        biao.huang@mediatek.com, hongzhou.yang@mediatek.com,
        erin.lo@mediatek.com, sean.wang@mediatek.com,
        sj.huang@mediatek.com, seiya.wang@mediatek.com,
        jg_poxu@mediatek.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: pinctrl: mt8192: add binding document
Message-ID: <20200803214655.GB3184946@bogus>
References: <20200801043303.32149-1-zhiyong.tao@mediatek.com>
 <20200801043303.32149-3-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200801043303.32149-3-zhiyong.tao@mediatek.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Aug 01, 2020 at 12:33:02PM +0800, Zhiyong Tao wrote:
> The commit adds mt8192 compatible node in binding document.
> 
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> ---
>  .../bindings/pinctrl/pinctrl-mt8192.yaml      | 175 ++++++++++++++++++
>  1 file changed, 175 insertions(+)
>  create mode 100755 Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
> new file mode 100755
> index 000000000000..88e18e2e23a0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
> @@ -0,0 +1,175 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/pinctrl-mt8192.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek MT8192 Pin Controller
> +
> +maintainers:
> +  - Sean Wang <sean.wang@mediatek.com>
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
> +    description: |
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
> +    description: |
> +      Physical address base for gpio base registers. There are 11 GPIO
> +      physical address base in mt8192.
> +    maxItems: 11
> +
> +  reg-names:
> +    description: |
> +      Gpio base register names.
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
> +  '^pins':
> +    type: object
> +    description: |
> +      A pinctrl node should contain at least one subnodes representing the
> +      pinctrl groups available on the machine. Each subnode will list the
> +      pins it needs, and how they should be configured, with regard to muxer
> +      configuration, pullups, drive strength, input enable/disable and
> +      input schmitt.
> +      An example of using macro:
> +      node {

'node' doesn't match '^pins' regex.

Better to put an example in the actual example so it is checked.

> +        pinmux = <PIN_NUMBER_PINMUX>;
> +        GENERIC_PINCONFIG;
> +      };
> +    properties:
> +      pinmux:
> +        $ref: "/schemas/types.yaml#/definitions/uint32-array"

Already a common definition in pinmux-node.yaml. Reference that file in 
'^pins'.

> +        description: |
> +          Integer array, represents gpio pin number and mux setting.
> +          Supported pin number and mux varies for different SoCs, and are defined
> +          as macros in dt-bindings/pinctrl/<soc>-pinfunc.h directly.
> +
> +      GENERIC_PINCONFIG:

That's not a property name.

> +        description: |
> +          It is the generic pinconfig options to use, bias-disable,
> +          bias-pull-down, bias-pull-up, input-enable, input-disable, output-low,
> +          output-high, input-schmitt-enable, input-schmitt-disable
> +          and drive-strength are valid.
> +
> +          Some special pins have extra pull up strength, there are R0 and R1 pull-up
> +          resistors available, but for user, it's only need to set R1R0 as 00, 01,
> +          10 or 11. So It needs config "mediatek,pull-up-adv" or
> +          "mediatek,pull-down-adv" to support arguments for those special pins.
> +          Valid arguments are from 0 to 3.
> +
> +          We can use "mediatek,tdsel" which is an integer describing the steps for
> +          output level shifter duty cycle when asserted (high pulse width adjustment).
> +          Valid arguments  are from 0 to 15.
> +          We can use "mediatek,rdsel" which is an integer describing the steps for
> +          input level shifter duty cycle when asserted (high pulse width adjustment).
> +          Valid arguments are from 0 to 63.
> +
> +          When config drive-strength, it can support some arguments, such as
> +          MTK_DRIVE_4mA, MTK_DRIVE_6mA, etc. See dt-bindings/pinctrl/mt65xx.h.
> +          It can only support 2/4/6/8/10/12/14/16mA in mt8192.
> +          For I2C pins, there are existing generic driving setup and the specific
> +          driving setup. I2C pins can only support 2/4/6/8/10/12/14/16mA driving
> +          adjustment in generic driving setup. But in specific driving setup,
> +          they can support 0.125/0.25/0.5/1mA adjustment. If we enable specific
> +          driving setup for I2C pins, the existing generic driving setup will be
> +          disabled. For some special features, we need the I2C pins specific
> +          driving setup. The specific driving setup is controlled by E1E0EN.
> +          So we need add extra vendor driving preperty instead of
> +          the generic driving property.
> +          We can add "mediatek,drive-strength-adv = <XXX>;" to describe the specific
> +          driving setup property. "XXX" means the value of E1E0EN. EN is 0 or 1.
> +          It is used to enable or disable the specific driving setup.
> +          E1E0 is used to describe the detail strength specification of the I2C pin.
> +          When E1=0/E0=0, the strength is 0.125mA.
> +          When E1=0/E0=1, the strength is 0.25mA.
> +          When E1=1/E0=0, the strength is 0.5mA.
> +          When E1=1/E0=1, the strength is 1mA.
> +          So the valid arguments of "mediatek,drive-strength-adv" are from 0 to 7.
> +
> +      bias-pull-down: true
> +
> +      bias-pull-up: true
> +
> +      bias-disable: true
> +
> +      output-high: true
> +
> +      output-low: true
> +
> +      input-enable: true
> +
> +      input-disable: true
> +
> +      input-schmitt-enable: true
> +
> +      input-schmitt-disable: true
> +
> +    required:
> +      - pinmux
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

additionalProperties: false

> +
> +examples:
> +  - |
> +            #include <dt-bindings/pinctrl/mt8192-pinfunc.h>
> +            #include <dt-bindings/interrupt-controller/arm-gic.h>
> +            pio: pinctrl@10005000 {
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
> +            };
> -- 
> 2.18.0
