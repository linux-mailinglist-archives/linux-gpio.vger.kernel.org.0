Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6822862442D
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Nov 2022 15:24:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229537AbiKJOYK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Nov 2022 09:24:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbiKJOYJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Nov 2022 09:24:09 -0500
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F34AC18B1B;
        Thu, 10 Nov 2022 06:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=qoFmVn/RVbiWlU8+j9YvRhNLwQE+IXU9nraJkisEkVk=; b=OQaEJySySnSNYRxSyKz5i9nCv0
        v6wd4jE08fOsidmsLkDoDw1J6s/txbapm50Y/+AWTgOTHkjzZuJlg8atqHfiX7qrCIUPdR6H4qcm8
        VnCxLQUsQmyf3/XUXn75nYSihY/pPTh9Dwd+y8+nn40/gORVVeRjp9sRwVg7/WvI6KbMM4kptc6ck
        YMdy0O0OVv3xglHFMiW3oK87nvw7jqYodjs6qltNUoEjo3VNihF6TyIo0qoAwc6IHLoiNKmYW0pm4
        BTHwN/r1ITBs2QPMQb87GPyIDpCF/0Kby7XfVXpR6ArBQ473ss0oWHB1KUL9WRYISXh13wVWvsLXD
        Q4moizjg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35204)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1ot8TF-0005iw-3c; Thu, 10 Nov 2022 14:23:57 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1ot8TD-0006i7-Mq; Thu, 10 Nov 2022 14:23:55 +0000
Date:   Thu, 10 Nov 2022 14:23:55 +0000
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Lee Jones <lee@kernel.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        asahi@lists.linux.dev, devicetree@vger.kernel.org,
        Hector Martin <marcan@marcan.st>,
        Jonathan Corbet <corbet@lwn.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-gpio@vger.kernel.org, Petr Mladek <pmladek@suse.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sven Peter <sven@svenpeter.dev>
Subject: Re: [PATCH v3 3/7] dt-bindings: mfd: add binding for Apple Mac
 System Management Controller
Message-ID: <Y20Je7quui2iohNR@shell.armlinux.org.uk>
References: <Y2qEpgIdpRTzTQbN@shell.armlinux.org.uk>
 <E1osRXT-002mw3-JR@rmk-PC.armlinux.org.uk>
 <531d88b8-75db-1d8f-1384-b8d05594e7b3@linaro.org>
 <Y2rWp4wasbflS/0y@shell.armlinux.org.uk>
 <20221109221723.GA2948356-robh@kernel.org>
 <Y2zlA8RpOqD/7TrM@shell.armlinux.org.uk>
 <bb77e12a-b218-461b-6aa8-10f2b9a67347@linaro.org>
 <Y20HOW8t3wfFott1@shell.armlinux.org.uk>
 <403f372a-6fd1-b5b6-cfd9-b15147bf1caf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <403f372a-6fd1-b5b6-cfd9-b15147bf1caf@linaro.org>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 10, 2022 at 03:21:35PM +0100, Krzysztof Kozlowski wrote:
> On 10/11/2022 15:14, Russell King (Oracle) wrote:
> > On Thu, Nov 10, 2022 at 03:00:16PM +0100, Krzysztof Kozlowski wrote:
> >> On 10/11/2022 12:48, Russell King (Oracle) wrote:
> >>> On Wed, Nov 09, 2022 at 04:17:23PM -0600, Rob Herring wrote:
> >>>> On Tue, Nov 08, 2022 at 10:22:31PM +0000, Russell King (Oracle) wrote:
> >>>>> On Tue, Nov 08, 2022 at 09:55:58PM +0100, Krzysztof Kozlowski wrote:
> >>>>>> On 08/11/2022 17:33, Russell King (Oracle) wrote:
> >>>>>>> Add a DT binding for the Apple Mac System Management Controller.
> >>>>>>
> >>>>>> Drop the second, redundant "binding" from subject. It's already in prefix.
> >>>>>
> >>>>> Yet another thing that's been there from the start... how many more
> >>>>> things are you going to pick up in subsequent versions of the patch?
> >>>>> When does this stop?
> >>>>>
> >>>>> In any case, taking your comment literally,
> >>>>>
> >>>>> "dt-bindings: mfd: add for Apple Mac System Management Controller"
> >>>>>
> >>>>> makes no sense, so presumably you want something more than that.
> >>>>>
> >>>>> In any case, I see several recent cases already merged which follow
> >>>>> the pattern that I've used and that you've reviewed.
> >>>>>
> >>>>>>> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> >>>>>>> ---
> >>>>>>>  .../devicetree/bindings/mfd/apple,smc.yaml    | 67 +++++++++++++++++++
> >>>>>>>  1 file changed, 67 insertions(+)
> >>>>>>>  create mode 100644 Documentation/devicetree/bindings/mfd/apple,smc.yaml
> >>>>>>>
> >>>>>>> diff --git a/Documentation/devicetree/bindings/mfd/apple,smc.yaml b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
> >>>>>>> new file mode 100644
> >>>>>>> index 000000000000..014eba5a1bbc
> >>>>>>> --- /dev/null
> >>>>>>> +++ b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
> >>>>>>> @@ -0,0 +1,67 @@
> >>>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>>>>>> +%YAML 1.2
> >>>>>>> +---
> >>>>>>> +$id: http://devicetree.org/schemas/mfd/apple,smc.yaml#
> >>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>>>>>> +
> >>>>>>> +title: Apple Mac System Management Controller
> >>>>>>> +
> >>>>>>> +maintainers:
> >>>>>>> +  - Hector Martin <marcan@marcan.st>
> >>>>>>> +
> >>>>>>> +description:
> >>>>>>> +  Apple Mac System Management Controller implements various functions
> >>>>>>> +  such as GPIO, RTC, power, reboot.
> >>>>>>> +
> >>>>>>> +properties:
> >>>>>>> +  compatible:
> >>>>>>> +    items:
> >>>>>>> +      - enum:
> >>>>>>> +          - apple,t6000-smc
> >>>>>>> +          - apple,t8103-smc
> >>>>>>> +          - apple,t8112-smc
> >>>>>>> +      - const: apple,smc
> >>>>>>> +
> >>>>>>> +  reg:
> >>>>>>> +    items:
> >>>>>>> +      - description: SMC area
> >>>>>>> +      - description: SRAM area
> >>>>>>> +
> >>>>>>> +  reg-names:
> >>>>>>> +    items:
> >>>>>>> +      - const: smc
> >>>>>>> +      - const: sram
> >>>>>>> +
> >>>>>>> +  mboxes:
> >>>>>>> +    maxItems: 1
> >>>>>>> +
> >>>>>>> +  gpio:
> >>>>>>> +    $ref: /schemas/gpio/gpio-macsmc.yaml
> >>>>>>
> >>>>>> So this depends on other patch, so:
> >>>>>> 1. You need mention the dependency in cover letter (nothing there),
> >>>>>> 2. Re-order patches.
> >>>>>>
> >>>>>> The GPIO cannot go separate tree and this must be explicitly communicated.
> >>>>>
> >>>>> Sigh, getting an order that is sensible is really bloody difficult.
> >>>>
> >>>> It's not. Sub-devices before the MFD. The only time that doesn't work is 
> >>>> when the sub-devices put the parent MFD in their example. The solution 
> >>>> there is don't do that. Just 1 complete example in the MFD schema and no 
> >>>> examples in the sub-devices.
> >>>
> >>> Meanwhile, I was told by Krzysztof that DT schemas must always have an
> >>> example. So, different person, different story.
> >>
> >> Hm, where do you see a message I told you to always have examples? Maybe
> >> in some discussion I mentioned that examples are desired, but not
> >> always. There is no point in having example in MFD child device schema
> >> if it is already part of the parent MFD binding, where it is actually
> >> required for complete picture.
> > 
> > 35ed6e48-40e6-eb14-72de-9a0a4f5b38f8@linaro.org
> > 
> > and
> 
> That was independent schema, no references to MFD, thus my comment. If
> you post such stuff alone without indication it is part of MFD, what do
> you expect from reviewers?
> 
> > 
> > 2e2356f2-ded1-3cbf-4456-20054a8defda@linaro.org
> 
> Which was comment about MFD, right? It is expected to have example for
> MFD. I never said it is mandatory for every schema, which you implied in
> previous mailing.
> 
> 
> > 
> > For the GPIO macsec binding. So I'm getting contradictory information.
> > First you say that I need an example in the gpio macsec DT binding
> > yaml document.
> 
> First you split patches making reviewers life difficult. Then reviewers
> don't get entire concept and they answer based what they got.
> 
> > 
> > Now I'm told it should go in the parent.
> 
> After posting entire patchset with context you can get better review,
> yes, that's right.
> 
> > 
> > Make up your bloody minds and stop pissing me about. This is why I've
> > given up trying to get this in.
> 
> I don't think it is constructive to discuss this with you anymore.
> 
> > 
> > Getting a consistent message would be nice, but it seems impossible.
> > 
> 

In which case you CLEARLY didn't read the cover message to that two
patch series.

Again, YOU are giving contradictory information.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
