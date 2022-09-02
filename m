Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74B855AB720
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Sep 2022 19:04:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236008AbiIBREz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Sep 2022 13:04:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236673AbiIBREw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Sep 2022 13:04:52 -0400
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EFDDC4;
        Fri,  2 Sep 2022 10:04:44 -0700 (PDT)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-11e7e0a63e2so6220355fac.4;
        Fri, 02 Sep 2022 10:04:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=wYZ6v+E+gcaj843yCuPCzJk2EjReC7fODq6r4wpL8VU=;
        b=PGA0lnCh2n0qpZQHnEy47yQ/1KXBXtQeBYMj/OJmBbdFr7rjcKKdwP3DfBUp9oROo5
         ajMRNrYWkigGPUaJ7odRgCPa5QaFMcDivkO41KfcU8ZJm0YTZgaXcnp7+jXmm5C+NZII
         MHQs6Yf55JRhN92QW4rgSukd5oDaiKQqSUMVSdL/OUxpkkVjfhPdxzP9YZfuGuVUD5Wo
         Qn9odt4NSErN1jxxJSSBiCYe11mWw6CItR1/B8zjPIxD26t6ZLZkXbAoFzUT4ssf2wW1
         umsDo9Q0xFtllthQkMs7YTSBhh/1PbNuL6dHYoSAW/E3aRSIGsJbsIVCxXyKSrZDtpZ0
         pACg==
X-Gm-Message-State: ACgBeo2gjHJ0hm2sryQDzJmEZdopnxES2raTTQld27c/Alx/ZpObmrkV
        TYprkjnjXPEJZbptIzuMag==
X-Google-Smtp-Source: AA6agR5twtq/Ml4e+nWk6xzMYxvoXTHjEt3iX+fMN5f/iS/3OQ73FAuUMZH1R2VzVkLajJW6pr/Jng==
X-Received: by 2002:a05:6870:c696:b0:125:691b:d212 with SMTP id cv22-20020a056870c69600b00125691bd212mr1033954oab.26.1662138282953;
        Fri, 02 Sep 2022 10:04:42 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 34-20020a9d0c25000000b006370abdc976sm1194995otr.58.2022.09.02.10.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 10:04:42 -0700 (PDT)
Received: (nullmailer pid 58129 invoked by uid 1000);
        Fri, 02 Sep 2022 17:04:41 -0000
Date:   Fri, 2 Sep 2022 12:04:41 -0500
From:   Rob Herring <robh@kernel.org>
To:     Mark Kettenis <mark.kettenis@xs4all.nl>
Cc:     linux@armlinux.org.uk, krzysztof.kozlowski@linaro.org,
        arnd@arndb.de, lee@kernel.org, linus.walleij@linaro.org,
        alyssa@rosenzweig.io, asahi@lists.linux.dev, brgl@bgdev.pl,
        marcan@marcan.st, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, sven@svenpeter.dev,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: mfd: add binding for Apple Mac System
 Management Controller
Message-ID: <20220902170441.GA52527-robh@kernel.org>
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk>
 <E1oTkeH-003t9A-3K@rmk-PC.armlinux.org.uk>
 <426469c1-13cc-178b-4904-09439d7788e8@linaro.org>
 <YxDL+cAx9kkZRL8K@shell.armlinux.org.uk>
 <928ddeff-efac-920c-7bbf-dda35a942b93@linaro.org>
 <YxDOpCq0vIlt4VNa@shell.armlinux.org.uk>
 <2fedff34-6a20-f1ce-a756-2bd8671fcd52@linaro.org>
 <YxDWG5dmzErhKIXw@shell.armlinux.org.uk>
 <CAL_JsqLXNVdEj3ZCA_Wnirv-7maCZATKmjS8fJYR0uLQ9OTQZQ@mail.gmail.com>
 <d3cec35e749f958d@bloch.sibelius.xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d3cec35e749f958d@bloch.sibelius.xs4all.nl>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 02, 2022 at 04:49:37PM +0200, Mark Kettenis wrote:
> > From: Rob Herring <robh+dt@kernel.org>
> > Date: Thu, 1 Sep 2022 17:26:18 -0500
> > 
> > On Thu, Sep 1, 2022 at 10:56 AM Russell King (Oracle)
> > <linux@armlinux.org.uk> wrote:
> > >
> > > On Thu, Sep 01, 2022 at 06:45:52PM +0300, Krzysztof Kozlowski wrote:
> > > > On 01/09/2022 18:24, Russell King (Oracle) wrote:
> > > > > On Thu, Sep 01, 2022 at 06:15:46PM +0300, Krzysztof Kozlowski wrote:
> > > > >> On 01/09/2022 18:12, Russell King (Oracle) wrote:
> > > > >>>>> +  compatible:
> > > > >>>>> +    items:
> > > > >>>>> +      - enum:
> > > > >>>>> +        - apple,t8103-smc
> > > > >>>>
> > > > >>>> You miss two spaces of indentation on this level.
> > > > >>>
> > > > >>> Should that be picked up by the dt checker?
> > 
> > I have a problem that Krzysztof is quicker. ;) Maybe I should stop
> > screening the emails (for the times I break things mostly).
> > 
> > > > >>
> > > > >> I think yamllint complains about it. It is not a hard-dependency, so
> > > > >> maybe you don't have it installed.
> > > > >>
> > > > >>>
> > > > >>>>> +        - apple,t8112-smc
> > > > >>>>> +        - apple,t6000-smc
> > > > >>>>
> > > > >>>> Bring some order here - either alphabetical or by date of release (as in
> > > > >>>> other Apple schemas). I think t6000 was before t8112, so it's none of
> > > > >>>> that orders.
> > > > >>>
> > > > >>> Ok.
> > > > >>>
> > > > >>>>> +      - const: apple,smc
> > > > >>>>> +
> > > > >>>>> +  reg:
> > > > >>>>> +    description: Two regions, one for the SMC area and one for the SRAM area.
> > > > >>>>
> > > > >>>> You need constraints for size/order, so in this context list with
> > > > >>>> described items.
> > > > >>>
> > > > >>> How do I do that? I tried maxItems/minItems set to 2, but the dt checker
> > > > >>> objected to it.
> > > > >>
> > > > >> One way:
> > > > >> reg:
> > > > >>   items:
> > > > >>     - description: SMC area
> > > > >>     - description: SRAM area
> > > > >>
> > > > >> but actually this is very similar what you wrote for reg-names - kind of
> > > > >> obvious, so easier way:
> > > > >>
> > > > >> reg:
> > > > >>   maxItems: 2
> > > > >
> > > > > Doesn't work. With maxItems: 2, the example fails, yet it correctly lists
> > > > > two regs which are 64-bit address and 64-bit size - so in total 8 32-bit
> > > > > ints.
> > > > >
> > > > > Documentation/devicetree/bindings/mfd/apple,smc.example.dtb: smc@23e400000: reg: [[2, 1044381696], [0, 16384], [2, 1071644672], [0, 1048576]] is too long
> > > > >         From schema: /home/rmk/git/linux-rmk/Documentation/devicetree/bindings/mfd/apple,smc.yaml
> > > > >
> > > > > Hence, I originally had maxItems: 2, and ended up deleting it because of
> > > > > the dt checker.
> > > > >
> > > > > With the two descriptions, it's the same failure.
> > > >
> > > > Yeah, they should create same result.
> > > >
> > > > >
> > > > > I think the problem is that the checker has no knowledge in the example
> > > > > of how big each address and size element of the reg property is. So,
> > > > > it's interpreting it as four entries of 32-bit address,size pairs
> > > > > instead of two entries of 64-bit address,size pairs. Yep, that's it,
> > > > > if I increase the number of "- description" entries to four then it's
> > > > > happy.
> > > > >
> > > > > So, what's the solution?
> > > > >
> > > >
> > > > If you open generated DTS examples (in your
> > > > kbuild-output/Documentation/devicetree/bindings/mfd/) you will see which
> > > > address/size cells are expected. By default it is I think address/size
> > > > cells=1, so you need a bus node setting it to 2.
> > >
> > > Thanks, that works. The patch with all those points addressed now looks
> > > like:
> > >
> > > 8<===
> > > From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
> > > Subject: [PATCH] dt-bindings: mfd: add binding for Apple Mac System Management
> > >  Controller
> > >
> > > Add a DT binding for the Apple Mac System Management Controller.
> > >
> > > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > > ---
> > >  .../devicetree/bindings/mfd/apple,smc.yaml    | 61 +++++++++++++++++++
> > >  1 file changed, 61 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/mfd/apple,smc.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/mfd/apple,smc.yaml b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
> > > new file mode 100644
> > > index 000000000000..168f237c2962
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
> > > @@ -0,0 +1,61 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/mfd/apple,smc.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Apple Mac System Management Controller
> > > +
> > > +maintainers:
> > > +  - Hector Martin <marcan@marcan.st>
> > > +
> > > +description:
> > > +  Apple Mac System Management Controller implements various functions
> > > +  such as GPIO, RTC, power, reboot.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    items:
> > > +      - enum:
> > > +          - apple,t6000-smc
> > > +          - apple,t8103-smc
> > > +          - apple,t8112-smc
> > > +      - const: apple,smc
> > > +
> > > +  reg:
> > > +    items:
> > > +      - description: SMC area
> > > +      - description: SRAM area
> > 
> > Based on the disjoint addresses, is this really one device? Perhaps
> > the SRAM area should use mmio-sram binding? That already supports
> > sub-dividing the sram for different uses. I'll comment more on the
> > full example.
> 
> To me it does look as if the SRAM is part of the SMC coprocessor
> block.  It is probably part of a larger SRAM on the side of the SMC
> coprocessor.  There is a gap, but the addresses are close.  The only
> thing in between is the SMC mailbox, which is represented by a
> separate node.

Okay, fair enough. Let's keep them together.

Rob
