Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B5184DE11B
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Mar 2022 19:34:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240174AbiCRSfO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Mar 2022 14:35:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237576AbiCRSfK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Mar 2022 14:35:10 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B83D01DA4F
        for <linux-gpio@vger.kernel.org>; Fri, 18 Mar 2022 11:33:48 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id q1-20020a17090a4f8100b001c6575ae105so6071129pjh.0
        for <linux-gpio@vger.kernel.org>; Fri, 18 Mar 2022 11:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8eYD6V1H2eTxabk7DiQrQRT/zZ4eHdFF0vDlDZt1xas=;
        b=ewU64KNEeZwytZF4An+dsvf1BP7k4U83MQd6onG03mYKzwvJoQl4qyHjLQs0oSWMp3
         tM0aT1vxlatYEhWzCxIKabcD3D3NcoCSA/GxWDyU+KAAJDiYFZuYWQGOBaZX+uHQTM53
         jPdp6xULDFi9D639TpwzwjkdL9Oz0toZhmU49RwKTErUvNhnsJaYTMRb3hfj5zIzJ4wm
         n6PXOCT5cKyQGjdDoemy+aeFQp1DhCM4DMG4ZJn4Q75Yl+kUB+K7wR9TCKS3yZ+Gj8V4
         uzeCvUID+J2qH0vocYC63Ga/NEPHYwwA4w45fo9owtXS+INCb0z/kgabtvtMF5vPvzE5
         0upg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8eYD6V1H2eTxabk7DiQrQRT/zZ4eHdFF0vDlDZt1xas=;
        b=LK+vjv+UrSlIxt5z6JT/YuZL47xF2gfUKNGr4NIT8KeYdlrxGeV7mUOYJsVlQgeDFR
         OOtQXKAVD5cI4BrSJaYyhdNdRAxsPaG2eGCG5DuVg4x7zWV6JL5peSH3y8OTXF3Zt+vp
         vCdjsFFvoJHAiseqrF74uvy+ZnJMZ4o2M6DNLk6LoFAfQhYB8vVQNV6QTwn8vTlKStTW
         zkG8CijSaa9uP0r84+wWCrEfNtN9lbq4ASuqRRu+Bn4ZRDWfk7r58Eqq/nUxG/rJ9buo
         TTq/ONsvWjYty7SmU7P3tgYJIq2uIMQOvHT5euLCSCLhkbn21QZMYIY5UZt4cAEBNtaJ
         HOJQ==
X-Gm-Message-State: AOAM5326psbJxTapLwrzj3xI9VPZ1dqeWBz03rFZK63TlxTX9HczC5ha
        YAEe1ZhkOF63/Z8sO9wklJJL2/AzvDQsE7aKB7H4
X-Google-Smtp-Source: ABdhPJywNU/bgojq+Q9H5bL3LPlh2ncjnrZOFfaHuK+iqJkgz5S3CtJ71EEeIfA73BW3NNK1remnTn+kKCiHGr7GfM0=
X-Received: by 2002:a17:90a:5b06:b0:1b8:b705:470b with SMTP id
 o6-20020a17090a5b0600b001b8b705470bmr12494149pji.168.1647628428016; Fri, 18
 Mar 2022 11:33:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220316213055.2351342-1-morbo@google.com> <YjL6K49CkH+YC4FQ@smile.fi.intel.com>
 <CAKwvOdkjb3uR+kqjfdKL5gqA8R+00c5=3E7uGGW+mGZ3QRsjqg@mail.gmail.com>
 <YjSROmYwwGhpsXMl@smile.fi.intel.com> <CAKwvOdkEjrPUL4HuO3UKaUZAzVw=XV1bEOSj6HR5R1WTUSSZ4w@mail.gmail.com>
 <CAGG=3QVCkF7RdbQ85MtKgUjm8qP79BESAUiGU3wSQc0+ExO0gA@mail.gmail.com> <CAKwvOd=1+JF6mxpM_K3xCYAr-R8nrj0s7tA9GwUybyiFdLpA2w@mail.gmail.com>
In-Reply-To: <CAKwvOd=1+JF6mxpM_K3xCYAr-R8nrj0s7tA9GwUybyiFdLpA2w@mail.gmail.com>
From:   Bill Wendling <morbo@google.com>
Date:   Fri, 18 Mar 2022 11:33:36 -0700
Message-ID: <CAGG=3QXJ1P-9vAvONe8PKBzMe3se66GSL9gbA9UoLb7a5R33kA@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: acpi: use correct format characters
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Nathan Chancellor <nathan@kernel.org>,
        linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev,
        Joe Perches <joe@perches.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 18, 2022 at 11:29 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Fri, Mar 18, 2022 at 11:25 AM Bill Wendling <morbo@google.com> wrote:
> >
> > On Fri, Mar 18, 2022 at 11:01 AM Nick Desaulniers
> > <ndesaulniers@google.com> wrote:
> > >
> > > On Fri, Mar 18, 2022 at 7:04 AM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > >
> > > > On Thu, Mar 17, 2022 at 11:11:21AM -0700, Nick Desaulniers wrote:
> > > > > Our goal is to enable -Wformat for CC=clang.  Please see also:
> > > > > commit cbacb5ab0aa0 ("docs: printk-formats: Stop encouraging use of
> > > > > unnecessary %h[xudi] and %hh[xudi]")
> > > >
> > > > Not that I agree on that commit for %h[h]x
> > > >
> > > >         signed char ch = -1;
> > > >         printf("%x\n", ch);
> > > >         printf("%hhx\n", ch);
> > >
> > > Will print:
> > > ffffffff
> > > ff
> > >
> > I noticed this. My first thought was to do something akin to:
> >
> >   printf("%x\n", (u8)ch);
> >
> > but went the route of removing the "h" qualifiers to be more in line
> > with previous fixes. I will be happy to change this patch if that's
> > what you would prefer.
>
> Should we add a note diagnostic to clang suggesting the explicit cast
> as one method of silencing the warning?

I don't think we should offer multiple suggestions in the notes. It
could become confusing and make the diagnostic messages much bigger.
That doesn't mean we couldn't change the suggestion. :-)

-bw
