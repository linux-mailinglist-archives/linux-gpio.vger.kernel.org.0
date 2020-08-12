Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62F46242F8F
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Aug 2020 21:48:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726547AbgHLTr7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Aug 2020 15:47:59 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:32913 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726542AbgHLTr7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Aug 2020 15:47:59 -0400
Received: by mail-il1-f194.google.com with SMTP id p16so3099822ile.0;
        Wed, 12 Aug 2020 12:47:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xl+iy8zYM0BPv+UpGDpwADGR9SiXZB2fIxAe24Tgxt8=;
        b=Wr7rsdNcrD47+u5UJidQVNt2OaZa1LmOEC4wuUb71n3HaJkEWAeZfFNhBr0fxpZsLD
         SxlpfD0zs2jdYu+TMx5v7XWlSFYI7pwwphFzK/L4pJLqJnVL1h3aEXCVxszAKubVhNXQ
         SoIRgESPlpacAfjBDWi2Z0iUdxQa43t65XZQ5fyA9UpWuh69L/cZBh5UN6hPMQSvx2Bh
         3up09RHplSYBz1B5MFKnmO/ENELiiGrFd5P76o+IMu8gXJ/58odl+VSk8au25U/XSeRI
         1y3LeDEdnwyNoPNp9IRr89YXl7ez0QSKjOdZDkHo0rWjrnizleIWdZXd7d4wOBPR6yTG
         e4yg==
X-Gm-Message-State: AOAM533FM+qGd1SvS6wUfGrq39/UnG2BO5YEi6q4orZZQru4ar7Z/ydI
        z/MALIxa3YNzsKYVowfNfg==
X-Google-Smtp-Source: ABdhPJw9tOye4ZcCS+R8VoihyiXoUuSKU/XScBRnVpWr94EG1RJNk/UEmloEmf2stQ4SVU9lKuJZ9w==
X-Received: by 2002:a92:4989:: with SMTP id k9mr1292913ilg.177.1597261677688;
        Wed, 12 Aug 2020 12:47:57 -0700 (PDT)
Received: from xps15 ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id e23sm1465234iot.28.2020.08.12.12.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 12:47:57 -0700 (PDT)
Received: (nullmailer pid 2592074 invoked by uid 1000);
        Wed, 12 Aug 2020 19:47:54 -0000
Date:   Wed, 12 Aug 2020 13:47:54 -0600
From:   Rob Herring <robh@kernel.org>
To:     Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc:     linus.walleij@linaro.org, mark.rutland@arm.com,
        matthias.bgg@gmail.com, sean.wang@kernel.org,
        srv_heupstream@mediatek.com, hui.liu@mediatek.com,
        eddie.huang@mediatek.com, chuanjia.liu@mediatek.com,
        biao.huang@mediatek.com, hongzhou.yang@mediatek.com,
        erin.lo@mediatek.com, sean.wang@mediatek.com,
        sj.huang@mediatek.com, seiya.wang@mediatek.com,
        jg_poxu@mediatek.com, sin_jieyang@mediatek.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 2/3] dt-bindings: pinctrl: mt8192: add binding document
Message-ID: <20200812194754.GA2587643@bogus>
References: <20200807074905.23468-1-zhiyong.tao@mediatek.com>
 <20200807074905.23468-3-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200807074905.23468-3-zhiyong.tao@mediatek.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 07, 2020 at 03:49:04PM +0800, Zhiyong Tao wrote:
> The commit adds mt8192 compatible node in binding document.
> 
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> ---
>  .../bindings/pinctrl/pinctrl-mt8192.yaml      | 149 ++++++++++++++++++
>  1 file changed, 149 insertions(+)
>  create mode 100755 Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml

Don't set execute permission.

> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
> new file mode 100755
> index 000000000000..3b46bbfa38ec
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
> @@ -0,0 +1,149 @@
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
> +      pincontroller {
> +        /* GPIO0 set as multifunction GPIO0 */
> +        state_0_node_a {
> +          pinmux = <PINMUX_GPIO0__FUNC_GPIO0>;
> +        };
> +        /* GPIO1 set as multifunction PWM */
> +        state_0_node_a {
> +          pinmux = <PINMUX_GPIO1__FUNC_PWM_1>;
> +        };
> +      };
> +    properties:
> +      pinmux:
> +        $ref: "pinmux-node.yaml"

This is at the wrong level. Should be under '^pins'.

> +        description: |
> +          Integer array, represents gpio pin number and mux setting.
> +          Supported pin number and mux varies for different SoCs, and are defined
> +          as macros in dt-bindings/pinctrl/<soc>-pinfunc.h directly.
> +
> +      drive-strength:
> +        description: |
> +          It can support some arguments, such as MTK_DRIVE_4mA, MTK_DRIVE_6mA, etc. See
> +          dt-bindings/pinctrl/mt65xx.h. It can only support 2/4/6/8/10/12/14/16mA in mt8192.
> +        enum: [2, 4, 6, 8, 10, 12, 14, 16]
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
> +    additionalProperties:  false
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
> +additionalProperties: false
> +
> +examples:
> +  - |
> +            #include <dt-bindings/pinctrl/mt8192-pinfunc.h>
> +            #include <dt-bindings/interrupt-controller/arm-gic.h>
> +            pio: pinctrl@10005000 {
> +                    compatible = "mediatek,mt8192-pinctrl";
> +                    reg = <0x10005000 0x1000>,
> +                          <0x11c20000 0x1000>,
> +                          <0x11d10000 0x1000>,
> +                          <0x11d30000 0x1000>,
> +                          <0x11d40000 0x1000>,
> +                          <0x11e20000 0x1000>,
> +                          <0x11e70000 0x1000>,
> +                          <0x11ea0000 0x1000>,
> +                          <0x11f20000 0x1000>,
> +                          <0x11f30000 0x1000>,
> +                          <0x1000b000 0x1000>;
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

Would be good to have a pin node here so you can test you've got the 
schema correct.

> +            };
> -- 
> 2.18.0
