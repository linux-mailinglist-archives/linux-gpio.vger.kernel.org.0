Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 064D9613672
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Oct 2022 13:34:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229915AbiJaMeH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 Oct 2022 08:34:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231466AbiJaMeF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Oct 2022 08:34:05 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 022FF120
        for <linux-gpio@vger.kernel.org>; Mon, 31 Oct 2022 05:34:05 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id u6so10588325plq.12
        for <linux-gpio@vger.kernel.org>; Mon, 31 Oct 2022 05:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VZrzQb3VNngEO3LHQX2K/16TQzCssK5G15pJH/WM1/I=;
        b=VqX9+R9rdWj3MDU7Azn+y42Kf5WyNuHw6tQvi/JRCJDVkcW+icROzLrd9WWKzQSKbN
         5jNc5PjmrfVJhBapCjKTePu0c0AMKNEc6A16d9tjRY463pYKOyTP1UgqQfVmSSotUCK6
         tPF8J7v/BDBdB6vY+QnCrUl6Xbx7vKgkMsSD+Sm3X8wysNHTdC6N9Bhp0THMTJ0LVEAp
         O4R0h6+KFGXtBkxo9oZUAG7ffkhQCCElcAt2GBJfQF/Rx5Ov9qi4hubT4f1+Qi8VQ0tC
         RKXYG9yU46UOklpb9lSVGqUQe68t/jZnkuSHQh515Ra9nvCHhxRKpUQ9Td2wSfRIifUE
         RRdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZrzQb3VNngEO3LHQX2K/16TQzCssK5G15pJH/WM1/I=;
        b=LVl6GB8hczZefO7bxGPmxNvIPu0ByrMnu6aLtPvJMra/hvWfOZKjU34RyLXaWKOOAr
         qOEt93GsSiLtyR9leUrxRoQWTikGBHn8dO3+dsP8VJHebX823VcIycvbjaSqC2k35Alg
         dvyG1iz1k4Xv27BYGep3oI9Ud89WnwX3hghejtEI/xkYW7X79Ah0aa0XdaO6iNPNGfFa
         qm0yeCt9bTlfMnxRCBqXYqvc1z9VPreYKbQjl1Xh+5msk2D9lCpk3EsXLQwU9mbgYPbH
         ot/1ATakeBNFsY+ugcixnxlJKHMaidjBragExEBlds3bFiaadrnOfUarG0ONFbbxs2JH
         Ppzg==
X-Gm-Message-State: ACrzQf35BBPCH5m+CGPeZ8GX+1BW2q0fXwmcj0K7TRwwV0r39CnbQ9rC
        8OAmgD4HAZR3KrYcnTFfDFU=
X-Google-Smtp-Source: AMsMyM5hC0ugLSQUDGTbX7kkg307V+kfbqjcxbMyHYH3g5YZHmqrvkInHwrOOKokebJydwKUUTRZDA==
X-Received: by 2002:a17:902:7408:b0:186:88be:1cca with SMTP id g8-20020a170902740800b0018688be1ccamr13865536pll.155.1667219644375;
        Mon, 31 Oct 2022 05:34:04 -0700 (PDT)
Received: from sol (14-203-42-90.tpgi.com.au. [14.203.42.90])
        by smtp.gmail.com with ESMTPSA id u9-20020a170902714900b00186f0f59d1esm2676579plm.192.2022.10.31.05.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 05:34:03 -0700 (PDT)
Date:   Mon, 31 Oct 2022 20:33:57 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Subject: Re: [PATCH V7 3/8] libgpiod: Add rust wrapper crate
Message-ID: <Y1/AtfEhuijx1+tK@sol>
References: <cover.1665744170.git.viresh.kumar@linaro.org>
 <6a94249d2d69bc5c1907fea9ed80c9d7e34278aa.1665744170.git.viresh.kumar@linaro.org>
 <Y01RvbboC3dMDVSy@sol>
 <20221021112238.teqz25pn3hz5d4cs@vireshk-i7>
 <Y1KTCWiGdUxkQ6Al@sol>
 <CAMRc=MdWce2Msjwjyo3ny9LyUsA8Zeq_WhhJ2=ar5CG1BPmhtg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MdWce2Msjwjyo3ny9LyUsA8Zeq_WhhJ2=ar5CG1BPmhtg@mail.gmail.com>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 27, 2022 at 02:09:31PM +0200, Bartosz Golaszewski wrote:
> On Fri, Oct 21, 2022 at 2:39 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Fri, Oct 21, 2022 at 04:52:38PM +0530, Viresh Kumar wrote:
> > > Hi Kent,
> > >
> > > >
> > > > What if the Rust bindings version differ from the libgpiod version?
> > >
> > > Hmm, not sure which version should we return here. I think it should
> > > just be libgpiod's version. Though I am fine with whatever you and
> > > Bartosz decide.
> > >
> >
> > You need both - separately.
> >
> 
> For C++ and Python, the API version stays consistent across all three
> trees for simplicity. There are separate ABI numbers for libgpiod,
> libgpiodcxx and libgpiosim. Rust doesn't seem to have this kind of
> differentiation between ABI and API so I'd say we should have a single
> API version but see below about the idea for the contrib/ directory.
> 

My thinking was that if the Rust bindings end up being compiled into the
app then it may be difficult to identify the version it was built with,
as opposed to the version of libgpiod it is running against.
Not sure you can always determine that from the Cargo.toml or
Cargo.lock, or that those will always be available after the fact.

Not a biggy if the two always remain compatible, but if a libgpiod change
inadvertently triggers some fault in the Rust bindings then it could be a
PITA just to determine the versions involved.

> > > Will it be possible to get on with the current implementation and once
> > > this is merged you send patches on top of it which can then get
> > > reviewed properly by others too, who know Rust better than me ?
> > >
> >
> > The Rust bindings are your baby, and I don't have any plans to be
> > patching it.  And Bart is the arbiter of what gets merged, so that
> > decision is his.
> >
> 
> I was thinking about it lately and figured that - since I don't know
> Rust very well and cannot reliably maintain that part myself - how
> about we create a 'contrib' directory in the libgpiod tree for this
> kind of "third-party" bindings? The requirements for stability and
> correctness in there would be more relaxed compared to the main tree?
> 

The problem there is you thinking that you need to be able to personally
support every line of libgpiod, and that it is not a team effort.

Wrt the Rust bindings, I was assuming that either Viresh would provide
support, or as his work appears to be on behalf of Linaro that they
would have an interest in maintaining it.

Similarly, I was assuming that I would be providing support for the
proposed tool changes, should they ever get merged.  Though, based on the
little feedback to date, I'm dubious about that ever happening.
I could always split them off into a separate project, but maintaining
an autoconf based setup doesn't interest me, particularly when the Go and
Rust alternatives are one-liners that just work, so probably not.

I was thinking that some forum for libgpiod, or more broadly GPIO
user space development, would help increase community involvement,
in both directions, and that might help address the Bartosz doesn't
scale problem. But I don't have anything useful to add on that.
The only relevant experience I have is with github, and while it would
probably suffice I would explore other options first, with gitlab
being the most obvious alternative.  No help there, I know.

Sorry for not replying sooner.  I was hoping to do a respin in a more
positive light, but that has eluded me and time marches on.

Cheers,
Kent.
