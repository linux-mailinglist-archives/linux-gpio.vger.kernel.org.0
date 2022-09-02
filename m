Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE43B5AB4FD
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Sep 2022 17:23:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236221AbiIBPXf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Sep 2022 11:23:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236401AbiIBPXG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Sep 2022 11:23:06 -0400
X-Greylist: delayed 396 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 02 Sep 2022 07:56:21 PDT
Received: from sibelius.xs4all.nl (80-61-163-207.fixed.kpn.net [80.61.163.207])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 134C412E4E8;
        Fri,  2 Sep 2022 07:56:20 -0700 (PDT)
Received: from localhost (bloch.sibelius.xs4all.nl [local])
        by bloch.sibelius.xs4all.nl (OpenSMTPD) with ESMTPA id 69f11a6b;
        Fri, 2 Sep 2022 16:49:37 +0200 (CEST)
Date:   Fri, 2 Sep 2022 16:49:37 +0200 (CEST)
From:   Mark Kettenis <mark.kettenis@xs4all.nl>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     linux@armlinux.org.uk, krzysztof.kozlowski@linaro.org,
        arnd@arndb.de, lee@kernel.org, linus.walleij@linaro.org,
        alyssa@rosenzweig.io, asahi@lists.linux.dev, brgl@bgdev.pl,
        marcan@marcan.st, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, sven@svenpeter.dev,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org
In-Reply-To: <CAL_JsqLXNVdEj3ZCA_Wnirv-7maCZATKmjS8fJYR0uLQ9OTQZQ@mail.gmail.com>
        (message from Rob Herring on Thu, 1 Sep 2022 17:26:18 -0500)
Subject: Re: [PATCH 1/6] dt-bindings: mfd: add binding for Apple Mac System
 Management Controller
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk> <E1oTkeH-003t9A-3K@rmk-PC.armlinux.org.uk>
 <426469c1-13cc-178b-4904-09439d7788e8@linaro.org> <YxDL+cAx9kkZRL8K@shell.armlinux.org.uk>
 <928ddeff-efac-920c-7bbf-dda35a942b93@linaro.org> <YxDOpCq0vIlt4VNa@shell.armlinux.org.uk>
 <2fedff34-6a20-f1ce-a756-2bd8671fcd52@linaro.org> <YxDWG5dmzErhKIXw@shell.armlinux.org.uk> <CAL_JsqLXNVdEj3ZCA_Wnirv-7maCZATKmjS8fJYR0uLQ9OTQZQ@mail.gmail.com>
Message-ID: <d3cec35e749f958d@bloch.sibelius.xs4all.nl>
X-Spam-Status: No, score=-0.8 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
        SPF_HELO_NONE,SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> From: Rob Herring <robh+dt@kernel.org>
> Date: Thu, 1 Sep 2022 17:26:18 -0500
> 
> On Thu, Sep 1, 2022 at 10:56 AM Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
> >
> > On Thu, Sep 01, 2022 at 06:45:52PM +0300, Krzysztof Kozlowski wrote:
> > > On 01/09/2022 18:24, Russell King (Oracle) wrote:
> > > > On Thu, Sep 01, 2022 at 06:15:46PM +0300, Krzysztof Kozlowski wrote:
> > > >> On 01/09/2022 18:12, Russell King (Oracle) wrote:
> > > >>>>> +  compatible:
> > > >>>>> +    items:
> > > >>>>> +      - enum:
> > > >>>>> +        - apple,t8103-smc
> > > >>>>
> > > >>>> You miss two spaces of indentation on this level.
> > > >>>
> > > >>> Should that be picked up by the dt checker?
> 
> I have a problem that Krzysztof is quicker. ;) Maybe I should stop
> screening the emails (for the times I break things mostly).
> 
> > > >>
> > > >> I think yamllint complains about it. It is not a hard-dependency, so
> > > >> maybe you don't have it installed.
> > > >>
> > > >>>
> > > >>>>> +        - apple,t8112-smc
> > > >>>>> +        - apple,t6000-smc
> > > >>>>
> > > >>>> Bring some order here - either alphabetical or by date of release (as in
> > > >>>> other Apple schemas). I think t6000 was before t8112, so it's none of
> > > >>>> that orders.
> > > >>>
> > > >>> Ok.
> > > >>>
> > > >>>>> +      - const: apple,smc
> > > >>>>> +
> > > >>>>> +  reg:
> > > >>>>> +    description: Two regions, one for the SMC area and one for the SRAM area.
> > > >>>>
> > > >>>> You need constraints for size/order, so in this context list with
> > > >>>> described items.
> > > >>>
> > > >>> How do I do that? I tried maxItems/minItems set to 2, but the dt checker
> > > >>> objected to it.
> > > >>
> > > >> One way:
> > > >> reg:
> > > >>   items:
> > > >>     - description: SMC area
> > > >>     - description: SRAM area
> > > >>
> > > >> but actually this is very similar what you wrote for reg-names - kind of
> > > >> obvious, so easier way:
> > > >>
> > > >> reg:
> > > >>   maxItems: 2
> > > >
> > > > Doesn't work. With maxItems: 2, the example fails, yet it correctly lists
> > > > two regs which are 64-bit address and 64-bit size - so in total 8 32-bit
> > > > ints.
> > > >
> > > > Documentation/devicetree/bindings/mfd/apple,smc.example.dtb: smc@23e400000: reg: [[2, 1044381696], [0, 16384], [2, 1071644672], [0, 1048576]] is too long
> > > >         From schema: /home/rmk/git/linux-rmk/Documentation/devicetree/bindings/mfd/apple,smc.yaml
> > > >
> > > > Hence, I originally had maxItems: 2, and ended up deleting it because of
> > > > the dt checker.
> > > >
> > > > With the two descriptions, it's the same failure.
> > >
> > > Yeah, they should create same result.
> > >
> > > >
> > > > I think the problem is that the checker has no knowledge in the example
> > > > of how big each address and size element of the reg property is. So,
> > > > it's interpreting it as four entries of 32-bit address,size pairs
> > > > instead of two entries of 64-bit address,size pairs. Yep, that's it,
> > > > if I increase the number of "- description" entries to four then it's
> > > > happy.
> > > >
> > > > So, what's the solution?
> > > >
> > >
> > > If you open generated DTS examples (in your
> > > kbuild-output/Documentation/devicetree/bindings/mfd/) you will see which
> > > address/size cells are expected. By default it is I think address/size
> > > cells=1, so you need a bus node setting it to 2.
> >
> > Thanks, that works. The patch with all those points addressed now looks
> > like:
> >
> > 8<===
> > From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
> > Subject: [PATCH] dt-bindings: mfd: add binding for Apple Mac System Management
> >  Controller
> >
> > Add a DT binding for the Apple Mac System Management Controller.
> >
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > ---
> >  .../devicetree/bindings/mfd/apple,smc.yaml    | 61 +++++++++++++++++++
> >  1 file changed, 61 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mfd/apple,smc.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/mfd/apple,smc.yaml b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
> > new file mode 100644
> > index 000000000000..168f237c2962
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
> > @@ -0,0 +1,61 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mfd/apple,smc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Apple Mac System Management Controller
> > +
> > +maintainers:
> > +  - Hector Martin <marcan@marcan.st>
> > +
> > +description:
> > +  Apple Mac System Management Controller implements various functions
> > +  such as GPIO, RTC, power, reboot.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - apple,t6000-smc
> > +          - apple,t8103-smc
> > +          - apple,t8112-smc
> > +      - const: apple,smc
> > +
> > +  reg:
> > +    items:
> > +      - description: SMC area
> > +      - description: SRAM area
> 
> Based on the disjoint addresses, is this really one device? Perhaps
> the SRAM area should use mmio-sram binding? That already supports
> sub-dividing the sram for different uses. I'll comment more on the
> full example.

To me it does look as if the SRAM is part of the SMC coprocessor
block.  It is probably part of a larger SRAM on the side of the SMC
coprocessor.  There is a gap, but the addresses are close.  The only
thing in between is the SMC mailbox, which is represented by a
separate node.

The address of the SRAM can be discovered by sending SMC commands.  I
believe Hector added it in order to verify the address that the SMC
firmware provides.  My OpenBSD driver doesn't use it, so in that sense
changing the binding to use a separate node with a "mmio-sram"
compatible (and presumably an "apple,sram" property to reference that
node using a phandle) would work fine.  The extra level of indirection
obviously would mean more code in the Linux SMC driver though.
