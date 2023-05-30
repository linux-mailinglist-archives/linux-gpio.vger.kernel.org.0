Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A20F3716527
	for <lists+linux-gpio@lfdr.de>; Tue, 30 May 2023 16:53:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230178AbjE3Owv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 May 2023 10:52:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232524AbjE3Owt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 May 2023 10:52:49 -0400
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com [IPv6:2607:f8b0:4864:20::a32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A84C8F
        for <linux-gpio@vger.kernel.org>; Tue, 30 May 2023 07:52:48 -0700 (PDT)
Received: by mail-vk1-xa32.google.com with SMTP id 71dfb90a1353d-456d241fcdcso1173778e0c.0
        for <linux-gpio@vger.kernel.org>; Tue, 30 May 2023 07:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685458367; x=1688050367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UztPcm7Ideok9RgMr9dycpmC1iD9Hp0ZrjBPzgQz5Rg=;
        b=O6oxTaesVrx11ADno/1ubBWaRAS/vJTImrwiiuCx9if/ssTGs4uvQn8zcxkN30dmoX
         YkH8HYKnBA3PpdXq04bj9FEUmDaNIqcceQgNpvnWoOK3dHKCgVN298S2aRsqJV1JIq6v
         TdymKUNgz+1OkkfC4gs8yeg1JhNiem/x7JSrUqqxppdsGmpk8uSqyvJG2VkAoTqfQ4uN
         dfsuknMe9wlShruYCOjz5mFSNsKZE1ZtuUFTUoUWWJVFodGZ5IdxDfYEXyIYTKlU1USs
         yPgP9ZDUKaIFSSELP8PaK9yb7SN6L5q0WYRvxQzYfOZEbeZ9U12SpUyIVTZk1MOYqgqA
         Zx8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685458367; x=1688050367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UztPcm7Ideok9RgMr9dycpmC1iD9Hp0ZrjBPzgQz5Rg=;
        b=kkDabqwLsWbWlE0/Ifv1LwFb6CawyfgRWv0NHN8+4GXAksYzvl9fyJxQmMM3rdDQpq
         KwM1rm0lXFH+YebMVTHshXbzYQGTPG+e+UT7IVVy8hOKQwviLYFNo2zyN/JDHn8F32rX
         lkHwQPDhsLeTPtSv0DMN9AJMxoWlSX+s0+sLE9sZ0gfGHvYfeyl5wwdgP7Cjf+45GwpB
         WHXC1Y/0P4JQt68uUeKw6eO4IDSbI7z+rGpvnicZ8iKJLSfqq3jRi9M6YiHq7RfeZSR4
         GlBqE/7TC1lPW4mE8PxgCnb6ps4GL3vIX/G7j9Qcp0JEN/yHquoTmMRoM10CmVqvUn8h
         mVdg==
X-Gm-Message-State: AC+VfDyX558P+XZKLkC8vNg5rtNiNnOs2JH+ZgpNTk59V+AuVkw4L9Wi
        6oG161LCsi+pZx8KXYmfMQiGv7Jq8hFSmAcriCv6nw==
X-Google-Smtp-Source: ACHHUZ6W5U6opaq8Xwr/+CtO6ijuhNp9YYzWliaxXOiks6l2PisUbio38TJh6ZpZrTFEL8a67pd+uru4sWIr6ae+YFg=
X-Received: by 2002:a1f:4e83:0:b0:457:1a8:9eaa with SMTP id
 c125-20020a1f4e83000000b0045701a89eaamr784248vkb.4.1685458367360; Tue, 30 May
 2023 07:52:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230524210945.4054480-1-joe.slater@windriver.com>
 <ZG7bpE8xRuIeq7J+@sol> <BY5PR11MB3992F8CA5B13108F6310D72A88469@BY5PR11MB3992.namprd11.prod.outlook.com>
 <CAMRc=MeOiCKkn2OqNtSfRrh6_jSgEpWbh5DJNK30FmKP5NfPDg@mail.gmail.com>
 <ZHXKRtJOYSw42BAi@sol> <CAMRc=Md8CSiX4PyoXG-Xy0PktHseLgecRUEC=XZWsQmMRAuWSQ@mail.gmail.com>
 <ZHYHAXLPwX0C7aTK@sol>
In-Reply-To: <ZHYHAXLPwX0C7aTK@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 30 May 2023 16:52:36 +0200
Message-ID: <CAMRc=MciugO5qS_fzfEipWN7vHBUKWLVkAJFLShZeuK8u9W9Bw@mail.gmail.com>
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

On Tue, May 30, 2023 at 4:24=E2=80=AFPM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Tue, May 30, 2023 at 04:13:06PM +0200, Bartosz Golaszewski wrote:
> > On Tue, May 30, 2023 at 12:05=E2=80=AFPM Kent Gibson <warthog618@gmail.=
com> wrote:
> > >
> > > On Tue, May 30, 2023 at 11:51:05AM +0200, Bartosz Golaszewski wrote:
> > > > On Thu, May 25, 2023 at 11:54=E2=80=AFPM Slater, Joseph
> > > > <joe.slater@windriver.com> wrote:
> > > > >
> > > > >
> > > > > [Slater, Joseph] I'll get rid of the comment and try the test wit=
h a shorter toggle time.
> > > > > The series of 159 tests takes, maybe, 10-15 minutes for me, so I =
don't think saving a
> > > > > second or two here would make much difference, though.
> > > > > Joe
> > > > >
> > > >
> > > > That can't be right, are you running it on a toaster? It takes 26
> > > > seconds on my regular lenovo thinkpad laptop which is still longer
> > > > than I'd like but quite acceptable for now (though I agree it would=
 be
> > > > great to improve it).
> > > >
> > >
> > > Consider yourself blessed.
> > > I just got:
> > >
> > > real    2m25.956s
> > >
> > > on my test VM.
> > > Not sure exactly what the hold up is - it isn't using much CPU, or an=
y
> > > other resources AFAICT.
> > > Compared to all the other test suites I run, this is far and away the
> > > slowest, especially since switching everything over to gpio-sim.
> >
> > I agree it's too slow - be it 20 seconds or 2 minutes. But similarly
> > to you - it's very low on my TODO list as I only run it every once in
> > a while. I'd be happy to accept any patches improving the situation of
> > course.
> >
>
> Same.  I already had a go at streamlining the tests when I updated them
> for v2, so it is somewhat better than it was, but it is still painfully
> slow for me.
> To improve further I'd have to start digging around to see what bats is
> up to.  Speaking of which, do we need to stick with bats?
> I've driven similar tests with Python in the past, and I'm sure that
> would provide a better experience.
> What constraints do we have?
>

I went with bats because it looked the fastest to write tests in -
it's shell after all.

But I think that we could potentially package whatever python
subprocess code we need into enough helper wrappers that it wouldn't
be much more complex than this.

We also already have python wrappers for libgpiosim ready.

No objections from my side, it's just that I won't have time to
rewrite the entire thing in Python anytime soon.

Bartosz
