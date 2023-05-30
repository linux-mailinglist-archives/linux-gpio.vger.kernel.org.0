Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E06C7168BE
	for <lists+linux-gpio@lfdr.de>; Tue, 30 May 2023 18:08:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230150AbjE3QIn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 May 2023 12:08:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230449AbjE3QIm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 May 2023 12:08:42 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA1BF123
        for <linux-gpio@vger.kernel.org>; Tue, 30 May 2023 09:08:09 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-75afeacb5e4so543023485a.3
        for <linux-gpio@vger.kernel.org>; Tue, 30 May 2023 09:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685462884; x=1688054884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WSjiGePAtUfdfIO+mC/gh9wrhGwSyjXAapryvD0UCP8=;
        b=jwaEwWe/cLhHvOgYzg0Xs38Vlod3AjV720n698L4kPPHl3+yZrm8XLolBApcMlzMHo
         J7vMSXN3EH3rI4IbKs1iOymt1U7mK64j2pbEKtccttsCluaujyE8JiEAdUA5nVMMqrlV
         UN7xDGSa6Eosiu4BagbuWr/msudFtc1vH8acjZtDAsbGp4k4c9Z29XmU0d6tsaW8Ajx8
         yVcCdjOz6O2dDWmY0KnsBRoYwg1plfiTfXXsODCBHyfeDbh4vNt+Y+LnrL8p+ecG7URS
         QZRwghjCQYCTAw96/mniIzopKiuKbFytP+1+2S9en5k22QZV81JdLcGn+vW+KoZQzL/m
         XGUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685462884; x=1688054884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WSjiGePAtUfdfIO+mC/gh9wrhGwSyjXAapryvD0UCP8=;
        b=XTVMuDqq/zhoV7FP8HbgD+Sw5LwY1An3a7Z+qgpbXOfRNj35AL5cI7UWguuuwdmDWF
         Fg7+MzIbvA9iREw7ffu7Ko2KhI+F8JozGrIVeArpQDyNJ+07ok/cDIJ9p6/VeFhs0Kqm
         xl7wRfJ8nIV0UE2g/dlIBwBhRdSZpro7K18jY0gcvvMGGwKkX0/Ps0BR29SJF92K1nCX
         dvsRPV1PImH2CUblPbIGN7sBH7nGyNkVnuPaQPuViis19N0XjhgfdLunhD36I+nFH4rP
         iQZ1/MbCUABO0XW4CnQR65mvGICvIl1EAHxL7x7PhiWfn2SxU+WGdagIYB/iIF3Uf/ie
         qLKA==
X-Gm-Message-State: AC+VfDzWOOoqkUwhx+gWflzG7yx/Y5eFZUHWf8k12KQjzmhYarfzzlKX
        gudlWuTvwUiUDB0MCMY+0Yvl6NZbnud+P4R5kX6mqp5iogCQ6faA
X-Google-Smtp-Source: ACHHUZ4QGOMA8NNG4xhmLVm9AgrhnAgWFzqJl7m1CfDxN1CPdxUSycHplvSLexyQcvBT8w22WJx4EG+tyWiNwLzSlIM=
X-Received: by 2002:a37:513:0:b0:75b:23a1:35f6 with SMTP id
 19-20020a370513000000b0075b23a135f6mr2571182qkf.7.1685462883836; Tue, 30 May
 2023 09:08:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230524210945.4054480-1-joe.slater@windriver.com>
 <ZG7bpE8xRuIeq7J+@sol> <BY5PR11MB3992F8CA5B13108F6310D72A88469@BY5PR11MB3992.namprd11.prod.outlook.com>
 <CAMRc=MeOiCKkn2OqNtSfRrh6_jSgEpWbh5DJNK30FmKP5NfPDg@mail.gmail.com>
 <ZHXKRtJOYSw42BAi@sol> <CAMRc=Md8CSiX4PyoXG-Xy0PktHseLgecRUEC=XZWsQmMRAuWSQ@mail.gmail.com>
 <ZHYHAXLPwX0C7aTK@sol> <CAMRc=MciugO5qS_fzfEipWN7vHBUKWLVkAJFLShZeuK8u9W9Bw@mail.gmail.com>
 <ZHYTqIt+CZOf4XTR@sol>
In-Reply-To: <ZHYTqIt+CZOf4XTR@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 30 May 2023 18:07:52 +0200
Message-ID: <CAMRc=MdHTjFeY_ba0o1YcnYp2JvdovBc0LiWY9oRaMNkMLBZqQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 1/1] gpio-tools-test.bats: modify delays in
 toggle test
To:     Kent Gibson <warthog618@gmail.com>
Cc:     "Slater, Joseph" <joe.slater@windriver.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "MacLeod, Randy" <Randy.MacLeod@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 30, 2023 at 5:18=E2=80=AFPM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Tue, May 30, 2023 at 04:52:36PM +0200, Bartosz Golaszewski wrote:
> > On Tue, May 30, 2023 at 4:24=E2=80=AFPM Kent Gibson <warthog618@gmail.c=
om> wrote:
> > >
> > > On Tue, May 30, 2023 at 04:13:06PM +0200, Bartosz Golaszewski wrote:
> > > > On Tue, May 30, 2023 at 12:05=E2=80=AFPM Kent Gibson <warthog618@gm=
ail.com> wrote:
> > > > >
> > > > > On Tue, May 30, 2023 at 11:51:05AM +0200, Bartosz Golaszewski wro=
te:
> > > > > > On Thu, May 25, 2023 at 11:54=E2=80=AFPM Slater, Joseph
> > > > > > <joe.slater@windriver.com> wrote:
> > > > > > >
> > > > > > >
> > > > > > > [Slater, Joseph] I'll get rid of the comment and try the test=
 with a shorter toggle time.
> > > > > > > The series of 159 tests takes, maybe, 10-15 minutes for me, s=
o I don't think saving a
> > > > > > > second or two here would make much difference, though.
> > > > > > > Joe
> > > > > > >
> > > > > >
> > > > > > That can't be right, are you running it on a toaster? It takes =
26
> > > > > > seconds on my regular lenovo thinkpad laptop which is still lon=
ger
> > > > > > than I'd like but quite acceptable for now (though I agree it w=
ould be
> > > > > > great to improve it).
> > > > > >
> > > > >
> > > > > Consider yourself blessed.
> > > > > I just got:
> > > > >
> > > > > real    2m25.956s
> > > > >
> > > > > on my test VM.
> > > > > Not sure exactly what the hold up is - it isn't using much CPU, o=
r any
> > > > > other resources AFAICT.
> > > > > Compared to all the other test suites I run, this is far and away=
 the
> > > > > slowest, especially since switching everything over to gpio-sim.
> > > >
> > > > I agree it's too slow - be it 20 seconds or 2 minutes. But similarl=
y
> > > > to you - it's very low on my TODO list as I only run it every once =
in
> > > > a while. I'd be happy to accept any patches improving the situation=
 of
> > > > course.
> > > >
> > >
> > > Same.  I already had a go at streamlining the tests when I updated th=
em
> > > for v2, so it is somewhat better than it was, but it is still painful=
ly
> > > slow for me.
> > > To improve further I'd have to start digging around to see what bats =
is
> > > up to.  Speaking of which, do we need to stick with bats?
> > > I've driven similar tests with Python in the past, and I'm sure that
> > > would provide a better experience.
> > > What constraints do we have?
> > >
> >
> > I went with bats because it looked the fastest to write tests in -
> > it's shell after all.
> >
>
> Really?  I wouldn't write anything of consequence in shell if Python was
> an option.
>
> How about Rust?  I've gotten over how spartan the Rust test framework is
> so I wouldn't have a problem writing it in that either.
>

I have a very strong preference for Python. I am quite bad at Rust.
Whatever is in bindings/rust/ is Viresh' jurisdiction and I defer to
him but I would prefer to be able to keep track of what's happening in
tools/ and work on it myself without too much frustration. And writing
anything in rust has been pure frustration so far.

Bartosz

> > But I think that we could potentially package whatever python
> > subprocess code we need into enough helper wrappers that it wouldn't
> > be much more complex than this.
> >
>
> The end result would look similar in terms of test complexity, but
> should be much easier to write and debug.
> Not that that counts for much given we have a functional bats test
> suite.
>
> > We also already have python wrappers for libgpiosim ready.
> >
>
> Exactly.  And Rust bindings too.
>
> > No objections from my side, it's just that I won't have time to
> > rewrite the entire thing in Python anytime soon.
> >
>
> I'll update my todo list.  No promises - it is low priority given the
> only real problem with the bats solution is its performance.
>
> Cheers,
> Kent.
>
