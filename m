Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A63C638AFC1
	for <lists+linux-gpio@lfdr.de>; Thu, 20 May 2021 15:15:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239115AbhETNQ0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 May 2021 09:16:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232298AbhETNQY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 May 2021 09:16:24 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 459F5C061574;
        Thu, 20 May 2021 06:15:03 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id b7so8571037wmh.5;
        Thu, 20 May 2021 06:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+8fuEBGRFLyxD5/pkOP7PuCSROFfwnW0wN+AJDDk3lY=;
        b=pzF2detpGiwUpJJW3V6gfk2m9xAnF29nXn8m4YvogpVzd0GoYeolKGLILZHDs2tl2/
         X00iIQi6V4zvD1Tyyx/dgMUBvm5+eRkLOCkaW53oXswsfE6nZK8T2TeOBaJiikGAchwZ
         raXkn7PyuDMOfnAkYemzf2x3tqPf9mQ+SIGksI2dCURRA/f6hrv81oyhdQ/QJ/lF2LgC
         ya7Gubth6obitMd9mu5d5++26KRqK4BzeY2k6fM2trKtJhnRTWrzbqsJn4DfErGqOK1v
         FSNsbW2Co8nr613gZy4dg/rzTe8sosQAlSnjadlWgvCnf/QqJ/aaOyzUV0D2JnhbIxe0
         nD3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+8fuEBGRFLyxD5/pkOP7PuCSROFfwnW0wN+AJDDk3lY=;
        b=rrUgL74WBL9BNSfkF9iXk3nn3oZ5q/nB5rBEzXMuG2xuLhrCt72WkLInm9FlHUtNjg
         3/DpRx5bOVUQqbJpWva5YZBAVN/BN/KnrzB6tH7JqE8a3S0L/upfHU/k1KQFYzrouIBO
         QoMI5ncREGMlReTml9ueTjaxSyyzM+p4sLZ1dRcOI+N3YZB7OkJy7dCTQaLTFkxOMNhO
         nY4UMoF+HfoReFJpBzMAf9ReTdIyJJN5rS1DBU1TRJAlMVTwWdNnoNZ1oOuUhhqHjzG/
         gOoJzmo4ine5qLg4HoR1YUI875XEH6iAfqc+qm+zijCuIkBjlMlYizjZPyM4sQkfaLi5
         Fwig==
X-Gm-Message-State: AOAM530fUjAr6kEq4t+6M5sJ8dPZNchf1QK1lkqpoGcXt1+72uUk4wT3
        n7n70HTQY+5mJgP7L/aUPsopF5IeokOK/Nw+yp8=
X-Google-Smtp-Source: ABdhPJwHoU1p/QU7aS+IfciqSqFfpMP42KmWBHQgQ6MtZ7k1i1vK/3GxtlTnQ9bmewTaQrIaGqi1S+xvXwnzKxBRJHs=
X-Received: by 2002:a1c:35c6:: with SMTP id c189mr3935125wma.127.1621516501843;
 Thu, 20 May 2021 06:15:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210518155013.45622-1-andriy.shevchenko@linux.intel.com>
 <20210518232451.GA7362@sol> <YKTCDNcyUlrgE0Y4@smile.fi.intel.com>
 <20210519080434.GA22854@sol> <YKTMninSSY3MK6Hf@smile.fi.intel.com> <CAMpxmJVJBx2J87bS0CUYPyJkHKt=nvFw65y_+iG-5JbVekuaqw@mail.gmail.com>
In-Reply-To: <CAMpxmJVJBx2J87bS0CUYPyJkHKt=nvFw65y_+iG-5JbVekuaqw@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 20 May 2021 16:14:45 +0300
Message-ID: <CAHp75VdZ3aws3G=4_r82LMfuMNmNdLoBpqRsfF_ogZ7c=vyTsQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] gpiolib: Never return internal error codes to user space
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
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

On Thu, May 20, 2021 at 4:08 PM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
> On Wed, May 19, 2021 at 10:30 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Wed, May 19, 2021 at 04:04:34PM +0800, Kent Gibson wrote:
> > > On Wed, May 19, 2021 at 10:45:16AM +0300, Andy Shevchenko wrote:
> > > > On Wed, May 19, 2021 at 07:24:51AM +0800, Kent Gibson wrote:
> > > > > On Tue, May 18, 2021 at 06:50:12PM +0300, Andy Shevchenko wrote:

...

> > > > > > Fixes: d7c51b47ac11 ("gpio: userspace ABI for reading/writing GPIO lines")
> > > > > > Fixes: 61f922db7221 ("gpio: userspace ABI for reading GPIO line events")
> > > > > > Fixes: 3c0d9c635ae2 ("gpiolib: cdev: support GPIO_V2_GET_LINE_IOCTL and GPIO_V2_LINE_GET_VALUES_IOCTL")

...

> > > > > You immediately revert this patch in patch 2.
> > > > > My understanding is that is not allowed within a patch set.
> > > >
> > > > > Why split the patches instead of going direct to the new helper?
> > > >
> > > > It's for backporting to make it easier. (I deliberately left the context above)
> > > >
> > > > I can fold them if maintainers think it's okay to do.
> > > >
> > >
> > > Not sure what the constraints are on backporting, but wouldn't it be
> > > simpler and cleaner to backport the new helper?
> >
> > Logically (and ideally) it would be three different patches:
> >  1) introduce helper
> >  2) use helper
> >  3) fix places where it's needed to be done
> >
> > But the above scheme doesn't fit backporting idea (we don't backport new
> > features and APIs without really necessity). So, the options left are:
> >
> > Option a: One patch (feels a bit like above)
> > Option b: Two patches like in this series (yes, you are correct about
> >           disadvantages)
> >
> > > But, as you say, it is the maintainers' call.

> Third option is to backport this patch but apply the helper
> immediately to master.

If I got you correctly, you want to have two patches, one for
backporting and one for current, correct? But how can we backport
something which has never been upstreamed?

-- 
With Best Regards,
Andy Shevchenko
