Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 759F766317
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jul 2019 02:51:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728860AbfGLAvg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Jul 2019 20:51:36 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:44459 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728102AbfGLAvg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 11 Jul 2019 20:51:36 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 0AE65212D;
        Thu, 11 Jul 2019 20:51:34 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute4.internal (MEProxy); Thu, 11 Jul 2019 20:51:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm3; bh=BR5GrqCFmr5ccuz4f2JcgVOZCtojTYc
        HrkDhtf7QyqA=; b=MgE3N+D/gYdf7nF/IsC4kmtUxRPANJDsUpi9d5+C4WKLoO4
        nBqmc/ad+fv8NZWo/kNJL/3Oa1DFXKkbssMuBSirnJ40Mcr//hDZPJUSR9J4UGS7
        66x21XfnZ01lWOZ9K7QccAcTow9H6oBrz5nKVGp/NYtLOgaYpaApgpkateR+ZJO7
        BDKwOCFv8uG2Q6R3i3WNxMQCdASwPyetxlhvYLGBlQ25kjEQBOFC8sIoOelLvMgf
        4ZKMDmwZqgITwyFen5F8q9QF1w/B123BjQtht8O8flGoom/HQAFLo3dmZPfsolmR
        lm6t+IIFTxW7tAdckEmO3ABdtYnCfTveJzE8kXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=BR5Grq
        CFmr5ccuz4f2JcgVOZCtojTYcHrkDhtf7QyqA=; b=mv7F2PbVhFtTq6ImOjsRrw
        z0+ruuhwrWku0whBzqC0VXUUnjR7VTkG0aBIvjY7FcXonooHABL/tex9c+y77/Lc
        v2uhjCIFBUgAwJCVybhRIG7GJNBxlAv3pxw6hxu37dF5Aw6KpAIkS6Xie28o5Y+X
        VjOfzNeC87l4PPU+hWug/vEu1pmrk0rVP610wIcJpnGW0RmQIJCtl2upRIoNvljN
        8+AGZRHGgz5M3MN+7S8QUxULyohEQBghjGQ/5lTY8wtAnlW4A6AnFcpOAUoMg5FK
        R5VInqWStBUcAwEjoIRuZbZiGIkvWp7vCjRVmWmEMwI9wXagqJvbkba/5uM+jF9Q
        ==
X-ME-Sender: <xms:lNknXYq7TnTiYwDIQpd5noxf20AJCLZFvSIvKr6MecbvmcDc4jzGFQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrgeelgdegtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
    vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucffohhmrg
    hinhepuggvvhhitggvthhrvggvrdhorhhgnecurfgrrhgrmhepmhgrihhlfhhrohhmpegr
    nhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:lNknXVNaUSksBCQg8STZePVCv_umtaXtNt5FVmBDs1D8ErLCc6Rtlw>
    <xmx:lNknXaqQapT3S-ARI77eJbHk956f_oRf22TiqkEeETmN_YIA4rP-1w>
    <xmx:lNknXQE4NOu3tEC1kQSqijtxWjh1ldhm19N_ZPmgxpo3e7KyoKK7Fw>
    <xmx:ldknXUBt44Kxc37Y05KLI5ir-s-Qez3difQ_r3gB2KRCeqF4vIBYRA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 363A9E0128; Thu, 11 Jul 2019 20:51:32 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-731-g19d3b16-fmstable-20190627v1
Mime-Version: 1.0
Message-Id: <da2f05bf-5117-4e08-b26b-e261ef4162f1@www.fastmail.com>
In-Reply-To: <CAL_JsqLvY_yxN=-tfUPGn_Bv=UNmntHjXqUhSD1aey79MXznQg@mail.gmail.com>
References: <20190711041942.23202-1-andrew@aj.id.au>
 <20190711041942.23202-2-andrew@aj.id.au>
 <CAL_JsqLvY_yxN=-tfUPGn_Bv=UNmntHjXqUhSD1aey79MXznQg@mail.gmail.com>
Date:   Fri, 12 Jul 2019 10:21:38 +0930
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Rob Herring" <robh+dt@kernel.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        "Mark Rutland" <mark.rutland@arm.com>,
        "Joel Stanley" <joel@jms.id.au>,
        "Ryan Chen" <ryanchen.aspeed@gmail.com>,
        "Johnny Huang" <johnny_huang@aspeedtech.com>,
        linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/6] dt-bindings: pinctrl: aspeed: Document AST2600 pinmux
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Fri, 12 Jul 2019, at 02:48, Rob Herring wrote:
> On Wed, Jul 10, 2019 at 10:19 PM Andrew Jeffery <andrew@aj.id.au> wrote:
> >
> > The AST260 differs from the 2400 and 2500 in that it supports multiple
> > groups for a subset of functions.
> >
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> >  .../pinctrl/aspeed,ast2600-pinctrl.yaml       | 128 ++++++++++++++++++
> >  1 file changed, 128 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
> > new file mode 100644
> > index 000000000000..dd31f8e62433
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
> > @@ -0,0 +1,128 @@
> > +# SPDX-License-Identifier: GPL-2.0+
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pinctrl/aspeed,ast2600-pinctrl.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: ASPEED AST2600 Pin Controller
> > +
> > +maintainers:
> > +  - Andrew Jeffery <andrew@aj.id.au>
> > +
> > +description: |+
> > +  The pin controller node should be the child of a syscon node with the
> > +  required property:
> > +
> > +  - compatible: Should be one of the following:
> > +                "aspeed,ast2600-scu", "syscon", "simple-mfd"
> > +
> > +  Refer to the the bindings described in
> > +  Documentation/devicetree/bindings/mfd/syscon.txt
> > +
> > +properties:
> > +  compatible:
> > +    const: aspeed,ast2600-pinctrl
> > +
> > +patternProperties:
> > +  '^.*$':
> > +    if:
> > +      type: object
> > +    then:
> > +      patternProperties:
> > +        "^function$":
> 
> That's a fixed string, not a pattern, so just put under 'properties'.

Haha, good point. Hopefully I'll get the hang of this eventually!

> 
> > +          allOf:
> > +            - $ref: "/schemas/types.yaml#/definitions/string"
> > +            - enum: [ "ADC0", "ADC1", "ADC10", "ADC11", "ADC12", "ADC13",
> 
> You can drop the quoting here. I wouldn't really care, but yours is
> one of the few right now and everyone will copy.

Yeah, fair point, the quotes add a lot of noise.

> 
> > +              "ADC14", "ADC15", "ADC2", "ADC3", "ADC4", "ADC5", "ADC6", "ADC7",
> > +              "ADC8", "ADC9", "BMCINT", "ESPI", "ESPIALT", "FSI1", "FSI2",
> > +              "FWSPIABR", "FWSPID", "FWSPIWP", "GPIT0", "GPIT1", "GPIT2",
> > +              "GPIT3", "GPIT4", "GPIT5", "GPIT6", "GPIT7", "GPIU0", "GPIU1",
> > +              "GPIU2", "GPIU3", "GPIU4", "GPIU5", "GPIU6", "GPIU7", "I2C1",
> > +              "I2C10", "I2C11", "I2C12", "I2C13", "I2C14", "I2C15", "I2C16",
> > +              "I2C2", "I2C3", "I2C4", "I2C5", "I2C6", "I2C7", "I2C8", "I2C9",
> > +              "I3C3", "I3C4", "I3C5", "I3C6", "JTAGM", "LHPD", "LHSIRQ", "LPC",
> > +              "LPCHC", "LPCPD", "LPCPME", "LPCSMI", "LSIRQ", "MACLINK1",
> > +              "MACLINK2", "MACLINK3", "MACLINK4", "MDIO1", "MDIO2", "MDIO3",
> > +              "MDIO4", "NCTS1", "NCTS2", "NCTS3", "NCTS4", "NDCD1", "NDCD2",
> > +              "NDCD3", "NDCD4", "NDSR1", "NDSR2", "NDSR3", "NDSR4", "NDTR1",
> > +              "NDTR2", "NDTR3", "NDTR4", "NRI1", "NRI2", "NRI3", "NRI4",
> > +              "NRTS1", "NRTS2", "NRTS3", "NRTS4", "OSCCLK", "PEWAKE", "PWM0",
> > +              "PWM1", "PWM10", "PWM11", "PWM12", "PWM13", "PWM14", "PWM15",
> > +              "PWM2", "PWM3", "PWM4", "PWM5", "PWM6", "PWM7", "PWM8", "PWM9",
> > +              "RGMII1", "RGMII2", "RGMII3", "RGMII4", "RMII1", "RMII2",
> > +              "RMII3", "RMII4", "RXD1", "RXD2", "RXD3", "RXD4", "SALT1",
> > +              "SALT10", "SALT11", "SALT12", "SALT13", "SALT14", "SALT15",
> > +              "SALT16", "SALT2", "SALT3", "SALT4", "SALT5", "SALT6", "SALT7",
> > +              "SALT8", "SALT9", "SD1", "SD2", "SD3", "SD3DAT4", "SD3DAT5",
> > +              "SD3DAT6", "SD3DAT7", "SGPM1", "SGPS1", "SIOONCTRL", "SIOPBI",
> > +              "SIOPBO", "SIOPWREQ", "SIOPWRGD", "SIOS3", "SIOS5", "SIOSCI",
> > +              "SPI1", "SPI1ABR", "SPI1CS1", "SPI1WP", "SPI2", "SPI2CS1",
> > +              "SPI2CS2", "TACH0", "TACH1", "TACH10", "TACH11", "TACH12",
> > +              "TACH13", "TACH14", "TACH15", "TACH2", "TACH3", "TACH4", "TACH5",
> > +              "TACH6", "TACH7", "TACH8", "TACH9", "THRU0", "THRU1", "THRU2",
> > +              "THRU3", "TXD1", "TXD2", "TXD3", "TXD4", "UART10", "UART11",
> > +              "UART12", "UART13", "UART6", "UART7", "UART8", "UART9", "VB",
> > +              "VGAHS", "VGAVS", "WDTRST1", "WDTRST2", "WDTRST3", "WDTRST4", ]
> > +        "^groups$":
> > +          allOf:
> > +            - $ref: "/schemas/types.yaml#/definitions/string"
> > +            - enum: [ "ADC0", "ADC1", "ADC10", "ADC11", "ADC12", "ADC13",
> > +              "ADC14", "ADC15", "ADC2", "ADC3", "ADC4", "ADC5", "ADC6", "ADC7",
> > +              "ADC8", "ADC9", "BMCINT", "ESPI", "ESPIALT", "FSI1", "FSI2",
> > +              "FWSPIABR", "FWSPID", "FWQSPID", "FWSPIWP", "GPIT0", "GPIT1",
> > +              "GPIT2", "GPIT3", "GPIT4", "GPIT5", "GPIT6", "GPIT7", "GPIU0",
> > +              "GPIU1", "GPIU2", "GPIU3", "GPIU4", "GPIU5", "GPIU6", "GPIU7",
> > +              "HVI3C3", "HVI3C4", "I2C1", "I2C10", "I2C11", "I2C12", "I2C13",
> > +              "I2C14", "I2C15", "I2C16", "I2C2", "I2C3", "I2C4", "I2C5",
> > +              "I2C6", "I2C7", "I2C8", "I2C9", "I3C3", "I3C4", "I3C5", "I3C6",
> > +              "JTAGM", "LHPD", "LHSIRQ", "LPC", "LPCHC", "LPCPD", "LPCPME",
> > +              "LPCSMI", "LSIRQ", "MACLINK1", "MACLINK2", "MACLINK3",
> > +              "MACLINK4", "MDIO1", "MDIO2", "MDIO3", "MDIO4", "NCTS1", "NCTS2",
> > +              "NCTS3", "NCTS4", "NDCD1", "NDCD2", "NDCD3", "NDCD4", "NDSR1",
> > +              "NDSR2", "NDSR3", "NDSR4", "NDTR1", "NDTR2", "NDTR3", "NDTR4",
> > +              "NRI1", "NRI2", "NRI3", "NRI4", "NRTS1", "NRTS2", "NRTS3",
> > +              "NRTS4", "OSCCLK", "PEWAKE", "PWM0", "PWM1", "PWM10G0",
> > +              "PWM10G1", "PWM11G0", "PWM11G1", "PWM12G0", "PWM12G1", "PWM13G0",
> > +              "PWM13G1", "PWM14G0", "PWM14G1", "PWM15G0", "PWM15G1", "PWM2",
> > +              "PWM3", "PWM4", "PWM5", "PWM6", "PWM7", "PWM8G0", "PWM8G1",
> > +              "PWM9G0", "PWM9G1", "QSPI1", "QSPI2", "RGMII1", "RGMII2",
> > +              "RGMII3", "RGMII4", "RMII1", "RMII2", "RMII3", "RMII4", "RXD1",
> > +              "RXD2", "RXD3", "RXD4", "SALT1", "SALT10G0", "SALT10G1",
> > +              "SALT11G0", "SALT11G1", "SALT12G0", "SALT12G1", "SALT13G0",
> > +              "SALT13G1", "SALT14G0", "SALT14G1", "SALT15G0", "SALT15G1",
> > +              "SALT16G0", "SALT16G1", "SALT2", "SALT3", "SALT4", "SALT5",
> > +              "SALT6", "SALT7", "SALT8", "SALT9G0", "SALT9G1", "SD1", "SD2",
> > +              "SD3", "SD3DAT4", "SD3DAT5", "SD3DAT6", "SD3DAT7", "SGPM1",
> > +              "SGPS1", "SIOONCTRL", "SIOPBI", "SIOPBO", "SIOPWREQ", "SIOPWRGD",
> > +              "SIOS3", "SIOS5", "SIOSCI", "SPI1", "SPI1ABR", "SPI1CS1",
> > +              "SPI1WP", "SPI2", "SPI2CS1", "SPI2CS2", "TACH0", "TACH1",
> > +              "TACH10", "TACH11", "TACH12", "TACH13", "TACH14", "TACH15",
> > +              "TACH2", "TACH3", "TACH4", "TACH5", "TACH6", "TACH7", "TACH8",
> > +              "TACH9", "THRU0", "THRU1", "THRU2", "THRU3", "TXD1", "TXD2",
> > +              "TXD3", "TXD4", "UART10", "UART11", "UART12G0", "UART12G1",
> > +              "UART13G0", "UART13G1", "UART6", "UART7", "UART8", "UART9", "VB",
> > +              "VGAHS", "VGAVS", "WDTRST1", "WDTRST2", "WDTRST3", "WDTRST4", ]
> > +
> > +required:
> > +  - compatible
> > +
> > +examples:
> > +  - |
> > +    syscon: scu@1e6e2000 {
> > +        compatible = "aspeed,ast2600-scu", "syscon", "simple-mfd";
> > +        reg = <0x1e6e2000 0xf6c>;
> > +
> > +        pinctrl: pinctrl {
> > +            compatible = "aspeed,g6-pinctrl";
> > +
> > +            pinctrl_pwm10g1_default: pwm10g1_default {
> > +                function = "PWM10";
> > +                groups = "PWM10G1";
> > +            };
> > +
> > +            pinctrl_gpioh0_unbiased_default: gpioh0 {
> > +                pins = "A18";
> > +                bias-disable;
> 
> This node and properties aren't getting checked. Need to figure out
> how to do that. That may mean needing some structure to the node
> names. You can worry about that later I suppose.

I surfaced the issue around subnode naming when I updated the 2400
and 2500 pinctrl bindings. As it stands the generic pinctrl bindings do
not impose any constraints on the naming, it's freeform. Converting
the bindings to yaml shouldn't be adding any constraints and
invalidating existing devicetrees. Not really sure how we solve that.

Andrew
