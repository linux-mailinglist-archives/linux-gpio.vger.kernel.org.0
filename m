Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 326BC38B216
	for <lists+linux-gpio@lfdr.de>; Thu, 20 May 2021 16:42:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231803AbhETOno (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 May 2021 10:43:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242905AbhETOmr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 May 2021 10:42:47 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34EDDC06135E
        for <linux-gpio@vger.kernel.org>; Thu, 20 May 2021 07:40:02 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id r8so23095641ybb.9
        for <linux-gpio@vger.kernel.org>; Thu, 20 May 2021 07:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9wizOY0EarwWfoT8sBSAOULyiMZlua8eTWF9dLcnBQo=;
        b=D5sKWuHddAS6wsMF0yqrzBm8O73rmgG9E6k2rGGSsgrHqiz3X4sJH9MzGZlLHljfZp
         TSlo3reO9Tx+GiS256/5L3pL7Myy3vXOvSe8YImblN2uNqQoqScgvXzJhSSzcIH4gUn9
         96Pn9IwKKR4hRxINmz/4aBVxsm+CJKyx0KWlGZk9X/qjfOquBzSsFJ0bMHevFPmuNjRX
         4mdye2AQMYcpE+aU5ugeUU2tM5kCVCEm7twjK7c0/AqP0TYaH3H4Pezz1NmsaVVOvdNr
         TFm1CdOlc3kkH5thL3BgUhqS3+e6Q0ete9R0WV1t+8PvLqaUrduM2OovkhCSsc6KTzLf
         79Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9wizOY0EarwWfoT8sBSAOULyiMZlua8eTWF9dLcnBQo=;
        b=SBhbwQ8TEJEdBvNNUUrPLZCMhDQoOHEVNfOIX9Y+VF+HKKLM7bFhtbrjiV4WHGvPtH
         jQx8f1zL9n9jLKAGaWDYrbnt0dDMiqyLRNNvUHb+j37m65qtE/dFptGQAKRvSabeXdDw
         FOJgVCu4sKkWLyiZ9nZz4u7GY1vKIYI6QRyMTcD9vKcZs1fwiiL6NP5HSTD6z69Qs11h
         qX12J35g2bST6EXV903P0fP0G6r4bcfZ9EuQFBYMeQ6UpFMOh3EaVsV0ZW8p8d6wtoPN
         iy+l2CSZ+g+2hQG3GkZdfiPA7I9cPf3jxH7WYHu8bKiZ2L9RmhJs5KFgj9fvdFshEAqX
         W/kg==
X-Gm-Message-State: AOAM531ZEc7zi+oJENp9/iVaCg9llQfOMPCsbRq36yYDjwoG9+PA7l5m
        ym3cocwSHNyhgw6m68RiR5VjnaJ0t7VRsuoVWemcNg==
X-Google-Smtp-Source: ABdhPJy1e4N2uZPMyL8hA7V2j6huim5DdDIrfgl2SUEmC46MEQW8QddIKklxeLSX46+xAN1d6tP2LZq+f3U+LVAZc/I=
X-Received: by 2002:a25:287:: with SMTP id 129mr7557117ybc.312.1621521601487;
 Thu, 20 May 2021 07:40:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210518155013.45622-1-andriy.shevchenko@linux.intel.com>
 <20210518232451.GA7362@sol> <YKTCDNcyUlrgE0Y4@smile.fi.intel.com>
 <20210519080434.GA22854@sol> <YKTMninSSY3MK6Hf@smile.fi.intel.com>
 <CAMpxmJVJBx2J87bS0CUYPyJkHKt=nvFw65y_+iG-5JbVekuaqw@mail.gmail.com> <CAHp75VdZ3aws3G=4_r82LMfuMNmNdLoBpqRsfF_ogZ7c=vyTsQ@mail.gmail.com>
In-Reply-To: <CAHp75VdZ3aws3G=4_r82LMfuMNmNdLoBpqRsfF_ogZ7c=vyTsQ@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 20 May 2021 16:39:50 +0200
Message-ID: <CAMpxmJVy12at1+37iPiqTXe6mvodUpjDKCkFQO02Cu=u5_sp_A@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] gpiolib: Never return internal error codes to user space
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Suresh Balakrishnan <suresh.balakrishnan@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 20, 2021 at 3:15 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Thu, May 20, 2021 at 4:08 PM Bartosz Golaszewski
> <bgolaszewski@baylibre.com> wrote:
> > On Wed, May 19, 2021 at 10:30 AM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Wed, May 19, 2021 at 04:04:34PM +0800, Kent Gibson wrote:
> > > > On Wed, May 19, 2021 at 10:45:16AM +0300, Andy Shevchenko wrote:
> > > > > On Wed, May 19, 2021 at 07:24:51AM +0800, Kent Gibson wrote:
> > > > > > On Tue, May 18, 2021 at 06:50:12PM +0300, Andy Shevchenko wrote:
>
> ...
>
> > > > > > > Fixes: d7c51b47ac11 ("gpio: userspace ABI for reading/writing GPIO lines")
> > > > > > > Fixes: 61f922db7221 ("gpio: userspace ABI for reading GPIO line events")
> > > > > > > Fixes: 3c0d9c635ae2 ("gpiolib: cdev: support GPIO_V2_GET_LINE_IOCTL and GPIO_V2_LINE_GET_VALUES_IOCTL")
>
> ...
>
> > > > > > You immediately revert this patch in patch 2.
> > > > > > My understanding is that is not allowed within a patch set.
> > > > >
> > > > > > Why split the patches instead of going direct to the new helper?
> > > > >
> > > > > It's for backporting to make it easier. (I deliberately left the context above)
> > > > >
> > > > > I can fold them if maintainers think it's okay to do.
> > > > >
> > > >
> > > > Not sure what the constraints are on backporting, but wouldn't it be
> > > > simpler and cleaner to backport the new helper?
> > >
> > > Logically (and ideally) it would be three different patches:
> > >  1) introduce helper
> > >  2) use helper
> > >  3) fix places where it's needed to be done
> > >
> > > But the above scheme doesn't fit backporting idea (we don't backport new
> > > features and APIs without really necessity). So, the options left are:
> > >
> > > Option a: One patch (feels a bit like above)
> > > Option b: Two patches like in this series (yes, you are correct about
> > >           disadvantages)
> > >
> > > > But, as you say, it is the maintainers' call.
>
> > Third option is to backport this patch but apply the helper
> > immediately to master.
>
> If I got you correctly, you want to have two patches, one for
> backporting and one for current, correct? But how can we backport
> something which has never been upstreamed?
>

Well we would not technically backport anything - there would be one
patch for mainline and a separate fix for stable.

Bart
