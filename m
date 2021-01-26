Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1F963041A7
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Jan 2021 16:10:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406091AbhAZPIm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jan 2021 10:08:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406159AbhAZPIj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Jan 2021 10:08:39 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4804BC061D73
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jan 2021 07:07:59 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id ox12so23472423ejb.2
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jan 2021 07:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dsXFFCypUU7ATohbWX05BEBJK/QJPkMGfZ0TJ1x/rq8=;
        b=BMTC9YXI1tuHNgCs73186kGG26BhgHHXIVdDxgE8gxh0iw1d8p0/L6yva1UMu4ryuw
         RK6LtCgpNnpcYFCAP20Df+NJxDteohOg4Z9HzrGXZ3hCVWXDQChgIOfgIuuvz18FljfZ
         yQp0io1qhQCSjZcrbkyDk3+8rtY8j+JkJOK8kzVXrpQxiYW3zWcKmTkcyzUs5Bhl/spd
         dJjIuBUOV9e6RUlmLHnfIVq+QacxOBtcJlHibK8IfVVv/eS49I5+r4bishRgpkpG06pp
         aLPEudk2dA1uLTXW8r7v5ZOQjc2DapBW2s/pJuJzl9piIKjGLq7Yomztki6WDDHxD0CX
         RzBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dsXFFCypUU7ATohbWX05BEBJK/QJPkMGfZ0TJ1x/rq8=;
        b=ChFpYNs1TYEEFe3+rI9XL93+Vx4jA7JMqe1BN6oyeCWELdm33GvZtTsunJtvw9HKZy
         Vh0vb7vxjAAKG7FGV0GCAtRBzwcYdOtAiaZaQj0r5xYIWEKsFi612Pwjjg6KRaVoGpat
         /XZZayqQ3xgvel7Fngy7Hj43BDJDD4JDzLAsmIS84d8TD1wbQH7naJaYAf6J4N9WCTk2
         88qh4kjmzkDfsd88412cUIEOFR6AiYKtTXmE8C6mA9UzZ85AALiox+u8p2odYZJLx0kN
         IptLOrxvo7Hn0GTunaqTlrVvXXUf9lf8uRKj/JHZRpB6LF+eCcrZEjaCy8b9jSbdReGA
         RKQA==
X-Gm-Message-State: AOAM532GHbo1YoCzUxaL62HGnzwvJw56IyjdYrq17Sw9gI+xVkNga/PC
        r8zt044+wQhh+CtAvzFUlk9CGm0ODvACGxl1wLTRyQ==
X-Google-Smtp-Source: ABdhPJyHxBVpmuGcVR5LGoe/ufKy5BuKGZXdX+i0QDFmjt9O2kUzHd/iOlUFRbj3GCPJK1dAJ/Avm8KLUxF29wdz5m0=
X-Received: by 2002:a17:906:b042:: with SMTP id bj2mr3714797ejb.261.1611673678063;
 Tue, 26 Jan 2021 07:07:58 -0800 (PST)
MIME-Version: 1.0
References: <20210111133426.22040-1-brgl@bgdev.pl> <20210111133426.22040-7-brgl@bgdev.pl>
 <CAHp75VfeO10DXc2nCRKP9=6uppJ28k36E8yr20+YCd0mKUGjWA@mail.gmail.com>
 <CAMRc=MevGmAMBK20O2BBmyD9NjCSpC9-O_j_0HM6DQV66rnA2Q@mail.gmail.com>
 <20210111144647.GY4077@smile.fi.intel.com> <CAMpxmJW=6YXgPBJ3=1sBbNAOWTV4idwHz-cWv+YborZ4hLtcKA@mail.gmail.com>
 <20210125055527.GA344851@sol>
In-Reply-To: <20210125055527.GA344851@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 26 Jan 2021 16:07:47 +0100
Message-ID: <CAMRc=Mc4gK6BXKV8-b9qBTgm8m5DqW35UPxPWn7PbfJ-8LB4Yw@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 6/6] core: add the kernel uapi header to the repository
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 25, 2021 at 6:55 AM Kent Gibson <warthog618@gmail.com> wrote:
>

[snip!]

> >
> > I don't like the ifdef hell so I prefer to bundle the header. I'm open
> > to other suggestions, although I can't come up with anything else.
> >
>
> Going off on a bit of a tangent, but I'm trying to add support for
> decoding the GPIO ioctls into strace and am running up against a similar
> issue.
>
> The way strace does it is to check the uAPI header on the host and use
> it if possible.  To handle where it may be stale, local types are
> defined that mirror any types that may have been added since the header
> was originally released.  If the corresponding type is available in the
> linux header then it is used, else the local type.
>
> This obviously creates a lot of pointless boilerplate code and
> preprocessor chicanery so I floated the idea of just including the latest
> header in the strace tree, as you are doing here for libgpiod.
> But that raised the issue of licencing, specifically if you copy the
> linux/gpio.h into a source tree does that mean that the whole project
> becomes GPL 2.0?  That is an issue for strace as it is LGPL 2.1 - as is
> libgpiod.
>
> The Linux uAPI headers are under the GPL-2.0 WITH Linux-syscall-note,
> which is also not totally clear on this point[1].
>
> My gut feeling was that using and even copying API headers doesn't
> constitute a derived work, as per the FSF view quoted in [1], and
> ethically might even be less of a violation than copying and re-defining
> individual types, but I'd rather not rely on a gut feeling.
>
> Is there some clear opinion or precedent on this point?
> i.e. are libgpiod and strace in legal licence jeopardy if they include
> gpio.h in their source tree?
>
> Cheers,
> Kent.
>
> [1] https://lkml.org/lkml/2020/2/21/2193

Thanks for pointing that out. I lack the legal knowledge to have an
opinion of my own on this.

Cc'ing Greg KH for help.

Greg: do you know if it's fine to bundle a 'GPL-2.0 WITH
Linux-syscall-note' uAPI header together with an LGPL-v2.1-or-later
user-space shared library?

Best Regards,
Bartosz Golaszewski
