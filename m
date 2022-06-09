Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E97B5442C4
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jun 2022 06:49:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233290AbiFIEte (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Jun 2022 00:49:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229791AbiFIEtd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Jun 2022 00:49:33 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ACD86160
        for <linux-gpio@vger.kernel.org>; Wed,  8 Jun 2022 21:49:32 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id e24so20434959pjt.0
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jun 2022 21:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7dBWxJcANaRiarlu4aQIbOIcgv0IF8mDn6YMEWjKl/0=;
        b=HOljL+e65I5otR2V5oIEWTMPb+286b33HQQpYrew/Zmy6My5cO113uR2v6b1WTx28u
         HWUl1/0uDHdonM7DdTR+VnNz9thQ7dwKZgoogxE2Cq8XnrH2LqdEVxEjDUUPwZ7VqFZy
         spq1iZXrt9kPhlHPg37oOVHnPx749dASK9Hc/d6WTMs1jCQ/pJDimX7EmPYaCNzJFWE0
         f8W/FDB9UJru1T0BUIPVwn8c2noXIrbY8++g9X67DomxtJ7NiHVhIDwY2fmoLX77ReQU
         vo0vgh/vKxexS49V+15OToQL8wmKBTi5ZdRZC93K1+bRBmGAdoTcMvnmuzqSJCJ1a9UE
         Tvcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7dBWxJcANaRiarlu4aQIbOIcgv0IF8mDn6YMEWjKl/0=;
        b=3fKV3fWS1Mji2Cc/VEQrzQNoE6635jYs2D+T7xVvPS1YYhB/n5EPc10hOYxhO0dERi
         LUxuPC8kRh2VelVN9lTOR8qGZ3pNyurxYTT5VBpa7kZnhft70g+7b4sr5zUKIIxY2WOD
         L3x30P97EFnjUGc4i4bbhLTIU7g7G8u/SS+amg/zXMzEx1MpjJ8Oln5AKEG7IIbMhvTq
         u9YrRGPhq8xZdce81pCP35pmYP+mTR8JbopC+HAqh/MuyZW87eLqltBuv4ppsijSJ6Is
         AnhZasuRf4N4NleC/cRjp9bIg/PiU++FCtM0U5Sr8nb+wki6+WzBgolMbBR53NiGq5RI
         x5pg==
X-Gm-Message-State: AOAM533C66jwundEr4Xh+yS7VH+EnHdU0kGJXPqQmC78IkMbRYwNxZ0K
        n5RFSerxyKqkqyb8RdJ9has=
X-Google-Smtp-Source: ABdhPJy7ncawixdUnIyN6onVLcIQSLwwRtCBCmCncU8HBp2XUvGNnC3EqWoi9vTmfE4wvurUSgTb6g==
X-Received: by 2002:a17:90b:1c07:b0:1e3:c8c:d4fa with SMTP id oc7-20020a17090b1c0700b001e30c8cd4famr1517825pjb.157.1654750171510;
        Wed, 08 Jun 2022 21:49:31 -0700 (PDT)
Received: from sol (14-200-166-137.static.tpgi.com.au. [14.200.166.137])
        by smtp.gmail.com with ESMTPSA id 205-20020a6216d6000000b0050dc76281f0sm15949712pfw.202.2022.06.08.21.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 21:49:30 -0700 (PDT)
Date:   Thu, 9 Jun 2022 12:49:22 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Darrien <darrien@freenet.de>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jiri Benc <jbenc@upir.cz>, Joel Savitz <joelsavitz@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod v2][PATCH 3/5] bindings: python: add examples for v2
 API
Message-ID: <20220609044922.GA11301@sol>
References: <20220525140704.94983-1-brgl@bgdev.pl>
 <20220525140704.94983-4-brgl@bgdev.pl>
 <20220603124600.GA35695@sol>
 <20220604024131.GB13574@sol>
 <Yp3TmNg2uBlC0XzI@smile.fi.intel.com>
 <20220607015220.GA9430@sol>
 <CAMRc=MdwgGefC0AgRCvgMfAZmq_+1GnXH6XMezjyBEKs37QuAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MdwgGefC0AgRCvgMfAZmq_+1GnXH6XMezjyBEKs37QuAQ@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 08, 2022 at 05:39:16PM +0200, Bartosz Golaszewski wrote:
> On Tue, Jun 7, 2022 at 3:52 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Mon, Jun 06, 2022 at 01:14:48PM +0300, Andy Shevchenko wrote:
> > > On Sat, Jun 04, 2022 at 10:41:31AM +0800, Kent Gibson wrote:
> > > > On Fri, Jun 03, 2022 at 08:46:00PM +0800, Kent Gibson wrote:
> > > > > On Wed, May 25, 2022 at 04:07:02PM +0200, Bartosz Golaszewski wrote:
> > >
> > > ...
> > >
> > > > > The focus of my comments above is to simplify the API for the most common
> > > > > case, and to make it a little more Pythonic rather than mirroring the C
> > > > > API, in both cases by hiding implementation details that the casual user
> > > > > doesn't need to know about.
> > > > >
> > > >
> > > > Further to this, and recalling our discussions on tool changes, it would
> > > > be great if the Python API supported identification of line by name, not
> > > > just (chip,offset).
> > > >
> > > > e.g.
> > > >     with gpiod.request_lines(
> > > >         lines=("GPIO17", "GPIO18"),
> > > >         edge_detection=Edge.BOTH,
> > > >     ) as request:
> > > >         for event in request.edge_events():
> > > >             print(event)
> > > >
> > > > with the returned event extended to contain the line name if the line
> > > > was identified by name in request_lines().
> > > >
> > > > The lines kwarg replaces offsets, and could contain names (strings) or
> > > > offsets (integers), or a combination.  If any offsets are present then
> > > > the chip path kwarg must also be provided.  If the chip isn't provided,
> > > > request_lines() would find the corresponding chip based on the line name.
> > >
> > > From Python programmer perspective it's a good idea, but from GPIO (ABI)
> > > perspective, it may be confusing. Line name is not unique (globally) and
> > > basically not a part of ABI.
> > >
> >
> > "basically not a part of the ABI"???
> > Damn - we should've removed it from the line info for uAPI v2 ;-).
> >
> > A common request from users is to be able to request lines by name.
> > Of the libgpiod bindings, Python is the best suited to allow that
> > possibility directly as part of its core API.
> > It also happens to be the one most likely to be used by said users.
> >
> > While identifying line by name can't be guaranteed to work universally,
> > that doesn't mean that we should automatically exclude the possibility.
> > It is possible with the current ABI - it is awkward, but possible.
> > In libgpiod v1, gpiod_ctxless_find_line(), gpiod_chip_find_line() et al.,
> > and in v2 gpiod_chip_get_line_offset_from_name(), do just that -
> > I'm merely suggesting that similar functionality be incorporated into
> > request_lines().
> >
> > Line names should be unique in well configured systems, even if the
> > kernel itself does not guarantee it.
> > The binding would perform an exhaustive search to ensure the requested
> > line name is unique, and throw if not (unlike the libgpiod v1 functions
> > that return the first match - yikes).
> > (We could always extend the GPIO uAPI to make the mapping process less
> > painful, e.g. an ioctl to perform the name to offset mapping, including
> > uniqueness check, for a chip.)
> > For applications targetting systems that don't guarantee uniqueness, the
> > (chip,offset) approach remains available.
> > And if the line names are thought to be unique within a chip, the middle
> > ground of (chip,name) is also available.
> >
> > Wrt confusion, the alternative would be to provide a separate name based
> > API wrapper, or insist that the user jump through the name mapping hoops
> > themselves prior to calling the offset based API.
> > Are either of those less confusing?
> >
> > But if the purpose of the Python binding is purely to minimally wrap the
> > C ABI, warts and all, then my suggestion should most certainly be ignored.
> >
> 
> I actually have a third alternative. I would like the gpiod module to
> only expose the C API functionality but how about a gpiod_extended or
> something similar with all kinds of python helpers? Python users are
> indeed used to modules making the work easier and I'm not against it
> but writing it in C would be a PITA so I'm thinking about a secondary
> pure python module with those kinds of extensions.
> 

Agree that it would be easier to write a pythonic wrapper around the C
API in Python, so no problem with that.
However, the pythonic wrapper should the one named gpiod, as it is
intended to be the primary interface for Python.  Rename your existing
to gpiod_c or gpiod_core or something.

Btw, I've only mentioned a small part of the API so far, but the same
applies to the remainder. e.g. the RequestConfig and LineConfig could use
the lines kwarg treatment as well. Though I suspect implementing that will
be a bit of a bear, in either language.

Cheers,
Kent.
