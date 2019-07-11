Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5763165E5A
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jul 2019 19:18:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728737AbfGKRSR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Jul 2019 13:18:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:58734 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728549AbfGKRSR (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 11 Jul 2019 13:18:17 -0400
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1967A216C8;
        Thu, 11 Jul 2019 17:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1562865496;
        bh=XoG0PrO159RtOOT6fP2sFpZA54IyqITi3iqq/2tn5rg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=tlXo1DePP59eQcvth0n1dwI8IIqCnPckx/sEigfDSlpyeOwiHTy4KXunBJ+22zQQ9
         1q38/0bxCmNiufaO+97lUwAx5UkuEtTNHxiPz9ppN81LDA9Qo0UaR0YHKDgr3CTxdF
         Bzqzej4pdz06tQjZmcdh9/xcYkkYFzp98+YRyA+8=
Received: by mail-qt1-f178.google.com with SMTP id r6so911563qtt.0;
        Thu, 11 Jul 2019 10:18:16 -0700 (PDT)
X-Gm-Message-State: APjAAAWY74qVNIDjDwTB1WVW/YK7L/RvjYnRTIGIsdiveGY4jHUo3VZn
        nvZbmBIF43cez1kWOJBlZE/cnv3t4uMYu5Nc8A==
X-Google-Smtp-Source: APXvYqzxvypz6pY/DnP3GoyHHz/HAyb8X4uqpv/6KJUGr3o+YFaNGwIoSXWHesk4P656OBctJrbTqkzroQ5B6v8eLrc=
X-Received: by 2002:ac8:3908:: with SMTP id s8mr2646300qtb.224.1562865495201;
 Thu, 11 Jul 2019 10:18:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190711041942.23202-1-andrew@aj.id.au> <20190711041942.23202-2-andrew@aj.id.au>
In-Reply-To: <20190711041942.23202-2-andrew@aj.id.au>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Thu, 11 Jul 2019 11:18:01 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLvY_yxN=-tfUPGn_Bv=UNmntHjXqUhSD1aey79MXznQg@mail.gmail.com>
Message-ID: <CAL_JsqLvY_yxN=-tfUPGn_Bv=UNmntHjXqUhSD1aey79MXznQg@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: pinctrl: aspeed: Document AST2600 pinmux
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Joel Stanley <joel@jms.id.au>,
        Ryan Chen <ryanchen.aspeed@gmail.com>,
        Johnny Huang <johnny_huang@aspeedtech.com>,
        linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 10, 2019 at 10:19 PM Andrew Jeffery <andrew@aj.id.au> wrote:
>
> The AST260 differs from the 2400 and 2500 in that it supports multiple
> groups for a subset of functions.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  .../pinctrl/aspeed,ast2600-pinctrl.yaml       | 128 ++++++++++++++++++
>  1 file changed, 128 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
> new file mode 100644
> index 000000000000..dd31f8e62433
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
> @@ -0,0 +1,128 @@
> +# SPDX-License-Identifier: GPL-2.0+
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/aspeed,ast2600-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ASPEED AST2600 Pin Controller
> +
> +maintainers:
> +  - Andrew Jeffery <andrew@aj.id.au>
> +
> +description: |+
> +  The pin controller node should be the child of a syscon node with the
> +  required property:
> +
> +  - compatible: Should be one of the following:
> +                "aspeed,ast2600-scu", "syscon", "simple-mfd"
> +
> +  Refer to the the bindings described in
> +  Documentation/devicetree/bindings/mfd/syscon.txt
> +
> +properties:
> +  compatible:
> +    const: aspeed,ast2600-pinctrl
> +
> +patternProperties:
> +  '^.*$':
> +    if:
> +      type: object
> +    then:
> +      patternProperties:
> +        "^function$":

That's a fixed string, not a pattern, so just put under 'properties'.

> +          allOf:
> +            - $ref: "/schemas/types.yaml#/definitions/string"
> +            - enum: [ "ADC0", "ADC1", "ADC10", "ADC11", "ADC12", "ADC13",

You can drop the quoting here. I wouldn't really care, but yours is
one of the few right now and everyone will copy.

> +              "ADC14", "ADC15", "ADC2", "ADC3", "ADC4", "ADC5", "ADC6", "ADC7",
> +              "ADC8", "ADC9", "BMCINT", "ESPI", "ESPIALT", "FSI1", "FSI2",
> +              "FWSPIABR", "FWSPID", "FWSPIWP", "GPIT0", "GPIT1", "GPIT2",
> +              "GPIT3", "GPIT4", "GPIT5", "GPIT6", "GPIT7", "GPIU0", "GPIU1",
> +              "GPIU2", "GPIU3", "GPIU4", "GPIU5", "GPIU6", "GPIU7", "I2C1",
> +              "I2C10", "I2C11", "I2C12", "I2C13", "I2C14", "I2C15", "I2C16",
> +              "I2C2", "I2C3", "I2C4", "I2C5", "I2C6", "I2C7", "I2C8", "I2C9",
> +              "I3C3", "I3C4", "I3C5", "I3C6", "JTAGM", "LHPD", "LHSIRQ", "LPC",
> +              "LPCHC", "LPCPD", "LPCPME", "LPCSMI", "LSIRQ", "MACLINK1",
> +              "MACLINK2", "MACLINK3", "MACLINK4", "MDIO1", "MDIO2", "MDIO3",
> +              "MDIO4", "NCTS1", "NCTS2", "NCTS3", "NCTS4", "NDCD1", "NDCD2",
> +              "NDCD3", "NDCD4", "NDSR1", "NDSR2", "NDSR3", "NDSR4", "NDTR1",
> +              "NDTR2", "NDTR3", "NDTR4", "NRI1", "NRI2", "NRI3", "NRI4",
> +              "NRTS1", "NRTS2", "NRTS3", "NRTS4", "OSCCLK", "PEWAKE", "PWM0",
> +              "PWM1", "PWM10", "PWM11", "PWM12", "PWM13", "PWM14", "PWM15",
> +              "PWM2", "PWM3", "PWM4", "PWM5", "PWM6", "PWM7", "PWM8", "PWM9",
> +              "RGMII1", "RGMII2", "RGMII3", "RGMII4", "RMII1", "RMII2",
> +              "RMII3", "RMII4", "RXD1", "RXD2", "RXD3", "RXD4", "SALT1",
> +              "SALT10", "SALT11", "SALT12", "SALT13", "SALT14", "SALT15",
> +              "SALT16", "SALT2", "SALT3", "SALT4", "SALT5", "SALT6", "SALT7",
> +              "SALT8", "SALT9", "SD1", "SD2", "SD3", "SD3DAT4", "SD3DAT5",
> +              "SD3DAT6", "SD3DAT7", "SGPM1", "SGPS1", "SIOONCTRL", "SIOPBI",
> +              "SIOPBO", "SIOPWREQ", "SIOPWRGD", "SIOS3", "SIOS5", "SIOSCI",
> +              "SPI1", "SPI1ABR", "SPI1CS1", "SPI1WP", "SPI2", "SPI2CS1",
> +              "SPI2CS2", "TACH0", "TACH1", "TACH10", "TACH11", "TACH12",
> +              "TACH13", "TACH14", "TACH15", "TACH2", "TACH3", "TACH4", "TACH5",
> +              "TACH6", "TACH7", "TACH8", "TACH9", "THRU0", "THRU1", "THRU2",
> +              "THRU3", "TXD1", "TXD2", "TXD3", "TXD4", "UART10", "UART11",
> +              "UART12", "UART13", "UART6", "UART7", "UART8", "UART9", "VB",
> +              "VGAHS", "VGAVS", "WDTRST1", "WDTRST2", "WDTRST3", "WDTRST4", ]
> +        "^groups$":
> +          allOf:
> +            - $ref: "/schemas/types.yaml#/definitions/string"
> +            - enum: [ "ADC0", "ADC1", "ADC10", "ADC11", "ADC12", "ADC13",
> +              "ADC14", "ADC15", "ADC2", "ADC3", "ADC4", "ADC5", "ADC6", "ADC7",
> +              "ADC8", "ADC9", "BMCINT", "ESPI", "ESPIALT", "FSI1", "FSI2",
> +              "FWSPIABR", "FWSPID", "FWQSPID", "FWSPIWP", "GPIT0", "GPIT1",
> +              "GPIT2", "GPIT3", "GPIT4", "GPIT5", "GPIT6", "GPIT7", "GPIU0",
> +              "GPIU1", "GPIU2", "GPIU3", "GPIU4", "GPIU5", "GPIU6", "GPIU7",
> +              "HVI3C3", "HVI3C4", "I2C1", "I2C10", "I2C11", "I2C12", "I2C13",
> +              "I2C14", "I2C15", "I2C16", "I2C2", "I2C3", "I2C4", "I2C5",
> +              "I2C6", "I2C7", "I2C8", "I2C9", "I3C3", "I3C4", "I3C5", "I3C6",
> +              "JTAGM", "LHPD", "LHSIRQ", "LPC", "LPCHC", "LPCPD", "LPCPME",
> +              "LPCSMI", "LSIRQ", "MACLINK1", "MACLINK2", "MACLINK3",
> +              "MACLINK4", "MDIO1", "MDIO2", "MDIO3", "MDIO4", "NCTS1", "NCTS2",
> +              "NCTS3", "NCTS4", "NDCD1", "NDCD2", "NDCD3", "NDCD4", "NDSR1",
> +              "NDSR2", "NDSR3", "NDSR4", "NDTR1", "NDTR2", "NDTR3", "NDTR4",
> +              "NRI1", "NRI2", "NRI3", "NRI4", "NRTS1", "NRTS2", "NRTS3",
> +              "NRTS4", "OSCCLK", "PEWAKE", "PWM0", "PWM1", "PWM10G0",
> +              "PWM10G1", "PWM11G0", "PWM11G1", "PWM12G0", "PWM12G1", "PWM13G0",
> +              "PWM13G1", "PWM14G0", "PWM14G1", "PWM15G0", "PWM15G1", "PWM2",
> +              "PWM3", "PWM4", "PWM5", "PWM6", "PWM7", "PWM8G0", "PWM8G1",
> +              "PWM9G0", "PWM9G1", "QSPI1", "QSPI2", "RGMII1", "RGMII2",
> +              "RGMII3", "RGMII4", "RMII1", "RMII2", "RMII3", "RMII4", "RXD1",
> +              "RXD2", "RXD3", "RXD4", "SALT1", "SALT10G0", "SALT10G1",
> +              "SALT11G0", "SALT11G1", "SALT12G0", "SALT12G1", "SALT13G0",
> +              "SALT13G1", "SALT14G0", "SALT14G1", "SALT15G0", "SALT15G1",
> +              "SALT16G0", "SALT16G1", "SALT2", "SALT3", "SALT4", "SALT5",
> +              "SALT6", "SALT7", "SALT8", "SALT9G0", "SALT9G1", "SD1", "SD2",
> +              "SD3", "SD3DAT4", "SD3DAT5", "SD3DAT6", "SD3DAT7", "SGPM1",
> +              "SGPS1", "SIOONCTRL", "SIOPBI", "SIOPBO", "SIOPWREQ", "SIOPWRGD",
> +              "SIOS3", "SIOS5", "SIOSCI", "SPI1", "SPI1ABR", "SPI1CS1",
> +              "SPI1WP", "SPI2", "SPI2CS1", "SPI2CS2", "TACH0", "TACH1",
> +              "TACH10", "TACH11", "TACH12", "TACH13", "TACH14", "TACH15",
> +              "TACH2", "TACH3", "TACH4", "TACH5", "TACH6", "TACH7", "TACH8",
> +              "TACH9", "THRU0", "THRU1", "THRU2", "THRU3", "TXD1", "TXD2",
> +              "TXD3", "TXD4", "UART10", "UART11", "UART12G0", "UART12G1",
> +              "UART13G0", "UART13G1", "UART6", "UART7", "UART8", "UART9", "VB",
> +              "VGAHS", "VGAVS", "WDTRST1", "WDTRST2", "WDTRST3", "WDTRST4", ]
> +
> +required:
> +  - compatible
> +
> +examples:
> +  - |
> +    syscon: scu@1e6e2000 {
> +        compatible = "aspeed,ast2600-scu", "syscon", "simple-mfd";
> +        reg = <0x1e6e2000 0xf6c>;
> +
> +        pinctrl: pinctrl {
> +            compatible = "aspeed,g6-pinctrl";
> +
> +            pinctrl_pwm10g1_default: pwm10g1_default {
> +                function = "PWM10";
> +                groups = "PWM10G1";
> +            };
> +
> +            pinctrl_gpioh0_unbiased_default: gpioh0 {
> +                pins = "A18";
> +                bias-disable;

This node and properties aren't getting checked. Need to figure out
how to do that. That may mean needing some structure to the node
names. You can worry about that later I suppose.

Rob
