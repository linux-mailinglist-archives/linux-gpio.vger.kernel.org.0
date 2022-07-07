Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E443F56AC8E
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Jul 2022 22:11:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235637AbiGGUJ7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Jul 2022 16:09:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235829AbiGGUJ6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Jul 2022 16:09:58 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A01D2718
        for <linux-gpio@vger.kernel.org>; Thu,  7 Jul 2022 13:09:56 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id n4so15021545ejz.10
        for <linux-gpio@vger.kernel.org>; Thu, 07 Jul 2022 13:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KIxrArYXI6WmiHHTPncIWFFcPGCSFMO07jaRgaKNSiA=;
        b=A+FrZgecmHEqgmkMcMPDctfBgZQ4a+c+C+gsstvkDb6A/J8Ly9jDHlJzsGWQKbRavj
         tF1LSOAsnugKyn8ECektX07Ntb1jTY601DwAblKmAQhhtFiPqqOSgdDkZM6i5Q01AaJL
         sBiN/kNHzHsOm3ElIxAExmPptkQrsKFH/fZECMwln0CTWT33eIbEETajvSmNtjT4fbCr
         XcaljWYCpWjwJlanfHQ9fg7Cwm7B44aPG97MFX2u5Uf0OiXmKlfBlXrtx2JClEOy2D6k
         0LcwTMSrvtu+N3A515n6WUF5DhWmTR+igTWZJ9YvQva7h057c9zgcHuaYOnxbkqFeAda
         7HkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KIxrArYXI6WmiHHTPncIWFFcPGCSFMO07jaRgaKNSiA=;
        b=7mdpN9pVRAoe080W4BzB2g+I9Gq7yvai4mH36ZkTykR+s0PllUgULkj6HlxuF3/3O8
         pA8PEFD2YLlWKWU+Gu/UJPAk4KPnnd1aln/e12KeRg48KVhPX0berRlRIwy7DNSk9ypw
         ofTQYYVoDHYLvcR3uhQfQG0DpR9J1ok4lC9wXqJhBV8FqI89BQ84uo5i4FzuMGn07yZv
         gwv54XP3nEUeKtHbnKoSwhV7xw8NpmiKd0qvC2lfBwz51gnXzOhLlNfzbqJPcTuaTBZC
         ldlJ88fNTPd62dFsOpB2Gq9oesGThYa98IOCB6xswoGlFD4KQdUZZjuRgAmGMw72dumu
         MTyg==
X-Gm-Message-State: AJIora+VWUSuABPh318GaAgjFI7O0DpKEVMqs2d81AggnM9K83xcijcU
        C2efspfFwmsasHZwAOepjU4J99fV/kyi8IhEUzuG6g==
X-Google-Smtp-Source: AGRyM1vrJ9gcs/RNyGHtjiTYCk4kBaDQIPeZOJ/AjMomuykYsMChBpRKOh1NK9BYWDmO1KKhtmaoegRh5kGqFQNxmyE=
X-Received: by 2002:a17:907:2c61:b0:72b:172d:6413 with SMTP id
 ib1-20020a1709072c6100b0072b172d6413mr2751197ejc.492.1657224595090; Thu, 07
 Jul 2022 13:09:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220628084226.472035-1-brgl@bgdev.pl> <20220628084226.472035-6-brgl@bgdev.pl>
 <20220705020937.GB6652@sol> <CAMRc=Mec4C2RUvZjxc=6G6Nv0-Us91X-j-3jnNNGzE8MjrbCag@mail.gmail.com>
 <20220707130955.GB66970@sol>
In-Reply-To: <20220707130955.GB66970@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 7 Jul 2022 22:09:44 +0200
Message-ID: <CAMRc=MfuzzjkApJ4LBARG0OpfvfBeMqVMTRnKJuj7zV4Gvez1Q@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH v2 5/5] bindings: python: add the
 implementation for v2 API
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Darrien <darrien@freenet.de>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jiri Benc <jbenc@upir.cz>, Joel Savitz <joelsavitz@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 7, 2022 at 3:10 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Thu, Jul 07, 2022 at 02:19:17PM +0200, Bartosz Golaszewski wrote:
> > On Tue, Jul 5, 2022 at 4:09 AM Kent Gibson <warthog618@gmail.com> wrote:

[snip]

> > >
> > > How about merging the _default and _offset forms by adding an offsets
> > > kwarg?
> > > offsets=None (or unspecified) -> default
> > > offsets=int -> offset
> > > offsets=iterable -> offsets
> > >
> > > Off on a bit of a tangent... why should the end user care about
> > > defaults and overrides?
> > > For a higher level abstraction I'd prefer to see the whole "default"
> > > concept disappear in favour of the config for each line.  That would
> > > remove a lot of the complexity from the LineConfig interface.
> > > Though it would add complexity to the binding internals.
> > >
> >
> > What would that look like (in python code) if I wanted to request 5
> > lines and use the same config for them?
> >
>
> That is the trivial case - you use the module level
> gpiod.request_lines() as is and pass in the config parameters and list of
> lines you want.
>
> req = gpiod.request_lines(chip="gpiochip0", offsets=[1,2,3,4,5],
>                           direction="output", values=[1,0,1,0,0])
>

This is close to what I have now in my v3 branch. Except that values
is called output_values and takes a dictionary like its counterpart in
LineConfig but that can be extended to interpreting a list as
providing the values for corresponding offsets/lines. Current version
of request_lines() takes all LineConfig options and uses them as the
defaults.

> The more complicated case is where the lines config differs.
> Then you have to build the LineConfig by adding the config for each set
> of lines in a separate call to set_props().
> Then you provide that LineConfig to the request_lines(), along with the
> set of lines.
>
> lc.set_props(offsets=[1,2,3], direction="input")
> lc.set_props(offsets=[4,5], direction="output", values=[1,0])
> req = gpiod.request_lines(chip="gpiochip0", line_cfg=lc)
>
> (simplified examples using stringified prop values etc - hope you get
> the idea)
>
> Building that on top of the C API, you would determine the "default"
> config based on the most common attribute values, then override the
> config for the lines that differ from that default.
> That is the internal complexity I mentioned.
>

Internal complexity is fine - it's the implicitness of the defaults
that make me not like this idea. I think we discussed something
similar for the C API and I was against it too. Your examples are fine
but the defaults for lines not mentioned in set_props() would be
filled by a freshly created LineConfig with its well defined default
values. In other words I prefer to keep the override mechanism visible
in python but unification of the property setters is something I will
consider.

To me it should look like:

lc.set_props(direction=Direction.INPUT, edge_detection=Edge.BOTH) sets
the defaults
lc.set_props(offset=4, direction=Direction.OUTPUT) sets a single override
lc.set_props(offsets=[5, 1], direction=Direction.OUTPUT,
output_value=Value.ACTIVE) sets a set of overrides.

Bart

> > > [snip]
> > > > +     static char *kwlist[] = {
> > > > +             "path",
> > > > +             "req_cfg",
> > > > +             "line_cfg",
> > > > +             "lines",
> > > > +             "direction",
> > > > +             "edge_detection",
> > > > +             "bias",
> > > > +             "drive",
> > > > +             "active_low",
> > > > +             "debounce_period",
> > > > +             "event_clock",
> > > > +             "output_value",
> > > > +             "output_values",
> > > > +             NULL
> > > > +     };
> > > > +
> > >
> > > My suggestion to provide a lines parameter here was actually a poor one,
> > > given the LineConfig only deals with offsets - which is totally reasonable
> > > as supporting line names in LineConfig would be complicated.
> > > I would prefer the two to be consistent, and so use offsets.
> > >
> >
> > I disagree. In the module-wide request function we have the chip
> > already, we can map the names to offsets. It makes perfect sense to do
> > it implicitly here as a pythonic shorthand for opening the chip
> > manually and requesting lines separately. This function already got
> > improved a lot in my v3.
> >
>
> Yeah, good point - the caller of the module level function won't have a
> Chip object to do the mapping.  And forcing them to create one defeats
> the purpose of having the module level function in the first place.
>
> Cheers,
> Kent.
