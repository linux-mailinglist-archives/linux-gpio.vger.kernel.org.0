Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2293B2756F9
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Sep 2020 13:16:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726422AbgIWLQt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Sep 2020 07:16:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726332AbgIWLQt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Sep 2020 07:16:49 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BFEDC0613CE;
        Wed, 23 Sep 2020 04:16:49 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id f1so6646216plo.13;
        Wed, 23 Sep 2020 04:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tLO1gXcp24NnHWckCB0vslQ5D/APM/oMUyXd2dfPxDI=;
        b=NX1M7LUTkuLCcgx/52QCft35kUoaLSsqtkg93wAdk6TuZeDBphMNQdlw0Mn8bsk3Tw
         3SLVWGieSI+0pOSsUqGQOFflNCAiqCNhlJY0L8V0BGOWiXj875b+vr5LNbTK7y0ZQdFf
         Ion424xrz68jiv6lgjMCuUF7aV3VGI4tDxTfBl0VoXuQwfGRtYTvUNjc87qTIIvrCo28
         tAFnYxLwdI2f2Sq6eIafuH9++XFl/zUKfh3RbxrnW7xZ1X8EwR+6odDF5/lCh+InpwJm
         VYoqYNnIaZcdkCzGUX7rVl0dPTQbcg8Ve0pZqbis7LPvPVCLwUk+6bCQd+/3iiFk/mmR
         WOJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tLO1gXcp24NnHWckCB0vslQ5D/APM/oMUyXd2dfPxDI=;
        b=IPHPYJkHdOrjFJOFOh9ONQdCw9hWzSv2UR4MZaMN/QELmySCqSO9+sKufEqNompPWE
         Oh8/s3RbOVuiiPNtCNosLBDlDOUqd6QXuiwGZ7zeBubsPMaDjfTWViCorNtC3V4w55UL
         xcZnpIOoxV0X2GPCitxrRUefsJygpubcLzVbZJnaVoeP7mp12VvZZkaEYJMelO1tVmbq
         R+Y7Fvym1aZsiA+Hhc4Jd7u8lTcsJS+A0YGIILIFK2jMFBeEr1UIfnFdr3/aqj1+N2U3
         oYL1nvAm4Ifz5EshpIz6X3btjUvnv/Z98AE6hD0WHyHZCmVdDiPOgbeYmTipxZL0138/
         uNUw==
X-Gm-Message-State: AOAM533WZ7bDXgk37SZzV0iHcG6n70Rf83hBkpaQ3hK9ndE4lLNXORuR
        9MY6TTGkgNRRJt3XLCB94VcLf48JyAA+eCXp+1OWju+IY6Uwwg==
X-Google-Smtp-Source: ABdhPJzd0148U220RCCM7OVrXg6BA1Lrtcj38FDVJtWkJqSlZ48YtZpUHW5g0A21LxovnM7Jy4aJi01m7MBVe/6gYGo=
X-Received: by 2002:a17:90a:fd98:: with SMTP id cx24mr7541233pjb.181.1600859808625;
 Wed, 23 Sep 2020 04:16:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200922023151.387447-1-warthog618@gmail.com> <20200922023151.387447-5-warthog618@gmail.com>
 <CAHp75VewJYDQ1Moi4jw=wbBMLNpaUGPgz+AsPjNdZqtHCgkjwA@mail.gmail.com> <20200923103031.GA579645@sol>
In-Reply-To: <20200923103031.GA579645@sol>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 23 Sep 2020 14:16:30 +0300
Message-ID: <CAHp75VdQ4qWe-870QyH-E42=518vkbLSueQWQOs44M-qKudRsw@mail.gmail.com>
Subject: Re: [PATCH v9 04/20] gpio: uapi: define uAPI v2
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 23, 2020 at 1:30 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Wed, Sep 23, 2020 at 01:04:05PM +0300, Andy Shevchenko wrote:
> > On Tue, Sep 22, 2020 at 5:34 AM Kent Gibson <warthog618@gmail.com> wrote:
> > >
>
> [snip]
>
> > > There is also some minor renaming of fields for consistency compared to
> > > their v1 counterparts, e.g. offset rather than lineoffset or line_offset,
> > > and consumer rather than consumer_label.
> > >
> > > Additionally, v1 GPIOHANDLES_MAX becomes GPIO_V2_LINES_MAX in v2 for
> > > clarity, and the gpiohandle_data __u8 array becomes a bitmap in
> > > gpio_v2_line_values.
> > >
> > > The v2 uAPI is mostly a reorganisation and extension of v1, so userspace
> > > code, particularly libgpiod, should readily port to it.
> >
> > ...
> >
> > > +struct gpio_v2_line_config {
> > > +       __aligned_u64 flags;
> > > +       __u32 num_attrs;
> >
> > > +       /* Pad to fill implicit padding and reserve space for future use. */
> > > +       __u32 padding[5];
> >
> > Probably I somehow missed the answer, but why do we need 5 here and not 1?
> >
>
> Sorry, I got tired of repeating myself, and just acked that we disagree
> on the approach here.
>
> Your suggestion to use the size for version would result in an
> explosion of ioctl signatures - every time we add a field we have to add
> a new ioctl and handle it separately in gpio_ioctl() or linereq_ioctl().

No, you just add
__u32 version; // implies sizeof() check as well.

Look for examples of existing ABIs (e.g. perf ABI).

> Instead what we do here is reserve some space for future use - that we
> can replace with fields without changing the signature.
> The padding is required to be zeroed now, and any future use will take
> a 0 to mean "leave alone".
>
> The sizes are a guestimate as to what may be needed in the future, and
> as such are almost certainly wrong - but hopefully on the high side.
> If that fails we can always fall back to your approach.

I see. So, we have no agreement on these pieces.
Linus and Bart can decide what to do, but I think either way has pros and cons.

So, guys, I am fine with everything else here, except this versioning
issue and waste of resources.

-- 
With Best Regards,
Andy Shevchenko
