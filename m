Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF9586104B0
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Oct 2022 23:49:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237035AbiJ0VtH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Oct 2022 17:49:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229998AbiJ0VtG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Oct 2022 17:49:06 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D2A786FA9;
        Thu, 27 Oct 2022 14:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=1ry49BdJFIYIjpEYQSw9wgWdTj6hfZpiO61BTbR6rd4=; b=BZozZ07RrFocNPLGj9pnS3IrZd
        ElHsueZxoxF/BjncQdyK0Vcu/N1zZ5W9qfZWx4E5QDOwq+v/oh+MnrIxg2ArFEctS6Ysk72aUq/i8
        Kwc763oprg/6zUOmUnUsDjCVbLzDhuxO0w54bxbbsLVrntNJxxH7HkkRIrVi/AFpBCGfjQSS+qqZJ
        hC2rnpbBPMImq6EaLZqiQcWjqEDQkUWd9aEtnXlYXvhOycYFosRqH3tdwJanfrGv/4uBYL9jgCRzY
        nV/ljjfaE+yEdzsyGmiRA6aHSUGd/Og7M4tpa9nKv82Td56mrK2kRGuAMNz7XuohqhRPzQvSA+aR0
        GdLx2o5Q==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34990)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1ooAkJ-0007YR-5I; Thu, 27 Oct 2022 22:49:03 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1ooAkH-0001tE-S2; Thu, 27 Oct 2022 22:49:01 +0100
Date:   Thu, 27 Oct 2022 22:49:01 +0100
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Hector Martin <marcan@marcan.st>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: gpio: add binding for the GPIO block
 for Apple Mac SMC
Message-ID: <Y1r8zZif6FUIA73J@shell.armlinux.org.uk>
References: <Y1q5jW8ff0aUdjPd@shell.armlinux.org.uk>
 <E1oo6Hw-00HYp8-Sa@rmk-PC.armlinux.org.uk>
 <35ed6e48-40e6-eb14-72de-9a0a4f5b38f8@linaro.org>
 <Y1rxdEjJox3HOqtp@shell.armlinux.org.uk>
 <2e2356f2-ded1-3cbf-4456-20054a8defda@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e2356f2-ded1-3cbf-4456-20054a8defda@linaro.org>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 27, 2022 at 05:31:49PM -0400, Krzysztof Kozlowski wrote:
> On 27/10/2022 17:00, Russell King (Oracle) wrote:
> > On Thu, Oct 27, 2022 at 03:53:25PM -0400, Krzysztof Kozlowski wrote:
> >> On 27/10/2022 13:03, Russell King (Oracle) wrote:
> >>> Add the DT binding for the Apple Mac System Management Controller GPIOs.
> >>>
> >>> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> >>> ---
> >>>  .../devicetree/bindings/gpio/gpio-macsmc.yaml | 28 +++++++++++++++++++
> >>>  1 file changed, 28 insertions(+)
> >>>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-macsmc.yaml
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/gpio/gpio-macsmc.yaml b/Documentation/devicetree/bindings/gpio/gpio-macsmc.yaml
> >>> new file mode 100644
> >>> index 000000000000..a3883d62292d
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/gpio/gpio-macsmc.yaml
> >>
> >> Filename based on compatible, so "apple,smc-gpio.yaml"
> > 
> > Many of the other yaml files in gpio/ are named as such.
> 
> Poor patterns, inconsistencies or even bugs like to copy themselves and
> it is never an argument.
> 
> The convention for all bindings is to use vendor,device.yaml, matching
> the compatible when applicable.
> 
> > 
> >>> @@ -0,0 +1,28 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/gpio/gpio-macsmc.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: Apple Mac System Management Controller GPIO
> >>> +
> >>> +maintainers:
> >>> +  - Hector Martin <marcan@marcan.st>
> >>> +
> >>> +description:
> >>> +  This describes the binding for the Apple Mac System Management Controller
> >>
> >> Drop "This describes the binding for"
> >>
> >>> +  GPIO block.
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    allOf:
> >>
> >> That's not proper syntax. Look at other examples (e.g. Apple bindings)
> >> doing it. Probably you wanted items here.
> > 
> > Really? You're joking. 
> 
> No. If you look at example-schema then answer should be obvious, so why
> do you think I am joking?
> 
> > I had sent an email to Rob to ask how this should
> > be done because my first guess spat out unhelpful error messages from
> > dt_bindings_check, and this is the best I could come up with based on
> > other "examples".
> > 
> > I tried "- items:" but that made no difference - dt_bindings_check spat
> > errors, so that's clearly incorrect. Specifically, I tried:
> > 
> > properties:
> >   compatible:
> >     - items:
> >         - enum:
> > 	    - apple,t8103-smc
> > 	- const: apple,smc-gpio
> > 
> > That doesn't work:
> 
> Of course, because "-" means list, so "- items" is not correct.
> 
> Where do you see such pattern? Anywhere following compatible? No. There
> is no. You just invented something instead of using many, many existing
> examples.

No, I did not "invent" something here. I tried to copy it from other
examples, but I couldn't find something that matched exactly.

In any case, relying on examples rather than a proper description of
how this should be done is utterly rediculous. There should be a formal
definition of the language used to describe this - but there doesn't
seem to be.

So, stuff like "-" means list is just not obvious, and the error
messages make it totally unobvious that's what the problem was.

> > Documentation/devicetree/bindings/gpio/gpio-macsmc.yaml: properties:compatible: [{'items': [{'const': 'apple,t8103-smc'}, {'const': 'apple,smc-gpio'}]}] is not of type 'object', 'boolean'  from schema $id: http://json-schema.org/draft-07/schema#
> > 
> >>> +      - enum:
> >>> +          - apple,t8103-smc
> >>> +      - const: apple,smc-gpio
> >>> +
> >>> +  gpio-controller: true
> >>> +
> >>> +  '#gpio-cells':
> >>> +    const: 2
> >>
> >> Missing required properties. Start from new bindings or example-schema.
> > 
> > What's missing? All the other bindings that I see follow this pattern.
> 
> No. All other bindings have list of required properties. Only yours do
> not have.

Oh, you don't mean there are required properties missing from
#gpio-cells, you mean the list of required properties is missing,
which is something _entirely_ different. Your comment was utterly
ambiguous.

> >>> +
> >>> +additionalProperties: false
> >>
> >> Missing example, it's necessary to validate these.
> > 
> > Documentation states that examples are optional according to the
> > "writing-schema" documentation.
> 
> Yes, but without it we cannot validate the bindings.

Please update the writing-schema documentation to state that it's now
required to validate bindings, so that the documentation is no longer
stating something that's different from the required process.

> > Honestly, I find this YAML stuff extremely difficult, especially given
> > the lack of documentation on how to write it and the cryptic error
> > messages from the tooling. It's impossible to get it right before
> > submitting it - and I suspect from what I see above, it's impossible
> > for reviewers to know what is correct either, since some of what you've
> > said above appears to be wrong!
> 
> I would say it is doable - copy example-schema or recent device specific
> schema and customize it... But you started adding some weird stuff which
> was never, never in other bindings.

"weird stuff"? What weird stuff? What wasn't in other bindings? You
make no sense when you make this accusations, because they are totally
untrue.

I started with:

properties:
  compatible:
    - enum:
       - ...
    - const: ...

and dt_bindings_check thew it out. So I looked again at
Documentation/bindings/gpio/*.yaml. I decided maybe the - enum
containing one entry could be confusing matters, so I tried converting
that to a - const. Still failed.

So I had another look at other *.yaml files, and I then tried adding
- items: and indenting the following. Failed.

So then I tried allOf: which passed the checks. That's the evolution
there - trial and error.

Cryptic error messages, nothing else in gpio/ that follows the pattern
I wanted and trial and error led me to what I had in this patch. This
is *no* way to develop bindings.

There has to be a formal definition of this schema language - and
something better than pointing people at other bindings that may or
may not be correct.

So, I repeat myself: writing yaml stuff is utterly horrid and a total
hit and miss affair whether one gets it correct or not.

It seems to me that the problem of validating .dts files hasn't been
solved - the problem has merely been moved to a whole set of different
problems trying to write .yaml files that allow .dts files to be
validated, some of which could be solved by a better understanding of
the syntax, if only it were documented properly.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
