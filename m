Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1FDF45C71C
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Nov 2021 15:18:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353502AbhKXOVW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Nov 2021 09:21:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351095AbhKXOVE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Nov 2021 09:21:04 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F209DC11223D
        for <linux-gpio@vger.kernel.org>; Wed, 24 Nov 2021 04:46:59 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id v1so9918370edx.2
        for <linux-gpio@vger.kernel.org>; Wed, 24 Nov 2021 04:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QNxbdxvY1XGwJO5BhsvGP2g9FnaYCe6z/c5imeKTCQc=;
        b=JAO/GeWYxrwEZ+KX7CN1FibY0RaYaYDktQMXfAGDm6HVGGFB8u3qG7/sKMMalnK5V/
         y+nL/khR63DpUwXJpS1dhQQV6ddEDo9nbmUBxbrwsGjbof5O4fOcSJgRfc9f2gdDx8Ye
         5GZhrudR0PunvfEXr9OgrZEdnJ9KRMq154DpIDlQ8CY6cXdv7DSbAegAX8vkhR/mh505
         JzdqlAUdf1b1BgOwmLbU2B1PziiNESeZ2vUty/cbK/DiWTjLvMQtq5bypBCcLiOkBr9a
         aHYFAxW7X6PzMqlmsJCe4aVB6M9Zl274zvr6M/C4Ht0BgSTT4Cu4prTQzU/bXfYwIZl9
         3o7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QNxbdxvY1XGwJO5BhsvGP2g9FnaYCe6z/c5imeKTCQc=;
        b=QmzFjUsj0ech80dAHpytFg7yLfnQ1zBouOByW1MDdi3Pie/8BEM/SiyyYuS1hDEWkm
         HF8cmcc6bcp1eigXs/JWi8u00iAfk+8L0yxXDfI2RIX1ylOqqmT5OHq3gM81NMWO/tH+
         XtzhIth/r20xItjH4hWT+cWMSlo56yl6c9Qxb0rxIAhl/xPh7ivfOZXGRf6N+IOYDiy8
         LhHEWT9l5YCi7xH4Uy3dKWEnIKq+GChVbExrpuDv5GR+p8WnPLl/GtauRInKkaz3YWwr
         nTeO8y9z2O3NAsIBbZ2Ga66IRAnkTf6LotJn6vzRwSbqPar7sLKM1TTrcu5A8jG2SmFe
         TPgg==
X-Gm-Message-State: AOAM532C6VIudcbNprrLoWxobRxTOMv8BLpLc7/adFVp44ieaxVbcZ1n
        OdQCnrraLM/aC1Hdczd7xA82VAnVh4qw79UNl2TDy9w7LCfLwA==
X-Google-Smtp-Source: ABdhPJyA+W15t1CjEV/znDfMRF9pbH794hXE1Mz4w5XFk6DeON2vEQHijf1ymInLVeDutAJkzB74uutR0+T/MJu13wM=
X-Received: by 2002:a05:6402:1e93:: with SMTP id f19mr24830673edf.60.1637758018580;
 Wed, 24 Nov 2021 04:46:58 -0800 (PST)
MIME-Version: 1.0
References: <20210518155013.45622-1-andriy.shevchenko@linux.intel.com>
 <20210518232451.GA7362@sol> <YKTCDNcyUlrgE0Y4@smile.fi.intel.com>
 <20210519080434.GA22854@sol> <YKTMninSSY3MK6Hf@smile.fi.intel.com>
 <CAMpxmJVJBx2J87bS0CUYPyJkHKt=nvFw65y_+iG-5JbVekuaqw@mail.gmail.com>
 <CAHp75VdZ3aws3G=4_r82LMfuMNmNdLoBpqRsfF_ogZ7c=vyTsQ@mail.gmail.com>
 <CAMpxmJVy12at1+37iPiqTXe6mvodUpjDKCkFQO02Cu=u5_sp_A@mail.gmail.com> <YZ0928wfsYIBJYcQ@smile.fi.intel.com>
In-Reply-To: <YZ0928wfsYIBJYcQ@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 24 Nov 2021 13:46:47 +0100
Message-ID: <CAMRc=McPGR4xejGWxCUkEsNiOmwkf1kctXB-K73xU9q3r7+CFA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] gpiolib: Never return internal error codes to user space
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Kent Gibson <warthog618@gmail.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Suresh Balakrishnan <suresh.balakrishnan@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 23, 2021 at 8:16 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Thu, May 20, 2021 at 04:39:50PM +0200, Bartosz Golaszewski wrote:
> > On Thu, May 20, 2021 at 3:15 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > >
> > > On Thu, May 20, 2021 at 4:08 PM Bartosz Golaszewski
> > > <bgolaszewski@baylibre.com> wrote:
> > > > On Wed, May 19, 2021 at 10:30 AM Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > On Wed, May 19, 2021 at 04:04:34PM +0800, Kent Gibson wrote:
> > > > > > On Wed, May 19, 2021 at 10:45:16AM +0300, Andy Shevchenko wrote:
> > > > > > > On Wed, May 19, 2021 at 07:24:51AM +0800, Kent Gibson wrote:
> > > > > > > > On Tue, May 18, 2021 at 06:50:12PM +0300, Andy Shevchenko wrote:
> > >
> > > ...
> > >
> > > > > > > > > Fixes: d7c51b47ac11 ("gpio: userspace ABI for reading/writing GPIO lines")
> > > > > > > > > Fixes: 61f922db7221 ("gpio: userspace ABI for reading GPIO line events")
> > > > > > > > > Fixes: 3c0d9c635ae2 ("gpiolib: cdev: support GPIO_V2_GET_LINE_IOCTL and GPIO_V2_LINE_GET_VALUES_IOCTL")
> > >
> > > ...
> > >
> > > > > > > > You immediately revert this patch in patch 2.
> > > > > > > > My understanding is that is not allowed within a patch set.
> > > > > > >
> > > > > > > > Why split the patches instead of going direct to the new helper?
> > > > > > >
> > > > > > > It's for backporting to make it easier. (I deliberately left the context above)
> > > > > > >
> > > > > > > I can fold them if maintainers think it's okay to do.
> > > > > > >
> > > > > >
> > > > > > Not sure what the constraints are on backporting, but wouldn't it be
> > > > > > simpler and cleaner to backport the new helper?
> > > > >
> > > > > Logically (and ideally) it would be three different patches:
> > > > >  1) introduce helper
> > > > >  2) use helper
> > > > >  3) fix places where it's needed to be done
> > > > >
> > > > > But the above scheme doesn't fit backporting idea (we don't backport new
> > > > > features and APIs without really necessity). So, the options left are:
> > > > >
> > > > > Option a: One patch (feels a bit like above)
> > > > > Option b: Two patches like in this series (yes, you are correct about
> > > > >           disadvantages)
> > > > >
> > > > > > But, as you say, it is the maintainers' call.
> > >
> > > > Third option is to backport this patch but apply the helper
> > > > immediately to master.
> > >
> > > If I got you correctly, you want to have two patches, one for
> > > backporting and one for current, correct? But how can we backport
> > > something which has never been upstreamed?
> > >
> >
> > Well we would not technically backport anything - there would be one
> > patch for mainline and a separate fix for stable.
>
> So, what should I do here?

Send a separate patch for stable branches that fixes the issue and
fold this patch into the next one in the series for master.

Bart
