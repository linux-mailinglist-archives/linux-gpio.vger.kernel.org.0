Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2442A3313B4
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Mar 2021 17:47:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230299AbhCHQqm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Mar 2021 11:46:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230184AbhCHQq0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Mar 2021 11:46:26 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FFA4C06174A;
        Mon,  8 Mar 2021 08:46:26 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id q2-20020a17090a2e02b02900bee668844dso3303091pjd.3;
        Mon, 08 Mar 2021 08:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zGoNNvyamCCOAzYtThSIWch4a9H8DIGqUuMkuWQ0gCE=;
        b=h3PoLQKMlQfs1tcP9HdS8D8uti3EUNdDRm8wCntNTIb+VJEKhKfSDx3Wn3qA/7kqoB
         cXMrDsIxF7yZmSeuT96H3brwpA5bVPCpQKOMr0Nh/cnfHdC6MxzskRyC4QIdbzVw5aEy
         Vq9QItz3r1kV/KXQ4nJi4BqDa60WKQ+B6Va+V4Cx332WaOM5YXVcvR62prHfE1unWdjv
         K51FmH9jcmBYmNhCxGjRwu8LvXBqEqYLx8cGI7tKYRtEUWX3LDgVazG6cge1h4XldlkA
         3ST6bZnSe9mpdup1113oWuvN3hJPrt6hP5ApBDrj9tdw+Msrb4BPLgjtodwvRmNddSWU
         kUqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zGoNNvyamCCOAzYtThSIWch4a9H8DIGqUuMkuWQ0gCE=;
        b=fSNqVa4pgOqee1fA/I5KnfmhI2tqY0gDprjutO3pA4A+apn5BcM2TkYbrotAhBFVOy
         N75GQU3xGWx+IfFpcwXA8JnrPZOt7vqasvmhNJaye8jhDCtpUZSTKATj+4IrwsajhVGu
         9PEpz5K7Rmw6YvkQ+UpzVvn6j0E1fq/vsORzOju/dn7GInUjfvhXTA7Yv7cSDOU4jNJs
         hi/kRuSRUwUVLurVSbUE62PBFyDj4Y3v/q3sH3GiFRhMOP3MXcpsVER/LcBmb62OAt0v
         IwmJT04oGB4bctlNChUz4gOleAN+n+iysiqhj8diJ5xMyF72G4xdRipRsh+q2N0fJwY5
         J3ow==
X-Gm-Message-State: AOAM533CG+Ho5BPGg1s8RH6MoJMhjABF3CJG7i42NKletHP68COSd39k
        LAl+7Ou+36vLdsbw5hbFmPUI45lZXOPuglBJXL8=
X-Google-Smtp-Source: ABdhPJz49BPi/t5vXJ4pR76HnmwOGFQKiaHCvjfowThnoAHi2B66bQbOEmijECX1QiBghJ5pLjklZuhaH/gWUnpJCRA=
X-Received: by 2002:a17:90a:4586:: with SMTP id v6mr25202814pjg.129.1615221985998;
 Mon, 08 Mar 2021 08:46:25 -0800 (PST)
MIME-Version: 1.0
References: <20210308152505.3762055-1-luzmaximilian@gmail.com>
 <YEZEX+BCw21O6rmT@smile.fi.intel.com> <YEZRbO3uJQmsCZO9@smile.fi.intel.com> <241a8d75-c0d7-0045-49ee-22072e8588b8@gmail.com>
In-Reply-To: <241a8d75-c0d7-0045-49ee-22072e8588b8@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 8 Mar 2021 18:46:09 +0200
Message-ID: <CAHp75Veg5LjQdx5VQBUWWkKRSGGQsxW-2sm7Y5aH8-g9cHDfJA@mail.gmail.com>
Subject: Re: [PATCH] Revert "pinctrl: intel: Split intel_pinctrl_add_padgroups()
 for better maintenance"
To:     Maximilian Luz <luzmaximilian@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 8, 2021 at 6:44 PM Maximilian Luz <luzmaximilian@gmail.com> wrote:
> On 3/8/21 5:31 PM, Andy Shevchenko wrote:
> > On Mon, Mar 08, 2021 at 05:35:59PM +0200, Andy Shevchenko wrote:
> >> On Mon, Mar 08, 2021 at 04:25:05PM +0100, Maximilian Luz wrote:
> >>> Following commit 036e126c72eb ("pinctrl: intel: Split
> >>> intel_pinctrl_add_padgroups() for better maintenance"),
> >>> gpiochip_get_desc() is broken on some Kaby Lake R devices (specifically
> >>> a Microsoft Surface Book 2), returning -EINVAL for GPIOs that in reality
> >>> should be there (they are defined in ACPI and have been accessible
> >>> previously). Due to this, gpiod_get() fails with -ENOENT.
> >>>
> >>> Reverting this commit fixes that issue and the GPIOs in question are
> >>> accessible again.
> >>
> >> I would like to have more information.
> >> Can you enable PINCTRL and GPIO debug options in the kernel, and show dmesg
> >> output (when kernel command line has 'ignore_loglevel' option) for both working
> >> and non-working cases?
> >>
> >> Also if it's possible to have DSDT.dsl of the device in question along with
> >> output of `grep -H 15 /sys/bus/acpi/devices/*/status`.
> >>
> >>> There is probably a better option than straight up reverting this, so
> >>> consider this more of a bug-report.
> >>
> >> Indeed.
> >
> >
> > Can you test if the below helps (probably you have to apply it by editing
> > the file manually):
> >
> > --- a/drivers/pinctrl/intel/pinctrl-intel.c
> > +++ b/drivers/pinctrl/intel/pinctrl-intel.c
> > @@ -1392,6 +1392,7 @@ static int intel_pinctrl_add_padgroups_by_size(struct intel_pinctrl *pctrl,
> >       gpps[i].size = min(gpp_size, npins);
> >       npins -= gpps[i].size;
> >
> > +     gpps[i].gpio_base = gpps[i].base;
> >       gpps[i].padown_num = padown_num;
> >
> >
>
> That does fix the issue! Thanks for the fast response and fix!

I'm about to send the formal patch. I will add the
Reported-and-tested-by tag if you are okay with it.

-- 
With Best Regards,
Andy Shevchenko
