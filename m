Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2F574C4850
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Feb 2022 16:08:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240124AbiBYPIm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Feb 2022 10:08:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240103AbiBYPIl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Feb 2022 10:08:41 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 988C62D1C1
        for <linux-gpio@vger.kernel.org>; Fri, 25 Feb 2022 07:08:07 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id iq13-20020a17090afb4d00b001bc4437df2cso5063444pjb.2
        for <linux-gpio@vger.kernel.org>; Fri, 25 Feb 2022 07:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=or9R+iDqVJ+AjlfrJegvHW/IiibtBCU5k60SVmbitno=;
        b=S9gA5t1ojHpVXnYx/92y6aQpxSpwn08fqOYKPDMsDlIcierO3vJTPOU5TrUEFG7HP0
         UF9hO25gsJvXtaKAs6fmFfdUEAD5KdmijdgvFuwi6ltP97rJTvRZ5NJ9jlCIejf9oL2O
         tYVFnR/MQSVuR7oBvh/wsKQRFtRrNLt5FJkMHnKjPXd0h2l1OpmS8oENhheN/79eCQJL
         0M0Aee0yZqV1L5WOMoYsrIS+/Y1bRIL/5xVGE5SgLWjzgNc+74OrRcpmtZMYhWLsLkM6
         w7QcJN/UPMKijJKKUwfCA9mikfSfY5YKckXcL5b46iR9qaYGf8KGYCJDBRJXBAJSNzqE
         J4tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=or9R+iDqVJ+AjlfrJegvHW/IiibtBCU5k60SVmbitno=;
        b=SbyBNTrLKwZaWFAXF2DmTlLEEIV10kn/i1FXbugT34ttT5Eb10Zng+1izK3miZ1nuk
         j9gxpCaNhnZyjtwsL7GBsdWGeuxgPokreRmylubMOqZGRjLOgQE+88uuJnTkqrfLSOpT
         OvyrsfwkRfkD+aLW7WMp+9Agcya9EAus1bA/1s++Tqrb8tk/84y4xmTfztEHJawWPbik
         UpcKYjislH0E3r6vZCUzUpFz3IDW98fU3XE6HyYc9nLaFu/3NU4XxYgsBm2K8DSR63ge
         vNFsEjDquMJ1ZeJKcNTnbJBhjAo73xqDFi71Y1k2wIfcyRuv2wHiQNmS+HluEeIE1k9C
         oB/w==
X-Gm-Message-State: AOAM532J3nMux5n6tcgcgyW94XZcm0I7YEoIeF0j/e0iJkUhy9ATTkEK
        DHt2R/tE+gyoXnFf1DfRxTor4x1tZo9i1g==
X-Google-Smtp-Source: ABdhPJxp7kZDYSDRdVcSf5FxSJPodI68/wzT2+dNz9mocRhEu95pQC2U4RSk4tkoDIWYVj9ml8EMDA==
X-Received: by 2002:a17:902:e852:b0:150:1120:9857 with SMTP id t18-20020a170902e85200b0015011209857mr7908506plg.103.1645801686868;
        Fri, 25 Feb 2022 07:08:06 -0800 (PST)
Received: from sol (60-242-155-106.static.tpgi.com.au. [60.242.155.106])
        by smtp.gmail.com with ESMTPSA id s42-20020a056a0017aa00b004df8133df4asm3964579pfg.179.2022.02.25.07.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 07:08:06 -0800 (PST)
Date:   Fri, 25 Feb 2022 23:08:01 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Joel Stanley <joel@jms.id.au>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod PATCH] core: Fix line_bulk_foreach_line invalid memory
 access
Message-ID: <20220225150801.GA179640@sol>
References: <20220202114204.31918-1-joel@jms.id.au>
 <CAMRc=MdJX0H1i=UjvHS15+yi+LYgYEyw3puavCwL878gsQWivA@mail.gmail.com>
 <CAMRc=McUht0K+=86VfV7Z8kOU+DMoaYbX65_CrA8WVVE9XhxvA@mail.gmail.com>
 <CACPK8XeN9Ym8wGVmZ15HprGb+UePY51tmcptC2o9zbUgTcP6HQ@mail.gmail.com>
 <CAMRc=McSdV9pxxyiHWeD-nr0VKcchEG7LnT=Z8f8f8pqd_USOQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=McSdV9pxxyiHWeD-nr0VKcchEG7LnT=Z8f8f8pqd_USOQ@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 24, 2022 at 03:50:18PM +0100, Bartosz Golaszewski wrote:
> On Thu, Feb 24, 2022 at 2:15 AM Joel Stanley <joel@jms.id.au> wrote:
> >
> > On Fri, 18 Feb 2022 at 18:42, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > >
> > > On Fri, Feb 18, 2022 at 7:38 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > > >
> > > > On Wed, Feb 2, 2022 at 12:42 PM Joel Stanley <joel@jms.id.au> wrote:
> > > > >
> > > > > Running libgpiod applications under valgrind results in the following
> > > > > warning:
> > > > >
> > > > > ==3006== Invalid read of size 8
> > > > > ==3006==    at 0x10C867: line_request_values (core.c:711)
> > > > > ==3006==    by 0x10CDA6: gpiod_line_request_bulk (core.c:849)
> > > > > ==3006==    by 0x10AE27: main (gpioset.c:323)
> > > > > ==3006==  Address 0x4a4d370 is 0 bytes after a block of size 16 alloc'd
> > > > > ==3006==    at 0x483F790: malloc (in /usr/libexec/valgrind/vgpreload_memcheck-amd64-linux.so)
> > > > > ==3006==    by 0x10B884: gpiod_line_bulk_new (core.c:109)
> > > > > ==3006==    by 0x10DBB0: gpiod_chip_get_lines (helpers.c:24)
> > > > > ==3006==    by 0x10ADC3: main (gpioset.c:313)
> > > > >
> > > > > This is because the foreach loop reads the next value before checking
> > > > > that index is still in bounds.
> > > > >
> > > > > Add a test to avoid reading past the end of the allocation.
> > > > >
> > > > > This bug is not present a released version of libgpiod.
> > > > >
> > > > > Fixes: 2b02d7ae1aa6 ("treewide: rework struct gpiod_line_bulk")
> > > > > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > > > > ---
> > > > >  lib/core.c | 3 ++-
> > > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/lib/core.c b/lib/core.c
> > > > > index 6ef09baec0f5..4463a7014776 100644
> > > > > --- a/lib/core.c
> > > > > +++ b/lib/core.c
> > > > > @@ -178,7 +178,8 @@ GPIOD_API void gpiod_line_bulk_foreach_line(struct gpiod_line_bulk *bulk,
> > > > >  #define line_bulk_foreach_line(bulk, line, index)                      \
> > > > >         for ((index) = 0, (line) = (bulk)->lines[0];                    \
> > > > >              (index) < (bulk)->num_lines;                               \
> > > > > -            (index)++, (line) = (bulk)->lines[(index)])
> > > > > +            (index)++,                                                 \
> > > > > +            (line) = (index) < (bulk)->num_lines ? (bulk)->lines[(index)] : NULL)
> > > > >
> > > > >  GPIOD_API bool gpiod_is_gpiochip_device(const char *path)
> > > > >  {
> > > > > --
> > > > > 2.34.1
> > > > >
> > > >
> > > > I'll skip this because this entire struct is going away in v2 and the
> > > > bug is not present in v1.6.x.
> > > >
> > > > Bart
> > >
> > > Ugh actually all three patches fix issues in the master branch that
> > > have never been nor will be released.
> > >
> > > I'm not sure if I made myself clear on that - the changes in the
> > > master branch are going away and the de facto new API is in
> > > next/libgpiod-2.0. I already pushed the other two so I'll leave them
> > > there but please take a look at the next branch so that you know how
> > > the upcoming API will work. That's also applicable to the patches
> > > adding the by-name option to the tools - I think it would be better to
> > > base them on that branch right away.
> >
> > That's a bit frustrating.
> >
> 
> I know and I'm sorry. I admit that this is not the best time to try to
> get new features in.
> 
> > Perhaps you could make the master branch contain the code you're
> > working on (instead of next), if you plan on abandoning the current
> > code base?
> 
> I can't just yet. I want to keep the codebase bisectable and only
> merge the new API into master once it's complete for the C, C++ and
> Python parts. The branch called next/libgpiod-2.0 contains the WIP
> changes but they are not complete yet. I just posted the test suite
> for C and plan on posting the complete C++ bindings soon.
> 
> In fact - we discussed it with Kent and Linus and I expect to be able
> to release the v2 in around two months and merge the new API into
> master in a month.
> 
> You can base your work on next/libgpiod-2.0 but could you just hold
> off the new features until after the new API is in master?
> 

I'm thinking that we should be re-visting the tools as part of the
switch to libgpiod v2, as a major version bump is our only opportunity
to make sweeping changes.

I have to admit I was not initially in favour of the by-name option, as
it is hideously inefficient compared to the offset version.  What was 
one or two ioctl calls could now be dozens, if not more.
And the thought of that happening everytime a user wants to toggle a
single line makes my skin crawl.

However, in light of our recent discussions, I think we need it as an
option.  But I would prefer to revise the tool command lines so lines
can be identified by name or offset.  The named option should be the
simplest, and so not require a --by-name flag.
My current thinking is that the chip should become an optional arg,
rather than a positional arg.
So [-c <chip>] <line>...
e.g.
    gpioset GPIO17=active GPIO22=1
or
    gpioset -c gpiochip0 17=1 LED=off

similarly get:

    gpioget GPIO17 GPIO22
or
    gpioget -c gpiochip0 17 LED

If the chip is not specified then the line identifier must be a name.
If the chip is specified then the line identifier is interpreted as an
offset if it parses as an int, else a name.
Either way, if multiple lines are provided then they must be on the one
chip.
That all hinges on the assumption that line names are never simply
stringified integers, or at least if they are then it matches the
offset.  Is that viable?

The sets should also accept a set of true/false variants, such as the
on/off, active/inactive in the examples above.
The gets should return active/inactive to make it clear they refer to
logical values, not physical values.

I am also wondering why the tools are separate, instead of being merged
into a single tool.  Is there a reason for that?

I've got a bunch of other minor changes that I've been trialing in my
Rust library.  So I have a working prototype of the set --interactive
that I had mentioned.  I scrapped the batch option - it doesn't
add much that the interactive mode and a named pipe doesn't already give
you.

But I digress.  The main thing I want to achieve here is to determine
where you want to go with the tools for v2, and what any contraints
might be.  Then we can take it from there.

Cheers,
Kent.
