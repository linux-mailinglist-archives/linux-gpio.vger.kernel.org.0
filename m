Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E554B4DE110
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Mar 2022 19:32:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238047AbiCRSd3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Mar 2022 14:33:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240146AbiCRSd3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Mar 2022 14:33:29 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E6EA11D792
        for <linux-gpio@vger.kernel.org>; Fri, 18 Mar 2022 11:30:42 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id p14so4087581lfe.4
        for <linux-gpio@vger.kernel.org>; Fri, 18 Mar 2022 11:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JhBJua4MwTn16uw9UYiJEFGtN/+A3wWm3ncEcAGAznM=;
        b=XveiTTIKo48Em6kpMiotlpRXPch6hY8GbRe9VEOQqpG6yRcjfb2uuLDWaH7MdWWew1
         gI8m6zGyXqGBYZXFfD6uchEnbTiGVAMKYwtrir4sHAJ8zGXz6qPjRYwKaVh1dIgoD5Dr
         p/bBCLdzfZWnm59rifezKBDWpY4ECydq3e1f6DbB9ztxomnVWx0X0OTb5N/R2NaqTfgh
         HSY7TAbH+g7cVRBh1555JHIrBWYm/QyxHdHW/QN+mYGR/M20VP46tUat0iTb3tTMVIZh
         6RAXHhN54Z3naU78SqEd065dR7pSMA9ePMsMcipIP7Ii0Q8haEBwngc91xEgEoxVmB9K
         BZzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JhBJua4MwTn16uw9UYiJEFGtN/+A3wWm3ncEcAGAznM=;
        b=8BcO4/ysrIsiYsF6X+X+pWK764NA084n2r/RTLZyYSexnPO48/werwb2KbZcHzIaC+
         QvK73L8I/xxZazm4KQQzIgxcIaweSr0ZLjMPxZTn2N2/0Dsx6MH4CACLgMC17Wyr4kJq
         4/nv7dj2VSf5V1MKoCqwXZJHsLriH3xn2kIK0iL7SO4nHUyfBUSCJ7ei48hxirYK+K6M
         xudNKHoYz69N5urc6Kz1x30K0u05K30tmff1QbYrf5x15zF+kB835k5luL4JG9nAPJlH
         xl+GYhncsWZQWAISiBx0FqvyhdOuYNr/9zBvbzq8a94bx5/iWlJZmiMAWBJzggnGSwd4
         2rFA==
X-Gm-Message-State: AOAM533CzEQguGjxkODYKMejhD6uc/aU6LxLcwyNDGv0rZyqKkHpIoSu
        yr8kJKBxt6HGfB7lhiV+pqOqrCWEvdCCFINUKyrFEg==
X-Google-Smtp-Source: ABdhPJzWbK0oJgZeNdqhptZp02Vl7ghfW80F6ZRIb/Zd4pWxJsRPSII+iAwnJeFfon+0mgclS0LLAq7EF/vEp3LrrtU=
X-Received: by 2002:a05:6512:b9e:b0:44a:10eb:9607 with SMTP id
 b30-20020a0565120b9e00b0044a10eb9607mr1450810lfv.626.1647628184755; Fri, 18
 Mar 2022 11:29:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220316213055.2351342-1-morbo@google.com> <YjL6K49CkH+YC4FQ@smile.fi.intel.com>
 <CAKwvOdkjb3uR+kqjfdKL5gqA8R+00c5=3E7uGGW+mGZ3QRsjqg@mail.gmail.com>
 <YjSROmYwwGhpsXMl@smile.fi.intel.com> <CAKwvOdkEjrPUL4HuO3UKaUZAzVw=XV1bEOSj6HR5R1WTUSSZ4w@mail.gmail.com>
 <CAGG=3QVCkF7RdbQ85MtKgUjm8qP79BESAUiGU3wSQc0+ExO0gA@mail.gmail.com>
In-Reply-To: <CAGG=3QVCkF7RdbQ85MtKgUjm8qP79BESAUiGU3wSQc0+ExO0gA@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 18 Mar 2022 11:29:32 -0700
Message-ID: <CAKwvOd=1+JF6mxpM_K3xCYAr-R8nrj0s7tA9GwUybyiFdLpA2w@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: acpi: use correct format characters
To:     Bill Wendling <morbo@google.com>
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

On Fri, Mar 18, 2022 at 11:25 AM Bill Wendling <morbo@google.com> wrote:
>
> On Fri, Mar 18, 2022 at 11:01 AM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > On Fri, Mar 18, 2022 at 7:04 AM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > On Thu, Mar 17, 2022 at 11:11:21AM -0700, Nick Desaulniers wrote:
> > > > Our goal is to enable -Wformat for CC=clang.  Please see also:
> > > > commit cbacb5ab0aa0 ("docs: printk-formats: Stop encouraging use of
> > > > unnecessary %h[xudi] and %hh[xudi]")
> > >
> > > Not that I agree on that commit for %h[h]x
> > >
> > >         signed char ch = -1;
> > >         printf("%x\n", ch);
> > >         printf("%hhx\n", ch);
> >
> > Will print:
> > ffffffff
> > ff
> >
> I noticed this. My first thought was to do something akin to:
>
>   printf("%x\n", (u8)ch);
>
> but went the route of removing the "h" qualifiers to be more in line
> with previous fixes. I will be happy to change this patch if that's
> what you would prefer.

Should we add a note diagnostic to clang suggesting the explicit cast
as one method of silencing the warning?
-- 
Thanks,
~Nick Desaulniers
