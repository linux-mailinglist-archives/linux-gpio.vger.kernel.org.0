Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24B9F562717
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Jul 2022 01:31:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232585AbiF3XbD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Jun 2022 19:31:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232099AbiF3XbC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Jun 2022 19:31:02 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FBD14D170
        for <linux-gpio@vger.kernel.org>; Thu, 30 Jun 2022 16:31:00 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id p7so1121484ybm.7
        for <linux-gpio@vger.kernel.org>; Thu, 30 Jun 2022 16:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7rzBjlWyrGCVnHojYy7aloe09Kk1ZJFyFafJ4B59izQ=;
        b=esSzbAG9SStIKedEdEyPNCZEwWeV7CGfw2gDAyv7xNkZGiGhAKyelsjm5S6l3zYohJ
         d/Eo0n6Mp+36R9EN/Pq2SisCS+9HoblIrvPkImxxTHiatXxbVEpvW3y/yNgVziC5uyoZ
         vYyHIRU3pYbXRmHkZLlWk/frQQwicQxGxfoUSBXj3PLfoEnFnvnX+lQNgSCCK/G112nQ
         +h/LHrk5XRmANsD8K55QOlIqREK2mYKCbE3t0k3EnnSD9DyzGjrrvdjT+EJJoRKX1F7X
         eGAoOxj+hwQhHxN9wOQ0TOIBLZRRt2Qt2wLPB0KOY9Z/NrqQd5sdoLelt/izUN/UnoDM
         mZeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7rzBjlWyrGCVnHojYy7aloe09Kk1ZJFyFafJ4B59izQ=;
        b=2b4CaJOpOUCHPF+EO7MukRztc8A+jd/HUdzADhYYMw3WoXj5ivfJuUHYNteKwDhepH
         sGua2Shfl2bdfov3szhAWMzQhtuZNnVJyLmcSQgIXtxuhsqmIUopq1ydPTrr/Sgr0y0o
         aSm0hyag7nzzA0l2WmfadDp3TwvBfoBYc838mnQtQO4OsSiuuDVJni9i8VbXO5n6rbyK
         K+hksF9sFNiFnfmAl6B5bFNP5dp2B8VOJq5yvlm+TOf3fi6Q+S8a9Xxs0tHe2qgbAoJ7
         TEdHPuiqqy0QaYeu8A5MYdrDjV7M8dEEQyvfTAIHEvVqLt8k44yvVaME5+4Svvlje8+I
         z/Qg==
X-Gm-Message-State: AJIora9QTVWYursC3HINSf4K7gjFDf3pMXZuT3/n+iodwCL3gKmQ1Rbw
        yrZzh6W1A1qlbV5KPlxEAYrquiIT2g+KcD5gxjPKEw==
X-Google-Smtp-Source: AGRyM1vZ35BqSkdVoL3YwWkOXOHYil4MKgDP8iAYz+Rz4wCD4ADLbbR0rsgTYZHYxiDej4wVmrVuer94e9q4LpiXAmA=
X-Received: by 2002:a25:5bc3:0:b0:669:b722:beb8 with SMTP id
 p186-20020a255bc3000000b00669b722beb8mr12118791ybb.447.1656631859258; Thu, 30
 Jun 2022 16:30:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220601070707.3946847-1-saravanak@google.com>
 <20220601070707.3946847-2-saravanak@google.com> <YrFzK6EiVvXmzVG6@atomide.com>
 <CAGETcx_1USPRbFKV5j00qkQ-QXJkp7=FAfnFcfiNnM4J5KF1cQ@mail.gmail.com>
 <YrKhkmj3jCQA39X/@atomide.com> <CAGETcx_11wO-HkZ2QsBF8o1+L9L3Xe1QBQ_GzegwozxAx1i0jg@mail.gmail.com>
 <YrQP3OZbe8aCQxKU@atomide.com> <CAGETcx9aFBzMcuOiTAEy5SJyWw3UfajZ8DVQfW2DGmzzDabZVg@mail.gmail.com>
 <Yrlz/P6Un2fACG98@atomide.com> <CAGETcx8c+P0r6ARmhv+ERaz9zAGBOVJQu3bSDXELBycEGfkYQw@mail.gmail.com>
 <CAL_JsqJd3J6k6pRar7CkHVaaPbY7jqvzAePd8rVDisRV-dLLtg@mail.gmail.com>
In-Reply-To: <CAL_JsqJd3J6k6pRar7CkHVaaPbY7jqvzAePd8rVDisRV-dLLtg@mail.gmail.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Thu, 30 Jun 2022 16:30:23 -0700
Message-ID: <CAGETcx9ZmeTyP1sJCFZ9pBbMyXeifQFohFvWN3aBPx0sSOJ2VA@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] PM: domains: Delete usage of driver_deferred_probe_check_state()
To:     Rob Herring <robh@kernel.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
        David Ahern <dsahern@kernel.org>,
        Android Kernel Team <kernel-team@android.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:THERMAL" <linux-pm@vger.kernel.org>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        netdev <netdev@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 30, 2022 at 4:26 PM Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Jun 30, 2022 at 5:11 PM Saravana Kannan <saravanak@google.com> wrote:
> >
> > On Mon, Jun 27, 2022 at 2:10 AM Tony Lindgren <tony@atomide.com> wrote:
> > >
> > > * Saravana Kannan <saravanak@google.com> [220623 08:17]:
> > > > On Thu, Jun 23, 2022 at 12:01 AM Tony Lindgren <tony@atomide.com> wrote:
> > > > >
> > > > > * Saravana Kannan <saravanak@google.com> [220622 19:05]:
> > > > > > On Tue, Jun 21, 2022 at 9:59 PM Tony Lindgren <tony@atomide.com> wrote:
> > > > > > > This issue is no directly related fw_devlink. It is a side effect of
> > > > > > > removing driver_deferred_probe_check_state(). We no longer return
> > > > > > > -EPROBE_DEFER at the end of driver_deferred_probe_check_state().
> > > > > >
> > > > > > Yes, I understand the issue. But driver_deferred_probe_check_state()
> > > > > > was deleted because fw_devlink=on should have short circuited the
> > > > > > probe attempt with an  -EPROBE_DEFER before reaching the bus/driver
> > > > > > probe function and hitting this -ENOENT failure. That's why I was
> > > > > > asking the other questions.
> > > > >
> > > > > OK. So where is the -EPROBE_DEFER supposed to happen without
> > > > > driver_deferred_probe_check_state() then?
> > > >
> > > > device_links_check_suppliers() call inside really_probe() would short
> > > > circuit and return an -EPROBE_DEFER if the device links are created as
> > > > expected.
> > >
> > > OK
> > >
> > > > > Hmm so I'm not seeing any supplier for the top level ocp device in
> > > > > the booting case without your patches. I see the suppliers for the
> > > > > ocp child device instances only.
> > > >
> > > > Hmmm... this is strange (that the device link isn't there), but this
> > > > is what I suspected.
> > >
> > > Yup, maybe it's because of the supplier being a device in the child
> > > interconnect for the ocp.
> >
> > Ugh... yeah, this is why the normal (not SYNC_STATE_ONLY) device link
> > isn't being created.
> >
> > So the aggregated view is something like (I had to set tabs = 4 space
> > to fit it within 80 cols):
> >
> >     ocp: ocp {         <========================= Consumer
> >         compatible = "simple-pm-bus";
> >         power-domains = <&prm_per>; <=========== Supplier ref
> >
> >                 l4_wkup: interconnect@44c00000 {
> >             compatible = "ti,am33xx-l4-wkup", "simple-pm-bus";
> >
> >             segment@200000 {  /* 0x44e00000 */
> >                 compatible = "simple-pm-bus";
> >
> >                 target-module@0 { /* 0x44e00000, ap 8 58.0 */
> >                     compatible = "ti,sysc-omap4", "ti,sysc";
> >
> >                     prcm: prcm@0 {
> >                         compatible = "ti,am3-prcm", "simple-bus";
> >
> >                         prm_per: prm@c00 { <========= Actual Supplier
> >                             compatible = "ti,am3-prm-inst", "ti,omap-prm-inst";
> >                         };
> >                     };
> >                 };
> >             };
> >         };
> >     };
> >
> > The power-domain supplier is the great-great-great-grand-child of the
> > consumer. It's not clear to me how this is valid. What does it even
> > mean?
> >
> > Rob, is this considered a valid DT?
>
> Valid DT for broken h/w.

I'm not sure even in that case it's valid. When the parent device is
in reset (when the SoC is coming out of reset), there's no way the
descendant is functional. And if the descendant is not functional, how
is the parent device powered up? This just feels like an incorrect
representation of the real h/w.

> So the domain must be default on and then simple-pm-bus is going to
> hold a reference to the domain preventing it from ever getting powered
> off and things seem to work. Except what happens during suspend?

But how can simple-pm-bus even get a reference? The PM domain can't
get added until we are well into the probe of the simple-pm-bus and
AFAICT the genpd attach is done before the driver probe is even
called.

-Saravana
