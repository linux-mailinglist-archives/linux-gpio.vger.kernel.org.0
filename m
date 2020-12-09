Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FC662D46B9
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Dec 2020 17:28:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731947AbgLIQ0q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 11:26:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729938AbgLIQ0q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2020 11:26:46 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DDBCC0617A6
        for <linux-gpio@vger.kernel.org>; Wed,  9 Dec 2020 08:25:45 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id a8so3912558lfb.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2020 08:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0xBrb97lTo75kGlgbY3m4XgGoTI/1jjRhlZu6u72rgk=;
        b=sDY9A2yMs122aEwsLRiAxNJUtdIrEVy+tAylzLcqgQaLuQgU/13aH4FcCdVRF72Jlj
         LJA7Cg1tkp04n8g6ckBSaSu8dClDZS51O9wMdZR95qKqxdFjS0zeyQ32gK7SFeivKv1l
         fQq+d+qR9qMZG3/dy8/V5wi8n7koeX96Aj/no3Ia7FmwUUuz1ElPhUTW9RYM5RPzOZiR
         2HqlpVHvlMEmmq/BBkVh8BppZTUEWYqEATUK7bngOERX58IbWU9Ma82eT+QH0QZfTtOh
         GE5Y6UII6VLYGWmuvwZNzo/gbjskQCe/VW+ilicVTjCSt5I1qVyySwWiDo/fYmXF69SG
         u3iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0xBrb97lTo75kGlgbY3m4XgGoTI/1jjRhlZu6u72rgk=;
        b=FJCOBJHIcSPcszw9T22Wgat3M64PMJl+mlKC9/qto/dRx0wf+2dhaXmRo8kx9q6xEP
         P9bv9NpsQYKmhT3HTuf+oP4D6+mKaWVyRzurE9VigpZe5Y/V6N86qe1Q9b52wNimyWPm
         c5D1ycZ0FY+O1iwK0zynQ/07OE2iRcjqlUoomirF1RyZhev0pEdzjy6XkpZjU4kXZsfJ
         goE6GY7GpidBma3Q2KIpNWHTRxvYIjG3PONnZpMf0zu32CeUw5JJZX7E2Sd5Xn+8e3WA
         wvKRnn/5LgB7FX+yE7l6Oo/KD6iD4l2L4Raopd4wFUwMY5E8MqyzFW/w6waUCQ2z9rVy
         tQ3Q==
X-Gm-Message-State: AOAM532tzN6858JRKObTVPLbrOtK5Ybgy5E0tUvRPWwP9x3RQ5UsrASn
        2ITtDEdevY+1tPlEBbgNRCQDRieXo+8N410qhir+fQ==
X-Google-Smtp-Source: ABdhPJyxNPa05kQBjmuwAnqODtgRKeoAKxynoWMj82Ul7NTn1ySYz/7hhIr7hEH0i6mj5ZwJrr98/n4mwkbSGi63eg4=
X-Received: by 2002:a19:8384:: with SMTP id f126mr1133455lfd.649.1607531143780;
 Wed, 09 Dec 2020 08:25:43 -0800 (PST)
MIME-Version: 1.0
References: <20201122170822.21715-1-mani@kernel.org> <20201122170822.21715-3-mani@kernel.org>
 <CACRpkdbY-aZB1BAD=JkZAHA+OQvpH12AD3tLAp6Nf1hwr74s9A@mail.gmail.com>
 <X8ZmfbQp7/BGgxec@localhost> <CACRpkdZJdxqxUEQaKUHctHRSQAUpYZJtuxonwVd_ZFAsLBbKrA@mail.gmail.com>
 <X89OOUOG0x0SSxXA@localhost> <CACRpkdavm7GG8HdV1xk0W_b1EzUmvF0kKAGnp0u6t42NAWa9iA@mail.gmail.com>
 <X9DsWahl6UDwZwBn@localhost>
In-Reply-To: <X9DsWahl6UDwZwBn@localhost>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 9 Dec 2020 17:25:32 +0100
Message-ID: <CACRpkdYm-j9QcK8hgNrC33KruWE17Q0F4+T=UanE7PCEZEtu6w@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] usb: serial: xr_serial: Add gpiochip support
To:     Johan Hovold <johan@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        patong.mxl@gmail.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Angelo Dureghello <angelo.dureghello@timesys.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 9, 2020 at 4:24 PM Johan Hovold <johan@kernel.org> wrote:
> On Tue, Dec 08, 2020 at 01:41:52PM +0100, Linus Walleij wrote:

> > depends on !GPIO_SYSFS
> >
> > so it can't even be compiled in if someone is using the sysfs.
> >
> > That should solve the situation where people are (ab)using
> > the sysfs and getting name collisions as a result.
>
> Would it possible to set a flag to suppress just the sysfs entry
> renaming instead?

Hm you mean that when a GPIO is "exported" in sysfs
it should not get a symbolic name from the names but instead
just the number?

I bet someone has written their scripts to take advantage of
the symbolic names so I suspect the task becomes bigger
like suppress the sysfs entry renaming if and only if there is
a namespace collision.

But I think we can do that, doesn't seem too hard?

I just hacked up this:
https://lore.kernel.org/linux-gpio/20201209161821.92931-1-linus.walleij@linaro.org/T/#u

> Despite its flaws the sysfs interface is still very convenient and I'd
> prefer not to disable it just because of the line names.

Would these conveniences be identical to those listed
in my recent TODO entry?
https://lore.kernel.org/linux-gpio/20201204083533.65830-1-linus.walleij@linaro.org/

There are several other issues with the sysfs, so making it conflict
with other drivers is almost  plus in the direction of discouragement
from the GPIO submaintainer point of view, but I do see that
people like it for the reasons in the TODO. :/

I am strongly encouraging any developer with a few spare cycles
on their hands to go and implement the debugfs facility because
we can make it so much better than the sysfs, easier and
more convenient for testing etc.

> > Then it should be fine for any driver to provide a names array
> > provided all the names are unique on that gpiochip.
>
> So it sounds like there's nothing preventing per-chip-unique names in
> the rest of gpiolib and the new chardev interface then? Are the
> user-space libraries able to cope with it, etc?

Yes the documentation refers to libgpiod a very well maintained
library:
https://www.kernel.org/doc/html/latest/driver-api/gpio/using-gpio.html
https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/

Then there are the the example tools included with the kernel
that provide a second implementation for the same interfaces
using just the C standard library:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/gpio

I usually use the tools myself.

Yours,
Linus Walleij
