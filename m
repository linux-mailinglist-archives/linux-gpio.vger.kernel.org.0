Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF69D338E8B
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Mar 2021 14:17:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230491AbhCLNQ3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Mar 2021 08:16:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231379AbhCLNQO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Mar 2021 08:16:14 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78384C061574
        for <linux-gpio@vger.kernel.org>; Fri, 12 Mar 2021 05:16:14 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id x21so7886455eds.4
        for <linux-gpio@vger.kernel.org>; Fri, 12 Mar 2021 05:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=neZ9V+cHHaOLaO/LQJ3v+VwMZ3+9mlPm1xPT4fXngAQ=;
        b=ZFEkO0tVH3wllnWFMhwQDJUcDBOY4/28BriU2RhZ3+Q5ZIGxNg1b2QaTwYCI7lr/Ce
         Z1ll8s2y3zgQsB5O1ZKpODLeh9AcHobATZSVo4EouwBk9ANUxNvRqCUnaUCjPUzVkzlW
         P6S9InY/9wESuvhpqE6KlDeC9o7BN3i9k7oWQxdq9035NaTQa8KGRTFPISPgVzwVhq2o
         WWHm9LRsZwg+njI4pTtAKwbeXvjcT9mX31UmXyhnmJ0a9K2D/NzZKGU90kE6FIHm09+W
         AEqV0CUhm/hmxCD28XI8gzmSrieF5jwDP2r+m64YuM526E7SQamFH/cqSpSODk57Q63K
         lyOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=neZ9V+cHHaOLaO/LQJ3v+VwMZ3+9mlPm1xPT4fXngAQ=;
        b=FqMQN2zQMT6JvWMg+tx34a0x0ZGhiSStITaL6T50ZWPyPV7LzdfeBIVIA0zwTFyTHa
         CD7wVCzCQ5hZRT9tZ64UQnpcCQvxKJ8r7mQbjANEAAoaHPVohPIdH2B7ucNkRv2Yrp/z
         GYgCc2g9f4Jvvy9yFIzkqp5u5gYPuzYkIEnSmjTpt0qVnpXBKQFvrlv4YZuplrPaGeds
         zRncJeyMYMHll5dGAcM6dyjPWw7a53vzH2dRPwSzErdYGBVW5PH06F5duvxKrixLON83
         +gMCYg4U8u+R8hzndvgqb5MuTqCu2Vd/lxZECbUugIdDQhd868kJ7Y1bkt0IEcT0D88e
         ZHVQ==
X-Gm-Message-State: AOAM530ivn1JwbPQ3c3uN/dKkiFxK6tlM5pm6dCUy5PcwcPI5oNhechd
        gNqJrFNLUtmFdfUwq1F1taq5dhjO9YqgXPUjblCczQ==
X-Google-Smtp-Source: ABdhPJwSNw8JNi+UKnMe99Qf0naPkixWkL2XPqedMsVuKvmkfKkzrdX38EVXWnCItjQXyDYYop5DuKx3MmFhtu4lBB0=
X-Received: by 2002:a05:6402:4309:: with SMTP id m9mr14555462edc.25.1615554973282;
 Fri, 12 Mar 2021 05:16:13 -0800 (PST)
MIME-Version: 1.0
References: <20210312095700.16277-1-brgl@bgdev.pl> <20210312095700.16277-8-brgl@bgdev.pl>
 <YEtTKJliHBep7bL4@smile.fi.intel.com>
In-Reply-To: <YEtTKJliHBep7bL4@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 12 Mar 2021 14:16:02 +0100
Message-ID: <CAMRc=Mc4DCDryO2VuC_2=ZkwT2XLPtUbe1HE47i0rfft=tb4oA@mail.gmail.com>
Subject: Re: [PATCH v4 07/11] lib: bitmap: provide devm_bitmap_alloc() and devm_bitmap_zalloc()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>,
        Shuah Khan <shuah@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kent Gibson <warthog618@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 12, 2021 at 12:40 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Mar 12, 2021 at 10:56:56AM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > Provide managed variants of bitmap_alloc() and bitmap_zalloc().
>
> Perhaps I missed your answer to Greg's comment...
> So, what do you think about adding _GPL to the export?
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Nah, I missed Greg's comment. :(

Will fix in v5.

Bart
