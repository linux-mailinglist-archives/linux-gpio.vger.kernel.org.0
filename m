Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B09A4701B3
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Dec 2021 14:34:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238677AbhLJNiU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Dec 2021 08:38:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238651AbhLJNiT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Dec 2021 08:38:19 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4F9FC061746
        for <linux-gpio@vger.kernel.org>; Fri, 10 Dec 2021 05:34:44 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id x10so12708817edd.5
        for <linux-gpio@vger.kernel.org>; Fri, 10 Dec 2021 05:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FPSEs55g+DtadhrlmbupJ6EiEHXiPlVM2kqOvXOraBg=;
        b=hufh9lbJRb0oJ7mH3ofEFSXMLGRUkPJVS0Pzd+B2GjC4BXqalqm5IObNYoixSA06IR
         STe38uxNdMvFGttgZXUjkrlKKXky8INm4CjDqCmitH5PJjPYo6vpfB2AV56cW/kGe7K7
         FkFZbLqwpWRanpHSa4bmalNW1mEaDdSrgXgFrWXKq2p6bkvTxTez09p3x8sc/OfXCoWw
         mKbV7zqGPLoyKO7kIwgudgfVaSrkSAnpFDfxMuAGhWvW8qPnnlDuIFQZKEihB2xDvkfG
         XybmgLlQr8ZBWcfyviXVUcbpIOQlUlXgKWVSrlVtFW/QQSm2B3Lzce8/tw1WDw32hSe0
         13zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FPSEs55g+DtadhrlmbupJ6EiEHXiPlVM2kqOvXOraBg=;
        b=JDn2A2CW8OHLGLvM1AxjwJ61kcc48oTDeVIN3mb9N39D3PLWmx3Do/4gjmiuF1XlKh
         urzQoSWsbRrZOs9HIALzPRAHMm5FiAW2+5sElW4J8f7dw9A05ju11XMNos5kAleHyLe5
         qISnd99afj50wG9jy10JsmJ0zL10OCUtPvHrI5Gq94TDTKN4ZGc3QpkP1X4b5fNrd7z2
         uWuzS0thv9yJmz8ZwuTArg74WV+VAco94PoL9JMFsvsPuKqB2wYcbOq5OybjOq+DrQ4Y
         HIczuTRwjx2YQXM1hDf6nm6DbuPm0Ha5ynrGPbt1UKxn1GVg5R4KWPz/ihbJYRfrfum/
         2gLA==
X-Gm-Message-State: AOAM530cHFOhebcyvxBe9a91dfXwMNtBMrD6SamFpxk8huiXx5TRY2rP
        xd85RrmtMf+KoZyNxQjATGTKxxl5NiSJx4DeY8EjZg==
X-Google-Smtp-Source: ABdhPJwmsSwmtmE3BmXsHOfQi4mh+f4JiRQfzRLj9pINvfop4k5ApnqKowLICk5v8t0gIe6zpjTa7U3y1DaxmvQ0fw8=
X-Received: by 2002:a05:6402:2744:: with SMTP id z4mr39310095edd.310.1639143283263;
 Fri, 10 Dec 2021 05:34:43 -0800 (PST)
MIME-Version: 1.0
References: <4a8c598db0a78421b074f19eb2157d89f3198440.1639047500.git.viresh.kumar@linaro.org>
 <CAHp75VdwQjcrQLHh49WV5e95KCsyqVyoFO=VeNfK4LC0mEZvNw@mail.gmail.com>
 <CAMRc=McUV3-Afhd3yipDfvcEQijqDxf3cXr9egdKAgPt0nv5RA@mail.gmail.com>
 <20211210033842.j4h5glg34prjn4ha@vireshk-i7> <20211210105818.tsbzahtcs5nlxqkr@vireshk-i7>
In-Reply-To: <20211210105818.tsbzahtcs5nlxqkr@vireshk-i7>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 10 Dec 2021 14:34:32 +0100
Message-ID: <CAMRc=MdLa=uLW18xeeny9+1dJfs3JxufLiJ2nPKXr9AvseaP5g@mail.gmail.com>
Subject: Re: [PATCH] libgpiod: Fix build failure with musl
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Kent Gibson <warthog618@gmail.com>,
        Arnd Bergmann <arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 10, 2021 at 11:58 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 10-12-21, 09:08, Viresh Kumar wrote:
> > On 09-12-21, 19:32, Bartosz Golaszewski wrote:
> > > On Thu, Dec 9, 2021 at 4:17 PM Andy Shevchenko
> > > <andy.shevchenko@gmail.com> wrote:
> > > >
> > > > On Thu, Dec 9, 2021 at 5:15 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > > > >
> > > > > Musl defines the _IO*() macros in the files included via <sys/ioctl.h>
> > > > > and hence we get redefinition errors during build as <linux/ioctl.h>,
> > > > > included via <uapi/gpio.h>, defines them again.
> > > > >
> > > > > Fix this by undefining the macros between both the includes, document it
> > > > > all in musl-compat.h as well.
> > > >
> > > > Is it only me who wonders why it should be fixed here?
> > > >
> > > > --
> > > > With Best Regards,
> > > > Andy Shevchenko
> > >
> > > No, I'm wondering the same. I see these musl compat issues being
> > > "fixed" in half the embedded linux projects. Looks to me musl
> > > introduces these issues, doesn't it? Any reason for it? Can it be
> > > fixed in the library?
> >
> > Not sure if I can go fix musl here :)
> >
> > Btw, another thing that will work better is if we do this:
> >
> > diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
> > index eaaea3d8e6b4..ebf6b5312cc0 100644
> > --- a/include/uapi/linux/gpio.h
> > +++ b/include/uapi/linux/gpio.h
> > @@ -12,8 +12,8 @@
> >  #define _UAPI_GPIO_H_
> >
> >  #include <linux/const.h>
> > -#include <linux/ioctl.h>
> >  #include <linux/types.h>
> > +#include <sys/ioctl.h>
> >
> >  /*
> >   * The maximum size of name and label arrays.
> >
> >
> >
> > That will fix it properly as well, no undef issues on any library
> > then. Some of the files in uapi already do this.
>
> This got fixed somehow after I played a bit with the toolchain for
> musl. Abandoning this change for now.
>

Good, because the commit that introduces this <sys/ioctl.h> include in
some uapi headers looks like this:

commit 607ca46e97a1b6594b29647d98a32d545c24bdff
Author: David Howells <dhowells@redhat.com>
Date:   Sat Oct 13 10:46:48 2012 +0100

    UAPI: (Scripted) Disintegrate include/linux

    Signed-off-by: David Howells <dhowells@redhat.com>
    Acked-by: Arnd Bergmann <arnd@arndb.de>
    Acked-by: Thomas Gleixner <tglx@linutronix.de>
    Acked-by: Michael Kerrisk <mtk.manpages@gmail.com>
    Acked-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
    Acked-by: Dave Jones <davej@redhat.com>

and is 68737 lines long.

No idea what the author meant honestly and why this was acked as it
is. I can't find any discussion on that anymore.

Bart
