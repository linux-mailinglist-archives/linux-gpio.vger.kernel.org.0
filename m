Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9732D2213
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Oct 2019 09:47:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727080AbfJJHrv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Oct 2019 03:47:51 -0400
Received: from mail-lf1-f45.google.com ([209.85.167.45]:41539 "EHLO
        mail-lf1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726923AbfJJHrv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Oct 2019 03:47:51 -0400
Received: by mail-lf1-f45.google.com with SMTP id r2so3602719lfn.8
        for <linux-gpio@vger.kernel.org>; Thu, 10 Oct 2019 00:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/gutGvdTsInRWYeA8X3FplSEq+YIYmbuvg5DSsC35e0=;
        b=gVKAS9lEr3m+gs2EXrC2d33Dm8HEFI0MGsYU7jpZpcKzxKNVuPJwsF1IS1kGxaYV7M
         HkLqhrJBCw9eaX6xv1k2wZlz5AXchfgtSw8LCo/WULllrU7Gt7lMBfxozA499hQcJwIl
         ngi6Pp+/fY1T0VG7bbp4BzCSQ/4kM0Z6tsbXy3g6kwrLtWq+F+TyJ/RX1zv02uCIssU+
         YSXbAhL/TO8pBHnTki0uBa/fYKBHl7U9efu2L7o8tItSK0NZvv0eTe/6GrpHdK78NJ5R
         eO+yzbAI4fjJH6JRDWJphv7QmyyPeSU9FRF8nW1gTuF6Git55A5Va4VDc84t8P9mLlZE
         3FOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/gutGvdTsInRWYeA8X3FplSEq+YIYmbuvg5DSsC35e0=;
        b=aoQeIiCkGMwMxyVAc6UHgV1wb+xVeVzIcsC1mRsz/GcMspoxJHJm7U/Qb09wstTz63
         JiB/th4i0RGKRAs8QK5+5zHTQQFbXMHr7LYdpHwFjtoePiLQ021ljetWNzcCcPMLhibc
         LqsI6Hizb/Ugzcg5pw7MBY4cSB7rzjbfh6zm+RgFWv2QnBzkelJF31MbsRlVTS/3efzq
         +GKjTa4rj6T66rY+Mhl5yyLDn8TJlYN1/eFaXSVx1jT0Ze30vjzVyePr4fShxtFEhPXP
         NmEwEYNIr2avi7fcwotIkQ++7fZzi139YfXhlFl2JVZIyRw9V1gDTIK1twwC0AG2vpcp
         aSHA==
X-Gm-Message-State: APjAAAVL1T2fpOBi0VdsUVcypkUXR20HdiWDZHwPFWi7p0v84KVJW88V
        XztGl5PgO8ELWozr45NCQDTjPpxoCT1Jr+M7myI=
X-Google-Smtp-Source: APXvYqzqAmhd864DezdUs791dyoP2JYdoY1wdQxDb+s1AMOl2sjD11eaM1s8NTCdkikBgdbnTAi7zGadhIevRcNRemY=
X-Received: by 2002:a19:7b11:: with SMTP id w17mr5068178lfc.188.1570693667404;
 Thu, 10 Oct 2019 00:47:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190921102522.8970-1-drew@pdp7.com> <20191008061512.GA19956@sol>
 <CAMRc=Mf8DsEOWcX2BTtdVtsRkNXB3oA-xt2SrWJTn6vt3Fd8Pg@mail.gmail.com>
 <20191008232120.GA9225@sol> <CAMRc=MdcWUtEx3QAKxEmEEa1Effq7JpRPGNJOGfSYP6Nh0p1Hg@mail.gmail.com>
 <20191008235626.GA10744@sol> <CAMRc=MdCktRBkofaqAEtjNLNS=60Z9zM9a4QoBLsCsx3bSdxtQ@mail.gmail.com>
 <20191009002211.GA11168@sol> <20191009065524.GA4061@sol> <20191009133037.GA17244@x1>
 <20191009235938.GA10263@sol>
In-Reply-To: <20191009235938.GA10263@sol>
From:   Drew Fustini <pdp7pdp7@gmail.com>
Date:   Thu, 10 Oct 2019 09:47:35 +0200
Message-ID: <CAEf4M_D4C2v87XR7oyc4YLN9j9XhSctJcw1NCt8hPcuf0P_=DA@mail.gmail.com>
Subject: Re: [RFC] gpio: expose pull-up/pull-down line flags to userspace
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 10, 2019 at 1:59 AM Kent Gibson <warthog618@gmail.com> wrote:
> It is basically working for me on my Pi4:
>
> pi@quoll:~ $ ./gpiodctl get gpiochip0 7
> 0
> pi@quoll:~ $ ./gpiodctl get -u gpiochip0 7
> 1
> pi@quoll:~ $ ./gpiodctl get gpiochip0 7
> 1
> pi@quoll:~ $ ./gpiodctl get -d gpiochip0 7
> 0
> pi@quoll:~ $ ./gpiodctl get gpiochip0 7
> 0
>
> That is using the gpiodctl tool from my gpiod library.
> My gpiod test suite also passes, but it doesn't do much to
> exercise the UAPI.
> I was intending to run my uapi test suite, which is more thorough,
> but it turns out that only targets gpio-mockup, whereas my gpiod
> test suite can target either.
> Something else for the todo list.
>
> Hopefully it is obvious what gpiodctl is doing. (-u sets the
> pull-up flag, -d sets the pull-down flag)
> Looks like the pulls stick when the line is released, and the
> subsequent get, without pull-up set, either doesn't clear the
> pull-up/down or the line stays floating at the old pull level.
> More investigation required, but that will have to wait til
> I get back to this later in the day.
>
> Oh, and that is running on the rpi-5.3.3 kernel patched with everything
> on my topic/gpio-uapi-config branch from 5.4-rc2 onward.

Thanks for sharing your results.

My Pi 3 had been running 5.3.0-v7+ from September 20th with my
pull-up/down patch (82fc38f6ab59).

I removed that patch and just cross-compiled 5.4-rc2 with
multi_v7_defconfig for the Pi3.

Are these the commits that I should apply from your topic branch?

bdc9696a27ed pull up/down requires explicit input mode in lineevent_create
14ee636232d4 disallow pull up/down on outputs
ce03bf5af1ec implement SET_CONFIG_IOCTL
f38b7554eb52 pull common validation code into linehandle_validate_flags
31c0aa53ffc3 Add default values for setting output
3c7ec03efcd9 add support for pull up/down to lineevent_create
99b85d1c26ea gpio: add new ioctl() to gpio chardev
82fc38f6ab59 gpio: expose pull-up/pull-down line flags to userspace
f6cfbbe2950b gpiolib: sanitize flags before allocating memory in
lineevent_create()

Thanks,
Drew
