Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 985BE44E631
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Nov 2021 13:16:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231221AbhKLMT2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Nov 2021 07:19:28 -0500
Received: from muru.com ([72.249.23.125]:55452 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231147AbhKLMT2 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 12 Nov 2021 07:19:28 -0500
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 3580180E2;
        Fri, 12 Nov 2021 12:17:14 +0000 (UTC)
Date:   Fri, 12 Nov 2021 14:16:35 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH RFC] dt-bindings: pinctrl: support specifying pins
Message-ID: <YY5bI+QzDA0zs/mN@atomide.com>
References: <20211110231436.8866-1-zajec5@gmail.com>
 <CACRpkdbAS0JiqTQUU0R0yRhVCwagubwsNYLxj1DLE1Ldc+H_JQ@mail.gmail.com>
 <YY4+4Wb/H2ogKnQg@atomide.com>
 <CAHp75VeO4yr9fAx_-MHDnRGQn1paWF=59+o-9ZyP5PGSCPU8og@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VeO4yr9fAx_-MHDnRGQn1paWF=59+o-9ZyP5PGSCPU8og@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

* Andy Shevchenko <andy.shevchenko@gmail.com> [211112 11:22]:
> > We only need the SoC specific data for the booted SoC, so devicetree
> > and loadable modules makes more sense there compared to the current
> > built-in setup.
> 
> I'm against putting that into DT and here is why.
> 
> DT is the thing that describes the _platform_. While it's fine to put
> GPIO expander thingy (and we actually do this with labeling schema for
> GPIOs, right?), the SoC level of things is a _hardware_ and with all
> flexibility the DT gives us we will definitely have a deviations on
> _different_ platforms with _the same_ SoC! To work around this we must
> have a validation of the pin names and their functions in many places.

I think you are misunderstanding what I mean here. Certainly the driver
needs to know how to deal with the SoC specific hardware. And that we
can easily do that in quite easily already. The device tree data I'm
describing would be similar to the interrupts with instance offset and
generic mux flags.

See for example the driver for drivers/pinctrl/ti/pinctrl-ti-iodelay.c.
For that driver we have the instance and picosecond iodelay values in
the devicetree, and with #nr-pinctrl cells there could be some generic
pinctrl mux flags. We are missing the generic pinctrl flags part AFAIK.

> And last but not least the copying it in tons of DT feels like a
> duplication effort.,

Hmm I don't think we have any of that for what I'm describing. But
please take a look at the iodelay example above, maybe I'm not
following.

> AFAIU the topic, the pin control lacks labeling schema that will
> provide the view from the platform perspective, while driver provides
> from HW perspective.

Agreed we need a generic labeling schema.

Regards,

Tony
