Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4ADFA34E532
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Mar 2021 12:15:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231701AbhC3KPN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Mar 2021 06:15:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231674AbhC3KOx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Mar 2021 06:14:53 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7167FC061574;
        Tue, 30 Mar 2021 03:14:53 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id a12so2946003pfc.7;
        Tue, 30 Mar 2021 03:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V/FqWFnSs67qGcCEFGqG7am98bSaZbZjUwLFj3yQgog=;
        b=khDuF+e2UuYu/nyY2Zxsnbnqhv47jLx34uo/yRN4QK2H6t+ttXEZhOrBD8rUGxgQtH
         yGaa30NkbMvGs7tilcrtRgVmGNZtb2fXsrO0LiFioYnmhiNY92+a93ZfOMGBFc0uQhbe
         B3QeVycVRAiHR5qa995KHYutnxDgvCI04oBHsg3YARBKMkBVOgObzGrsf7HL5gv2TzFl
         oqUREAwz6TxMW4gyD/1ws7/t/GK+p7nVHM1BYpHz6+RaWfu9y4beFl5HN6VKsobi7zzX
         UIOlPUBcmUSL+AF9sgOgqkIlKMVoadcsB0mPzBEjBZDcHDqFcWej0V29G37M/TaXhGpK
         m65Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V/FqWFnSs67qGcCEFGqG7am98bSaZbZjUwLFj3yQgog=;
        b=XxkkbYdhc7wm8zDyWp8xr6EsnhGzEwNdzYREQ37JaLsAcBRhvFwePOaLK9YDhuLfXe
         Kj04BrI1TqJXLGUZhiUoEepvyVqhV1+CiYUKJikde0J27mAxuMVTlIaegId8MlFtHka0
         Y2RK7H+ypwPD8ABDuphPKIetmECVp8RR+v1JTNehWL20l927BuzMK4UNC0/Gr1N0aEPM
         nkvCLh9c3WdVYiTQ4kEZpZVZAmu/RZou4I/6PKxnnkHLJMh4uc8yZtakOf942ExNvHFL
         jDhVjwEilUQvfo2nzsMCizvGEhBWIh4CCwC55hd/8OS0ZgpZTFKdTb+r/F6zJh56TbQN
         TB8w==
X-Gm-Message-State: AOAM531wjIVvBHygL2xB0/wGX4M17a5kJMxFMrFs2hBMn/nj7HdL1Z/S
        eP+2Vn5R9YHB0kRH8fLgq9Bmge0SH6AoP/e9HpI=
X-Google-Smtp-Source: ABdhPJyILHEmzrLjVBkkaRHNJz9cY8t9hh5ubDELOkuJG/yLxLPEh9xv1zX8Yy2xEfobxgdNbHsAiXwFdw/fwQk6l9A=
X-Received: by 2002:a63:c48:: with SMTP id 8mr5652768pgm.74.1617099292871;
 Tue, 30 Mar 2021 03:14:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1616760183.git.sander@svanheule.net> <31e5a5aeb833c43c07daafcf939864497ff1c349.1616760183.git.sander@svanheule.net>
 <CAHp75Vdi06dLxJNCo4f1CA=cS1MuPwG0nEAnVqt8BRrz9bnOtw@mail.gmail.com>
 <f5059092c1d4f3a23683a2eebfa37cb739881a8a.camel@svanheule.net>
 <CAHp75VfTkfBqHc1S1aUm0Pr-=L_FNDUqkoH_x+KJgkXdZ33VAA@mail.gmail.com> <537a2becc81360f314a4293f7bb619ed2a377cb6.camel@svanheule.net>
In-Reply-To: <537a2becc81360f314a4293f7bb619ed2a377cb6.camel@svanheule.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 30 Mar 2021 13:14:36 +0300
Message-ID: <CAHp75VftETTkOGx6AUvQi5s-ngo73WBdHnqsX84pCM6GAaHMyQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] gpio: Add Realtek Otto GPIO support
To:     Sander Vanheule <sander@svanheule.net>
Cc:     devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bert Vermeulen <bert@biot.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 29, 2021 at 8:28 PM Sander Vanheule <sander@svanheule.net> wrote:
> On Mon, 2021-03-29 at 13:26 +0300, Andy Shevchenko wrote:
> > On Fri, Mar 26, 2021 at 11:11 PM Sander Vanheule <
> > sander@svanheule.net> wrote:

...

> > AFAICS all, except one have this flag, I suggest you to do other way
> > around, i.e. check compatible string in the code. Or do something more
> > clever. What happens if you have this flag enabled for the fallback
> > node?
> >
> > If two people ask the same, it might be a smoking gun.
> >
>
> Testing for the fallback wouldn't work, since of_device_is_compatible()
> would always match. Setting the (inverse) flag only on the fallback
> would indeed reduce the clutter.
>
> If the port order is reversed w.r.t. to the current implementation,
> enabling a GPIO+IRQ would enable the same pin on a different port. I
> don't think the result would be catastrophical, but it would result in
> unexpected behaviour. When A0 and C0 are then enabled, A0 interrupts
> would actually come from C0, and vice versa.
>
>    Intended port | A | B | C | D
> -----------------+---+---+---+---
> Actual GPIO port | D | C | B | A
>  Actual IRQ port | B | A | D | C
>
> If only the actual GPIO ports change, at least you can still use a
> modified GPIO line number and polling. The user could just leave out
> the optional irq-controller from the devicetree, but I would rather
> have it enforced in some way.

OK! Thanks for clarification.

-- 
With Best Regards,
Andy Shevchenko
