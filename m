Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3951D1B3661
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2020 06:33:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725934AbgDVEdr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Apr 2020 00:33:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725929AbgDVEdr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 22 Apr 2020 00:33:47 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36F8BC061BD3
        for <linux-gpio@vger.kernel.org>; Tue, 21 Apr 2020 21:33:47 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id a21so789820ljb.9
        for <linux-gpio@vger.kernel.org>; Tue, 21 Apr 2020 21:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7ZW2G5EWj02g78DhOe3VvfhnqHuBH5xIVqVpm2/M/48=;
        b=ftBZoe+dtjZZgFL2UgUfqHRuKKiVHbKWT/bynCHsxKoKz4IcTm0WwutgI3i5hpNY98
         K3VlGh2WcXO+IIqZNMS78Rnfg9KmPqpBJYifX80Wf/69Z2T5mHfETMxmOzGws4fBitrt
         DqRxvnTbVmjC1diNrZ4cjEEhS3JqUGcxKSv041Goz3gMepbdk1cOhQvWRS34gQjXtFNw
         l+/nRItNTXXVooPSKrNA6KVXKlYiZrag68mnacFZpJGljSQBDMzhHpmy2XxWE5jiR3i/
         hLLkzWOWfRItJwB3ixGCZLpFcs6Xp0CLjD3n5TNLkqD/1k7XYPj5H6drTPFVkS7iTFUA
         nldw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7ZW2G5EWj02g78DhOe3VvfhnqHuBH5xIVqVpm2/M/48=;
        b=ktMBXWjPW/StqxO+ehgZaMQyvDqoRD3dOWkWagsE2TuYyoG32BjQKE3Q3VMfoW4ieh
         eowdYzKV3T0DBQKATrh278nO54bxXwkRfNmWrvsPE6h7JmGzw5CDXcDxRbZggDE9+2Ag
         xf6qclDHjRu/LXACE8M2fNBc5Ji7EeyJMhvQFEWmlSTE3hRpWm/ouc7Q7sXlNiLDMlAh
         2hdjgGewG6olfS7Iir6O3eLlXcq7CSedmGV91EeYCAJy/nbZmmS2toJpySfpe92iVvti
         DvsYsOpKeLnkDd2rUlormAHWJruJBl4xMQTikMgT0PvtpG39FBKZddNp1mQuIIzUJyi5
         3QFQ==
X-Gm-Message-State: AGi0Pubmyna4LCix4swMdM4BvlDhposw+bUntb7vZFzk+L4RbMwikxzC
        KlJNJsvFEa9r7sHFwWK+N8I7dEX0agiKpFET17Pn6YtF
X-Google-Smtp-Source: APiQypKGtSxvcNSfOuJN4z8vfc8l/7jCSAABN6rF+t76f74i6p74JCOzZ2zXJghABD3r7qf6kGliAh0+wLQs3o/nOwQ=
X-Received: by 2002:a2e:9dcd:: with SMTP id x13mr14113487ljj.120.1587530025623;
 Tue, 21 Apr 2020 21:33:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200420172752.33588-1-andriy.shevchenko@linux.intel.com>
 <CAD56B7da+DDxpMvvntmq_nQaZ8aiJ+up4CY5QQ6t2hz_C8LhjQ@mail.gmail.com>
 <20200421125553.GJ185537@smile.fi.intel.com> <20200421140624.sipahotlak5ukrxy@pengutronix.de>
 <20200421142145.GO185537@smile.fi.intel.com>
In-Reply-To: <20200421142145.GO185537@smile.fi.intel.com>
From:   Paul Thomas <pthomas8589@gmail.com>
Date:   Wed, 22 Apr 2020 00:33:34 -0400
Message-ID: <CAD56B7fUZ4+oUpsmmydYeFK0K4xvZa-txth07BmoVu3XUP8iSA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] gpio: pca953x: Rewrite ->get_multiple() function
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Everyone,

On Tue, Apr 21, 2020 at 10:21 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Apr 21, 2020 at 04:06:24PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> > On Tue, Apr 21, 2020 at 03:55:53PM +0300, Andy Shevchenko wrote:
> > > On Mon, Apr 20, 2020 at 11:23:57PM -0400, Paul Thomas wrote:
> > > > On Mon, Apr 20, 2020 at 1:27 PM Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > >
> > > > > The commit 96d7c7b3e654 ("gpio: gpio-pca953x, Add get_multiple fu=
nction")
> > > > > basically did everything wrong from style and code reuse perspect=
ive, i.e.
> > > > Hi Andy,
> > > >
> > > > Well your version is certainly elegant and simple, and does better
> > > > with code reuse. However there are a couple of other goals I had in
> > > > mind.
> > > > First, the "lazy" approach of 96d7c7b3e654 is actually faster when
> > > > user space sets up a 8-bit linehandle[1]146us (single regmap_read()=
)
> > > > vs 172us (pca953x_read_regs()) which incidentally is what we do in =
our
> > > > application. In lazily reading 1 byte at a time it is the fastest
> > > > access for that, if user space is always setting up the linehandle =
for
> > > > the whole chip pca953x_read_regs() would be faster. Seeing as
> > > > get_multiple has been unimplemented for this chip until now perhaps
> > > > our use case deserves some consideration?
> > >
> > > I understand completely your goal, but
> > > - for I=C2=B2C expanders timings is the last thing to look for (they =
are quite slow
> > >   by nature), so, I really don't care about 16% speed up for one call=
; don't
> > >   forget that we are in multi-task OS, where this can be easily inter=
rupted and
> > >   user will see the result quite after expected quick result
Sure, it's not a HUGE deal, but this will get worse for 5 bank chips.
Also, 26us is not insignificant, with the preempt-rt kernel we're
using that can be more than the max interrupt latency.

> >
> > I didn't do any timing analysis and while I understand your
> > argumentation, I'm not sure to agree. I noticed while debugging the
> > problem that then resulted in my fix that gpioctl uses the .set_multipl=
e
> > callback. I told my customer to use gpioctl instead of /sys/class/gpio
> > because it performs better just to notice that when using gpioctl to se=
t
> > a single GPIO this transfers five bytes instead of only two.
> >
> > Having said that I think the sane approach is to optimize
> > .{g,s}et_multiple to reduce the read/write size to the smallest bulk
> > size possible that covers all bits that have their corresponding bit se=
t
> > in mask.
> >
> > > - the code maintenance has a priority over micro-optimization (this d=
river
> > >   suffered many times of breakages because of some optimizations done=
)
Yeah, I appreciate that maintainability needs to be a big priority,
I'm wondering if comments & syntax could be improved so that the
general idea of 96d7c7b3e654 is clear and maintainable. It is just
walking through mask, and whenever it gets to a new byte it reads it
from the hardware.

> >
> > ack here. Some parts of the driver were harder to grasp than necessary.
> >
> > > - it breaks Uwe's approach to fix AI chips, after my patch Uwe's ones=
 are
> > >   applied cleanly
> >
> > I didn't check, is 96d7c7b3e654 broken for some chips?
>
> I was referring to another call to recalc address with additional paramet=
ers,
> which your second patch actually gets rid of.

If it's just the call to pca953x_recalc_addr() that caused the
conflict with Uwe's work with 96d7c7b3e654, we can just remove the
last two arguments so it matches what pca953x_gpio_get_value() is
doing.

thanks,
Paul
