Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE75C71A111
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Jun 2023 16:54:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233969AbjFAOyM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Jun 2023 10:54:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233831AbjFAOyL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Jun 2023 10:54:11 -0400
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com [IPv6:2607:f8b0:4864:20::92c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39A9B1A6
        for <linux-gpio@vger.kernel.org>; Thu,  1 Jun 2023 07:54:07 -0700 (PDT)
Received: by mail-ua1-x92c.google.com with SMTP id a1e0cc1a2514c-783f88ce548so286179241.1
        for <linux-gpio@vger.kernel.org>; Thu, 01 Jun 2023 07:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685631246; x=1688223246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rlZcTKlHz9rqH0g7sQHElpcjdbWMS87en8filwJuuqA=;
        b=Yn6aY1c2snHlpYrgOtklul1uYFwWC9vivk8m0ZdPglerPDm9rXgsq0p47A6C0Bz6nJ
         KKdl2Sk7H6LNZQybbV7FJQAldF8ppNuo6D47sPTrb/Floy9vzTlFpgyt7LppRbdxLF/N
         QLfmVz5MLIXTWY2kgw6IQUDoIMuxtbyfa5/VZB0+U1bNw3wonjW+SkuCfFZTAX5Vl0lm
         duHEtjcQfsEabMGdoKRoYZ2DVxHUhsIlpaXuZ6buGGVj6qLj2plX1T/7twPIekzRQIPa
         DRnH3m719cK6EHcUj9V0HoV0n5ABogLMhOMJ1Dvaqvq7cDrgPAjtQRVek3xrNZzCMZ69
         bLNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685631246; x=1688223246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rlZcTKlHz9rqH0g7sQHElpcjdbWMS87en8filwJuuqA=;
        b=Ay4J8AKl6R/HoALdwuZFhUe4teTBj3/fJ6UeQzxXjhj68WL1OhOtvPeYZQBY4A4NkZ
         siyqyYI/HN7CDH0B6mlSFn3Tj9zFXjjSwGiK0Me4A6UiEwjsAylsFRGfy4e9M8ezCJyI
         UmrLci/1m3V3SZTr5LsEH/Ba7NHO/yE+U0D1GIAXoJpgqwbl8OE/0BV7Bn3Sj/1aAvsY
         rVHmfChOpyKvwmNWbBbyB5AWPBPB2fhoRbr/R37H9qqZ+askc5yUpUUn3gxsgWw+9bPy
         lk3jAem5xeAW/06RMIxo/OFn+y28eZlEjRK0pA9P48Xg+Z7Gmf40GpVWoT0ANM++phVF
         DdVQ==
X-Gm-Message-State: AC+VfDyLBfyLn9MydfDlgzvo6XztPKJr1OpVtZrRCaTqj9d7I52Fw4hQ
        XfEfhdRnK/2n/l6jyM8ramNWYQ+Q8wVRWbkmLYp4fhuWtImyF5OE
X-Google-Smtp-Source: ACHHUZ4Slf+7da6UJxr4IivaOi5X3WVVnoWxdtHacTgndo434p1KWxvMfEjQSHO4zJGCa78z+SI+qwvYdHWFtwAJPME=
X-Received: by 2002:a1f:5f48:0:b0:453:8a02:8d8 with SMTP id
 t69-20020a1f5f48000000b004538a0208d8mr1367611vkb.6.1685631246237; Thu, 01 Jun
 2023 07:54:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230524210945.4054480-1-joe.slater@windriver.com>
 <ZG7bpE8xRuIeq7J+@sol> <BY5PR11MB3992F8CA5B13108F6310D72A88469@BY5PR11MB3992.namprd11.prod.outlook.com>
 <CAMRc=MeOiCKkn2OqNtSfRrh6_jSgEpWbh5DJNK30FmKP5NfPDg@mail.gmail.com>
 <ZHXKRtJOYSw42BAi@sol> <CAMRc=Md8CSiX4PyoXG-Xy0PktHseLgecRUEC=XZWsQmMRAuWSQ@mail.gmail.com>
 <ZHYHAXLPwX0C7aTK@sol> <CAMRc=MciugO5qS_fzfEipWN7vHBUKWLVkAJFLShZeuK8u9W9Bw@mail.gmail.com>
 <ZHYTqIt+CZOf4XTR@sol> <CAMRc=MdHTjFeY_ba0o1YcnYp2JvdovBc0LiWY9oRaMNkMLBZqQ@mail.gmail.com>
 <ZHagOu0OcWKkMQ+9@sol> <CAMRc=Megxyh5XW8tux-aJaCynZi9PUcDnezQ+ZKPd5QWLScrBQ@mail.gmail.com>
In-Reply-To: <CAMRc=Megxyh5XW8tux-aJaCynZi9PUcDnezQ+ZKPd5QWLScrBQ@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 1 Jun 2023 16:53:55 +0200
Message-ID: <CAMRc=Mc==QG04UWU9P+0AGDBvfue8VMMxKg3gGTFabQQpt=cJw@mail.gmail.com>
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

On Thu, Jun 1, 2023 at 3:16=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
>
> On Wed, May 31, 2023 at 3:17=E2=80=AFAM Kent Gibson <warthog618@gmail.com=
> wrote:
> >
> > On Tue, May 30, 2023 at 06:07:52PM +0200, Bartosz Golaszewski wrote:
> > > On Tue, May 30, 2023 at 5:18=E2=80=AFPM Kent Gibson <warthog618@gmail=
.com> wrote:
> > > >
> > > > On Tue, May 30, 2023 at 04:52:36PM +0200, Bartosz Golaszewski wrote=
:
> > > > > On Tue, May 30, 2023 at 4:24=E2=80=AFPM Kent Gibson <warthog618@g=
mail.com> wrote:
> > > > > >
> > > > > > On Tue, May 30, 2023 at 04:13:06PM +0200, Bartosz Golaszewski w=
rote:
> > > > > > > On Tue, May 30, 2023 at 12:05=E2=80=AFPM Kent Gibson <warthog=
618@gmail.com> wrote:
> > > > >
> > > > > I went with bats because it looked the fastest to write tests in =
-
> > > > > it's shell after all.
> > > > >
> > > >
> > > > Really?  I wouldn't write anything of consequence in shell if Pytho=
n was
> > > > an option.
> > > >
> > > > How about Rust?  I've gotten over how spartan the Rust test framewo=
rk is
> > > > so I wouldn't have a problem writing it in that either.
> > > >
> > >
> > > I have a very strong preference for Python. I am quite bad at Rust.
> > > Whatever is in bindings/rust/ is Viresh' jurisdiction and I defer to
> > > him but I would prefer to be able to keep track of what's happening i=
n
> > > tools/ and work on it myself without too much frustration. And writin=
g
> > > anything in rust has been pure frustration so far.
> > >
> >
> > Fair enough, Python it is then.
> >
> > I personally had no problem picking up Rust - seems Rust and I have a
> > similar view - I've always had issues with the vagueness of ownership
> > and lifetimes in other languages, particularly C/C++.  Rust gets it.
> > And if you do make a hash of something clippy provides good suggestions=
,
> > or at least clearly identifies the problem. That helped me a lot with
> > the learning curve.
> >
> > Cheers,
> > Kent.
>
> Before jumping into a complete rewrite, I thought it's worth at least
> giving bats a chance and see if we can simply fix the delay. A quick
> strace run is telling me this:
>
> % time     seconds  usecs/call     calls    errors syscall
> ------ ----------- ----------- --------- --------- ------------------
>  91,93   20,569295        1014     20284      8653 wait4
>   1,72    0,384721           0    814827           rt_sigprocmask
>   1,35    0,301451           1    171558    142755 readlink
>   1,19    0,265404           1    261357         8 read
>   1,04    0,233103          20     11283           clone
>   0,50    0,110845          16      6848      1025 execve
>   0,49    0,110042           0    128382     13692 newfstatat
>   0,33    0,073843           0     95369     49559 ioctl
>   0,25    0,055440           0     78664           mmap
>   0,20    0,044861           2     22081           write
> [...]
>
> It suggests, there's some issue with waiting for exiting processes
> that if we fix, we should decrease the test time by at least 90%.
>
> Bart

Nevermind that, turns out strace -c -f doesn't do what I thought it
does. It only shows the stats for the top process which mostly just
waits for other processes. That's not the culprit. I need to figure
out a way to correctly profile this.

Bart
