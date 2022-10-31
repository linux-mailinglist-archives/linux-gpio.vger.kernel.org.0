Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1660C6136C7
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Oct 2022 13:46:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230249AbiJaMq3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 Oct 2022 08:46:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231311AbiJaMpT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Oct 2022 08:45:19 -0400
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com [IPv6:2607:f8b0:4864:20::a2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C4EBDF73
        for <linux-gpio@vger.kernel.org>; Mon, 31 Oct 2022 05:45:18 -0700 (PDT)
Received: by mail-vk1-xa2e.google.com with SMTP id g4so1858560vkk.6
        for <linux-gpio@vger.kernel.org>; Mon, 31 Oct 2022 05:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/qgQvB4ySfyWVig0SGvTgMyVh902Cgq+b8vF6A5QfDo=;
        b=jfDLQqlas/jiNIPaVJ/nytGFbOZjuqFpAP65aaEV3tRjHL+iDK9T8VPOKZV0Oy/jo1
         6nW/QoMGjXi599FJPPtoPtME6m+m8NmryLFuYLYFeCxYMXriQqEeyT9lS1gQEeUSQE5o
         +yHHWp/G18q9s/i5R8gY+cRahXnpM/oAhH8SpEEtxIVHI0+TsgUjiVjQJNhxT201hqUT
         eGxxujpPOX5SJUsmBf0izzzLfZuK7vnshZy9rD6KNZxXtWEBJt/9hubQtcWq5JuchJUS
         tDLmA0jOl7HxvrPRWFHJ1YCtxi8Awkabx5SHDzaAMwAxoewp9IQHB8j3OlgVrpfSIMUP
         HZIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/qgQvB4ySfyWVig0SGvTgMyVh902Cgq+b8vF6A5QfDo=;
        b=rYyizHMTFnQdm0+tOVCWNhaVUpX0Ctv+A5hgY3VxJTLDGBr4V5ZEtycmrxNnZrn4UC
         gaKedcrvVh9qlBOuv3SE8KmY4Rx0NvwQp+j0OHpm/D/9QusEGrXIYruzMA262WUV21ZQ
         Lpd0wjwKaZZVTejqc2/kisBBV3C2en0HHV2ti0n3eEX1hdOcgzNQDstWCPp6m2krj3J2
         8P5pz8Kt2v7Q/fhN78KQxHfJocE/pCijeuPjU3mBFZmzw6WknDYsU/lmG0S0NRh5+oss
         4qLl3Jr7wjvXBkLnEEwivVPXs672i0uMP9N9gyMunpf8T+KlF/+oRDQ47H800Gqo3Ywt
         t+1Q==
X-Gm-Message-State: ACrzQf3NTM1rrxUh+CvJgoYRA2TSy6iwff1CivB8cfS6nw+qETGcDwd0
        AI8UdAS/adyCPRnuEt4/XUAPvq1nAWEnoz0fn+qzgA==
X-Google-Smtp-Source: AMsMyM7zzrhNdA+fKhkj7x48Dodfpimsx6+OXjuJarRHklARoZf3SqQlFWu3ULum1limd4nLzuV8/mf+rTLDQsY4dvo=
X-Received: by 2002:a1f:2455:0:b0:3b7:88a4:c121 with SMTP id
 k82-20020a1f2455000000b003b788a4c121mr4385057vkk.1.1667220317644; Mon, 31 Oct
 2022 05:45:17 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1665744170.git.viresh.kumar@linaro.org> <6a94249d2d69bc5c1907fea9ed80c9d7e34278aa.1665744170.git.viresh.kumar@linaro.org>
 <Y01RvbboC3dMDVSy@sol> <20221021112238.teqz25pn3hz5d4cs@vireshk-i7>
 <Y1KTCWiGdUxkQ6Al@sol> <CAMRc=MdWce2Msjwjyo3ny9LyUsA8Zeq_WhhJ2=ar5CG1BPmhtg@mail.gmail.com>
 <Y1/AtfEhuijx1+tK@sol>
In-Reply-To: <Y1/AtfEhuijx1+tK@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 31 Oct 2022 13:45:06 +0100
Message-ID: <CAMRc=MeAq5ako_JFJM+f7OywH6X+-UX_znse0tqhJiy-GQmv9w@mail.gmail.com>
Subject: Re: [PATCH V7 3/8] libgpiod: Add rust wrapper crate
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 31, 2022 at 1:34 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Thu, Oct 27, 2022 at 02:09:31PM +0200, Bartosz Golaszewski wrote:
> > On Fri, Oct 21, 2022 at 2:39 PM Kent Gibson <warthog618@gmail.com> wrote:
> > >
> > > On Fri, Oct 21, 2022 at 04:52:38PM +0530, Viresh Kumar wrote:
> > > > Hi Kent,
> > > >
> > > > >
> > > > > What if the Rust bindings version differ from the libgpiod version?
> > > >
> > > > Hmm, not sure which version should we return here. I think it should
> > > > just be libgpiod's version. Though I am fine with whatever you and
> > > > Bartosz decide.
> > > >
> > >
> > > You need both - separately.
> > >
> >
> > For C++ and Python, the API version stays consistent across all three
> > trees for simplicity. There are separate ABI numbers for libgpiod,
> > libgpiodcxx and libgpiosim. Rust doesn't seem to have this kind of
> > differentiation between ABI and API so I'd say we should have a single
> > API version but see below about the idea for the contrib/ directory.
> >
>
> My thinking was that if the Rust bindings end up being compiled into the
> app then it may be difficult to identify the version it was built with,
> as opposed to the version of libgpiod it is running against.
> Not sure you can always determine that from the Cargo.toml or
> Cargo.lock, or that those will always be available after the fact.
>
> Not a biggy if the two always remain compatible, but if a libgpiod change
> inadvertently triggers some fault in the Rust bindings then it could be a
> PITA just to determine the versions involved.
>
> > > > Will it be possible to get on with the current implementation and once
> > > > this is merged you send patches on top of it which can then get
> > > > reviewed properly by others too, who know Rust better than me ?
> > > >
> > >
> > > The Rust bindings are your baby, and I don't have any plans to be
> > > patching it.  And Bart is the arbiter of what gets merged, so that
> > > decision is his.
> > >
> >
> > I was thinking about it lately and figured that - since I don't know
> > Rust very well and cannot reliably maintain that part myself - how
> > about we create a 'contrib' directory in the libgpiod tree for this
> > kind of "third-party" bindings? The requirements for stability and
> > correctness in there would be more relaxed compared to the main tree?
> >
>
> The problem there is you thinking that you need to be able to personally
> support every line of libgpiod, and that it is not a team effort.
>
> Wrt the Rust bindings, I was assuming that either Viresh would provide
> support, or as his work appears to be on behalf of Linaro that they
> would have an interest in maintaining it.
>
> Similarly, I was assuming that I would be providing support for the
> proposed tool changes, should they ever get merged.  Though, based on the
> little feedback to date, I'm dubious about that ever happening.

Hey, this is literally the next item on my TODO list. I've just merged
the v2 API into master and am getting ready to dive head-first into
your patches.

Bart

> I could always split them off into a separate project, but maintaining
> an autoconf based setup doesn't interest me, particularly when the Go and
> Rust alternatives are one-liners that just work, so probably not.
>
> I was thinking that some forum for libgpiod, or more broadly GPIO
> user space development, would help increase community involvement,
> in both directions, and that might help address the Bartosz doesn't
> scale problem. But I don't have anything useful to add on that.
> The only relevant experience I have is with github, and while it would
> probably suffice I would explore other options first, with gitlab
> being the most obvious alternative.  No help there, I know.
>
> Sorry for not replying sooner.  I was hoping to do a respin in a more
> positive light, but that has eluded me and time marches on.
>
> Cheers,
> Kent.
