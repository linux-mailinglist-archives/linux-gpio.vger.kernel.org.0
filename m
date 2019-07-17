Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E324A6B520
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jul 2019 05:49:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728035AbfGQDtE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jul 2019 23:49:04 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:42771 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728029AbfGQDtD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 16 Jul 2019 23:49:03 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id E1D1125D5;
        Tue, 16 Jul 2019 23:48:59 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute4.internal (MEProxy); Tue, 16 Jul 2019 23:48:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm3; bh=mh/pMipFPT+Mu/hJUdFSzOvvP0fIfxk
        W6RkfI+IZShA=; b=SUfoXXZAv3O8PWgUgt9K/YejLz6gCEM5nAA8HEcbqAjwNYW
        sLi1uKsWqoNiqytpXjTLmfzLsw/Dn8sJOhuath9tDVu1B5hLkofqqqgiHyT462Ml
        HZh9HCmGWRgXtltI8CTrH6q05MaClzB9s9z57pcR1feqHroRPHFuSgLmbgnbQ02z
        hOqMtZjV9C98EXCZsF17tG3buKjcfSty1zouQEpnF7xy7t2JejDQNS+ad7iSw5Op
        RftsWZzdKAquJRWLlh5EP7G1gxHMAzRAI/WQ/QXWVwi7dg6Puwz26zBPBJFrXn77
        tsbGpRJ03QDudmApIZj5bjd0aTMVWE/TBrdNtfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=mh/pMi
        pFPT+Mu/hJUdFSzOvvP0fIfxkW6RkfI+IZShA=; b=0uABlP357PIQJYJ89+ZXrs
        mNazU1xqJLwGEsRhXJun95r5dkezduTH6jPcc2YodELLvNrgYsn65jL/e4X/owOf
        vzAgB6Wdl2gaYba1T0lubHcdD8XpZNAnrmMGm3yZYNHDOejhhHj5R98DJxVgSKl7
        Zf+bAm0iwvzGXTMVnEyCJVnI9CUgwG+LBLAl+h27XKLo34RVFxJYX+i2G8zSUVgn
        izUSpJ917Prl8wtSA1pGugXVTrNc4/Ve8m4FeFs67R03+tTTt/ARDmsuG6WbZ2iM
        FhH5tLLT9gACfTIJKwCIbo6wdgf7DGd1YiP1u6cZKkt9V6cQYatug7+O5YOFoqog
        ==
X-ME-Sender: <xms:qZouXbPKSxS1lK4HvOejyJBdIK8FUaltpFY_R4LGEnpdMaEh249Z4Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddriedugdejiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
    vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
    hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
    ufhiiigvpedt
X-ME-Proxy: <xmx:qZouXQ0qOUGgnZ5U5ErkWmLrqdFyrPTWzt_GEU57WpN8kKn8Ah0ucw>
    <xmx:qZouXSFWSY6NwShMr05LeOu2I38mLQj7DUm3LHB7H7SPUNgux-L-nw>
    <xmx:qZouXd5f8ermVymBWLW9I5mcFy8_axXyphMokb1GOWJ9J_0nbNfU_A>
    <xmx:q5ouXXRmboc0UcZzqNsRvPckR4kWnwba4JMzfmiWS8VPV5_lqaQc_Q>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id B62ACE00CC; Tue, 16 Jul 2019 23:48:57 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-731-g19d3b16-fmstable-20190627v1
Mime-Version: 1.0
Message-Id: <91ebb817-3cc6-4b87-8c2b-cfcd66f4c284@www.fastmail.com>
In-Reply-To: <1563313711-17961-1-git-send-email-hongweiz@ami.com>
References: <1563313711-17961-1-git-send-email-hongweiz@ami.com>
Date:   Wed, 17 Jul 2019 13:19:07 +0930
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Hongwei Zhang" <hongweiz@ami.com>,
        "Joel Stanley" <joel@jms.id.au>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org
Cc:     "Rob Herring" <robh+dt@kernel.org>,
        "Mark Rutland" <mark.rutland@arm.com>,
        "Bartosz Golaszewski" <bgolaszewski@baylibre.com>,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 2/3 v3] dt-bindings: gpio: aspeed: Add SGPIO support
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Hongwei,

On Wed, 17 Jul 2019, at 07:18, Hongwei Zhang wrote:
> Add bindings to support SGPIO on AST2400 or AST2500.
> 
> Signed-off-by: Hongwei Zhang <hongweiz@ami.com>
> ---
>  .../devicetree/bindings/gpio/sgpio-aspeed.txt      | 55 ++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
> 
> diff --git a/Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt 
> b/Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
> new file mode 100644
> index 0000000..8c3a747
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
> @@ -0,0 +1,55 @@
> +Aspeed SGPIO controller Device Tree Bindings
> +-------------------------------------------
> +
> +This SGPIO controller is for ASPEED AST2500 SoC, it supports up to 80 
> full 
> +featured Serial GPIOs. Each of the Serial GPIO pins can be programmed 
> to 
> +support the following options:
> +- Support interrupt option for each input port and various interrupt 
> +  sensitivity option (level-high, level-low, edge-high, edge-low)
> +- Support reset tolerance option for each output port
> +- Directly connected to APB bus and its shift clock is from APB bus 
> clock
> +  divided by a programmable value.
> +- Co-work with external signal-chained TTL components (74LV165/74LV595)

Nice description.

> +
> +
> +Required properties:
> +
> +- compatible		: Either "aspeed,ast2400-sgpio" or "aspeed,ast2500-sgpio"
> +
> +- #gpio-cells 		: Should be two
> +			  - First cell is the GPIO line number
> +			  - Second cell is used to specify optional
> +			    parameters (unused)
> +
> +- reg			: Address and length of the register set for the device
> +- gpio-controller	: Marks the device node as a GPIO controller.
> +- interrupts		: Interrupt specifier (see interrupt bindings for
> +			  details)
> +
> +- interrupt-controller	: Mark the GPIO controller as an 
> interrupt-controller
> +
> +- nr-gpios		: number of GPIO pins to serialise. 
> +			  (should be multiple of 8, up to 80 pins; 0 if not used)

It's unclear to me what you mean by "0 if not used" here. The property is
required, so its description in a devicetree should always have a non-zero
value of `status = "okay";`, as 0 is an invalid value according to the
datasheet (sensibly so). If `status = "disabled";` then it doesn't really
matter, which makes the comment not terribly useful.

> +
> +- clocks               : A phandle to the APB clock for SGPM clock 
> division
> +
> +- bus-frequency	: SGPM CLK frequency, derived from APB bus clock by a 
> programmable devisor

I'd leave off the parent clock information. Practically speaking it's probably
always going to be the APB clock, but who knows. From a devicetree writer's
perspective they just want to say "make it 7MHz" or whatever speed they,
and it shouldn't matter too much how we get there.

Finally, as mentioned on the driver patch, please send v4 without the history
at the bottom.

Cheers,

Andrew

> +
> +
> +The sgpio and interrupt properties are further described in their 
> respective bindings documentation:
> +
> +- Documentation/devicetree/bindings/sgpio/gpio.txt
> +- Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
> +
> +  Example:
> +	sgpio@1e780200 {
> +		#gpio-cells = <2>;
> +		compatible = "aspeed,ast2500-sgpio";
> +		gpio-controller;
> +		interrupts = <40>;
> +		reg = <0x1e780200 0x0100>;
> +		clocks = <&syscon ASPEED_CLK_APB>;
> +		interrupt-controller;
> +		nr-gpios = <8>;
> +		bus-frequency = <12000000>;
> +	};
> -- 
> 2.7.4
> 
> 
> Thanks Andrew, please see above v3 and inline comments at below.
> --Hongwei
> 
> > From:	Andrew Jeffery <andrew@aj.id.au>
> > Sent:	Sunday, July 14, 2019 10:25 PM
> > To:	Hongwei Zhang; Joel Stanley; Linus Walleij; devicetree@vger.kernel.org
> > Cc:	Rob Herring; Mark Rutland; Bartosz Golaszewski; linux-aspeed@lists.ozlabs.org; linux-
> > kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-gpio@vger.kernel.org
> > Subject:	Re: [PATCH 2/3 v2] dt-bindings: gpio: aspeed: Add SGPIO support
> > 
> > Hello Hongwei,
> > 
> > On Sat, 13 Jul 2019, at 05:44, Hongwei Zhang wrote:
> > > Add bindings to support SGPIO on AST2400 or AST2500.
> > > 
> > > Signed-off-by: Hongwei Zhang <hongweiz@ami.com>
> > > ---
> > >  .../devicetree/bindings/gpio/sgpio-aspeed.txt      | 43 ++++++++++++++++++++++
> > >  1 file changed, 43 insertions(+)
> > >  create mode 100755 
> > > Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
> > > 
> > > diff --git a/Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
> > > b/Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
> > > new file mode 100755
> > > index 0000000..3ae2b79
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
> > > @@ -0,0 +1,43 @@
> > > +Aspeed SGPIO controller Device Tree Bindings
> > > +-------------------------------------------
> > > +
> > > +Required properties:
> > > +- compatible		: Either "aspeed,ast2400-sgpio" or "aspeed,ast2500-sgpio"
> > > +
> > > +- #gpio-cells 		: Should be two
> > > +			  - First cell is the GPIO line number
> > > +			  - Second cell is used to specify optional
> > > +			    parameters (unused)
> > > +
> > > +- reg			: Address and length of the register set for the device
> > > +- gpio-controller	: Marks the device node as a GPIO controller.
> > > +- interrupts		: Interrupt specifier (see interrupt bindings for
> > > +			  details)
> > > +
> > > +- interrupt-controller	: Mark the GPIO controller as an 
> > > interrupt-controller
> > > +
> > > +- nr-gpios		: number of GPIO pins to serialise. (should be multiple of 
> > > 8, up to 80 pins)
> > > +			  if not specified, defaults to 80.
> > 
> > This appears to be a statement about the driver implementation, but bindings documents are about 
> > describing hardware. Reading the datasheet it actually appears the ASPEED SGPIO hardware comes up 
> > in what is "technically" a forbidden state (equivalent to `nr-gpios = <0>;`), though the device is also 
> > disabled at this point, so it's probably moot. The point is the true default value from a hardware 
> > perspective is 0, not 80, so if we're going to talk about default values, 0 would be more appropriate. 
> > However:
> > 
> > You've also listed nr-gpios under the "Required properties" header, but the description suggests it's 
> > optional. It's either one or the other, please lets be clear about it. On that front, lets make it nr-gpios 
> > *not* optional (i.e. make it
> > required) thus force the specification of how many SGPIOs we want to emit on the bus. This value is 
> > coupled to the platform design, so I don't think there's ever a scenario where we want nr-gpios to take a 
> > default value.
> > 
> 
> Added some descriptions and updated nr-gpios, please see v3.
> 
> > > +
> > > +- clocks               : A phandle to the APB clock for SGPM clock 
> > > division
> > > +
> > > +- bus-frequency	: SGPM CLK frequency, if not specified defaults to 1 
> > > MHz
> > 
> > Again here with the default value - SGPM CLK period is derived from PCLK by the expression `period = 
> > PCLK * 2 *(GPIO254[31:16] + 1)`, where GPIO254's initialisation state is `GPIO254[31:16] = 0`, which 
> > gives a default SGPM bus frequency of PCLK / 2. This is likely not going to be 1MHz (more like ~12MHz).
> > 
> > Lets just make the property required. That way we avoid any ambiguity about the bus frequency and 
> > thus don't need words about defaults that turn out to be about the driver, not about the hardware.
> > 
> 
> updated, please see v3.
> 
> > Finally, when updating patches in response to feedback, please send the full series again, and bump the 
> > series version number. That way people can review a coherent set of patches and not have to hunt 
> > around and (fail to) collate the correct combination. It makes it easier to say "Reviewed-by:" on your 
> > patches :)
> > 
> > Cheers,
> > 
> > Andrew
>
