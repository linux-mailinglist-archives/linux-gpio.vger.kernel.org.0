Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AA6B4C5112
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Feb 2022 22:55:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235204AbiBYV4P (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Feb 2022 16:56:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235236AbiBYV4L (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Feb 2022 16:56:11 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8834218CE1
        for <linux-gpio@vger.kernel.org>; Fri, 25 Feb 2022 13:55:37 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id gb39so13400117ejc.1
        for <linux-gpio@vger.kernel.org>; Fri, 25 Feb 2022 13:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XYIjXEbmSzdH/y37XLRVlG6daa+HP7UjG46td/fwl0E=;
        b=uPGVLscFVACkYjZxDd8CGUgOSWNyc+cVKJ8dtggbXBTqrYi5+MoA3gOwnCawZ3SRN5
         42YdI5KmSfuvhsSIOo9h2WVsNqh+Mf2E1GWb4JPpAKoB4DKybSGyKqbGMFYM796c3yRY
         epsWqRH7IVmEai0pFjiSS5MBt7ZsqP5JAEvEV+BfFYFFtM46h9c+ZfLhLsQvnm0+Xhol
         ca5WDbV3stD077HKmUlq0clGYDPlo+JuHYxXK0MjQUOeJlJLgKVMZMqWggmcMX/IMiy+
         Cyv87U5XuBmm+zILsKXB4912KtRHQGZrtp8N6JWR/NZK28x3RZJKkY+VmRtfQfxsyvzs
         ijxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XYIjXEbmSzdH/y37XLRVlG6daa+HP7UjG46td/fwl0E=;
        b=eeyxtpHy6bfUNih0lZdagHqq/AkcycW2IMIPUNPNp17UJflMxnijmKB/2ymnPfsEH2
         3k59j0gZCJWGuSkYT/Xschv4PSdXTA3XjWqnvIavQ8C8lM9wST4bgCH3iRdDkRmCD4RC
         E1QVKKlQtb7qZWjgZDpCDm/mfJYP0lK1ltKwGQ7aqPfRXVhRBQ67Tl0OwMwMfmjhuZn/
         9I41aN96HIhnBm0CHavFKdHOJbSX/d6xrb+1qXQ3lHwUJ53ZSHKRZXOnWTeQVh0dXcyV
         7MhuGHsDlCaacDOVxqHBBxtsi5SC/If1iGp27IWbpoVLmfITs7bips7iAihZnNEqKMJy
         fl3g==
X-Gm-Message-State: AOAM533rCLDRoxpr4OP6zGVXPgq8trKmSoNcsZMsCDOpE4TolWg9Oajk
        GIDJi0pDl4uauZYumxOrqIXqS+gmPk/0iuSnHVE8FwHJLXs=
X-Google-Smtp-Source: ABdhPJw07vR45eRxNkgZT4sZ+RWNhvxGJ0KzeG1olNnoLmNUN0FcdiEjfQ2MA66/fTrz5Bfa0zZTtsKH0ZPblk7eqDA=
X-Received: by 2002:a17:906:1393:b0:6ba:dfb1:4435 with SMTP id
 f19-20020a170906139300b006badfb14435mr8018677ejc.736.1645826136131; Fri, 25
 Feb 2022 13:55:36 -0800 (PST)
MIME-Version: 1.0
References: <20220202114204.31918-1-joel@jms.id.au> <CAMRc=MdJX0H1i=UjvHS15+yi+LYgYEyw3puavCwL878gsQWivA@mail.gmail.com>
 <CAMRc=McUht0K+=86VfV7Z8kOU+DMoaYbX65_CrA8WVVE9XhxvA@mail.gmail.com>
 <CACPK8XeN9Ym8wGVmZ15HprGb+UePY51tmcptC2o9zbUgTcP6HQ@mail.gmail.com>
 <CAMRc=McSdV9pxxyiHWeD-nr0VKcchEG7LnT=Z8f8f8pqd_USOQ@mail.gmail.com> <20220225150801.GA179640@sol>
In-Reply-To: <20220225150801.GA179640@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 25 Feb 2022 22:55:25 +0100
Message-ID: <CAMRc=MfmvyCg+Xpir_+6HUjcpgtmRx9FjG3Fx4iG55X8NP=UNQ@mail.gmail.com>
Subject: Re: [libgpiod PATCH] core: Fix line_bulk_foreach_line invalid memory access
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Joel Stanley <joel@jms.id.au>,
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

On Fri, Feb 25, 2022 at 4:08 PM Kent Gibson <warthog618@gmail.com> wrote:
>

[snip]

> > >
> > > That's a bit frustrating.
> > >
> >
> > I know and I'm sorry. I admit that this is not the best time to try to
> > get new features in.
> >
> > > Perhaps you could make the master branch contain the code you're
> > > working on (instead of next), if you plan on abandoning the current
> > > code base?
> >
> > I can't just yet. I want to keep the codebase bisectable and only
> > merge the new API into master once it's complete for the C, C++ and
> > Python parts. The branch called next/libgpiod-2.0 contains the WIP
> > changes but they are not complete yet. I just posted the test suite
> > for C and plan on posting the complete C++ bindings soon.
> >
> > In fact - we discussed it with Kent and Linus and I expect to be able
> > to release the v2 in around two months and merge the new API into
> > master in a month.
> >
> > You can base your work on next/libgpiod-2.0 but could you just hold
> > off the new features until after the new API is in master?
> >
>
> I'm thinking that we should be re-visting the tools as part of the
> switch to libgpiod v2, as a major version bump is our only opportunity
> to make sweeping changes.
>

Yes and no. I'm not very happy about making the very command-line
users that we managed to convince to switch away from sysfs to using
gpio-tools angry again with totally incompatible changes in v2.

> I have to admit I was not initially in favour of the by-name option, as
> it is hideously inefficient compared to the offset version.  What was
> one or two ioctl calls could now be dozens, if not more.
> And the thought of that happening everytime a user wants to toggle a
> single line makes my skin crawl.
>
> However, in light of our recent discussions, I think we need it as an
> option.  But I would prefer to revise the tool command lines so lines
> can be identified by name or offset.  The named option should be the
> simplest, and so not require a --by-name flag.
> My current thinking is that the chip should become an optional arg,
> rather than a positional arg.
> So [-c <chip>] <line>...
> e.g.
>     gpioset GPIO17=active GPIO22=1
> or
>     gpioset -c gpiochip0 17=1 LED=off
>
> similarly get:
>
>     gpioget GPIO17 GPIO22
> or
>     gpioget -c gpiochip0 17 LED
>
> If the chip is not specified then the line identifier must be a name.
> If the chip is specified then the line identifier is interpreted as an
> offset if it parses as an int, else a name.
> Either way, if multiple lines are provided then they must be on the one
> chip.
> That all hinges on the assumption that line names are never simply
> stringified integers, or at least if they are then it matches the
> offset.  Is that viable?
>

We cannot make that assumptions and I would prefer to stay both
compatible AND explicit here. As in: work with offsets by default and
with names as an option. On the other hand - if we specify --by-name,
I'm fine with skipping the chip parameter and let the program look up
the line among all chips.

> The sets should also accept a set of true/false variants, such as the
> on/off, active/inactive in the examples above.

Why though? What do we gain from accepting all kinds of different
strings? IMO it just makes the interface less clear.

> The gets should return active/inactive to make it clear they refer to
> logical values, not physical values.
>

What's wrong with 1/0?

> I am also wondering why the tools are separate, instead of being merged
> into a single tool.  Is there a reason for that?
>

You mean like busybox' single executable with multiple links under
different names internally redirecting to different main() functions
or really a single tool with multiple commands?

The reason for having separate tools is that they really are tiny, the
little code they share and statically link to is negligible and it's
simply clearer as to which tool does what. I didn't want the tools to
be this swiss-knife do-it-all program that requires studying the
README for a long time.

> I've got a bunch of other minor changes that I've been trialing in my
> Rust library.  So I have a working prototype of the set --interactive
> that I had mentioned.  I scrapped the batch option - it doesn't
> add much that the interactive mode and a named pipe doesn't already give
> you.
>

gpioset --interactive is definitely something I'm interested in.

> But I digress.  The main thing I want to achieve here is to determine
> where you want to go with the tools for v2, and what any contraints
> might be.  Then we can take it from there.
>

While the total overhaul of the library is understandable, I would
prefer to keep the tools mostly backward compatible. I plan on adding
gpiowatch for watching info events but that's it. Do you see any
things that are obviously wrong in how the tools work that would
justify the sweeping changing you mention?

Bart

> Cheers,
> Kent.
