Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D769B56B5F7
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jul 2022 11:54:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237853AbiGHJuU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jul 2022 05:50:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237676AbiGHJuT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jul 2022 05:50:19 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76651823BC
        for <linux-gpio@vger.kernel.org>; Fri,  8 Jul 2022 02:50:11 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a9so7084005ejf.6
        for <linux-gpio@vger.kernel.org>; Fri, 08 Jul 2022 02:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vFg34GBTrDPV7mJXn7hPjAYCguC+rPNSl2CgD0TJNAw=;
        b=DQiNC4BuyhCk8yhlvocA01Gm7vW6Cwtnuqmjn9Cf8I9tf+9SHPwaHg+mkcPHHh1TAS
         6foVH9YBCc3XJQUrTQ9GGYWVo7CMQwyhJNUuOI1hcuyDbDbS52J4VqfWMILB+sWYeWWX
         dcPDU71AD5JRj8wQoKAfDipIPU+jxsnSeFMY3bxYOstn4Nfc6eb9T9TNrDAEe1BVaUy9
         EQBp9Bqi/bQUNmRnhm+tAJDX85Vm0GLDnDB+wAcDt+Itpb4Sw7b8NrssHwpbbHiD+sT9
         d27BVSkHm/W9ahngWFvj3GR9Onke50SlgnnRx/hiLIXKyjmglVLqqVPZN/oUV0ZLKGEK
         Y9gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vFg34GBTrDPV7mJXn7hPjAYCguC+rPNSl2CgD0TJNAw=;
        b=XoExCLb1n3BzFG6zdWTC8sX1OAesNwvyINlQ+3wHeFUqcNw6oA1jZroN859aqnRu0t
         3ZaVJ7j2DT6v8WbgAdHgYwGoJ3C+casEPnHLSBumkUO5ysb0Y0wwC3Qp4j1XzaxpBD0W
         /nG9ByP1z5rFcmC4PeX8NvqPG7GkzW4oOFcTF6jtaP7DdzsMgOsSc3NlYKH7u+0/qWmT
         je6PfuajuKcWBFvAhvhbbwoUXnuNmcYTUkk9GUjucyiJf33+iXhPZvQuj/EW3XEDlrf0
         a2MUGHOwUe2gDXStgxjA36W8qWYVfeeFLbFV/o9zljqj8V/7EnikWR1tyddsh9UchSTP
         c9vA==
X-Gm-Message-State: AJIora/BmcCwzhp9K5MBmVlYfHAijWGXBKlPd7xYTI1vJWojH11YaHVO
        kvWPeqSumc1UMCfNxW29VoD1UHDU+M6xkso2c2FNSPCA2ao=
X-Google-Smtp-Source: AGRyM1v85PbnRAdWnDiJzHdUYhMp3tFCgh1cxS4UwWU8aQnuPzo0gt2CS438712uN6MkJisryD7z2CZwhDeSiuOb5K8=
X-Received: by 2002:a17:907:3e20:b0:726:2c09:3fa4 with SMTP id
 hp32-20020a1709073e2000b007262c093fa4mr2589359ejc.101.1657273809897; Fri, 08
 Jul 2022 02:50:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220628084226.472035-1-brgl@bgdev.pl> <20220628084226.472035-6-brgl@bgdev.pl>
 <20220705020937.GB6652@sol> <CAMRc=Mec4C2RUvZjxc=6G6Nv0-Us91X-j-3jnNNGzE8MjrbCag@mail.gmail.com>
 <20220707130955.GB66970@sol> <CAMRc=MfuzzjkApJ4LBARG0OpfvfBeMqVMTRnKJuj7zV4Gvez1Q@mail.gmail.com>
 <20220708013834.GA6484@sol>
In-Reply-To: <20220708013834.GA6484@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 8 Jul 2022 11:49:59 +0200
Message-ID: <CAMRc=MfGT_FZ=LToa4DPqc3UqjAbt+9dpT2NtKOmMqhcFKWLZQ@mail.gmail.com>
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

On Fri, Jul 8, 2022 at 3:38 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Thu, Jul 07, 2022 at 10:09:44PM +0200, Bartosz Golaszewski wrote:
> > On Thu, Jul 7, 2022 at 3:10 PM Kent Gibson <warthog618@gmail.com> wrote:
> > >
> > > On Thu, Jul 07, 2022 at 02:19:17PM +0200, Bartosz Golaszewski wrote:
> > > > On Tue, Jul 5, 2022 at 4:09 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > [snip]
> >
> > > > >
> > > > > How about merging the _default and _offset forms by adding an offsets
> > > > > kwarg?
> > > > > offsets=None (or unspecified) -> default
> > > > > offsets=int -> offset
> > > > > offsets=iterable -> offsets
> > > > >
> > > > > Off on a bit of a tangent... why should the end user care about
> > > > > defaults and overrides?
> > > > > For a higher level abstraction I'd prefer to see the whole "default"
> > > > > concept disappear in favour of the config for each line.  That would
> > > > > remove a lot of the complexity from the LineConfig interface.
> > > > > Though it would add complexity to the binding internals.
> > > > >
> > > >
> > > > What would that look like (in python code) if I wanted to request 5
> > > > lines and use the same config for them?
> > > >
> > >
> > > That is the trivial case - you use the module level
> > > gpiod.request_lines() as is and pass in the config parameters and list of
> > > lines you want.
> > >
> > > req = gpiod.request_lines(chip="gpiochip0", offsets=[1,2,3,4,5],
> > >                           direction="output", values=[1,0,1,0,0])
> > >
> >
> > This is close to what I have now in my v3 branch. Except that values
> > is called output_values and takes a dictionary like its counterpart in
> > LineConfig but that can be extended to interpreting a list as
> > providing the values for corresponding offsets/lines. Current version
> > of request_lines() takes all LineConfig options and uses them as the
> > defaults.
> >
> > > The more complicated case is where the lines config differs.
> > > Then you have to build the LineConfig by adding the config for each set
> > > of lines in a separate call to set_props().
> > > Then you provide that LineConfig to the request_lines(), along with the
> > > set of lines.
> > >
> > > lc.set_props(offsets=[1,2,3], direction="input")
> > > lc.set_props(offsets=[4,5], direction="output", values=[1,0])
> > > req = gpiod.request_lines(chip="gpiochip0", line_cfg=lc)
> > >
> > > (simplified examples using stringified prop values etc - hope you get
> > > the idea)
> > >
> > > Building that on top of the C API, you would determine the "default"
> > > config based on the most common attribute values, then override the
> > > config for the lines that differ from that default.
> > > That is the internal complexity I mentioned.
> > >
> >
> > Internal complexity is fine - it's the implicitness of the defaults
> > that make me not like this idea. I think we discussed something
> > similar for the C API and I was against it too. Your examples are fine
> > but the defaults for lines not mentioned in set_props() would be
> > filled by a freshly created LineConfig with its well defined default
> > values. In other words I prefer to keep the override mechanism visible
> > in python but unification of the property setters is something I will
> > consider.
> >
>
> I suspect you are right that we've been here before and I'm flogging a
> dead horse, but you get that - I must think there is still a bit of life
> in the old nag ;-).
>
> I find it ironic that a feature of the uAPI that is there due to
> the constraints on the uAPI, i.e. to keep the line_config to a
> manageable size, gets propagated this highly.  In my mind the
> configuration for each line has always been distinct, and the uAPI
> line_config is just a reduced form.
>

The limitation of the uAPI is what keeps us from making it true in
user-space (that each line can have its own config). As it is, only up
to 9-10 lines can have distinct configs and making the API look and
behave as if it wasn't the case is more confusing (E2BIG errors) than
simply admitting we have the concept of defaults and overrides (to
which the interface is greatly simplified in the high-level
libraries). The idea about making the most common config attributes
become the defaults is simply bad. It would require the user to
anticipate how the library will behave for every attribute and lead to
way more confusion than simply providing a set of defaults (either
implicitly from a freshly created LineConfig or by defining a set of
defaults manually). I would argue that deriving the defaults from the
most common values would be much more dangerous than the case you
describe below. :)

> (it was also a logical stepping stone from the v1 "all lines have the
> same config", which maybe where your attachment to a default originates,
> to "all lines can be configured independently" that I was going for in
> v2, but practicality limited to "all lines can be configured
> independently - to a point", basically by supporting a limited number
> of deltas - which you refer to as overrides)
>
> > To me it should look like:
> >
> > lc.set_props(direction=Direction.INPUT, edge_detection=Edge.BOTH) sets
> > the defaults
> > lc.set_props(offset=4, direction=Direction.OUTPUT) sets a single override
> > lc.set_props(offsets=[5, 1], direction=Direction.OUTPUT,
> > output_value=Value.ACTIVE) sets a set of overrides.
> >
>
> I could argue that I don't like the implictness of lines 1, 2 and 3 here.
>

I disagree. They are defined (if you actually do request them) as:
take the safe defaults from a new LineConfig and set direction to
input and detect both edge interrupts. Without the first call, they
would use the defaults from LineConfig. It's not that complicated.

> The LineConfig defaults are safe.  Allowing the user to redefine the
> defaults that apply to a request, separately from where the request is
> made mind you, is potentially dangerous.
>

Yes, the implicit defaults are safe. That's not an argument against
allowing the defaults to be EXPLICITLY changed by the user though.

> What if you make the default OUTPUT, and then elsewhere you request
> lines and include line 6, forgetting to set it to an INPUT or assuming
> that by default you'll get an INPUT?  Kiss that board goodbye.
>

I don't buy this argument. The same user could forget any number of
other configuration options. You want to be safe? You use a fresh
LineConfig when requesting lines. There's always a trade-off between
giving more power to users and not letting them shoot themselves in
the foot. It's just a matter of where the line is drawn.

> OTOH the LineConfig "well defined default values" are safe.
> Forget to define the config for a line - get a vanilla input.
>
> I wasn't overly concerned about this in the uAPI itself as I was assuming
> that at a higher level the lines would be configured separately, and
> the higher level language binding would perform the encoding to uAPI.
> Turns out that isn't always the case :-|.
>

It's a question of the most common use-cases vs advanced usage. With
the module-wide request function in Python, the code can be very
concise and intuitive and you don't need to think about defaults and
overrides at all. But if you want to do something else, you can.

Bart
