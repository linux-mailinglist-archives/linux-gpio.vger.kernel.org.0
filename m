Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0485C51BA2F
	for <lists+linux-gpio@lfdr.de>; Thu,  5 May 2022 10:22:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349095AbiEEIZ7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 May 2022 04:25:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349301AbiEEIZt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 May 2022 04:25:49 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6D032BB37
        for <linux-gpio@vger.kernel.org>; Thu,  5 May 2022 01:20:41 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id bv19so7273477ejb.6
        for <linux-gpio@vger.kernel.org>; Thu, 05 May 2022 01:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=pImyoEOMEflWvjoWQS7mGMdgJX7h/yQqdlk0MwbeqHE=;
        b=OASPXtVMKk6++inOh9W5rVqLk4SF3aifWs8l91JRjnNdMJqXADFwrXYWJKdRRiSkuQ
         XwU9azoGngJK2rixx8gxWVVcorteQT0yucW+OlEOWkEN0CzFVXDtJfV459s8mpGqz/ZA
         JsQLRp8BlAngRMiyqJtuI7tq5ECMibz0s5WqrhXz+g9JRZIf649HPbgrqBTUcodThiYn
         Pf4M+TTPo5h5EdhUhXxBdIVXRbjxHC3moIGPZ7IW+gwx0jU8FFLles914Sy2E+8ormW9
         iHtVsxHW7u2lkUebw4AT5P4kvjjLc8Al/eZMTUUk351mIzDETa5i/mrCngUK/VLVPmgk
         LpvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=pImyoEOMEflWvjoWQS7mGMdgJX7h/yQqdlk0MwbeqHE=;
        b=l05D4UajXfZetBVWc9nlDhRr4NiT7Nsw2RsxxSJ6xmC+6EFFRGUNi2VU/GivGJqWX9
         hDfdhoSngZ+KYD/GHC6NSPlXGxj2oxYxh+BBC4UXpZhZNlmaYnI4VYzF2RsK/Aud6+Sb
         WCgwTjTyI6xnPlojebRh57rXSsz4kyPQRwW1/YT5GNMw7vJyoD6NATsEF7mqrWtfCxbN
         NNpxqn2zGlHP0Vua0OKnBVcELZ5sv6To/P+4PZWuPwjPNyYO6gUN1lR2OaQU+KKHVDBd
         uGYuUGpVvoirugCeYiMXEeGd8HvXbiBxLkS3MxscJQNxqKsSQXzlfpqesIlJVLnBIXVA
         c6pA==
X-Gm-Message-State: AOAM533kd0ecGcU/WLhX5w00c7FVmaWzzKaJ9Tvpf+YtGP1gvmF8l7mx
        XdCUfb94FaXh41xgr+S2iVgNYpfnGaiipOuPOCR1/w==
X-Google-Smtp-Source: ABdhPJztl8pMxMyVN8aQQFQv1Y97HhwB+vnhe17lsHrGy+AGhI+M88Cm6uJxQ7KX8Gc6d5DbjJ5ZxYqO7YduJW9pZrU=
X-Received: by 2002:a17:907:c2a:b0:6f4:4b49:9cfb with SMTP id
 ga42-20020a1709070c2a00b006f44b499cfbmr17692183ejc.697.1651738840358; Thu, 05
 May 2022 01:20:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220426125023.2664623-1-brgl@bgdev.pl> <20220426125023.2664623-3-brgl@bgdev.pl>
In-Reply-To: <20220426125023.2664623-3-brgl@bgdev.pl>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 5 May 2022 10:20:29 +0200
Message-ID: <CAMRc=Me-7EHqoUUGPwapUy948e6HQjkX3JYBwWmmEhs630-prg@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH v6 2/5] bindings: cxx: add v2 headers
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Alexander Stein <alexander.stein@mailbox.org>,
        David Kozub <zub@linux.fjfi.cvut.cz>,
        =?UTF-8?B?SmFuIEt1bmRyw6F0?= <jan.kundrat@cesnet.cz>,
        Michael Beach <michaelb@ieee.org>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@lindev.ch>
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

On Tue, Apr 26, 2022 at 2:50 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> This adds the headers for the v2 C++ bindings.
>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>

I'm pasting below the review I got from my work colleague Bernhard
Rosenkr=C3=A4nzer (Cc'ed):

Bart

---

Looks good to me, one minor nit: I presume bindings/cxx/gpiod.hpp Is
supposed to be #include-d by users of the library. The definition of
GPIOD_CXX_API in the file causes the symbol to be re-exported by
anything including the header. Usually the way to achieve what you
want there is

AM_CPPFLAGS +=3D -DBUILDING_GPIOD=3D1
in Makefile.am, and the definition of GPIOD_CXX_API changed to

#ifdef BUILDING_GPIOD
#define GPIOD_CXX_API __attribute__((visibility("default")))
#else
#define GPIOD_CXX_API __attribute__((visibility("hidden")))
#endif

Also, in Makefile.am you probably want to change
libgpiodcxx_la_CPPFLAGS to libgpiodcxx_la_CXXFLAGS -- CPPFLAGS is for
C/C++ PreProcessor flags, CXXFLAGS is for the C++ compiler

Doesn't make much of a difference currently because at least with
clang and gcc the preprocessor isn't called separately, but you never
know what kind of insanity a future automake version will bring

You might also want to change the various methods taking (void) [none]
as parameters to just taking () -- (void) is a C-ism, not needed for
C++ (and you never know if at some point the standard will actually
disallow it)

Also, I'm not sure if it's intentional that some classes (class chip
etc.) aren't marked GPIOD_CXX_API

line-config.hpp uses using override =3D ::std::pair<line::offset,
property>; -- override is a reserved word (to be used by something
inheriting a class to indicate the method being defined overrides a
base class method -- optional, what it actually does is cause a
compile time error if parameters mismatch or there's some other reason
why it doesn't overload something), so using it in this context might
break with some compilers

Minor nit: some parameters could add more const-ness (e.g. void
clear_drive_override(*const* line::offset offset) noexcept;)

In theory, this could help a compiler optimize something out, but in
practice I don't know any compiler that would actually generate better
code from that
