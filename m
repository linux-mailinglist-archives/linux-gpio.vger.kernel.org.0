Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49258719D1E
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Jun 2023 15:16:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbjFANQa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Jun 2023 09:16:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230222AbjFANQ3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Jun 2023 09:16:29 -0400
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2F08E7
        for <linux-gpio@vger.kernel.org>; Thu,  1 Jun 2023 06:16:27 -0700 (PDT)
Received: by mail-vs1-xe2d.google.com with SMTP id ada2fe7eead31-4393c074161so135533137.2
        for <linux-gpio@vger.kernel.org>; Thu, 01 Jun 2023 06:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685625387; x=1688217387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xfwQHvGUhhK6VWKbxJbkUh+kpCIvEBFCiEsGvwEpt30=;
        b=1hF9Oh4EXEA4qaYgjpDPrT7nHx8uRxJSftUW8hNWcUosRLblqnz6skLQnwOkmwuCYg
         oRZrTW6tZLF2nYD68cth1C28+FbGyt2Ecz/DIvssr7eKG/24ArvK/52somlS2+19Y4Wf
         tFSfj5+rppUWkBxqb57XkuueU1KJkf1zuP+K/MNAr7WBcvGI2BpPpEywcNjrbVqJK0vI
         kL4ncRohuoXBuAoIM6y2/LqUKTTDW7WaXu1RJ2zoCyOGDnq1vz/0AMes7ji6O7iGlEX7
         vUywIRlLGvAgQZFfOKYr7oonXrxq5S1vwqTQTBbSqCLBmxeSYczCopr0ebrterM2rDZW
         HiCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685625387; x=1688217387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xfwQHvGUhhK6VWKbxJbkUh+kpCIvEBFCiEsGvwEpt30=;
        b=WiDkBU3OWfr/n9u6FORdIwF3GGNg3iTG2nxUXDMpFenhQ8TF9x/drv/Wh4WqwTGByB
         fD1+e6fBrxJhX38I+WhzPUPGF15UVaGt6mBkJhwlJxto3Ta5r4e/MHNaa2SNbOr8DHMJ
         SXmtmIR5GljYhnGu6M5I57SrwmZAcgGsV8HZAo3KinxTK1Ews1cKXMIlj555y85yo9Xr
         8xhYYi11P6BolVaJKF5ktaMSsBTrKoilHYsxeKve1hCyTJ7n/lYhpUM7lKQxB1Y4CGc1
         t26lXBtzW3PQL6ofi6eJBJTuvBWyXQUC818+orFP4l9vm5xkJDDy0s63J9wotDdZ6DIo
         8OqQ==
X-Gm-Message-State: AC+VfDxSzuBnMDNLhec9l5O1SiAuUlg1+lFEcvZcLSo/xfbUB8MsmRK5
        729NKWqDvJxRZHyH4CDEhjPhvk7WGFSmvMOnEvMcPA==
X-Google-Smtp-Source: ACHHUZ441KtZZ3SINLTvpyCE0ZXlpQNcxuk4q/KhdNaJbI9UUoFo1tjMDXeRyv1E9GKBT1u9Gk8fNUI6z9ibpZF2gPY=
X-Received: by 2002:a67:b64c:0:b0:437:d987:87f2 with SMTP id
 e12-20020a67b64c000000b00437d98787f2mr3679657vsm.17.1685625387075; Thu, 01
 Jun 2023 06:16:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230524210945.4054480-1-joe.slater@windriver.com>
 <ZG7bpE8xRuIeq7J+@sol> <BY5PR11MB3992F8CA5B13108F6310D72A88469@BY5PR11MB3992.namprd11.prod.outlook.com>
 <CAMRc=MeOiCKkn2OqNtSfRrh6_jSgEpWbh5DJNK30FmKP5NfPDg@mail.gmail.com>
 <ZHXKRtJOYSw42BAi@sol> <CAMRc=Md8CSiX4PyoXG-Xy0PktHseLgecRUEC=XZWsQmMRAuWSQ@mail.gmail.com>
 <ZHYHAXLPwX0C7aTK@sol> <CAMRc=MciugO5qS_fzfEipWN7vHBUKWLVkAJFLShZeuK8u9W9Bw@mail.gmail.com>
 <ZHYTqIt+CZOf4XTR@sol> <CAMRc=MdHTjFeY_ba0o1YcnYp2JvdovBc0LiWY9oRaMNkMLBZqQ@mail.gmail.com>
 <ZHagOu0OcWKkMQ+9@sol>
In-Reply-To: <ZHagOu0OcWKkMQ+9@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 1 Jun 2023 15:16:15 +0200
Message-ID: <CAMRc=Megxyh5XW8tux-aJaCynZi9PUcDnezQ+ZKPd5QWLScrBQ@mail.gmail.com>
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

On Wed, May 31, 2023 at 3:17=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Tue, May 30, 2023 at 06:07:52PM +0200, Bartosz Golaszewski wrote:
> > On Tue, May 30, 2023 at 5:18=E2=80=AFPM Kent Gibson <warthog618@gmail.c=
om> wrote:
> > >
> > > On Tue, May 30, 2023 at 04:52:36PM +0200, Bartosz Golaszewski wrote:
> > > > On Tue, May 30, 2023 at 4:24=E2=80=AFPM Kent Gibson <warthog618@gma=
il.com> wrote:
> > > > >
> > > > > On Tue, May 30, 2023 at 04:13:06PM +0200, Bartosz Golaszewski wro=
te:
> > > > > > On Tue, May 30, 2023 at 12:05=E2=80=AFPM Kent Gibson <warthog61=
8@gmail.com> wrote:
> > > >
> > > > I went with bats because it looked the fastest to write tests in -
> > > > it's shell after all.
> > > >
> > >
> > > Really?  I wouldn't write anything of consequence in shell if Python =
was
> > > an option.
> > >
> > > How about Rust?  I've gotten over how spartan the Rust test framework=
 is
> > > so I wouldn't have a problem writing it in that either.
> > >
> >
> > I have a very strong preference for Python. I am quite bad at Rust.
> > Whatever is in bindings/rust/ is Viresh' jurisdiction and I defer to
> > him but I would prefer to be able to keep track of what's happening in
> > tools/ and work on it myself without too much frustration. And writing
> > anything in rust has been pure frustration so far.
> >
>
> Fair enough, Python it is then.
>
> I personally had no problem picking up Rust - seems Rust and I have a
> similar view - I've always had issues with the vagueness of ownership
> and lifetimes in other languages, particularly C/C++.  Rust gets it.
> And if you do make a hash of something clippy provides good suggestions,
> or at least clearly identifies the problem. That helped me a lot with
> the learning curve.
>
> Cheers,
> Kent.

Before jumping into a complete rewrite, I thought it's worth at least
giving bats a chance and see if we can simply fix the delay. A quick
strace run is telling me this:

% time     seconds  usecs/call     calls    errors syscall
------ ----------- ----------- --------- --------- ------------------
 91,93   20,569295        1014     20284      8653 wait4
  1,72    0,384721           0    814827           rt_sigprocmask
  1,35    0,301451           1    171558    142755 readlink
  1,19    0,265404           1    261357         8 read
  1,04    0,233103          20     11283           clone
  0,50    0,110845          16      6848      1025 execve
  0,49    0,110042           0    128382     13692 newfstatat
  0,33    0,073843           0     95369     49559 ioctl
  0,25    0,055440           0     78664           mmap
  0,20    0,044861           2     22081           write
[...]

It suggests, there's some issue with waiting for exiting processes
that if we fix, we should decrease the test time by at least 90%.

Bart
