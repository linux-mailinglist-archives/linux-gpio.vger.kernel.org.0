Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2598623666
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Nov 2022 23:17:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229967AbiKIWRY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Nov 2022 17:17:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbiKIWRY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Nov 2022 17:17:24 -0500
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C3A411806;
        Wed,  9 Nov 2022 14:17:23 -0800 (PST)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-13bef14ea06so369071fac.3;
        Wed, 09 Nov 2022 14:17:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k4lH5rWvUE98GU8yCy1NGQDUM/X/Z3Tpbwa5NYFQXGg=;
        b=ZFqmmdUoIHpjBeZSZKy30ZQONpWcZRCwwHk9rMv1ZIjVVM9tQxyKOe5bWKV9pAWrow
         MsYrBI/bAuF/gYUuvQ5xTH/uuGfmV56zZZ+Q0YF4EUOMiH/odYwC9kL7iuO+m36J0lM1
         QYNE+8Cu19PB5oAOuXx4lW4HCJOnzzrYB+63tazKyBKnLKkLadx5mlt7V1hEEgJ3ISR7
         boX+LBbynr3+Ue7GDOQ4Tf3ToZTOiDDm2KXa88IMkqKj4//5v1MeqcpwyaV4xARSnbOj
         Rbq/VBg8P16giFPjcjmVxmoqnSE+oPVJH2dYUrPNsznFF3JK75/jz6r9uhMb9TlXwHTi
         j6Eg==
X-Gm-Message-State: ACrzQf1PPJAS5uFJydaoMMKaD0rfreZIerjFIU2cAO0MG3hsv+p2+13v
        7EmQQmoYyWRpL0jXOlgIIA==
X-Google-Smtp-Source: AMsMyM4FAtCtJYba4qjwAMKO/E286pubc0VAzXrmDkV7GWZ7ieKpPlDQmLDrWAXpJ8enR50wmPd/Qg==
X-Received: by 2002:a05:6871:611:b0:13b:8097:2b92 with SMTP id w17-20020a056871061100b0013b80972b92mr47236179oan.44.1668032242503;
        Wed, 09 Nov 2022 14:17:22 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id db6-20020a0568306b0600b0066cc0525476sm4690773otb.75.2022.11.09.14.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 14:17:21 -0800 (PST)
Received: (nullmailer pid 2973198 invoked by uid 1000);
        Wed, 09 Nov 2022 22:17:23 -0000
Date:   Wed, 9 Nov 2022 16:17:23 -0600
From:   Rob Herring <robh@kernel.org>
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
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
Message-ID: <20221109221723.GA2948356-robh@kernel.org>
References: <Y2qEpgIdpRTzTQbN@shell.armlinux.org.uk>
 <E1osRXT-002mw3-JR@rmk-PC.armlinux.org.uk>
 <531d88b8-75db-1d8f-1384-b8d05594e7b3@linaro.org>
 <Y2rWp4wasbflS/0y@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2rWp4wasbflS/0y@shell.armlinux.org.uk>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 08, 2022 at 10:22:31PM +0000, Russell King (Oracle) wrote:
> On Tue, Nov 08, 2022 at 09:55:58PM +0100, Krzysztof Kozlowski wrote:
> > On 08/11/2022 17:33, Russell King (Oracle) wrote:
> > > Add a DT binding for the Apple Mac System Management Controller.
> > 
> > Drop the second, redundant "binding" from subject. It's already in prefix.
> 
> Yet another thing that's been there from the start... how many more
> things are you going to pick up in subsequent versions of the patch?
> When does this stop?
> 
> In any case, taking your comment literally,
> 
> "dt-bindings: mfd: add for Apple Mac System Management Controller"
> 
> makes no sense, so presumably you want something more than that.
> 
> In any case, I see several recent cases already merged which follow
> the pattern that I've used and that you've reviewed.
> 
> > > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > > ---
> > >  .../devicetree/bindings/mfd/apple,smc.yaml    | 67 +++++++++++++++++++
> > >  1 file changed, 67 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/mfd/apple,smc.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/mfd/apple,smc.yaml b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
> > > new file mode 100644
> > > index 000000000000..014eba5a1bbc
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
> > > @@ -0,0 +1,67 @@
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
> > > +
> > > +  reg-names:
> > > +    items:
> > > +      - const: smc
> > > +      - const: sram
> > > +
> > > +  mboxes:
> > > +    maxItems: 1
> > > +
> > > +  gpio:
> > > +    $ref: /schemas/gpio/gpio-macsmc.yaml
> > 
> > So this depends on other patch, so:
> > 1. You need mention the dependency in cover letter (nothing there),
> > 2. Re-order patches.
> > 
> > The GPIO cannot go separate tree and this must be explicitly communicated.
> 
> Sigh, getting an order that is sensible is really bloody difficult.

It's not. Sub-devices before the MFD. The only time that doesn't work is 
when the sub-devices put the parent MFD in their example. The solution 
there is don't do that. Just 1 complete example in the MFD schema and no 
examples in the sub-devices.

> I'm quite sure Lee is only going to want to apply the mfd bits. 

Indeed. I can't seem to make Lee care... All the schemas should really 
be applied together.

> Then
> what do we do with the other bits? GPIO stuff via the GPIO tree, then
> wait a cycle before the rest can be merged. Or what?

The schemas must be picked up in the same cycle. I don't care so much 
if subsystem maintainers' trees have warnings if they don't care, but I 
do care for linux-next. If the subsystem bits aren't picked up, then 
I'll pick them up if it comes to that.

Rob
