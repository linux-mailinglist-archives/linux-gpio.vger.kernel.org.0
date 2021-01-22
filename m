Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15A6C2FFFA6
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Jan 2021 11:01:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727418AbhAVJ7W (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Jan 2021 04:59:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727727AbhAVJua (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Jan 2021 04:50:30 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F5A0C061786
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jan 2021 01:50:03 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id w18so3349271pfu.9
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jan 2021 01:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OKi5EXU5rgmzsI6aDa7OCZTcXDJNQQk0V5qykYmEWEQ=;
        b=r5d0wM8IZqYTdqTe1SOJb+tDn7WcwYvVRne8tHym6vj+9wk8zY1c65X5uQcL+/VH+M
         4vN7WmHmvovFPOAHzyHgBDeiHScEWX8v8Dwma0x+rnaF1xRGALxt5i5p42hGcBSlqcSi
         Z5zG9Z7HzOifELGIWJ2u2BGwJxrZEpbtaxDuouNE4x5g8v6GveTwI+ZqaT8Zrinf28FY
         CAiWD/bRfyeNkbp0kLbUuqS8UzJMrH9eI4d5+6o9BmxKHgZWwSTAhbPjlfNmprLMpRA6
         mFDzfp2rr9xB5v8kINCNgy6bDhb+eAvUm2Rp934ELiKHTkIxj57qJf35cpYYeLAvRRQ9
         l2xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OKi5EXU5rgmzsI6aDa7OCZTcXDJNQQk0V5qykYmEWEQ=;
        b=QvWJdH0KnFtLqnsG774UJ9ArnAOj9eIt+E6DM81kCMxU3thYres4nEUZ24CFLj36iT
         WRqy+78U4WRutE1iGJB5ZVIvmfHuEF0yPeOvaNG5EyhC/mG0HN5jJAT0PH/gBlg57J1l
         W48FkcD1Ku8BlObZfwApRN90zjp/w7U5v0nEJ0sTElvzT45Kohjx+rOV1yhV2WT9WpCD
         r0zTctQrkHaURajpZJupXPPuO1R1m0pOzyiy3FiPyzsY6Bk4euG9i6zMMzhZVtCQU0OK
         mkGBBIXZvkrGNiiBZTfWL1lWTMajd4M+4ibMom2YlDPkg21t+eiDx6ngcJAXFNH4uK1f
         yITQ==
X-Gm-Message-State: AOAM531Mv02TgWiM1sNzqwaek6+byxhqfdqRzJEESIUytz1/6r9f9bnz
        68Bb43zKWJcQoT2Ia4FyYRJ8hQY9DnH7Y6lNt98=
X-Google-Smtp-Source: ABdhPJw9nAy2TIV/TBisoHC5r2WsLItDqHIawvumE1Q6ksX4wjBwOCrQ9yL9NMYUcbGN8kVOKGFPsKppK+dZ/LS61mA=
X-Received: by 2002:a65:644b:: with SMTP id s11mr4012113pgv.4.1611309003007;
 Fri, 22 Jan 2021 01:50:03 -0800 (PST)
MIME-Version: 1.0
References: <20210121051806.623743-1-drew@beagleboard.org> <CAHp75Vd5M0kyNzq+5gcZEd=6hK_7Y5_dEJ39-yQO7WuYRM4KWw@mail.gmail.com>
 <20210121232653.GA672978@x1>
In-Reply-To: <20210121232653.GA672978@x1>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 22 Jan 2021 11:50:52 +0200
Message-ID: <CAHp75Vejt3mN4SBTVnRkyLkDA+jnh3Y4pC5bOGdKAdUZGCPFWw@mail.gmail.com>
Subject: Re: [RFC PATCH] pinctrl: pinmux: Add pinmux-set debugfs file
To:     Drew Fustini <drew@beagleboard.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 22, 2021 at 1:26 AM Drew Fustini <drew@beagleboard.org> wrote:
> On Thu, Jan 21, 2021 at 01:18:58PM +0200, Andy Shevchenko wrote:
> > On Thu, Jan 21, 2021 at 7:18 AM Drew Fustini <drew@beagleboard.org> wrote:

...

> > > RFC question: should pinmux-set take function name and group name
> > > instead of the selector numbers?
> >
> > I would prefer names and integers (but from user p.o.v. names are
> > easier to understand, while numbers are good for scripting).
>
> I don't actually see any example of looking up the function name in the
> existing pinctrl code. There is pin_function_tree in struct pinctrl_dev.
> pinmux_generic_get_function_name() does radix_tree_lookup() with the
> selector integer as the key, but there is no corresponding "get function
> selector by name" function.
>
> I think I would need to go through all the nodes in the radix tree to
> find the name that matches. Although, I am just learning now about the
> radix implementation in Linux so there might be a simpler way that I am
> missing.

I probably have to revive my work towards gluing ACPI with pin control
where AFAIR I have created some kind of radix / rbtree for something
(not sure it's exactly what you need here, so consider this just as a
side note).

...

> > The following is better to include in documentation and remove from
> > the commit message.

> > Shorter is better, what about simply
> >
> > # cat /sys/kernel/debug/pinctrl/44e10800.pinmux-pinctrl-single/pinmux-functions
> > ?
> >
> > Btw  in reST format you may create a nice citation of this. And yes,
> > this should also go to the documentation.
>
> Good point, I'll shorten the example lines in v2.

Even better to tell that we operate on the level of mount point of
debugfs and use

 # cat pinctrl/44e10800.pinmux-pinctrl-single/pinmux-functions

> > This and above is still part of documentation, and not a commit message thingy.
>
> Is something I should add to Documentation/driver-api/pinctl.rst in a
> seperate patch?

Not sure, I think more about as a part of this very path you change
code and documentation. But usually it's a preference of the certain
subsystem.

...

> > > +       if (cnt == 0)
> > > +               return 0;
> >
> > Has it ever happened here?
>
> Good point, I guess there is no reason for userspace to write 0 bytes.

My point is that this check is done somewhere in the guts of kernfs.
When in doubt I recommend to look around in the kernel and check most
recent code with similar code pieces.

...

> > > +       buf = memdup_user_nul(user_buf, cnt);
> > > +       if (IS_ERR(buf))
> > > +               return PTR_ERR(buf);
> > > +
> > > +       if (buf[cnt - 1] == '\n')
> > > +               buf[cnt - 1] = '\0';
> >
> > Shouldn't you rather use strndup_from_user() (or how is it called?)

Any comments?

...

> > Can be simply
> >
> >  err_freebuf:
> >         kfree(buf);
> >         return err ?: cnt;
>
> Thanks, I didn't really like the duplication but was having trouble
> thinking of a cleaner way to write it.  That is good to know it is ok to
> use the ternary operator in a return statement.

Again, depends on certain subsystem maintainer's preferences.


> > > +       debugfs_create_file("pinmux-set", S_IFREG | S_IWUSR,
> > > +                           devroot, pctldev, &pinmux_set_ops);

One more thing, as a preparatory patch please move from S_I* to plain
octal numbers as it's preferable.


-- 
With Best Regards,
Andy Shevchenko
