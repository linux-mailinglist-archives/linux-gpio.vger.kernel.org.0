Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77F174786FA
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Dec 2021 10:21:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234091AbhLQJVk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Dec 2021 04:21:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234055AbhLQJVj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Dec 2021 04:21:39 -0500
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4486C061574
        for <linux-gpio@vger.kernel.org>; Fri, 17 Dec 2021 01:21:39 -0800 (PST)
Received: by mail-io1-xd29.google.com with SMTP id m9so2101796iop.0
        for <linux-gpio@vger.kernel.org>; Fri, 17 Dec 2021 01:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vubsKhoayN+JKOdss8VLk4RKvSPxCWjrirp/AalNrr8=;
        b=e8vIlpJK5Fy2w4QN/BiWwDOK/Pbuf7N02FBv+ngR2zafnbdr8CQPYD8g5GcF4FEod5
         i5ePoQr2dKS7WJaDSTdWBzFayio41NOYKD0XqffiP+o2SBGrjI9I/0dJoEyJWT/9+JcQ
         4fSx0ecXhU0KyLk0zTS240M0DTH5zVWD1lPkkK0uGHlnnz7uAy+N7S4DTM+EuzuoDdHg
         AsiNjA9p7s3CP+GIzTO+KjAJ6MRMLfOC/bQl5flsy4OpwyyuQIS4yHn8b0rptsmdp2mU
         YdAzC0jx4RmS8DZGtsxTY+mmpGKCWrt9CprsAVH4lu7Q2jIs2V9CKHUD9Ko3g3nuK8s/
         TGcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vubsKhoayN+JKOdss8VLk4RKvSPxCWjrirp/AalNrr8=;
        b=U+BcQFPm8FhiQ6tOcuxZtiov0yu/PzHr2HV88X/NvYmC7GdaIdij9rOO7Z8+7MmmXn
         BA1WcA3q6E6Yr0TLfPiCiYohPTsvrCzVsLkwf+1Oyrpx5RUmXmDOdSA7cVbm8aNlQWja
         SRnEob4mbx08GzC3MACcM/9nGkVPNxxY77tW8fR56sVr6RenuSGEWvJba/XxR6QF0pvf
         HULY46d6zK++fgAU4ax0K53f9XWD/Ss9IDaFKUikWCa+yQ9c7s20YKUnJeZn0s6UszWI
         rxEUW4Ty/4Hi8yhnh1o6AJh0bQ1cHukGLsLOXUS8CISJWYQ2AyxP3wQCKCu5X5LCOake
         5V0w==
X-Gm-Message-State: AOAM531YI+OjcDvzH6J1Qx745h/JJTKKGbsumxo5kqgwQcW7lPAWwFds
        TGprg+nuIW0QK9mddMIAa3HHjfPJIdzJXfjF77+bWlL0x3m/pw==
X-Google-Smtp-Source: ABdhPJxyLmkEkk7jpMTFmPaFsY372swAsYrF/GKZ+3NU4l8/11GpO2NtzAjZ3QV2JJ1lLTS2TVXUMmjsqwM5pPLeD3s=
X-Received: by 2002:a05:6638:160e:: with SMTP id x14mr1162893jas.308.1639732899017;
 Fri, 17 Dec 2021 01:21:39 -0800 (PST)
MIME-Version: 1.0
References: <cover.1638443930.git.viresh.kumar@linaro.org> <7ace171379783b73a8f560737fd47900ac28924c.1638443930.git.viresh.kumar@linaro.org>
 <CAMRc=MeoTiUOjM_D36ZEU=echpM9jVhr1HY7fuxTDs0t0jf2Jg@mail.gmail.com>
In-Reply-To: <CAMRc=MeoTiUOjM_D36ZEU=echpM9jVhr1HY7fuxTDs0t0jf2Jg@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 17 Dec 2021 10:21:27 +0100
Message-ID: <CANiq72m5g7j=-rzi8dFvGU27Hw8779m-m1QZUy8rCt2szenkpA@mail.gmail.com>
Subject: Re: [PATCH V2 2/4] libgpiod: Add rust wrappers
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Kent Gibson <warthog618@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 16, 2021 at 2:59 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> The line from one of the examples: 'use libgpiod::chip::GpiodChip;'
> looks like it has a lot of redundancy in it. How about calling the
> crate gpiod and dropping the chip package entirely? Basically follow
> what C++ and python bindings do by having `use gpiod::Chip` etc.?

I agree on avoiding redundancy in names where possible (in particular,
the `Gpiod` in `GpiodChip` does not buy much); however, note that
modules in Rust are used a bit differently from C++ namespaces, so I
think it would be a bad idea to drop the modules.

For instance, in Rust, one can be fairly liberal with `use`, while in
C++ one has to worry about ADL and avoid them in global scope in
headers. More importantly, Rust modules are used for encapsulation,
while in C++ namespaces not really (except for the anonymous case or
the """internal""" namespace hack in headers) and in Python privacy is
even weaker. In particular, in Rust one can give each item (including
free functions, variables, etc. not just types) inside a module
different privacy, and importantly, they get special access privileges
within their module.

So while in C++ is indeed fairly typical (though not universal, e.g.
`boost::asio::ip::tcp::socket` comes to mind) to have a flatter layout
with something like `library::Type` with privacy within the `Type` and
hiding things in different TUs; in Rust it is fairly common to have a
`library::module::Item` layout (e.g. `std::vec::Vec` from the standard
library), where one puts everything related to the "module" concept
inside that module.

In any case, one can also re-export things more conveniently for
users, so that is an option too.

> Does it have to be an Error? It's pretty normal for an operation to
> time out, no?

Hmm... what do you mean? Timing out is considered an error in many
APIs, even if it is a frequent occurrence. After all, the request of
"doing something in X time" failed (even if the underlying operation
may even succeed).

Note that errors in Rust are normal control flow, i.e. they do not
involve exceptions (if that is the concern).

Cheers,
Miguel
