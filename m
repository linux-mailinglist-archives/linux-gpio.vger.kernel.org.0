Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BAF354464B
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jun 2022 10:48:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242190AbiFIIqR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Jun 2022 04:46:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242944AbiFIIoK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Jun 2022 04:44:10 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F2934BBA9
        for <linux-gpio@vger.kernel.org>; Thu,  9 Jun 2022 01:42:56 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id h23so34993840ejj.12
        for <linux-gpio@vger.kernel.org>; Thu, 09 Jun 2022 01:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6KAo7jS5aG6p9VqItjYfyX1dQwDTwXbn50bINr0hax4=;
        b=hBXL5m5qTCJF9rp4MXt89jSKS+DwP+SpVoTcDr83LD0NED03SQR3JdgVgcOHSXQvNg
         f7HlWwYE35HwxKujzlX6KCC/p82ntPO7yfqIxGfqS+GM9n81epQPBcI/CxO4UohOUL9i
         ZgkUS4rEIjchMQ/bMXql1cTU9X+2dykLLKLxEKF54lwpdQOchaViMhhN1cz1SVIyblfC
         LowlSAg55lvzlHhaeIucRV0bhie0R1NJZGHM02VQp8L/iXINyvgWBaf1bLqaM8t2qhxt
         34r4DnaWCyN/qAGzkwF4+eHL367WmzuybTIUVCYqR7x7gAmf6HAyEnnlOS/pbTbUx02H
         27cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6KAo7jS5aG6p9VqItjYfyX1dQwDTwXbn50bINr0hax4=;
        b=JbA3L3spdNiBOJ7gv8cnCfsccNik4VSkio5NX8gHjL0A0kWGyQ5ee1wnScKSeH2Ghh
         V5GO2GapeG4ecNMnJkHoRFWa121E4ZguB3BpVo+wKADUHGyZa2V/kgv8TJYWNa7T9ASR
         cIB/NZIHbsyuaX4V5+u355QK23rzP2AYC/3MWEEMxjsrhhNqrTh+eJzswkyALhbPxIAA
         FmAwe7jdXkKA4Af7kcSJxwaMnhqe2r9bcGL4FYIR4szyEgs7aXkj1VwLC6306tdpB+px
         taXlls8Cg+9no40k2q/0osbdRnBgnhKh8tWNinY5aRvFfkxTupiphJbzVoH69knPuvC6
         WofQ==
X-Gm-Message-State: AOAM530l///YVB59rutYuwmbIO3pyCwplGmnbMoptKZniEJl7oKL8QlX
        2UiJaAIbHPzAEJfoLaueJx1b36HjMN/K87Buuvg7CA==
X-Google-Smtp-Source: ABdhPJzg2DUQWYL603LTCECMAPGmxgc2HiOYJWr8yt5Fjei9nqmSu4Xd7YSbC6QOLTTqgAQIoyIOKq0QoypPYKm3Bfc=
X-Received: by 2002:a17:906:fc12:b0:711:d2e9:99d9 with SMTP id
 ov18-20020a170906fc1200b00711d2e999d9mr17187850ejb.734.1654764174871; Thu, 09
 Jun 2022 01:42:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220525140704.94983-1-brgl@bgdev.pl> <20220525140704.94983-4-brgl@bgdev.pl>
 <20220603124600.GA35695@sol> <20220604024131.GB13574@sol> <Yp3TmNg2uBlC0XzI@smile.fi.intel.com>
 <20220607015220.GA9430@sol> <CAMRc=MdwgGefC0AgRCvgMfAZmq_+1GnXH6XMezjyBEKs37QuAQ@mail.gmail.com>
 <20220609044922.GA11301@sol>
In-Reply-To: <20220609044922.GA11301@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 9 Jun 2022 10:42:44 +0200
Message-ID: <CAMRc=Md_7WO69hKqToSoAAyDQWxfqgg-PisrBF5AzrsKMM8FQA@mail.gmail.com>
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

On Thu, Jun 9, 2022 at 6:49 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Wed, Jun 08, 2022 at 05:39:16PM +0200, Bartosz Golaszewski wrote:
> > On Tue, Jun 7, 2022 at 3:52 AM Kent Gibson <warthog618@gmail.com> wrote:
> > >
> > > On Mon, Jun 06, 2022 at 01:14:48PM +0300, Andy Shevchenko wrote:
> > > > On Sat, Jun 04, 2022 at 10:41:31AM +0800, Kent Gibson wrote:
> > > > > On Fri, Jun 03, 2022 at 08:46:00PM +0800, Kent Gibson wrote:
> > > > > > On Wed, May 25, 2022 at 04:07:02PM +0200, Bartosz Golaszewski wrote:
> > > >
> > > > ...
> > > >
> > > > > > The focus of my comments above is to simplify the API for the most common
> > > > > > case, and to make it a little more Pythonic rather than mirroring the C
> > > > > > API, in both cases by hiding implementation details that the casual user
> > > > > > doesn't need to know about.
> > > > > >
> > > > >
> > > > > Further to this, and recalling our discussions on tool changes, it would
> > > > > be great if the Python API supported identification of line by name, not
> > > > > just (chip,offset).
> > > > >
> > > > > e.g.
> > > > >     with gpiod.request_lines(
> > > > >         lines=("GPIO17", "GPIO18"),
> > > > >         edge_detection=Edge.BOTH,
> > > > >     ) as request:
> > > > >         for event in request.edge_events():
> > > > >             print(event)
> > > > >
> > > > > with the returned event extended to contain the line name if the line
> > > > > was identified by name in request_lines().
> > > > >
> > > > > The lines kwarg replaces offsets, and could contain names (strings) or
> > > > > offsets (integers), or a combination.  If any offsets are present then
> > > > > the chip path kwarg must also be provided.  If the chip isn't provided,
> > > > > request_lines() would find the corresponding chip based on the line name.
> > > >
> > > > From Python programmer perspective it's a good idea, but from GPIO (ABI)
> > > > perspective, it may be confusing. Line name is not unique (globally) and
> > > > basically not a part of ABI.
> > > >
> > >
> > > "basically not a part of the ABI"???
> > > Damn - we should've removed it from the line info for uAPI v2 ;-).
> > >
> > > A common request from users is to be able to request lines by name.
> > > Of the libgpiod bindings, Python is the best suited to allow that
> > > possibility directly as part of its core API.
> > > It also happens to be the one most likely to be used by said users.
> > >
> > > While identifying line by name can't be guaranteed to work universally,
> > > that doesn't mean that we should automatically exclude the possibility.
> > > It is possible with the current ABI - it is awkward, but possible.
> > > In libgpiod v1, gpiod_ctxless_find_line(), gpiod_chip_find_line() et al.,
> > > and in v2 gpiod_chip_get_line_offset_from_name(), do just that -
> > > I'm merely suggesting that similar functionality be incorporated into
> > > request_lines().
> > >
> > > Line names should be unique in well configured systems, even if the
> > > kernel itself does not guarantee it.
> > > The binding would perform an exhaustive search to ensure the requested
> > > line name is unique, and throw if not (unlike the libgpiod v1 functions
> > > that return the first match - yikes).
> > > (We could always extend the GPIO uAPI to make the mapping process less
> > > painful, e.g. an ioctl to perform the name to offset mapping, including
> > > uniqueness check, for a chip.)
> > > For applications targetting systems that don't guarantee uniqueness, the
> > > (chip,offset) approach remains available.
> > > And if the line names are thought to be unique within a chip, the middle
> > > ground of (chip,name) is also available.
> > >
> > > Wrt confusion, the alternative would be to provide a separate name based
> > > API wrapper, or insist that the user jump through the name mapping hoops
> > > themselves prior to calling the offset based API.
> > > Are either of those less confusing?
> > >
> > > But if the purpose of the Python binding is purely to minimally wrap the
> > > C ABI, warts and all, then my suggestion should most certainly be ignored.
> > >
> >
> > I actually have a third alternative. I would like the gpiod module to
> > only expose the C API functionality but how about a gpiod_extended or
> > something similar with all kinds of python helpers? Python users are
> > indeed used to modules making the work easier and I'm not against it
> > but writing it in C would be a PITA so I'm thinking about a secondary
> > pure python module with those kinds of extensions.
> >
>
> Agree that it would be easier to write a pythonic wrapper around the C
> API in Python, so no problem with that.
> However, the pythonic wrapper should the one named gpiod, as it is
> intended to be the primary interface for Python.  Rename your existing
> to gpiod_c or gpiod_core or something.
>

I don't agree. The module that wraps the C library should still be
called gpiod and be the primary interface. The pythonic module would
just offer helpers that would still use the gpiod data types for most
part.

Bart

> Btw, I've only mentioned a small part of the API so far, but the same
> applies to the remainder. e.g. the RequestConfig and LineConfig could use
> the lines kwarg treatment as well. Though I suspect implementing that will
> be a bit of a bear, in either language.
>
