Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3DF02D9E51
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Dec 2020 18:58:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502452AbgLNRz1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Dec 2020 12:55:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502436AbgLNRzE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Dec 2020 12:55:04 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5067DC0613D3;
        Mon, 14 Dec 2020 09:54:24 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id p18so1396381pgm.11;
        Mon, 14 Dec 2020 09:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y4OYtfMZ2K4JBiXVgvri6qdCRzrXhV7GNsl1P8DU6OY=;
        b=EiicOxwiEwHVWdr7gf4zPmzQAO8KNK1cZoS4wLniUM+K7hPK7ptvrO8Ou4eXgvHmQk
         dWvWqpo3IOx0Yp4GqJNB+7AMnm7tO/QlPhhPD36Yv1xb+qbQkz+BonbT9TAmvrdevolm
         2NxSBrcIkuREzr9piI3iROS0meXenStOYMNYkRs9FwIBVkwSX3zFDc6zGOJ4vH5EMJb4
         qs1CT44ohrLggc6RIyVsb3ONIaQPmXynSDpED5IiqMkb6DDsrHCEvSOeDXJXy0nqVw7f
         OSD75fr3rm67onFok/tv07nym4qmoY0WtJAyPqncBt61bOylOyl+OxYJktbuAHBlcYvW
         V1+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y4OYtfMZ2K4JBiXVgvri6qdCRzrXhV7GNsl1P8DU6OY=;
        b=eUCqzCAKCvcGhTLPABtcGfrlFqhgQQv4BCpZ8XaPGLT50GU7TYpIo+7BWLxTreDodS
         3+tutKH8igbj7Mbktydbx/gW8Sk6slFbCc1Fsli67xOW7jihzgwDxwlw40Zg7aqPJUzL
         +4Zd4tgiMhuYmquAvyX0LEKvKDo2wVnKl+5bPYXdNtMKYyyEkoQ9+DskB7fEC/hUhPQ0
         t9WaaQzHAmmGYtPIl/AvHvXVe+/+yYYLJ/IuvQY2SioZUv20CWk00d+7bcagP0OeKr2d
         94sxF5FbmRy0W45lkN1BqP4seYTTohxLp0YjIhmbUDeAxRaR99bZhnLBG8FeCJ9maR74
         sSjQ==
X-Gm-Message-State: AOAM533rmB34eT+5QKtdBQsBFnwp5jiygcOvPFfgJE8s73ImzxHleeXN
        P3ieFdZCBwBLIQii107yUd30XFhoFb+ebSly6BthxPsFY7A=
X-Google-Smtp-Source: ABdhPJxWhrMA20bv+G9Pm0/5nVz3ofkooo6Xmq49SWViDFHg+N7BhSEuraHzjokkjvI3798fa9btDLQY/77VJip5SHU=
X-Received: by 2002:a63:b1e:: with SMTP id 30mr25347309pgl.203.1607968463784;
 Mon, 14 Dec 2020 09:54:23 -0800 (PST)
MIME-Version: 1.0
References: <20201211042625.129255-1-drew@beagleboard.org> <CAHp75VcAbdrSnb_ag9Rc0tny3Vtqjs1if+ahk7U36V2eaKMpSw@mail.gmail.com>
 <20201211234304.GA189853@x1>
In-Reply-To: <20201211234304.GA189853@x1>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 14 Dec 2020 19:55:12 +0200
Message-ID: <CAHp75Vf-=nM-M2K-v_8iyME4t6ZF-gvSZ5ePsxQFhObJ_0YHsw@mail.gmail.com>
Subject: Re: [RFC PATCH] pinctrl: add helper to expose pinctrl state in debugfs
To:     Drew Fustini <drew@beagleboard.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Dec 12, 2020 at 1:43 AM Drew Fustini <drew@beagleboard.org> wrote:
> On Fri, Dec 11, 2020 at 11:15:21PM +0200, Andy Shevchenko wrote:
> > On Fri, Dec 11, 2020 at 1:54 PM Drew Fustini <drew@beagleboard.org> wrote:
> > >
> > > BeagleBoard.org [0] currently uses an out-of-tree driver called
> > > bone-pinmux-helper [1] developed by Pantelis Antoniou [2] back in 2013.
> >
> > And it looks like it's still using APIs from 2013.
> > Needs quite a clean up.
>
> Thanks for taking a look at my RFC and responding. It is good to know
> that it is using out-dated APIs. Would you be able to elaborate?
>
> It interacts with pinctrl core through devm_pinctrl_get(),
> pinctrl_lookup_state() and pinctrl_select_state(). Is there newer way of
> doing that?

No. I'm talking mostly about FS callbacks where some relatively old
new APIs can be used, such as kasprintf().

...

> > > I used the compatible string "pinctrl,state-helper" but would appreciate
> > > advice on how to best name this. Should I create a new vendor prefix?
> >
> > Since it's BB specific, it should have file name and compatible string
> > accordingly.
>
> At first, I was thinking about this as a beaglebone specific solution
> and had bone in the driver name and compatible string. But then I
> realized it could used in other situations where it is beneficial to
> to read and select a pinctrl state through debugfs.
>
> I'm happy to rebrand the naming as beaglebone if that would be more
> acceptable.

See below.

> > But I'm wondering, why it requires this kind of thing and can't be
> > simply always part of the kernel based on configuration option?
>
> Do you mean not having a new CONFIG option for this driver and just have
> it be enabled by CONFIG_PINCTRL?

No, configuration option stays, but no compatible strings no nothing
like that. Just probed always when loaded.
Actually not even sure we want to have it as a module.

...

> > > The P9_14_pinmux entry would cause pinctrl-state-helper to be probed.
> > > The driver would create the corresponding pinctrl state file in debugfs
> > > for the pin.  Here is an example of how the state can be read and
> > > written from userspace:
> > >
> > > root@beaglebone:~# cat /sys/kernel/debug/ocp\:P9_14_pinmux/state
> > > default
> > > root@beaglebone:~# echo pwm > /sys/kernel/debug/ocp\:P9_14_pinmux/state
> > > root@beaglebone:~# cat /sys/kernel/debug/ocp\:P9_14_pinmux/state
> > > pwm
> >
> > Shouldn't it be rather a part of a certain pin control folder:
> > debug/pinctrl/.../mux/...
> > ?
>
> Yes, I think that would make sense, but I was struggling to figure out
> how to do that. pinctrl_init_debugfs() in pinctrl/core.c does create the
> "pinctrl" directory, but I could not figure out how to use this as the
> parent dir when calling debugfs_create_dir() in this driver's probe().
>
> I thought there might be a way in debugfs API to use existing directory
> path as a parent but I couldn't figure anything like that. I would
> appreciate any advice.

If the option is boolean from the beginning then you just call it from
the corresponding pin control instantiation chain.

-- 
With Best Regards,
Andy Shevchenko
