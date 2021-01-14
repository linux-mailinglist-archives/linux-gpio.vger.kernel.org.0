Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B00D22F565D
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Jan 2021 02:58:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728185AbhANBqh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Jan 2021 20:46:37 -0500
Received: from foss.arm.com ([217.140.110.172]:42570 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727012AbhANA55 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 13 Jan 2021 19:57:57 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1DB191FB;
        Wed, 13 Jan 2021 16:45:58 -0800 (PST)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A3073F719;
        Wed, 13 Jan 2021 16:45:55 -0800 (PST)
Date:   Thu, 14 Jan 2021 00:45:12 +0000
From:   Andre Przywara <andre.przywara@arm.com>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Icenowy Zheng <icenowy@aosc.xyz>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
        Shuosheng Huang <huangshuosheng@allwinnertech.com>,
        Yangtao Li <tiny.windzz@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 02/21] dt-bindings: pinctrl: Add Allwinner H616
 compatible strings
Message-ID: <20210114004512.6cc7bd10@slackpad.fritz.box>
In-Reply-To: <20201214093728.ehd2362jzclbxwp5@gilmour>
References: <20201211011934.6171-1-andre.przywara@arm.com>
        <20201211011934.6171-3-andre.przywara@arm.com>
        <20201214093728.ehd2362jzclbxwp5@gilmour>
Organization: Arm Ltd.
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 14 Dec 2020 10:37:28 +0100
Maxime Ripard <maxime@cerno.tech> wrote:

> On Fri, Dec 11, 2020 at 01:19:15AM +0000, Andre Przywara wrote:
> > A new SoC, a new compatible string.
> > Also we were too miserly with just allowing seven interrupt banks.
> > 
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >  .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml   | 18
> > ++++++++++++++++-- 1 file changed, 16 insertions(+), 2 deletions(-)
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
> > b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
> > index 5240487dfe50..292b05d9ed08 100644 ---
> > a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
> > +++
> > b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
> > @@ -53,6 +53,8 @@ properties:
> >        - allwinner,sun50i-h5-pinctrl
> >        - allwinner,sun50i-h6-pinctrl
> >        - allwinner,sun50i-h6-r-pinctrl
> > +      - allwinner,sun50i-h616-pinctrl
> > +      - allwinner,sun50i-h616-r-pinctrl
> >        - allwinner,suniv-f1c100s-pinctrl
> >        - nextthing,gr8-pinctrl
> >  
> > @@ -61,7 +63,7 @@ properties:
> >  
> >    interrupts:
> >      minItems: 1
> > -    maxItems: 7
> > +    maxItems: 8
> >      description:
> >        One interrupt per external interrupt bank supported on the
> >        controller, sorted by bank number ascending order.
> > @@ -91,7 +93,7 @@ properties:
> >        bank found in the controller
> >      $ref: /schemas/types.yaml#/definitions/uint32-array
> >      minItems: 1
> > -    maxItems: 5
> > +    maxItems: 8
> >  
> >  patternProperties:
> >    # It's pretty scary, but the basic idea is that:
> > @@ -145,6 +147,18 @@ allOf:
> >    # boards are defining it at the moment so it would generate a
> > lot of # warnings.
> >  
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          enum:
> > +            - allwinner,sun50i-h616-pinctrl
> > +
> > +    then:
> > +      properties:
> > +        interrupts:
> > +          minItems: 8
> > +          maxItems: 8
> > +  
> 
> You don't need to have both if they are equals, and in this particular

Mmh, but all the other compatibles have both equal, so what would be
the recommended way to describe this? Just minItems? I don't find a
good explanation at the moment how to handle an explicit number, other
than by enumerating the items explicitly.

> case we already check that the maximum is 8 so there's no need to
> repeat that check here.

Are you referring to the overall "maxItems: 8" above, in the 2nd hunk?
While this will become redundant, this is apparently prone to changes
(as only "7" would be redundant at the moment), so I would rather not
rely on a global limit.

Cheers,
Andre.
