Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDE2453B9D0
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jun 2022 15:35:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235393AbiFBNec (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Jun 2022 09:34:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235339AbiFBNeT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Jun 2022 09:34:19 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70147255A1
        for <linux-gpio@vger.kernel.org>; Thu,  2 Jun 2022 06:34:15 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id x5so1214655edi.2
        for <linux-gpio@vger.kernel.org>; Thu, 02 Jun 2022 06:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BOAYhVcCEhkOSR4owOKV7QJFsEb8GeMSuFJnex79qtU=;
        b=DVx41viEVIlJt9j4EvPHuw3SwMdIAVdgB2/ysE8vurFmz/h16EO5Uz4yBkkTF76WQN
         JRv8wZY0QamCiDM/DGONOysYtzXpPpCLZlCTULZngXfSX9ou8tTCLikQxiJJOcLKCuTY
         az+zrR3snsPME7bvMo3wjW79uSeIiKTfH0vSkUDXz2NDihxnga0vVM2hdbv5B1lLF33p
         GgGicnPgrZzE0obivPLgm8ZZeXqlv96RnLQe1lMIEkJyEb4HiNJX3j7tQC2fhdouVunJ
         mIBrDn6pQeOWAeaDkfRM+fbEBbwFEDvlo08Wrh5LLVgBz3uI/U+tDWYkQIw/Ps2iGpQv
         UAwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BOAYhVcCEhkOSR4owOKV7QJFsEb8GeMSuFJnex79qtU=;
        b=eJdELPQrSxZoKT4UzC06Oy41ZyeTxK69liAXsz15P1+/LK4h63qfOT2g7qC/R9ZAj0
         /zN/Bu33ji3X/z6PCswkGBCpWy1pMt2tTIUocAQn1mMrojuFhUcjsFE1iKLPxI26GVaD
         kMsUoWMkVxIcYhB4S0Cpy4hs9lzynjtGXlVvrlAeXHCHOMBJjqF0M75Rf2sFFtluBr+/
         lbiNsREzrtr79ZY99tectjbzfjNQ5RT+LUXpvNsKTkjGxsPnCriAKWZMV7lZG2+3HK1G
         Q7tkZERBb4fV6oaSKAmHWvuZDccl3Mt+PXXjAJ5gra1qRFyfcsl/5fMHAM9V1VvzlrTR
         +1aA==
X-Gm-Message-State: AOAM531LwOoLqYoqRMXqUc/81+EHMdN76xy0YiVJ9U9kmvMlHcHMAGE3
        hVyRiZY17LLlaWROg9jaIIc0TO6nImSMD302N20xBg==
X-Google-Smtp-Source: ABdhPJyAR/qwsrNm8g5Y3tGyswvpJUdxni5O0Bh2HmneWRzuAX90jcdIYSE17k7li5EZuPp1AaFh5scXTXS38JKwOD0=
X-Received: by 2002:a05:6402:3712:b0:42d:d762:32cd with SMTP id
 ek18-20020a056402371200b0042dd76232cdmr5522943edb.408.1654176854436; Thu, 02
 Jun 2022 06:34:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220602112656.31261-1-brgl@bgdev.pl> <20220602115241.GA43087@sol>
In-Reply-To: <20220602115241.GA43087@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 2 Jun 2022 15:34:03 +0200
Message-ID: <CAMRc=Mez7Ak9YG_EGxn4etMC7rY7+YkJd9aM5kHXTORWJLpwHA@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH] treewide: implement v2 API
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Darrien <darrien@freenet.de>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jiri Benc <jbenc@upir.cz>, Joel Savitz <joelsavitz@gmail.com>,
        Alexander Stein <alexander.stein@mailbox.org>,
        David Kozub <zub@linux.fjfi.cvut.cz>,
        =?UTF-8?B?SmFuIEt1bmRyw6F0?= <jan.kundrat@cesnet.cz>,
        Michael Beach <michaelb@ieee.org>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Ben Hutchings <ben.hutchings@mind.be>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 2, 2022 at 1:52 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Thu, Jun 02, 2022 at 01:26:56PM +0200, Bartosz Golaszewski wrote:
> > This is the main changeset implementing the new libgpiod API for the core
> > C library as well as C++ and Python bindings. It's actually the effect of
> > squashing all the patches we've had in the next/libgpiod-v2.0 branch (and
> > that have been developed and reviewed over the course of several months)
> > so that the master branch can remain bisectable.
> >
> > Big thanks to Kent Gibson for his reviews.
> >
> > Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> > [Ben: fix format specifier for uint64_t]
> > Signed-off-by: Ben Hutchings <ben.hutchings@mind.be>
> > [Viresh: Fix ioctl number for gpiod_line_request_reconfigure_lines()]
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> > [Kent: splitting of chip_info out of chip, documentation tweaks and some renaming]
> > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > ---
> > There were no reviews so far for the python bindings but I'm generally
> > happy with them and think that the contents of next/libgpiod-2.0 branch
> > are mature enough to get them into master and continue the work incrementally
> > there. So this is the amalgamation of all the work done so far on libgpiod v2
> > that I'd like to apply soon.
> >
>
> My apologies for not getting back to you earlier wrt the python
> bindings.
> When I try them I get:
>
> $ python3
> Python 3.9.2 (default, Feb 28 2021, 17:03:44)
> [GCC 10.2.1 20210110] on linux
> Type "help", "copyright", "credits" or "license" for more information.
> >>> import gpiod
> Traceback (most recent call last):
>   File "<stdin>", line 1, in <module>
>   File "exception.c", line 1, in <module>
> NameError: __build_class__ not found
> >>>
>
> I may be doing something dopey, but building v1.6.3 on the same
> platform (a clean Debian 11.3 install with a v5.18 kernel with gpiosim
> and gpio-mockup) works fine.
> Haven't had a chance to look into it further...
>
> Any ideas?

I ran Debian 11.3 with docker and can confirm this issue. I don't see
it on Ubuntu 22.04. Interesting. I'll look into it.

Bart
