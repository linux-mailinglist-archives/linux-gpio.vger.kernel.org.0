Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 870DD543799
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jun 2022 17:40:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244336AbiFHPjb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jun 2022 11:39:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244423AbiFHPj3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jun 2022 11:39:29 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D8D91C4F11
        for <linux-gpio@vger.kernel.org>; Wed,  8 Jun 2022 08:39:28 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id d14so2082822eda.12
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jun 2022 08:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=on2Zkm4M4A+TaahhehRXYQDk+uXlUXfzWiaShxWCTS8=;
        b=8Wox/rz5SY8VcswXMx7sEWCQU6B0jiERX2l3sERLNdqShH/U9oU9sIFwVqFWz/Dh6M
         Wy+WnAT+kgrFm6VCUbOB71NIR12fgIP7sjGs/y2des/STG68IAL0q/iQksLWevvcEodP
         BX+06qLSbA/quie889QuPZH6l+Dfv6YnhRdz300OqJMIeNRBAmiwW96O699SBH8DILVW
         EGXGOceUrIQRekkw7GEyZ4U7enPLl5rZ+xgBGuARqmQXDJ7DSF7RlwtedJvczSks6Myq
         Gl/c7+HDdcPIbm5uwZsE0MuKilsqcFPnjyEpbAPjHuRlGqz8AodbbnUL3qVNOyptrZGs
         FzAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=on2Zkm4M4A+TaahhehRXYQDk+uXlUXfzWiaShxWCTS8=;
        b=Euk6bHQsuszcYKM2TO6SoQLKZn/ipXbjgHaZ14bfPqieQxV/sC8PgIUZGdS3ZXdKs3
         vjs53XNiJakV6viJndbFpgARjXGKQ+Y/GyEATmS7GQpySY+ubCO7zY55P575UfsAgWDj
         XaXO290mh4ebKxKMyat1DYlydMFe8kpEEwMJPFLbLzlELksMVCu0QMmvd7s82Ob5/UjL
         3Xde++71TVEBd1h8e1aeZMWHClk6faiVfdedw7FhH8N5kCdeMZGPc5+Jn0crMzOglgRH
         m6+ea14IfzBc5DVtjD3TS9xCoFY0WN0P2mifmCxP5Sr+PkEKnrFkZmSCaH+vswLdIqWx
         7lDQ==
X-Gm-Message-State: AOAM530514hxK3C2ZMJm2g541zCRIw/SlQNj54E1XEBz281NzygwDuhl
        ++7XH8ywqnhFNzQphfP9WdnEU70Fa4uYIstkqRJJUA==
X-Google-Smtp-Source: ABdhPJyTRh41N7MZJaSbUr7nKiNbaVR7mVvW/dVFmNBFg7vnUtBOF2SWTgR2GDQwo2VCKnr0OCyD+l7pyCjOjUxU1/4=
X-Received: by 2002:aa7:d8d8:0:b0:42d:dbb0:f05b with SMTP id
 k24-20020aa7d8d8000000b0042ddbb0f05bmr39900136eds.82.1654702766815; Wed, 08
 Jun 2022 08:39:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220525140704.94983-1-brgl@bgdev.pl> <20220525140704.94983-4-brgl@bgdev.pl>
 <20220603124600.GA35695@sol> <20220604024131.GB13574@sol> <Yp3TmNg2uBlC0XzI@smile.fi.intel.com>
 <20220607015220.GA9430@sol>
In-Reply-To: <20220607015220.GA9430@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 8 Jun 2022 17:39:16 +0200
Message-ID: <CAMRc=MdwgGefC0AgRCvgMfAZmq_+1GnXH6XMezjyBEKs37QuAQ@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH 3/5] bindings: python: add examples for v2 API
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
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

On Tue, Jun 7, 2022 at 3:52 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Mon, Jun 06, 2022 at 01:14:48PM +0300, Andy Shevchenko wrote:
> > On Sat, Jun 04, 2022 at 10:41:31AM +0800, Kent Gibson wrote:
> > > On Fri, Jun 03, 2022 at 08:46:00PM +0800, Kent Gibson wrote:
> > > > On Wed, May 25, 2022 at 04:07:02PM +0200, Bartosz Golaszewski wrote:
> >
> > ...
> >
> > > > The focus of my comments above is to simplify the API for the most common
> > > > case, and to make it a little more Pythonic rather than mirroring the C
> > > > API, in both cases by hiding implementation details that the casual user
> > > > doesn't need to know about.
> > > >
> > >
> > > Further to this, and recalling our discussions on tool changes, it would
> > > be great if the Python API supported identification of line by name, not
> > > just (chip,offset).
> > >
> > > e.g.
> > >     with gpiod.request_lines(
> > >         lines=("GPIO17", "GPIO18"),
> > >         edge_detection=Edge.BOTH,
> > >     ) as request:
> > >         for event in request.edge_events():
> > >             print(event)
> > >
> > > with the returned event extended to contain the line name if the line
> > > was identified by name in request_lines().
> > >
> > > The lines kwarg replaces offsets, and could contain names (strings) or
> > > offsets (integers), or a combination.  If any offsets are present then
> > > the chip path kwarg must also be provided.  If the chip isn't provided,
> > > request_lines() would find the corresponding chip based on the line name.
> >
> > From Python programmer perspective it's a good idea, but from GPIO (ABI)
> > perspective, it may be confusing. Line name is not unique (globally) and
> > basically not a part of ABI.
> >
>
> "basically not a part of the ABI"???
> Damn - we should've removed it from the line info for uAPI v2 ;-).
>
> A common request from users is to be able to request lines by name.
> Of the libgpiod bindings, Python is the best suited to allow that
> possibility directly as part of its core API.
> It also happens to be the one most likely to be used by said users.
>
> While identifying line by name can't be guaranteed to work universally,
> that doesn't mean that we should automatically exclude the possibility.
> It is possible with the current ABI - it is awkward, but possible.
> In libgpiod v1, gpiod_ctxless_find_line(), gpiod_chip_find_line() et al.,
> and in v2 gpiod_chip_get_line_offset_from_name(), do just that -
> I'm merely suggesting that similar functionality be incorporated into
> request_lines().
>
> Line names should be unique in well configured systems, even if the
> kernel itself does not guarantee it.
> The binding would perform an exhaustive search to ensure the requested
> line name is unique, and throw if not (unlike the libgpiod v1 functions
> that return the first match - yikes).
> (We could always extend the GPIO uAPI to make the mapping process less
> painful, e.g. an ioctl to perform the name to offset mapping, including
> uniqueness check, for a chip.)
> For applications targetting systems that don't guarantee uniqueness, the
> (chip,offset) approach remains available.
> And if the line names are thought to be unique within a chip, the middle
> ground of (chip,name) is also available.
>
> Wrt confusion, the alternative would be to provide a separate name based
> API wrapper, or insist that the user jump through the name mapping hoops
> themselves prior to calling the offset based API.
> Are either of those less confusing?
>
> But if the purpose of the Python binding is purely to minimally wrap the
> C ABI, warts and all, then my suggestion should most certainly be ignored.
>

I actually have a third alternative. I would like the gpiod module to
only expose the C API functionality but how about a gpiod_extended or
something similar with all kinds of python helpers? Python users are
indeed used to modules making the work easier and I'm not against it
but writing it in C would be a PITA so I'm thinking about a secondary
pure python module with those kinds of extensions.

Bart
