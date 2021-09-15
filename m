Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FE0140C7A3
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Sep 2021 16:43:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237923AbhIOOol (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Sep 2021 10:44:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237921AbhIOOok (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Sep 2021 10:44:40 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95D93C061574
        for <linux-gpio@vger.kernel.org>; Wed, 15 Sep 2021 07:43:21 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id z24so6668741ejf.5
        for <linux-gpio@vger.kernel.org>; Wed, 15 Sep 2021 07:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=dk3O7JUnkIGYR0cwjWzRmQGndCjcM+i53moUhwrZYZE=;
        b=p17J/l9aiEUqhUgwQYfMZT0JRGuvEbWWf5ES9rrUmBbjjWS4+x1WmW++tcj//+FbR7
         zBgwiKTdUCVDpEbPq13rXGIfhFatwB0GCcU6i1Quev/Kx3NU8L9mUe7deZVnr2EBd6hZ
         w19bQkrzbCE8c88Xp2XO5trAdBgXUgR+y6MDxnSS0PqR3yn8IWObfaVqCCOzitWn+RrB
         7iQutnLDS7uzuwIV0wvoKFq7ixgUECDhV6BvK7g8uoSsoRW7Dm6hcLiA5H13O3AFiOyy
         +FugKWFgDwdumNxPivGMiSKb3A2POIQiRMA5evbZh96sUWDzbY07ls+OjR8uauoXNh+s
         jyMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=dk3O7JUnkIGYR0cwjWzRmQGndCjcM+i53moUhwrZYZE=;
        b=0D5aPfzQF837oZCZ/gE0xkxzewvCDQDn8t3tOpChNal5wR2UN04gTJ3BjPiVgR2b+z
         50d3NeD72JW3/dg6msUONZK56zTdTaMOR9mEX7G6OYaCcdwLtc4RdtQfIlLFa2GE2+9d
         eMnPN9rSjcfzwh72WVlBfcrBbFkiAaly7Fj9nz8pjJ9fo6PLQmAnseK6pCSxheCxBi4+
         3HlM1X4QsB0e/QBj87tejW6jkbh0lVh2Nd2XTchGXpV3woanRKixAhXG3yYbF9gVNxhF
         E6u04ePbG08DSoKC6gMFn4zA6SBzy+dvd1m8q27VOelfxGLd4WPZZAzCY5O7pS0TuctV
         z7ag==
X-Gm-Message-State: AOAM530zTWG8u5r9x3WaBYso8AjQXcQuYSAH32bJ7MxIkh98Gv7VrqSL
        qT1cRTI2NTyQp6L1wz4G/WCtsNFxoBpuQLrVwJ5Ke/cE8Gk=
X-Google-Smtp-Source: ABdhPJw31f+fACOU2497t+wWzBcABkh+IDzdrJ90XpLJYb0xKSpHkyWLZS48eUmilgTNTwaHUIIsAae9EL4gdLNniZo=
X-Received: by 2002:a17:907:2bdb:: with SMTP id gv27mr320096ejc.483.1631716999682;
 Wed, 15 Sep 2021 07:43:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAFKLa4LqPdXutqRdWp+MoHTuYkN4Qp=gUM5Gi_ZArDN0Lsn8eg@mail.gmail.com>
 <YUHbb1awZcmih5PC@ada.ifak-system.com>
In-Reply-To: <YUHbb1awZcmih5PC@ada.ifak-system.com>
From:   Andreas Pokorny <andreas.pokorny@gmail.com>
Date:   Wed, 15 Sep 2021 16:43:07 +0200
Message-ID: <CAFKLa4LUWq9Z7MmNt701z3BNFiyfcUTwS3fsU97Keya0YGzEsA@mail.gmail.com>
Subject: Re: [libgpiod PATCH] Add cmake support
To:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

Am Mi., 15. Sept. 2021 um 13:39 Uhr schrieb Alexander Dahl <ada@thorsis.com>:
>
> Hello Andreas,
>
> just a quick glance over it, but some things catched my eye even
> without proper review. See below.

Nice, looked proper enough for me!

> Am Wed, Sep 15, 2021 at 12:59:58PM +0200 schrieb Andreas Pokorny:
> > This is a wip cmake support for libgpiod. It allows to integrate
> > libgpiod as part of a bigger cmake project built via the new package
> > management feature of cmake called FetchContent or as git submodule.
> > ...
> > +cmake_minimum_required(VERSION 3.14)
>
> What's the actual CMake feature you are using requiring 3.14, or is it
> the version you happened to have?

3.14 for the FetchContent_MakeAvailable, 3.13 for the options policy

> > +project(libgpiod VERSION 2.0.0 LANGUAGES C CXX)
> > [...]
> > +check_symbol_exists(ioctl "sys/ioctl.h" HAVE_IOCTL)
> > +set(CMAKE_REQUIRED_DEFINITIONS -D_GNU_SOURCE)
>
> This is no CMake variable, you should not use that prefix for your own
> variables.

check_symbol_exists are old macro facilities that use the variable above
to influence the compile test.

> > +check_symbol_exists(asprintf "stdio.h" HAVE_ASPRINTF)
> > +check_symbol_exists(scandir "dirent.h" HAVE_SCANDIR)
> > +check_symbol_exists(alphasort "dirent.h" HAVE_ALPHASORT)
> > [...]
> > +  set_target_properties(gpiomockup PROPERTIES
> > +    VERSION ${PROJECT_VERSION}
> > +    SOVERSION ${GPIOD_MOCK_SOVERSION}
>
> You should use only the major version part for SOVERSION property.

Ah yes I forgot about the revision and age stuff.


> > +    PUBLIC_HEADER tests/mockup/gpio-mockup.h
> > +    )
> > +  target_compile_options(gpiomockup PRIVATE -Wall -Wextra
> > -fvisibility=hidden -include ${CMAKE_BINARY_DIR}/config.h)
>
> This is compiler specific and might conflict with what the user
> wanting to build this thing wants.
>
> > +  target_link_libraries(gpiomockup PRIVATE ${KMOD_LDFLAGS}
> > ${UDEV_LDFLAGS} Threads::Threads)
>
> If you're using PkgConfig and recent CMake anyways, please use the
> IMPORTED_TARGET option of pkg_check_modules and use that for
> target_link_libraries.
>
> > +  target_include_directories(gpiomockup PUBLIC
> > $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/tests/mockup/>)
> > +
> > +  enable_testing()
> > +  add_executable(gpiod_tests
> > +        tests/gpiod-test.c
> > +        tests/gpiod-test.h
> > +        tests/tests-chip.c
> > +        tests/tests-event.c
> > +        tests/tests-line.c
> > +        tests/tests-misc.c)
> > +  target_compile_options(gpiod_tests PRIVATE ${GLIB_CFLAGS} -Wall
> > -Wextra -include ${CMAKE_BINARY_DIR}/config.h)
>
> Those glib cflags should come with pkgconfig imported target, for GCC
> options see above.
>
> Is there any reason to include that config.h header like this over
> adding $<BUILD_INTERFACE:${CMAKE_BINARY_DIR}> to
> target_include_directories?

This is done in the autotools build. This only replicates the solution. I am not
particularly fond of doing something like that. The two relevant flags
configured
that way are only used internally and never exposed to users of the library.

Thanks for the review - I hope the next update addresses all findings.

kind regards
Andreas
