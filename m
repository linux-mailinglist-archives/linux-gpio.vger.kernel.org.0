Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27D3B627A08
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Nov 2022 11:07:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235874AbiKNKHc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Nov 2022 05:07:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236453AbiKNKGh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Nov 2022 05:06:37 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCC7CD91;
        Mon, 14 Nov 2022 02:05:53 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E8CC2B80DA9;
        Mon, 14 Nov 2022 10:05:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F53EC433C1;
        Mon, 14 Nov 2022 10:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668420350;
        bh=NhbLUkVP1qgXtJ3N5nkqK7ZHPyOyPFqJ0lETMsTVYws=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=c3/xqHsgaufIAMdRP91uc5oGFKPH6u7DIAYCBEJ1ZkEeqyrESomFRzqxttQqIUY6m
         4qh+KhN2tnUOrXjLTJiR+gz0VOTCqYxrA0JytJ3b90JwtGjRP9d/hOcCityd/ecDIT
         LyHHHUVLTRpG2chq4+AhNkoSlQeEjio/0N2uq/qWBdyI2/JbMjhZTNK4wWTGI8TpmA
         Hr03doA+gJ+IOgfJvZ75vgcfqKqeLj2T0taLl8D3QSh50KNgSnpy7M+nuoEF6EZOoX
         RI8ePXZAC8s7oAw1x//Flr4Om7AX1UJS3zKbklaxR6mVAuP6U6osjYKX9fktcPw7uu
         4KQleIGBiObug==
Date:   Mon, 14 Nov 2022 10:05:43 +0000
From:   Lee Jones <lee@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     "Russell King (Oracle)" <linux@armlinux.org.uk>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
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
Message-ID: <Y3IS96xQhs1/Jre4@google.com>
References: <Y2qEpgIdpRTzTQbN@shell.armlinux.org.uk>
 <E1osRXT-002mw3-JR@rmk-PC.armlinux.org.uk>
 <531d88b8-75db-1d8f-1384-b8d05594e7b3@linaro.org>
 <Y2rWp4wasbflS/0y@shell.armlinux.org.uk>
 <20221109221723.GA2948356-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221109221723.GA2948356-robh@kernel.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 09 Nov 2022, Rob Herring wrote:

> On Tue, Nov 08, 2022 at 10:22:31PM +0000, Russell King (Oracle) wrote:
> > On Tue, Nov 08, 2022 at 09:55:58PM +0100, Krzysztof Kozlowski wrote:
> > > On 08/11/2022 17:33, Russell King (Oracle) wrote:
> > > > Add a DT binding for the Apple Mac System Management Controller.
> > > 
> > > Drop the second, redundant "binding" from subject. It's already in prefix.
> > 
> > Yet another thing that's been there from the start... how many more
> > things are you going to pick up in subsequent versions of the patch?
> > When does this stop?
> > 
> > In any case, taking your comment literally,
> > 
> > "dt-bindings: mfd: add for Apple Mac System Management Controller"
> > 
> > makes no sense, so presumably you want something more than that.
> > 
> > In any case, I see several recent cases already merged which follow
> > the pattern that I've used and that you've reviewed.
> > 
> > > > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > > > ---
> > > >  .../devicetree/bindings/mfd/apple,smc.yaml    | 67 +++++++++++++++++++
> > > >  1 file changed, 67 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/mfd/apple,smc.yaml
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/mfd/apple,smc.yaml b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
> > > > new file mode 100644
> > > > index 000000000000..014eba5a1bbc
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
> > > > @@ -0,0 +1,67 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/mfd/apple,smc.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Apple Mac System Management Controller
> > > > +
> > > > +maintainers:
> > > > +  - Hector Martin <marcan@marcan.st>
> > > > +
> > > > +description:
> > > > +  Apple Mac System Management Controller implements various functions
> > > > +  such as GPIO, RTC, power, reboot.
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    items:
> > > > +      - enum:
> > > > +          - apple,t6000-smc
> > > > +          - apple,t8103-smc
> > > > +          - apple,t8112-smc
> > > > +      - const: apple,smc
> > > > +
> > > > +  reg:
> > > > +    items:
> > > > +      - description: SMC area
> > > > +      - description: SRAM area
> > > > +
> > > > +  reg-names:
> > > > +    items:
> > > > +      - const: smc
> > > > +      - const: sram
> > > > +
> > > > +  mboxes:
> > > > +    maxItems: 1
> > > > +
> > > > +  gpio:
> > > > +    $ref: /schemas/gpio/gpio-macsmc.yaml
> > > 
> > > So this depends on other patch, so:
> > > 1. You need mention the dependency in cover letter (nothing there),
> > > 2. Re-order patches.
> > > 
> > > The GPIO cannot go separate tree and this must be explicitly communicated.
> > 
> > Sigh, getting an order that is sensible is really bloody difficult.
> 
> It's not. Sub-devices before the MFD. The only time that doesn't work is 
> when the sub-devices put the parent MFD in their example. The solution 
> there is don't do that. Just 1 complete example in the MFD schema and no 
> examples in the sub-devices.
> 
> > I'm quite sure Lee is only going to want to apply the mfd bits. 
> 
> Indeed. I can't seem to make Lee care... All the schemas should really 
> be applied together.

I care about drivers.  Happy to take the set as a whole if it helps.

-- 
Lee Jones [李琼斯]
